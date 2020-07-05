package com.eon.bookstore.entity;

import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Table(name = "basket")
@Entity
public class Basket {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid")
    @Column(name = "basket_id")
    private String id;

    @Column(name = "total_price")
    private double totalPrice;

    @OneToMany(mappedBy = "basket", cascade = CascadeType.ALL)
    private List<TotalBasket> totalBasketList;

    public Basket() {
    }

    public Basket(double totalPrice) {
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

    public List<TotalBasket> getTotalBasketList() {
        return totalBasketList;
    }

    public void setTotalBasketList(List<TotalBasket> totalBasket) {
        this.totalBasketList = totalBasket;
    }

    // add convenience methods for bi-directional relationship
    public void add(TotalBasket totalBasket) {
        if (totalBasketList == null) {
            totalBasketList = new ArrayList<>();
        }
        totalBasketList.add(totalBasket);
    }

}
