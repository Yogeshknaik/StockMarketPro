package com.stock.controller;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.stock.model.Stock;
import com.stock.model.allStock;
import com.stock.model.buyedStocks;
import com.stock.model.tranStock;

@Controller
public class HomeController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    	String name;

    @RequestMapping("/")
    public String home() {
        return "homepage";
    }
    @RequestMapping("signup")
    public String signup() {

        return "signup";
    }

 @RequestMapping("userlogin")
 public String userlogin() {
        return "login";
    }

    
 @RequestMapping("login")
 public String login(@RequestParam(name = "username") String username,
            @RequestParam(name = "email") String email,
            @RequestParam(name = "password") String password) {

System.out.println("Username: " + username + ", Email: " + email + ", Password: " + password); // Mask password for logging

try {
String createTableQuery = "CREATE TABLE IF NOT EXISTS users (username VARCHAR(255), email VARCHAR(255), password VARCHAR(255))";
jdbcTemplate.execute(createTableQuery);

String insertUserQuery = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
int rowsAffected = jdbcTemplate.update(insertUserQuery, username, email, password);

if (rowsAffected > 0) {
 return "login";
} else {
 return "registration_error";
}
} catch (DataAccessException e) {
return "registration_error"; 
}
}

  
 
 @RequestMapping("/trending")
    public String trending(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            ModelMap model) {

        try {
            // Prepared statement to prevent SQL injection
            String selectUserQuery = "SELECT * FROM users WHERE username = ? AND password = ?";
            List<Map<String, Object>> users = jdbcTemplate.queryForList(selectUserQuery, username, password); // Use encoded password for comparison
System.out.print(username);
name=username;
            if (!users.isEmpty()) {
                // User exists, redirect to the trending page
                model.addAttribute("name", username);
               
                return "trending";
            } else {
                return "invadidUser"; // Replace with the appropriate view name
            }
        } catch (Exception e) {
            // Log the exception and handle appropriately
            e.printStackTrace();
            return "error"; // Replace with the appropriate view name
        }
}
 @RequestMapping("/dashboard")
 public String dashboard(ModelMap model) {
     String fetchStocksQuery = "SELECT * FROM stocks";
    
     List<Map<String, Object>> stocks = jdbcTemplate.queryForList(fetchStocksQuery);
     
     List<Stock> stocksList = new ArrayList<>();
     for (Map<String, Object> stockMap : stocks) {
         int id = (int) stockMap.get("id");
         String name = (String) stockMap.get("name");
         double trend = (double) stockMap.get("trend");
         String icon = (String) stockMap.get("icon");
         int  volume = (int) stockMap.get("volume");
         
         // Assuming Stock class has a constructor that matches these parameters
         Stock stock = new Stock(id, name, trend, icon, volume);
         
         stocksList.add(stock);
     }
     
     System.out.println("Number of stocks: " + stocksList.size());
      model.addAttribute("stocks",stocksList);
      
      
      
      
      
      String stockNamesQuery = "SELECT DISTINCT stockName FROM userStoksData WHERE username = ?";
      List<Map<String, Object>> stockNamesResult = jdbcTemplate.queryForList(stockNamesQuery, name);

      // Create a list to store stock names
      List<String> stockNames = new ArrayList<>();
      for (Map<String, Object> stockNameMap : stockNamesResult) {
          String stockName = (String) stockNameMap.get("stockName");
          stockNames.add(stockName);
      }

      
      System.out.println(stockNames);
      
      
      
      String StocksQuery = "SELECT * FROM buyedStocks";
      
      List<Map<String, Object>> userstocks = jdbcTemplate.queryForList(StocksQuery);
      
     
      List<buyedStocks> userstocksList = new ArrayList<>();
 for (Map<String, Object> stockMap : userstocks) {
	 System.out.println((String) stockMap.get("stockName"));
 if (stockNames.contains((String) stockMap.get("stockName"))/*&&stockMap.get("date")=="todaydate"*/) {
          int sno = (int) stockMap.get("sno");
          String date = (String) stockMap.get("date");
          String stockName = (String) stockMap.get("stockName");
          BigDecimal prize = (BigDecimal) stockMap.get("prize");
          int  quantity = (int) stockMap.get("quantity");
          
          // Assuming Stock class has a constructor that matches these parameters
          buyedStocks buyedStock = new buyedStocks(sno, date, stockName, prize, quantity);
          
          userstocksList.add(buyedStock);
    	  }
      }
      
      System.out.println("Number of stocks: " + stocksList.size()+""+userstocksList );
       model.addAttribute("userStocks",userstocksList);
      
       
       
       String tranStocksQuery = "SELECT * FROM stockStatus";
       
       List<Map<String, Object>> transtocks = jdbcTemplate.queryForList(tranStocksQuery);
       
       List<tranStock> transtocksList = new ArrayList<>();
       for (Map<String, Object> stockMap : transtocks) {
    	    if(name.equals((String)stockMap.get("userName"))) {
    	        String StockName = (String) stockMap.get("StockName");
    	        String Status = (String) stockMap.get("Status");

    	        // Assuming Stock class has a constructor that matches these parameters
    	        tranStock transtock = new tranStock(StockName, Status);

    	        transtocksList.add(transtock);
    	    }
    	}

 
       System.out.println(transtocksList);
        model.addAttribute("transtocks",transtocksList);
       
     return "dashboard";
 }



 @RequestMapping("/addStocks")
 public String GoTOAddStocks() {
	 
	 return "addStocks";
 }
 @RequestMapping("/GotoDashboard")
 public String addStocks(@RequestParam("stockName") String stockName, @RequestParam("Quaintaty") int Quaintaty, ModelMap model) {
     System.out.println(name + stockName + Quaintaty);
     String selectUserQuery = "INSERT INTO userStoksData (username, stockName, Quaintaty) VALUES (?, ?, ?)";
     jdbcTemplate.update(selectUserQuery, name, stockName, Quaintaty);
     LocalDate todaydate = LocalDate.now();
     String TranStockQuery = "INSERT INTO stockStatus ( StockName, Status, Date, userName) VALUES (?,?,?,?)";
     jdbcTemplate.update(TranStockQuery, stockName,"buyed",todaydate.toString(),name);
     return "redirect:/dashboard";
 }
