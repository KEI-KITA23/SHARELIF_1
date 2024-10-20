/*
import { Hono } from 'hono';

const app = new Hono();

// 사용자 검색: 이름으로 사용자 검색
app.get('/search/:name', async (c) => {
  const name = c.req.param('name');

  // 데이터베이스에서 이름으로 사용자 조회
  const users = await c.env.DB.prepare(
    "SELECT * FROM users WHERE username LIKE ?"
  ).bind(`%${name}%`).all();

  if (users.length === 0) {
    return c.json({ message: "No users found" }, 404);
  }

  return c.json({ users });
});

// 순위 표시: 최근 일주일간 조회수가 가장 많은 게시물
app.get('/ranking', async (c) => {
  const oneWeekAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString(); // 일주일 전 날짜

  // 최근 일주일간 조회수가 가장 많은 게시물 조회
  const rankedPosts = await c.env.DB.prepare(
    "SELECT * FROM posts WHERE timestamp >= ? ORDER BY views DESC"
  ).bind(oneWeekAgo).all();

  if (rankedPosts.length === 0) {
    return c.json({ message: "No ranked posts found" }, 404);
  }

  return c.json({ rankedPosts });
});

export default app;
*/