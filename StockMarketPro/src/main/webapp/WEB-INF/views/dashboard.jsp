<%@page import="com.stock.model.tranStock"%>
<%@page import="com.stock.model.buyedStocks"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.stock.model.Stock" %>
    
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard design</title>
    <style type="text/css">
    *{
    margin:0;
    padding:0;
    border: none;
    outline: none;
    box-sizing: border-box;
    font-family: "Poppins",sans-serif;
}
body{
    display:flex;
}
.sidebar{
    position: sticky;
    top:0;
    left:0;
    bottom:0;
    width:110px;
    height:100vh;
    padding:0 1.7rem;
    color:#fff;
    overflow:hidden;
    transition: all 0.5s linear;
    background: #0982a0;
}

.sidebar:hover{
    width: 240px;
    transition:0.5s;

}
.logo{
    height: 80px;
    padding: 16px;
}
.menu{
    height:88%;
    position: relative;
    list-style: none;
    padding: 0;
}
.menu li{
    padding :1rem;
    margin:8px 0;
    border-radius: 8px;
    transition: all 0.5s ease-in-out;
}
.menu li:hover,
.active{
    background:#e0e0e058 ;
}
.menu a{
    color:#fff;
    font-size: 14px;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 1.5rem;
}
.menu a span{
    overflow: hidden;
}
.menu a i{
    font-size: 1.2rem;
}
.logout{
    position: absolute;
    bottom: 0;
    left:0;
    width:100%;
}
.main--content{
    position: relative;
    background: #ebe9e9;
    width: 100%;
    padding: 1rem;
}
.header--wrapper img{
    width:50px;
    height:50px;
    cursor:pointer;
    border-radius: 50%;
}

.header--wrapper{
    display: flex;
    justify-content:space-between;
    align-items: center;
    flex-wrap: wrap;
    background: #fff;
    border-radius: 10px;
    padding: 10px 2rem;
    margin-bottom: 1rem;
}

.header--title{
    color: #cca866;
}

.user--info{
    display: flex;
    align-items: center;
    gap: 1rem;
}
.search--box{
    background: rgb(237,237,237);
    border-radius: 15px;
    color: #ebce7f;
    display: flex;
    align-items: center;
    gap: 5px;
    padding: 4px 12px;
}
.search--box input{
    background: transparent;
    padding: 10px;
}
.search--box i{
    font-size: 1.2rem;
    cursor:pointer;
    transition: all 0.5s ease-out;
}
.search--box i:hover{
    transform: scale(1.2);
}
/*card container*/
.card--container{
    background: #fff;
    padding: 2rem;
    border-radius: 10px;
}
.card--wrapper{
    display: flex;
    flex-wrap: wrap;
    gap:1rem;
}
.main--title{
    color:#89bceb;
    padding-bottom:10px ;
    font-size: 15px;
}
.payment--card{
    background: rgb(229,223,223);
    border-radius: 10px;
    padding: 1.2rem;
    width:290px;
    height:150px;
    display:flex;
    flex-direction: column;
    justify-content: space-between;
    transition:all 0.5s ease ;
}

.payment--card:hover{
    transform:translateY(-5px);
}
.card--header{
    display:flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}
.amount{
    display: flex;
    flex-direction: column;
}
.title{
    font-size:12px;
    font-weight: 200;;
}
.amount--value{
    font-size:24px;
    font-family: 'Courier New', Courier, monospace;
    font-weight: 600;
}

.icon{
    color: #fff;
    padding: 1rem;
    height: 60px;
    width: 80px;
    text-align: center;
    border-radius: 50%;
    font-size: 1.5rem;
    background: rgb(253, 253, 253);
}

.card-details{
    font-size:18px;
    color:#777777;
    letter-spacing: 2px;
    font-family: 'Courier New', Courier, monospace;
}
.light-red{
    background: rgb(251, 233, 233);
}
.light-purple{
    background: rgb(254,226,254);
}
.light-green{
    background: rgb(235,254,235);
}
.light-blue{
    background:rgb(236,236,254);
}
.dark-red{
    background: red;
}
.dark-purple{
    background:purple;
}
.dark-green{
    background:green;
}
.dark-blue{
    background:blue;
}

/**tabular section**/
.tabular--wrapper{
background: #fff;
margin-top:1rem;
border-radius:10px;
padding:2rem;
}
.table-container{
    width:100%
}
table{
    width: 100%;
    border-collapse: collapse;
}
thead{
    background: #98cdec;
    color:#fff;
}
th{
    padding:15px;
    text-align: left;
}
tbody{
    background: #fef2f2;
}
td{padding:15px;
font-size: 14px;
color:#333;
}

tr:nth-child(even){
    background: #fff;
}
tfoot{
background: #cca866;
font-weight: bold;
color:#fff;
}
tfoot td{
padding:15px;
color: #fff;
}

.table-container button{
color:#cca866;
background:none;
cursor: pointer;
}


#content main .table-data {
	display: flex;
	flex-wrap: wrap;
	grid-gap: 24px;
	margin-top: 24px;
	width: 100%;
	color: var(--dark);
}
#content main .table-data > div {
	border-radius: 20px;
	background: var(--light);
	padding: 24px;
	overflow-x: auto;
}
#content main .table-data .head {
	display: flex;
	align-items: center;
	grid-gap: 16px;
	margin-bottom: 24px;
}
#content main .table-data .head h3 {
	margin-right: auto;
	font-size: 24px;
	font-weight: 600;
}
#content main .table-data .head .bx {
	cursor: pointer;
}

