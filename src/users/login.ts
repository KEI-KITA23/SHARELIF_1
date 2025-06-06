/*
import { Hono } from 'hono';

const app = new Hono();

// 사용자 타입 정의
type User = {
  id: string;
  username: string;
  password: string;
  email: string;
};

let users: User[] = [];  // 타입 명시

// 로그인
app.post('/login', async (c) => {
  const { username, password } = await c.req.json();

  // 유효성 검사
  if (!username || !password) {
    return c.json({ message: 'Username and password are required' }, 400);
  }

  // 사용자 확인
  const user = users.find(u => u.username === username && u.password === password);
  if (!user) {
    return c.json({ message: 'Invalid credentials' }, 401);
  }

  // 토큰 발급 또는 세션 생성 (간단한 응답 예시)
  return c.json({ message: 'Login successful', token: 'dummy-token' });
});

export default app;
*/

import { Hono } from 'hono';

const app = new Hono();

// 로그인
app.post('/login', async (c) => {
  const { username, password } = await c.req.json();

  // 유효성 검사
  if (!username || !password) {
    return c.json({ message: 'Username and password are required' }, 400);
  }

  // 데이터베이스에서 사용자 조회
  const user = await c.env.DB.prepare(
    "SELECT * FROM users WHERE username = ? AND password = ?"
  ).bind(username, password).first();

  if (!user) {
    return c.json({ message: 'Invalid credentials' }, 401);
  }

  // 토큰 발급 또는 세션 생성 (간단한 응답 예시)
  return c.json({ message: 'Login successful', token: 'dummy-token' });
});

export default app;
