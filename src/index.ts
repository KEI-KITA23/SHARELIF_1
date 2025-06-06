import { Hono } from "hono";
import { prettyJSON } from "hono/pretty-json";
import posts from "./posts/posts";
import auth from "./auth/auth";
import followers from "./followers/followers";
import users from "./users/users";
import notifications from "./notifications/notifications"; 
import register from './users/register';
import login from './users/login';
import resetPassword from './users/reset-password';
import search from "./followers/search"; //D1
import QR from "./followers/QR"; // D1
import ranking from './ranking/ranking'; // D1
import settings from "./settings/settings"; // D1`

const app = new Hono();

app.use("*", prettyJSON());

// 경로들
app.route("/posts", posts);
app.route("/auth", auth);
app.route("/followers", followers);
app.route("/users", users);
app.route("/notifications", notifications); 
app.route('/register', register);
app.route('/login', login);
app.route('/reset-password', resetPassword);
app.route("/followers/search", search); //D1
app.route("/followers", QR); // D1
app.route("/ranking", ranking); // D1
app.route("/settings", settings); // D1

// 기본 경로
app.get("/", (c) => {
  return c.text("Welcome to SNS Backend!");
});

export default app;
