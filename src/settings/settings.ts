/*
import { Hono } from 'hono';

const app = new Hono();

// 사용자 프로필 설정
app.put('/profile', async (c) => {
  const { userId, username, bio, profilePicture } = await c.req.json();
  
  // 데이터베이스에서 사용자 정보 업데이트
  await c.env.DB.prepare(
    "UPDATE users SET username = ?, bio = ?, profilePicture = ? WHERE id = ?"
  ).bind(username, bio, profilePicture, userId).run();
  
  return c.json({ message: 'Profile updated successfully' });
});

// 알림 설정
app.put('/notifications', async (c) => {
  const { userId, notificationPreferences } = await c.req.json();

  // 알림 설정 업데이트 로직
  await c.env.DB.prepare(
    "UPDATE users SET notificationPreferences = ? WHERE id = ?"
  ).bind(notificationPreferences, userId).run();

  return c.json({ message: 'Notification settings updated' });
});

// 보안 설정: 비밀번호 변경
app.put('/security/password', async (c) => {
  const { userId, oldPassword, newPassword } = await c.req.json();

  // 비밀번호 변경 로직 (비밀번호 해시 처리 필요)
  await c.env.DB.prepare(
    "UPDATE users SET password = ? WHERE id = ? AND password = ?"
  ).bind(newPassword, userId, oldPassword).run();
  
  return c.json({ message: 'Password changed successfully' });
});

// 보안 설정: 2단계 인증 설정
app.put('/security/two-factor', async (c) => {
  const { userId, enabled } = await c.req.json();

  // 2단계 인증 설정 로직
  await c.env.DB.prepare(
    "UPDATE users SET twoFactorEnabled = ? WHERE id = ?"
  ).bind(enabled, userId).run();

  return c.json({ message: `Two-factor authentication ${enabled ? 'enabled' : 'disabled'}` });
});

// 연결된 계정 관리
app.post('/accounts/link', async (c) => {
  const { userId, accountType } = await c.req.json();

  // 소셜 계정 연결 로직
  await c.env.DB.prepare(
    "INSERT INTO connected_accounts (userId, accountType) VALUES (?, ?)"
  ).bind(userId, accountType).run();

  return c.json({ message: 'Account linked successfully' });
});

// 로그아웃 기능
app.post('/logout', async (c) => {
  const { userId } = await c.req.json(); // 사용자 ID 받아오기

  // D1에서 사용자 세션 또는 토큰 무효화 로직
  await c.env.DB.prepare(
    "DELETE FROM sessions WHERE userId = ?"  // 세션 테이블에서 삭제
  ).bind(userId).run();
  
  return c.json({ message: 'Logged out successfully' });
});

export default app;
*/