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
                        rs.getString("status"), rs.getInt("blogCategoryID"));
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

    public static void main(String[] args) {
        DAO d = new DAO();
        List<Blog> listB = d.getAllBlogByStatusFilter("", "Private");
        System.out.println(listB);
    }

}
