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
import model.Customer;
import model.Feedback;
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

    public String getCidByPid(String pid) {
        String sql = "select cid from product\n"
                + "where id = ?\n"
                + "";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString("cid");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
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

    public List<Product> getLatestProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 4 *\n"
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
                + "Where [quantity] != '0' ORDER BY id DESC ";
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

    public List<Product> getProductByCidPage(int cid, int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product \n"
                + "where cid = ?\n"
                + "order by id \n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setInt(2, index);
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

    public List<Blog> getBlogByCidPage(int cid, int pageIndex) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "where blogCategoryID = ?\n"
                + "ORDER BY blogID\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setInt(2, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"),
                        rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getBlogByCid(int cid) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "where blogCategoryID = ?\n";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"),
                        rs.getInt("blogCategoryID"));
                list.add(b);
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
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
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

    public String getBlogCategoryNameByID(int blogID) {
        String sql = "select bc.blogCategoryName from Blog b join Blog_Category bc\n"
                + "on b.blogCategoryID = bc.blogCategoryID\n"
                + "where b.blogID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blogID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString("blogCategoryName");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Blog getBlogDetailByID(int id) {
        String sql = "select * from Blog\n"
                + "where blogID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"),
                        rs.getInt("blogCategoryID"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Blog> getAllManageBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n";
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
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogByCid(int cid) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "where blogCategoryID = ?";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertBlog(String title, String image, String date, String content, String author, String status, int blogCateID) {
        String sql = "INSERT INTO [dbo].[Blog]\n"
                + "           ([blogTitle]\n"
                + "           ,[blogImage]\n"
                + "           ,[postDate]\n"
                + "           ,[content]\n"
                + "           ,[author]\n"
                + "           ,[status]\n"
                + "           ,[blogCategoryID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, image);
            st.setString(3, date);
            st.setString(4, content);
            st.setString(5, author);
            st.setString(6, status);
            st.setInt(7, blogCateID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editBlog(String title, String image, String date, String content, String author, String status, int blogCateID, int blogID) {
        String sql = "UPDATE [dbo].[Blog]\n"
                + "   SET [blogTitle] = ?\n"
                + "      ,[blogImage] = ?\n"
                + "      ,[postDate] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[author] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[blogCategoryID] = ?\n"
                + " WHERE blogID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, image);
            st.setString(3, date);
            st.setString(4, content);
            st.setString(5, author);
            st.setString(6, status);
            st.setInt(7, blogCateID);
            st.setInt(8, blogID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteBlog(int blogID) {
        String sql = "DELETE FROM [dbo].[Blog]\n"
                + "      WHERE blogID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blogID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Blog> getAllManageBlogPage(int pageIndex) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM Blog\n"
                + "ORDER BY blogID\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogPageByStatus(int pageIndex, String status) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "where [status] = ?\n"
                + "ORDER BY blogID\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogPageByStatusFilter(String status1, String status2, int pageIndex) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM Blog\n"
                + "WHERE [status] IN (?, ?)\n"
                + "ORDER BY blogID\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, status1);
            st.setString(2, status2);
            st.setInt(3, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogByStatusFilter(String status1, String status2) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM Blog\n"
                + "WHERE [status] IN (?, ?)\n";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, status1);
            st.setString(2, status2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogPageByCategoryFilter(String cate1, String cate2,
            String cate3, String cate4, int pageIndex) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM Blog\n"
                + "WHERE blogCategoryID IN (SELECT blogCategoryID FROM Blog_Category WHERE blogCategoryName IN (?, ?, ?,?))\n"
                + "ORDER BY blogID\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, cate1);
            st.setString(2, cate2);
            st.setString(3, cate3);
            st.setString(4, cate4);
            st.setInt(5, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogByCategoryFilter(String cate1, String cate2,
            String cate3, String cate4) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM Blog\n"
                + "WHERE blogCategoryID IN (SELECT blogCategoryID FROM Blog_Category WHERE blogCategoryName IN (?, ?, ?,?))";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, cate1);
            st.setString(2, cate2);
            st.setString(3, cate3);
            st.setString(4, cate4);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogByStatus(String status) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "where [status] = ?\n";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogASCPage(int pageIndex) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "order by blogTitle asc\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogASC() {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "order by blogTitle asc";
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
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductASC(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where cid = ?\n"
                + "order by [name] asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid")
                );
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAllProductDESC(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where cid = ?\n"
                + "order by [name] desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid")
                );
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getAllBlogDESCPage(int pageIndex) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "order by blogTitle desc\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogDESC() {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "order by blogTitle desc";
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
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getAllBlogSearch(String searchValue, int pageIndex) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "where blogTitle like N'%' + ? + '%' ORDER BY blogID\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, searchValue);
            st.setInt(2, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getString("blogImage"),
                        rs.getString("postDate"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
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
                        rs.getString("author"),
                        rs.getString("status"), rs.getInt("blogCategoryID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Product> getAllProductSearch(String search) {
        ArrayList<Product> list = new ArrayList<>();
        search = "%" + search + "%";
        String sql = "select * from product where name like N'%' + ? + '%'";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, search);
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

    public List<Product> getProductSameCategoryID(String listCategory) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 8 *\n"
                + "FROM product where cid in ";
        sql += listCategory;
        System.out.println(sql);

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

    public void addFeedback(String cid, String content, String pid, String posDate, String rate) {
        String sql = "INSERT INTO [dbo].[Feedback]\n"
                + "           ([customerID]\n"
                + "           ,[content]\n"
                + "           ,[productID]\n"
                + "           ,[postDate]\n"
                + "           ,[rate_star]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            st.setString(2, content);
            st.setString(3, pid);
            st.setString(4, posDate);
            st.setString(5, rate);
            st.setString(6, "1");
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        String sql = "select fb.*,c.fullName,p.[name] from [Feedback] fb join product p on fb.productID = p.id \n"
                + "join Customer c on fb.customerID = c.customerID";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Feedback getFeedbackByFid(String fid) {
        String sql = "select fb.*,c.fullName,p.[name] from [Feedback] fb join product p on fb.productID = p.id\n"
                + "join Customer c on fb.customerID = c.customerID\n"
                + "where fb.feedbackID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer getCustomerByCid(int Cid) {
        String sql = "select * from Customer\n"
                + "where customerID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Feedback> getAllFeedbackPage(int index) {
        List<Feedback> list = new ArrayList<>();
        String sql = "select fb.*,c.fullName,p.[name] from [Feedback] fb join product p on fb.productID = p.id\n"
                + "join Customer c on fb.customerID = c.customerID\n"
                + "order by fb.feedbackID\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllFeedbackByPidPage(String pid, int index) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT fb.*, c.fullName, p.[name]\n"
                + "FROM [Feedback] fb\n"
                + "JOIN Product p ON fb.productID = p.id\n"
                + "JOIN Customer c ON fb.customerID = c.customerID\n"
                + "where fb.productID = ?\n"
                + "order by fb.feedbackID\n"
                + "OFFSET (? - 1) * 3 ROWS\n"
                + "FETCH NEXT 3 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.setInt(2, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllFeedbackByPid(String pid) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT fb.*, c.fullName, p.[name]\n"
                + "FROM [Feedback] fb\n"
                + "JOIN Product p ON fb.productID = p.id\n"
                + "JOIN Customer c ON fb.customerID = c.customerID\n"
                + "where fb.productID = ?\n";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getCustomerNameAscPage(int index) {
        List<Feedback> list = new ArrayList<>();
        String sql = "select fb.*,c.fullName,p.[name] from [Feedback] fb join product p on fb.productID = p.id\n"
                + "join Customer c on fb.customerID = c.customerID\n"
                + "order by c.fullName asc\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllCustomerNameAsc() {
        List<Feedback> list = new ArrayList<>();
        String sql = "select fb.*,c.fullName,p.[name] from [Feedback] fb join product p on fb.productID = p.id\n"
                + "join Customer c on fb.customerID = c.customerID\n"
                + "order by c.fullName asc";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getCustomerNameDescPage(int index) {
        List<Feedback> list = new ArrayList<>();
        String sql = "select fb.*,c.fullName,p.[name] from [Feedback] fb join product p on fb.productID = p.id\n"
                + "join Customer c on fb.customerID = c.customerID\n"
                + "order by c.fullName desc\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllCustomerNameDesc() {
        List<Feedback> list = new ArrayList<>();
        String sql = "select fb.*,c.fullName,p.[name] from [Feedback] fb join product p on fb.productID = p.id\n"
                + "join Customer c on fb.customerID = c.customerID\n"
                + "order by c.fullName desc";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void editFeedbackStatus(String status, int fid) {
        String sql = "update Feedback \n"
                + "set [status] = ?\n"
                + "where feedbackID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, fid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Feedback> getProductNameAscPage(int index) {
        List<Feedback> list = new ArrayList<>();
        String sql = "select fb.*,c.fullName,p.[name] from [Feedback] fb join product p on fb.productID = p.id\n"
                + "join Customer c on fb.customerID = c.customerID\n"
                + "order by p.[name] asc\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllProductNameAsc() {
        List<Feedback> list = new ArrayList<>();
        String sql = "select fb.*,c.fullName,p.[name] from [Feedback] fb join product p on fb.productID = p.id\n"
                + "join Customer c on fb.customerID = c.customerID\n"
                + "order by p.[name] asc";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getProductNameDescPage(int index) {
        List<Feedback> list = new ArrayList<>();
        String sql = "select fb.*,c.fullName,p.[name] from [Feedback] fb join product p on fb.productID = p.id\n"
                + "join Customer c on fb.customerID = c.customerID\n"
                + "order by p.[name] desc\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllProductNameDesc() {
        List<Feedback> list = new ArrayList<>();
        String sql = "select fb.*,c.fullName,p.[name] from [Feedback] fb join product p on fb.productID = p.id\n"
                + "join Customer c on fb.customerID = c.customerID\n"
                + "order by p.[name] desc";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllFeedbackSearch(String search) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT fb.*, c.fullName, p.[name]\n"
                + "FROM [Feedback] fb\n"
                + "JOIN Product p ON fb.productID = p.id\n"
                + "JOIN Customer c ON fb.customerID = c.customerID\n"
                + "WHERE TRIM(c.fullName) LIKE N'%' + REPLACE(?,' ','') + '%'\n"
                + "   OR TRIM(fb.content) LIKE N'%' + REPLACE(?,' ','') + '%'";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, search);
            st.setString(2, search);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllFeedbackSearchPage(String search, int index) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT fb.*, c.fullName, p.[name]\n"
                + "FROM [Feedback] fb\n"
                + "JOIN Product p ON fb.productID = p.id\n"
                + "JOIN Customer c ON fb.customerID = c.customerID\n"
                + "WHERE TRIM(c.fullName) LIKE N'%' + REPLACE(?,' ','') + '%'\n"
                + "   OR TRIM(fb.content) LIKE N'%' + REPLACE(?,' ','') + '%'\n"
                + "ORDER BY c.fullName\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;\n";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, search);
            st.setString(2, search);
            st.setInt(3, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllFeedbackByStatusFilter(String status1,
            String status2, String status3, String status4) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT fb.*, c.fullName, p.[name]\n"
                + "FROM [Feedback] fb\n"
                + "JOIN Product p ON fb.productID = p.id\n"
                + "JOIN Customer c ON fb.customerID = c.customerID\n"
                + "where [status] in (?,?,?,?)";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, status1);
            st.setString(2, status2);
            st.setString(3, status3);
            st.setString(4, status4);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllFeedbackByRateStarFilter(String status1,
            String status2, String status3, String status4, String status5) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT fb.*, c.fullName, p.[name]\n"
                + "FROM [Feedback] fb\n"
                + "JOIN Product p ON fb.productID = p.id\n"
                + "JOIN Customer c ON fb.customerID = c.customerID\n"
                + "where rate_star in (?,?,?,?,?)";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, status1);
            st.setString(2, status2);
            st.setString(3, status3);
            st.setString(4, status4);
            st.setString(5, status5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllFeedbackByRateStarFilterPage(String status1,
            String status2, String status3, String status4, String status5, int index) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT fb.*, c.fullName, p.[name]\n"
                + "FROM [Feedback] fb\n"
                + "JOIN Product p ON fb.productID = p.id\n"
                + "JOIN Customer c ON fb.customerID = c.customerID\n"
                + "where rate_star in (?,?,?,?,?)\n"
                + "ORDER BY feedbackID\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, status1);
            st.setString(2, status2);
            st.setString(3, status3);
            st.setString(4, status4);
            st.setString(5, status5);
            st.setInt(6, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllFeedbackByStatusFilterPage(String status1,
            String status2, String status3, String status4, int index) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT fb.*, c.fullName, p.[name]\n"
                + "FROM [Feedback] fb\n"
                + "JOIN Product p ON fb.productID = p.id\n"
                + "JOIN Customer c ON fb.customerID = c.customerID\n"
                + "where [status] in (?,?,?,?)\n"
                + "ORDER BY feedbackID\n"
                + "OFFSET (? - 1) * 6 ROWS\n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, status1);
            st.setString(2, status2);
            st.setString(3, status3);
            st.setString(4, status4);
            st.setInt(5, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback c = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllManageProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid")
                );
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getAllManageProductPage(int pageIndex) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product\n"
                + "ORDER BY id\n"
                + "OFFSET (? - 1) * 8 ROWS\n"
                + "FETCH NEXT 8 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addProduct(String name, double original_price, double sale_price, int quantity, String describe, String image, int cid) {
        String sql = "INSERT INTO [dbo].[product]\n"
                + "           ([name]\n"
                + "           ,[original_price]\n"
                + "           ,[sale_price]\n"
                + "           ,[quantity]\n"
                + "           ,[describe]\n"
                + "           ,[image]\n"
                + "           ,[cid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setDouble(2, original_price);
            st.setDouble(3, sale_price);
            st.setInt(4, quantity);
            st.setString(5, describe);
            st.setString(6, image);
            st.setInt(7, cid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editProduct(String name, double original_price, double sale_price, int quantity, String describe, String image, int cid, int id) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [name] = ?\n"
                + "      ,[original_price] = ?\n"
                + "      ,[sale_price] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[describe] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[cid] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setDouble(2, original_price);
            st.setDouble(3, sale_price);
            st.setInt(4, quantity);
            st.setString(5, describe);
            st.setString(6, image);
            st.setInt(7, cid);
            st.setInt(8, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM [dbo].[product]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void isFeedback(int detailID) {
        String sql = "update orderDetail\n"
                + "set isFeedback = '1'\n"
                + "where detailID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, detailID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> searchProductList(String searchValue, int pageIndex) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "where name like N'%' + ? + '%' ORDER BY id\n"
                + "OFFSET (? - 1) * 8 ROWS\n"
                + "FETCH NEXT 8 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, searchValue);
            st.setInt(2, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductASCPage(int pageIndex) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "order by name asc\n"
                + "OFFSET (? - 1) * 8 ROWS\n"
                + "FETCH NEXT 8 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllManageProductASC() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "order by name asc";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductDESCPage(int pageIndex) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "order by name desc\n"
                + "OFFSET (? - 1) * 8 ROWS\n"
                + "FETCH NEXT 8 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllManageProductDESC() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "order by name desc";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "where cid = ?";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getManageProductByCidPage(int cid, int pageIndex) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "where cid = ?\n"
                + "ORDER BY id\n"
                + "OFFSET (? - 1) * 8 ROWS\n"
                + "FETCH NEXT 8 ROWS ONLY;";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setInt(2, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("original_price"),
                        rs.getDouble("sale_price"),
                        rs.getInt("quantity"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        rs.getInt("cid"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
//        DAO d = new DAO();
//        d.editFeedbackStatus("In Progress", 1);
//        System.out.println("Hu");
    }

}
