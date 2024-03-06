/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author minh1
 */
public class Feedback {

    private int feedbackID;
    private int customerID;
    private String content;
    private int productID;
    private String postDate;
    private float ratedStar;
    private String status;
    private String customerName;
    private String productName;

    public Feedback(int feedbackID, int customerID, String content, int productID, String postDate, float ratedStar, String status, String customerName, String productName) {
        this.feedbackID = feedbackID;
        this.customerID = customerID;
        this.content = content;
        this.productID = productID;
        this.postDate = postDate;
        this.ratedStar = ratedStar;
        this.status = status;
        this.customerName = customerName;
        this.productName = productName;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public float getRatedStar() {
        return ratedStar;
    }

    public void setRatedStar(float ratedStar) {
        this.ratedStar = ratedStar;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

}
