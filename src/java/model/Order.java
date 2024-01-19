/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author minh1
 */
public class Order {
//    orderID int IDENTITY(1,1) primary key NOT NULL,
//userID int,
//orderName nvarchar(60),
//orderStatusID int,
//orderDiscount int,
//orderDate Date,
//notes nvarchar(1000),
//orderAddress nvarchar(100),
//orderPhone nvarchar(20),
//FOREIGN KEY (userID) REFERENCES [Users](userID),
//FOREIGN KEY (orderStatusID) REFERENCES orderStatus(orderStatusID)

    private int orderID;
    private int customerID;
    private String orderName;
    private int orderStatusID;
    private int orderDiscount;
    private String orderDate;
    private String notes;
    private String orderAddress;
    private int orderPhone;

    public Order() {
    }

    public Order(int orderID, int customerID, String orderName, int orderStatusID, int orderDiscount, String orderDate, String notes, String orderAddress, int orderPhone) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.orderName = orderName;
        this.orderStatusID = orderStatusID;
        this.orderDiscount = orderDiscount;
        this.orderDate = orderDate;
        this.notes = notes;
        this.orderAddress = orderAddress;
        this.orderPhone = orderPhone;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public int getOrderStatusID() {
        return orderStatusID;
    }

    public void setOrderStatusID(int orderStatusID) {
        this.orderStatusID = orderStatusID;
    }

    public int getOrderDiscount() {
        return orderDiscount;
    }

    public void setOrderDiscount(int orderDiscount) {
        this.orderDiscount = orderDiscount;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public int getOrderPhone() {
        return orderPhone;
    }

    public void setOrderPhone(int orderPhone) {
        this.orderPhone = orderPhone;
    }

}
