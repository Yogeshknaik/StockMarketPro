package com.stock.model;

import java.sql.Date;

public class allStock {


	    private String stockname;
	    private double price;
	    private String date;

	    // Getters and Setters
	    public String getStockname() {
	        return stockname;
	    }

	    public void setStockname(String stockname) {
	        this.stockname = stockname;
	    }

	  

		public allStock(String stockname2, double price2, String date2) {
			// TODO Auto-generated constructor stub
			this.stockname = stockname2;
			this.price = price2;
			this.date = date2;
		}
		

		public double getPrice() {
	        return price;
	    }

	    public void setPrice(double price) {
	        this.price = price;
	    }

	    public String getDate() {
	        return date;
	    }

	    public void setDate(String date) {
	        this.date = date;
	    }
	}