#content main .table-data .order {
	flex-grow: 1;
	flex-basis: 500px;
}
#content main .table-data .order table {
	width: 100%;
	border-collapse: collapse;
}
#content main .table-data .order table th {
	padding-bottom: 12px;
	font-size: 13px;
	text-align: left;
	border-bottom: 1px solid var(--grey);
}
#content main .table-data .order table td {
	padding: 16px 0;
}
#content main .table-data .order table tr td:first-child {
	display: flex;
	align-items: center;
	grid-gap: 12px;
	padding-left: 6px;
}
#content main .table-data .order table td img {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	object-fit: cover;
}
#content main .table-data .order table tbody tr:hover {
	background: var(--grey);
}
#content main .table-data .order table tr td .status {
	font-size: 10px;
	padding: 6px 16px;
	color: var(--light);
	border-radius: 20px;
	font-weight: 700;
}

#content main .table-data .order table tr td .status.completed {
	background: var(--blue);
}
#content main .table-data .order table tr td .status.process {
	background: var(--yellow);
}
#content main .table-data .order table tr td .status.pending {
	background: var(--orange);
}
    
    
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="sidebar">
        <div class="logo"> </div>
            <ul class="menu">
                <li class="active">
                    <a href="#" >
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-user"></i>
                        <span>Profile</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-chart-bar"></i>
                        <span>StockNews</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-briefcase"></i>
                        <span><a href="${pageContext.request.contextPath}/addStocks">Add Stock</a></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-question-circle"></i>
                        <span>FAQ</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-star"></i>
                        <span>Terminologies</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-cog"></i>
                        <span>Settings</span>
                    </a>
                </li>
                
                <li class="logout">
                    <a href="#">
                        <i class="fas fa-sign-out-alt"></i>
                        <span><a href="${pageContext.request.contextPath}/">Add Stock</a></span>
                    </a>
                </li>
            </ul>   
    </div>
    <div class="main--content">
        <div class="header--wrapper">
            <div class="header--title">
                <span>Trending</span>
                <h2>STOCKS</h2>
            </div>
            <div class="user--info">
                <div class="search--box">
                <i class="fa-solid fa-search"></i>
                <input type="text" placeholder="search">
            </div>
            <img src="./image/logo_farm.png" alt="">
        </div>
        </div>
 <div>

     <%
        // Assuming the list of stocks is passed as a request attribute named "stocks"
        List<Stock> stocks = (List<Stock>) request.getAttribute("stocks");
    %>
     <% for (Stock stock : stocks) { %>
<div class="card-container">
    <div class="payment--card light-red">
        <div class="card--header">
            <div class="amount">
                <span class="title"><%= stock.getName() %></span>
                <span class="amount-value"><%= stock.getTrend() %></span>
            </div>
            <img class="icon"  src="<%= stock.getIcon() %>" alt="<%= stock.getName() %>">
        </div>
        <span class="card-detail">Volume Traded :<%= stock.getVolume() %></span>
    </div>
</div>
        <% } %>
</div>
        
        <div class="tabular--wrapper">
            <h3 class="main--title">Finance data</h3>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                        	<th>Sno</th>
                            <th>Date</th>
                            <th>Stock Name</th>
                            <th>Prize</th>
                            <th>Quantity</th>
                            <th>view</th>
                            <th>sell</th>
                            
                        </tr>
                       </thead>
                        <tbody>
    <%
        // Assuming the list of stocks is passed as a request attribute named "userStocks"
        List<buyedStocks> buyedstocks = (List<buyedStocks>) request.getAttribute("userStocks");
        int i = 1;
    %>
    <% for (buyedStocks buyedstock : buyedstocks) { %>
        <tr>
            <td><%= i %></td>
            <td><%= buyedstock.getDate() %></td>
            <td><%= buyedstock.getStockName() %></td>
            <td><%= buyedstock.getPrize() %></td>
          <td><button><a href="${pageContext.request.contextPath}/stockPrices?stockName=<%= buyedstock.getStockName() %>">View</a></button></td>
          <td><button><a href="${pageContext.request.contextPath}/deleteStocks?stockName=<%= buyedstock.getStockName() %>">Sell</a></button></td>
          
            <td><button>News</button></td>
        </tr>
        <% i++; } %>
</tbody>
                        
                </table>
                
            </div>
        </div>
        <section id="content">
            <main>
        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Recent Orders</h3>
                    <i class='bx bx-search' ></i>
                    <i class='bx bx-filter' ></i>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>sNo</th>
                            <th>StockName</th>
                            <th>Status</th>
                        </tr>
                        
                    </thead>
                    <tbody>
                     <%
        // Assuming the list of stocks is passed as a request attribute named "userStocks"
        List<tranStock> transtocks = (List<tranStock>) request.getAttribute("transtocks");
        int j = 1;
    %>
    <% for (tranStock transtock : transtocks) { %>
                        <tr>
                            <td> <%= j %></td>
                            <td><%=transtock.getStockName() %></td>
                            <td><%=transtock.getStatus()%></td>
                        </tr>
              <% j++; } %>
                    </tbody>
                </table>
            </div>
        </div>
        </main>
        </section>
    </div>
</body>
</html>