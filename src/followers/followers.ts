/*
import { Hono } from 'hono';

const app = new Hono();

let followers = [
  { userId: '1', followerId: '2' },
  { userId: '2', followerId: '1' }
];

// 팔로우 요청
app.post('/follow', async (c) => {
  const { userId, followerId } = await c.req.json();
  
  // 이미 팔로우 중인지 확인
  const isFollowing = followers.some(f => f.userId === userId && f.followerId === followerId);
  
  if (isFollowing) {
    return c.json({ message: 'Already following' });
  }
  
  followers.push({ userId, followerId });
  return c.json({ message: 'Now following' });
});


// 팔로워 목록 가져오기
app.get('/:userId/followers', (c) => {
  const userId = c.req.param('userId');
  const userFollowers = followers.filter(f => f.userId === userId);
  return c.json({ followers: userFollowers });
});

// 특정 사용자가 팔로우하고 있는 목록 가져오기
app.get('/:userId/following', (c) => {
  const userId = c.req.param('userId');
  const following = followers.filter(f => f.followerId === userId);
  return c.json({ following });
});

// 팔로우 취소
app.delete('/unfollow', async (c) => {
  const { userId, followerId } = await c.req.json();
  followers = followers.filter(f => f.userId !== userId || f.followerId !== followerId);
  return c.json({ message: 'Unfollowed' });
});

export default app;
*/
import { Hono } from 'hono';

const app = new Hono();

// 팔로우 요청
app.post('/follow', async (c) => {
  const { userId, followerId } = await c.req.json();
  
  // 이미 팔로우 중인지 확인
  const isFollowing = await c.env.DB.prepare(
    "SELECT * FROM followers WHERE userId = ? AND followerId = ?"
  ).bind(userId, followerId).first();
  
  if (isFollowing) {
    return c.json({ message: 'Already following' });
  }
  
  // 새 팔로우 추가
  await c.env.DB.prepare(
    "INSERT INTO followers (userId, followerId) VALUES (?, ?)"
  ).bind(userId, followerId).run();
  
  return c.json({ message: 'Now following' });
});

// 팔로워 목록 가져오기
app.get('/:userId/followers', async (c) => {
  const userId = c.req.param('userId');

  // 데이터베이스에서 팔로워 조회
  const userFollowers = await c.env.DB.prepare(
    "SELECT * FROM followers WHERE userId = ?"
  ).bind(userId).all();

  return c.json({ followers: userFollowers });
});

// 특정 사용자가 팔로우하고 있는 목록 가져오기
app.get('/:userId/following', async (c) => {
  const userId = c.req.param('userId');

  // 데이터베이스에서 팔로우 관계 조회
  const following = await c.env.DB.prepare(
    "SELECT * FROM followers WHERE followerId = ?"
  ).bind(userId).all();

  return c.json({ following });
});

// 팔로우 취소
app.delete('/unfollow', async (c) => {
  const { userId, followerId } = await c.req.json();
  
  // 팔로우 관계 삭제
  await c.env.DB.prepare(
    "DELETE FROM followers WHERE userId = ? AND followerId = ?"
  ).bind(userId, followerId).run();
  
  return c.json({ message: 'Unfollowed' });
});

export default app;
