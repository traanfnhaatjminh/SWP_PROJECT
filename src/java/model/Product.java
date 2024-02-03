/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author minh1
 */
public class Product {

    private int id;
    private String name;
    private double original_price;
    private double sale_price;
    private int quantity;
    private String describe, image;
    private int cid;

    public Product() {
    }

    public Product(int id, String name, double original_price, double sale_price, int quantity, String describe, String image, int cid) {
        this.id = id;
        this.name = name;
        this.original_price = original_price;
        this.sale_price = sale_price;
        this.quantity = quantity;
        this.describe = describe;
        this.image = image;
        this.cid = cid;
    }

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

    public double getOriginal_price() {
        return original_price;
    }

    public void setOriginal_price(double original_price) {
        this.original_price = original_price;
    }

    public double getSale_price() {
        return sale_price;
    }

    public void setSale_price(double sale_price) {
        this.sale_price = sale_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", original_price=" + original_price + ", sale_price=" + sale_price + ", quantity=" + quantity + ", describe=" + describe + ", image=" + image + ", cid=" + cid + '}';
    }

}
