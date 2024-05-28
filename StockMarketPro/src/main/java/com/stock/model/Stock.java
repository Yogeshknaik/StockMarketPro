package com.stock.model;
public class Stock {
    private int id;
    private String name;
    private double trend;
    private String icon;
    private long volume;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getTrend() {
		return trend;
	}
	public void setTrend(double trend) {
		this.trend = trend;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public long getVolume() {
		return volume;
	}
	public void setVolume(long volume) {
		this.volume = volume;
	}
	
	public Stock(int id2, String name2, double trend2, String icon2, int volume2) {
		// TODO Auto-generated constructor stub
		this.id = id2;
		this.name = name2;
		this.trend = trend2;
		this.icon = icon2;
		this.volume = volume2;
	}
}
