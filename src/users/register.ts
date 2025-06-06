/*
import { Hono } from 'hono';

const app = new Hono();

type User = {
  id: string;
  username: string;
  password: string;
  email: string;
};

let users: User[] = [];  // 타입 명시

// 회원가입
app.post('/register', async (c) => {
  const { username, password, email } = await c.req.json();

  // 유효성 검사
  if (!username || !password || !email) {
    return c.json({ message: 'All fields are required' }, 400);
  }

  // 중복된 사용자 확인
  const existingUser = users.find(u => u.username === username);
  if (existingUser) {
    return c.json({ message: 'Username already exists' }, 400);
  }

  const newUser: User = {
    id: String(users.length + 1),
    username,
    password,
    email
  };

  users.push(newUser);
  return c.json({ message: 'User registered successfully', user: newUser }, 201);
});

export default app;
*/

import { Hono } from 'hono';

const app = new Hono();

// 회원가입
app.post('/register', async (c) => {
  const { username, password, email } = await c.req.json();

  // 유효성 검사
  if (!username || !password || !email) {
    return c.json({ message: 'All fields are required' }, 400);
  }

  // 중복된 사용자 확인
  const existingUser = await c.env.DB.prepare(
    "SELECT * FROM users WHERE username = ?"
  ).bind(username).first();

  if (existingUser) {
    return c.json({ message: 'Username already exists' }, 400);
  }

  // 새 사용자 추가
  await c.env.DB.prepare(
    "INSERT INTO users (username, password, email) VALUES (?, ?, ?)"
  ).bind(username, password, email).run();

  return c.json({ message: 'User registered successfully' }, 201);
});

export default app;
