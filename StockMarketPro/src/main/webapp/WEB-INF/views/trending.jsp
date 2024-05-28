<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blog Post</title>
<style>
body {
  font-family: Arial, sans-serif;
  background: #fafafa;
  margin: 0;
  padding: 0;
}
#blog-post {
  background: #fff;
  border: 1px solid #e6e6e6;
  border-radius: 5px;
  width: 300px;
  margin: 20px auto;
  padding: 20px;
  box-shadow: 0 0 5px rgba(0,0,0,0.1);
}
#blog-post h1 {
  font-size: 24px;
  color: #262626;
  margin-bottom: 10px;
}
#blog-post img {
  width: 100%;
  height: auto;
  border-top: 1px solid #efefef;
  border-bottom: 1px solid #efefef;
}
#blog-post p {
  color: #999;
  line-height: 1.5;
}
button {
  background: #3897f0;
  border: 1px solid #3897f0;
  border-radius: 4px;
  color: #fff;
  cursor: pointer;
  font-weight: bold;
  padding: 5px 9px;
  text-transform: uppercase;
  margin: 5px;
}
button:hover {
  background: #2779bd;
}
</style>
</head>
<body>
    <div id="blog-post">
        <h1>Blog Post Title</h1>
        <img src="image.jpg" alt="Blog image">
        <p>This is a little description of the blog post. It's just a placeholder text for now.</p>
        <button type="button" onclick="alert('Liked!')">Like</button>
        <button type="button" onclick="alert('Shared!')">Share</button>
        <button type="button" onclick="alert('Commented!')">Comment</button>
    </div>
<p></p>
<div id="blog-post">
        <h1>Blog Post Title</h1>
        <img src="image.jpg" alt="Blog image">
        <p>This is a little description of the blog post. It's just a placeholder text for now.</p>
        <button type="button" onclick="alert('Liked!')">Like</button>
        <button type="button" onclick="alert('Shared!')">Share</button>
        <button type="button" onclick="alert('Commented!')">Comment</button>
    </div>
login sucess ${name}
 <a href="${pageContext.request.contextPath}/dashboard">Login</a>
</body>
</html>