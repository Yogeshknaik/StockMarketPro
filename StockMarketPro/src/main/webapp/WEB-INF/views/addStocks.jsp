<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
/* styles.css */
.container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

h2 {
    text-align: center;
}

label {
    display: block;
    margin-bottom: 10px;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

button {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 3px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

</style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="GotoDashboard" method="post">
            <label for="stockName">Stockname:</label>
            <select id="stockName" name="stockName" required>
                <option value="">Select a stock</option>
                <option value="AAPL">AAPL</option>
                <option value="stock2">Stock 2</option>
            </select>
            
            <label for="Quaintaty">Quaintaty:</label>
            <input type="number" id="Quaintaty" name="Quaintaty" required>

            <button type="submit">Login</button>
        </form>
      <a href="${pageContext.request.contextPath}/dashboard">Login</a>
    </div>
</body>
</html>
</html>