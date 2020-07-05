package com.eon.bookstore.entity;

import javax.persistence.*;
import java.util.Date;


@Table(name = "orderinfo")
@Entity
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "address_id")
    private int addressID;

    @Column(name = "value")
    private double value;

    @Column(name = "order_date")
    private Date date;

    @Column(name = "status")
    private int status;

    public Order() {
    }

    public Order(User user, int addressID, double value, Date date, int status) {
        this.user = user;
        this.addressID = addressID;
        this.value = value;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", user=" + user +
                ", addressID='" + addressID + '\'' +
                ", value=" + value +
                ", date=" + date +
                '}';
    }
}
