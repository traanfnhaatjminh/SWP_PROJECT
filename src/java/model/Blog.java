/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author minh1
 */
public class Blog {

    private int blogID;
    private String blogTitle;
    private String blogImage;
    private String postDate;
    private String content;
    private String author;
    private String status;

    public Blog() {
    }

    public Blog(int blogID, String blogTitle, String blogImage, String postDate, String content, String author, String status) {
        this.blogID = blogID;
        this.blogTitle = blogTitle;
        this.blogImage = blogImage;
        this.postDate = postDate;
        this.content = content;
        this.author = author;
        this.status = status;
    }

    public int getBlogID() {
        return blogID;
    }

    public void setBlogID(int blogID) {
        this.blogID = blogID;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogImage() {
        return blogImage;
    }

    public void setBlogImage(String blogImage) {
        this.blogImage = blogImage;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Blog{" + "blogID=" + blogID + ", blogTitle=" + blogTitle + ", blogImage=" + blogImage + ", postDate=" + postDate + ", content=" + content + ", author=" + author + ", status=" + status + '}';
    }
    
}
