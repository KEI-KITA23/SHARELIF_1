import { Hono } from 'hono';

const app = new Hono();

let blogPosts = [
  {
    id: "1",
    title: "Post1",
    content: "Post1 content",
    likes: 0,
    comments: [],
    timestamp: new Date("2023-10-05T10:00:00Z")  // 게시물 생성 시간
  },
  {
    id: "2",
    title: "Post2",
    content: "Post2 content",
    likes: 0,
    comments: [],
    timestamp: new Date("2023-10-06T09:00:00Z")  // 게시물 생성 시간
  }
];

// 모든 포스트를 최신순으로 정렬하여 가져오기
app.get("/", (c) => {
  const sortedPosts = blogPosts.sort((a, b) => b.timestamp.getTime() - a.timestamp.getTime());
  return c.json({ posts: sortedPosts });
});

// 특정 포스트 가져오기
app.get("/:id", (c) => {
  const id = c.req.param("id");
  const post = blogPosts.find(p => p.id === id);

  if (!post) {
    return c.json({ message: "Post not found" }, 404);
  }

  return c.json(post);
});

// 포스트 생성하기
app.post("/", async (c) => {
  const { title, content } = await c.req.json();
  const newPost = {
    id: String(blogPosts.length + 1),
    title,
    content,
    likes: 0,
    comments: [],
    timestamp: new Date()  // 현재 시간을 생성 시간으로 추가
  };
  blogPosts.push(newPost);
  return c.json(newPost, 201);
});

// 포스트 수정
app.put("/:id", async (c) => {
  const id = c.req.param("id");
  const post = blogPosts.find(p => p.id === id);

  if (!post) {
    return c.json({ message: "Post not found" }, 404);
  }

  const { title, content } = await c.req.json();
  post.title = title;
  post.content = content;

  return c.json(post);
});

// 포스트 삭제
app.delete("/:id", (c) => {
  const id = c.req.param("id");
  blogPosts = blogPosts.filter(p => p.id !== id);
  return c.json({ message: "Post deleted" });
});


// 좋아요 기능
app.post("/:id/like", (c) => {
  const id = c.req.param("id");
  const post = blogPosts.find(p => p.id === id);

  if (!post) {
    return c.json({ message: "Post not found" }, 404);
  }

  post.likes += 1;
  return c.json({ message: "Post liked", likes: post.likes });
});

// 제목 또는 내용에서 특정 키워드로 검색
app.get("/search/:query", (c) => {
  const query = c.req.param("query").toLowerCase();
  const filteredPosts = blogPosts.filter(post => 
    post.title.toLowerCase().includes(query) || post.content.toLowerCase().includes(query)
  );

  if (filteredPosts.length === 0) {
    return c.json({ message: "No posts found" }, 404);
  }

  return c.json({ posts: filteredPosts });
});

export default app;
