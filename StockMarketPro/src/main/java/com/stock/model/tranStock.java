package com.stock.model;

public class tranStock {
private String StockName;
private String Status;
public String getStockName() {
	return StockName;
}
public void setStockName(String stockName) {
	StockName = stockName;
}
public String getStatus() {
	return Status;
}
public void setStatus(String status) {
	Status = status;
}

public tranStock(String stockName, String status) {
	// TODO Auto-generated constructor stub
	StockName = stockName;
	Status = status;
}
@Override
public String toString() {
	return "tranStock [StockName=" + StockName + ", Status=" + Status + "]";
}

}

