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

    private int orderID;
    private int productID;
    private double productPrice;
    private int quantity;
    private double totalCost;
    private String product_img;
    private String product_name;
    private String product_cate;
    private Product product;

    public OrderDetail() {
    }

    public OrderDetail(int orderID, int productID, double productPrice, int quantity, double totalCost, String product_img, String product_name, String product_cate) {
        this.orderID = orderID;
        this.productID = productID;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.totalCost = totalCost;
        this.product_img = product_img;
        this.product_name = product_name;
        this.product_cate = product_cate;

    }

    public OrderDetail(int orderID, int productID, double productPrice, int quantity, double totalCost) {
        this.orderID = orderID;
        this.productID = productID;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.totalCost = totalCost;
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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProduct_img() {
        return product_img;
    }

    public void setProduct_img(String product_img) {
        this.product_img = product_img;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_cate() {
        return product_cate;
    }

    public void setProduct_cate(String product_cate) {
        this.product_cate = product_cate;
    }

}
