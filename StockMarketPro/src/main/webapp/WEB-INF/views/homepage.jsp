<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Stock Information</title>
<style>
body {
    background-image: url('https://www.cash-master.com/wp-content/uploads/2017/07/m1-1.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    font-family: Arial, sans-serif;
}
.navbar {
	padding-left:50px;
	padding-right:50px;
    background-color: #86B6F6;
    overflow: hidden;
    display: flex;
    justify-content:space-between;
    align-items: center;
    box-shadow: 0 0 10px rgba(0,0,0,0.5);
}
.navbar a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    transition: color 0.3s ease;
}
.navbar a:hover {
    color: #ff6347;
}
h2 {
    color: #333;
    text-align: center;
    margin-top: 50px;
}
button {
    display: block;
    width: 200px;
    height: 50px;
    margin: 20px auto;
    background-color: #4CAF50;
    color: white;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,0.5);
    cursor: pointer;
    transition: background-color 0.3s ease;
}
button:hover {
    background-color: #45a049;
}
footer {
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    background-color: #333;
    color: white;
    text-align: center;
    padding: 10px 0;
}
</style>
</head>
<body>

<div class="navbar">
<div> <a>STOCK MARKET</a></div>
<div>
  <a href="#home">Home</a>
 <a href="${pageContext.request.contextPath}/userlogin">Login</a>
  <a href="#contact">Contact</a>
  </div>
</div>
<div>
    <h2>Invest in everything</h2>
    <p>Online platform to invest in stocks, derivatives, mutual funds, and more</p>
    <!-- Add your stock related information here -->
</div>
<div>
	<form action="signup">
      <button type="submit">SIGN UP</button>
        </form>
</div>
<footer>
    <p>Copyright © 2024 Stock Information</p>
</footer>
</body>
</html>
