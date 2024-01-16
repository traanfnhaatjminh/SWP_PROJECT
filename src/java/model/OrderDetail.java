/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author minh1
 */
public class OrderDetail {
//    create table orderDetail(
//detailID int IDENTITY(1,1) NOT NULL,
//orderID int NOT NULL,
//productID int,
//orderPrice money,
//quantity int,
//FOREIGN KEY (orderID) REFERENCES [Order](orderID),
//FOREIGN KEY (productID) REFERENCES product(id),

    private int orderID;
    private int productID;
    private double orderPrice;
    private int quantity;

    public OrderDetail() {
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public double getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(double orderPrice) {
        this.orderPrice = orderPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
