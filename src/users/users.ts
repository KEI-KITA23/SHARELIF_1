/*
import { Hono } from 'hono';

const app = new Hono();

let users = [
  { id: '1', username: 'user1', bio: 'Hello, I am user1' },
  { id: '2', username: 'user2', bio: 'This is user2' }
];

// 사용자 정보 조회
app.get('/:id', (c) => {
  const id = c.req.param('id');
  const user = users.find(u => u.id === id);

  if (!user) {
    return c.json({ message: 'User not found' }, 404);
  }

  return c.json(user);
});

// 사용자 정보 업데이트
app.put('/:id', async (c) => {
  const id = c.req.param('id');
  const { bio } = await c.req.json();
  const user = users.find(u => u.id === id);

  if (!user) {
    return c.json({ message: 'User not found' }, 404);
  }

  user.bio = bio;
  return c.json(user);
});

export default app;
*/


import { Hono } from 'hono';

const app = new Hono();

// 사용자 정보 조회
app.get('/:id', async (c) => {
  const id = c.req.param('id');

  // 데이터베이스에서 사용자 조회
  const user = await c.env.DB.prepare(
    "SELECT * FROM users WHERE id = ?"
  ).bind(id).first();

  if (!user) {
    return c.json({ message: 'User not found' }, 404);
  }

  return c.json(user);
});

// 사용자 정보 업데이트
app.put('/:id', async (c) => {
  const id = c.req.param('id');
  const { bio } = await c.req.json();

  // 사용자 존재 확인
  const user = await c.env.DB.prepare(
    "SELECT * FROM users WHERE id = ?"
  ).bind(id).first();

  if (!user) {
    return c.json({ message: 'User not found' }, 404);
  }

  // 데이터베이스에서 사용자 bio 업데이트
  await c.env.DB.prepare(
    "UPDATE users SET bio = ? WHERE id = ?"
  ).bind(bio, id).run();

  return c.json({ message: 'User bio updated successfully' });
});

export default app;
