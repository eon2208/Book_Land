package com.eon.bookstore.model;

public class BasketModel {

    private String id;
    private double totalPrice;

    public BasketModel() {
    }

    public BasketModel(String id, double totalPrice) {
        this.id = id;
        this.totalPrice = totalPrice;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
