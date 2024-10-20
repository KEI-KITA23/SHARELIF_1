/*
import { Hono } from 'hono';
import QRCode from 'qrcode';

const app = new Hono();

// QR 코드 생성
app.get('/generate/:userId', async (c) => {
  const userId = c.req.param('userId');

  // QR 코드 데이터 생성 (예: 사용자 ID로 생성)
  const qrData = `https://yourapp.com/follow/${userId}`; // 사용자가 팔로우할 링크

  try {
    const qrCodeUrl = await QRCode.toDataURL(qrData);
    return c.json({ qrCodeUrl });
  } catch (error) {
    return c.json({ message: 'Error generating QR code' }, 500);
  }
});

// 친구 추가 기능 (팔로우)
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

export default app;
*/