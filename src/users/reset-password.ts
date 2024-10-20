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

// 비밀번호 재설정 요청
app.post('/reset-password/request', async (c) => {
  const { email } = await c.req.json();
  const user = users.find(u => u.email === email);

  if (!user) {
    return c.json({ message: 'Email not found' }, 404);
  }

  // 재설정 링크 보내기 (간단한 예시)
  // 실제로는 이메일 발송 기능 필요
  return c.json({ message: 'Password reset link sent to your email' });
});

// 비밀번호 재설정
app.post('/reset-password', async (c) => {
  const { email, newPassword } = await c.req.json();
  const user = users.find(u => u.email === email);

  if (!user) {
    return c.json({ message: 'User not found' }, 404);
  }

  user.password = newPassword;  // 실제로는 해시 암호화 필요 (bcrypt 등)
  return c.json({ message: 'Password reset successful' });
});

export default app;
*/

import { Hono } from 'hono';

const app = new Hono();

// 비밀번호 재설정 요청
app.post('/reset-password/request', async (c) => {
  const { email } = await c.req.json();

  // 데이터베이스에서 사용자 조회
  const user = await c.env.DB.prepare(
    "SELECT * FROM users WHERE email = ?"
  ).bind(email).first();

  if (!user) {
    return c.json({ message: 'Email not found' }, 404);
  }

  // 재설정 링크 보내기 (간단한 예시)
  // 실제로는 이메일 발송 기능 필요
  return c.json({ message: 'Password reset link sent to your email' });
});

// 비밀번호 재설정
app.post('/reset-password', async (c) => {
  const { email, newPassword } = await c.req.json();

  // 데이터베이스에서 사용자 조회
  const user = await c.env.DB.prepare(
    "SELECT * FROM users WHERE email = ?"
  ).bind(email).first();

  if (!user) {
    return c.json({ message: 'User not found' }, 404);
  }

  // 비밀번호 업데이트
  await c.env.DB.prepare(
    "UPDATE users SET password = ? WHERE email = ?"
  ).bind(newPassword, email).run();

  return c.json({ message: 'Password reset successful' });