//http://localhost:8080/stockPrices?stockName=Apple
@RequestMapping("/stockPrices")
public String getStockPrices(@RequestParam("stockName") String stockName, ModelMap model) {
	  List<Map<String, Object>> stocks = jdbcTemplate.queryForList(
	            "SELECT * FROM allstocks WHERE stockname = ?",  // Keep the placeholder
	            new Object[]{stockName}  // Provide the parameter value
	    );
	 List<allStock> stocksList = new ArrayList<>();
    for (Map<String, Object> stockMap : stocks) {
        String stockname = (String) stockMap.get("stockname");
        double price = (double) stockMap.get("price");
        String date = (String) stockMap.get("date");
       
        
        // Assuming Stock class has a constructor that matches these parameters
        allStock stock = new allStock( stockname, price, date);
        
        stocksList.add(stock);
    }

    model.addAttribute("stockData",stocksList);
    model.addAttribute("stockname",stockName);

    return "graph";
}
 @RequestMapping("/deleteStocks")
 public String deleteStocks(@RequestParam("stockName") String stockName, ModelMap model) {
     System.out.println(name + stockName );
     String deleteStockQuery = "DELETE FROM userStoksData WHERE username = ? AND stockName = ?";
     jdbcTemplate.update(deleteStockQuery, name, stockName);
     String TranStockQuery = "INSERT INTO stockStatus ( StockName, Status, Date, userName) VALUES (?,?,?,?)";
 LocalDate todaydate = LocalDate.now();
     jdbcTemplate.update(TranStockQuery, stockName,"selld",todaydate.toString(),name);
     
     return "redirect:/dashboard";
 }
 
}