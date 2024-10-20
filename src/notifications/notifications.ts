/*
import { Hono } from 'hono';

const app = new Hono();

let notifications = [
  { id: '1', userId: '1', message: 'Your post was liked!', read: false, timestamp: new Date() },
  { id: '2', userId: '2', message: 'You have a new follower!', read: false, timestamp: new Date() }
];

// 특정 사용자의 알림 목록 조회 (최신순)
app.get('/:userId', (c) => {
  const userId = c.req.param('userId');
  const userNotifications = notifications
    .filter(n => n.userId === userId)
    .sort((a, b) => b.timestamp.getTime() - a.timestamp.getTime());
  
  return c.json({ notifications: userNotifications });
});

// 새로운 알림 생성 (예: 게시물 좋아요, 팔로우 등)
app.post('/', async (c) => {
  const { userId, message } = await c.req.json();
  const newNotification = {
    id: String(notifications.length + 1),
    userId,
    message,
    read: false,
    timestamp: new Date()
  };
  notifications.push(newNotification);
  
  return c.json(newNotification, 201);
});

// 알림 읽음 처리
app.put('/:id/read', (c) => {
  const id = c.req.param('id');
  const notification = notifications.find(n => n.id === id);

  if (!notification) {
    return c.json({ message: 'Notification not found' }, 404);
  }

  notification.read = true;
  return c.json({ message: 'Notification marked as read' });
});

// 알림 삭제
app.delete('/:id', (c) => {
  const id = c.req.param('id');
  const initialLength = notifications.length;

  notifications = notifications.filter(n => n.id !== id);

  if (initialLength === notifications.length) {
    return c.json({ message: 'Notification not found' }, 404);
  }

  return c.json({ message: 'Notification deleted' });
});


export default app;
*/

import { Hono } from 'hono';

const app = new Hono();

// 특정 사용자의 알림 목록 조회 (최신순)
app.get('/:userId', async (c) => {
  const userId = c.req.param('userId');
  
  // 데이터베이스에서 사용자 알림 조회
  const userNotifications = await c.env.DB.prepare(
    "SELECT * FROM notifications WHERE userId = ? ORDER BY timestamp DESC"
  ).bind(userId).all();
  
  return c.json({ notifications: userNotifications });
});

// 새로운 알림 생성 (예: 게시물 좋아요, 팔로우 등)
app.post('/', async (c) => {
  const { userId, message } = await c.req.json();
  const timestamp = new Date(); // 현재 시간 생성

  // 데이터베이스에 새로운 알림 추가
  const newNotification = await c.env.DB.prepare(
    "INSERT INTO notifications (userId, message, read, timestamp) VALUES (?, ?, ?, ?)"
  ).bind(userId, message, false, timestamp).run();

  return c.json({ id: newNotification.lastInsertRowId, userId, message, read: false, timestamp }, 201);
});

// 알림 읽음 처리
app.put('/:id/read', async (c) => {
  const id = c.req.param('id');

  // 데이터베이스에서 알림 존재 확인
  const notification = await c.env.DB.prepare(
    "SELECT * FROM notifications WHERE id = ?"
  ).bind(id).first();

  if (!notification) {
    return c.json({ message: 'Notification not found' }, 404);
  }

  // 데이터베이스에서 알림 읽음 처리
  await c.env.DB.prepare(
    "UPDATE notifications SET read = ? WHERE id = ?"
  ).bind(true, id).run();

  return c.json({ message: 'Notification marked as read' });
});

// 알림 삭제
app.delete('/:id', async (c) => {
  const id = c.req.param('id');

  // 데이터베이스에서 알림 삭제
  const result = await c.env.DB.prepare(
    "DELETE FROM notifications WHERE id = ?"
  ).bind(id).run();

  if (result.changes === 0) {
    return c.json({ message: 'Notification not found' }, 404);
  }

  return c.json({ message: 'Notification deleted' });
});

export default app;

