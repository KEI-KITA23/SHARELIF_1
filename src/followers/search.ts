import { Hono } from 'hono';

const app = new Hono();

// 유저 ID로 사용자 검색
app.get('/:userId', async (c) => {
  const userId = c.req.param('userId');

  // 데이터베이스에서 유저 ID로 사용자 조회
  const user = await c.env.DB.prepare(
    "SELECT * FROM followers WHERE userId = ?"
  ).bind(userId).first();

  if (!user) {
    return c.json({ message: 'User not found' }, 404);
  }

  return c.json(user);
});

export default app;
