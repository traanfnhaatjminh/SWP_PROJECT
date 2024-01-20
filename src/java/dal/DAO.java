/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.BlogCategory;
import model.Category;
import model.Post;
import model.Product;
import model.Slider;
import model.Users;

/**
 *
 * @author minh1
 */
public class DAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid")
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(
                        rs.getInt("cid"),
                        rs.getString("cname"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<BlogCategory> getAllBlogCategory() {
        List<BlogCategory> list = new ArrayList<>();
        String sql = "select * from Blog_Category";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BlogCategory c = new BlogCategory(
                        rs.getInt("blogCategoryID"),
                        rs.getString("blogCategoryName"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTopProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 8 *\n"
                + "FROM product\n"
                + "ORDER BY id DESC;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid")
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Slider> getTopSlider(int start, int end) {
        List<Slider> list = new ArrayList<>();
        String sql = "select top 3 * from Slider\n"
                + "where sliderID between ? and ?\n"
                + "order by sliderID asc";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, start);
            st.setInt(2, end);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Slider c = new Slider(
                        rs.getInt("sliderID"),
                        rs.getString("sliderTitle"),
                        rs.getString("sliderImage"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Post> getTopPost() {
        List<Post> list = new ArrayList<>();
        String sql = "select top 2 * from Post\n"
                + "order by postID desc";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post c = new Post(
                        rs.getInt("postID"),
                        rs.getString("postTitle"),
                        rs.getString("postImage"),
                        rs.getString("postContent"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "where cid = ?";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid")
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Blog getLatestBlog() {
        String sql = "select top 1 * from Blog\n"
                + "order by blogID desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductByID(String id) {
        String sql = "SELECT * from product\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogSearch(String searchValue) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "where blogTitle like N'%' + ? + '%'";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, searchValue);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogRecent() {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "order by postDate desc";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Users checkUsers(String user, String pass) {
        String sql = "select * from Users\n"
                + "where [userName] = ? AND [pass] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Users(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getDouble(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Users checkExisted(String user) {
        String sql = "SELECT * FROM Users\n"
                + "where [userName] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Users(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getDouble(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public void signup(String user, String email, String pass) {
        String sql = "insert into Users "
                + "values(?,?,?,1,0)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, email);
            st.setString(3, pass);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        List<Blog> listB = d.getAllBlogSearch("hướng dẫn");
        System.out.println(listB);
    }

}
