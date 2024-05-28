package com.stock.model;

import java.math.BigDecimal;

public class buyedStocks {
	 private int sno;
	    private String date;
	    private String stockName;
	    private BigDecimal prize;
	    private int quantity;
		
		
		public buyedStocks(int sno, String date, String stockName, BigDecimal prize, int quantity) {
			// TODO Auto-generated constructor stub
			this.sno = sno;
			this.date = date;
			this.stockName = stockName;
			this.prize = prize;
			this.quantity = quantity;
		}

		public int getSno() {
			return sno;
		}
		public void setSno(int sno) {
			this.sno = sno;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getStockName() {
			return stockName;
		}
		public void setStockName(String stockName) {
			this.stockName = stockName;
		}
		public BigDecimal getPrize() {
			return prize;
		}
		public void setPrize(BigDecimal prize) {
			this.prize = prize;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}

		@Override
		public String toString() {
			return "buyedStocks [sno=" + sno + ", date=" + date + ", stockName=" + stockName + ", prize=" + prize
					+ ", quantity=" + quantity + "]";
		}
	    
	    
}
