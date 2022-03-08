package com.glostock.model;

public class StockVO {

    private String ticker;
    private String name;
    private double current_price;
    private double prev_close_price;
    private double change_in_percentage;
    private String logo_url;

    public StockVO() {
    }

    public StockVO(String ticker, String name, int current_price, int prev_close_price, int change_in_percentage) {
        this.ticker = ticker;
        this.name = name;
        this.current_price = current_price;
        this.prev_close_price = prev_close_price;
        this.change_in_percentage = change_in_percentage;
    }

    public String getTicker() {
        return ticker;
    }

    public void setTicker(String ticker) {
        this.ticker = ticker;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getCurrent_price() {
        return current_price;
    }

    public void setCurrent_price(double current_price) {
        this.current_price = current_price;
    }

    public double getPrev_close_price() {
        return prev_close_price;
    }

    public void setPrev_close_price(double prev_close_price) {
        this.prev_close_price = prev_close_price;
    }

    public double getChange_in_percentage() {
        return change_in_percentage;
    }

    public void setChange_in_percentage(double change_in_percentage) {
        this.change_in_percentage = change_in_percentage;
    }

    public String getLogo_url() {
        return logo_url;
    }

    public void setLogo_url(String logo_url) {
        this.logo_url = logo_url;
    }
}
