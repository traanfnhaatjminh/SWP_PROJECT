/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author minh1
 */
public class Order {

    private int orderID;
    private int customerID;
    private String orderName;
    private int orderDiscount;
    private String orderDate;
    private String notes;
    private String orderAddress;
    private int orderPhone;
    private String orderStatus;
    private float totalCost;
    private int sellerID;
    private List<String> productName;

    public Order() {
    }

    public Order(int orderID, int customerID, String orderName, int orderDiscount, String orderDate, String notes, String orderAddress, int orderPhone, String orderStatus, float totalCost, int sellerID) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.orderName = orderName;
        this.orderDiscount = orderDiscount;
        this.orderDate = orderDate;
        this.notes = notes;
        this.orderAddress = orderAddress;
        this.orderPhone = orderPhone;
        this.orderStatus = orderStatus;
        this.totalCost = totalCost;
        this.sellerID = sellerID;
    }

    public Order(int orderID, int customerID, String orderName, int orderDiscount, String orderDate, String notes, String orderAddress, int orderPhone, String orderStatus, float totalCost, int sellerID, List<String> productName) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.orderName = orderName;
        this.orderDiscount = orderDiscount;
        this.orderDate = orderDate;
        this.notes = notes;
        this.orderAddress = orderAddress;
        this.orderPhone = orderPhone;
        this.orderStatus = orderStatus;
        this.totalCost = totalCost;
        this.sellerID = sellerID;
        this.productName = productName;
    }

    public Order(int orderID, int customerID, int sellerID, String orderName, int orderDiscount, String orderDate, String notes, String orderAddress, int orderPhone, String orderStatus, float totalCost) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.sellerID = sellerID;
        this.orderName = orderName;
        this.orderDiscount = orderDiscount;
        this.orderDate = orderDate;
        this.notes = notes;
        this.orderAddress = orderAddress;
        this.orderPhone = orderPhone;
        this.orderStatus = orderStatus;
        this.totalCost = totalCost;
    }

    public Order(int orderID, int customerID, int sellerID, String orderName, int orderDiscount, String orderDate, String notes, String orderAddress, int orderPhone, String orderStatus, float totalCost, List<String> productName) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.sellerID = sellerID;
        this.orderName = orderName;
        this.orderDiscount = orderDiscount;
        this.orderDate = orderDate;
        this.notes = notes;
        this.orderAddress = orderAddress;
        this.orderPhone = orderPhone;
        this.orderStatus = orderStatus;
        this.totalCost = totalCost;
        this.productName = productName;
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

    public int getSellerID() {
        return sellerID;
    }

    public void setSellerID(int sellerID) {
        this.sellerID = sellerID;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
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

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public float getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(float totalCost) {
        this.totalCost = totalCost;
    }

    public List<String> getProductName() {
        return productName;
    }

    public void setProductName(List<String> productName) {
        this.productName = productName;
    }

}
