/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import model.Roles;
import model.Users;

/**
 *
 * @author nguye
 */
public class userDAO_1 extends DBContext {

//    public List<Users> getAllUserDetail() throws SQLException {
//        List<Users> list = new ArrayList<Users>();
//        String sql = "select * from Users where userID = ?";
//        return list;
//    }
    // the function to get detail of user
    public List<Users> getAllUserDetail() throws SQLException {
        List<Users> list = new ArrayList<Users>();

        try {
            if (connection != null) {
                String sql = "SELECT\n"
                        + "    u.userID,\n"
                        + "    u.userName,\n"
                        + "    u.gender,\n"
                        + "    u.email,\n"
                        + "    u.mobile,\n"
                        + "    u.[address],\n"
                        + "    r.roleName,\n"
                        + "    u.userStatus\n"
                        + "FROM\n"
                        + "    Users AS u\n"
                        + "JOIN\n"
                        + "    Roles AS r ON u.roleID = r.roleID;";

                PreparedStatement st;
                st = connection.prepareStatement(sql);
                ResultSet rs = st.executeQuery();

                while (rs.next()) {
                    Users user = new Users();
                    user.setUserID(rs.getInt(1));
                    user.setUserName(rs.getString(2));
                    user.setGender(rs.getString(3));
                    user.setEmail(rs.getString(4));
                    user.setMobile(rs.getString(5));
                    user.setAddress(rs.getString(6));
                    user.setUser_role_name(rs.getString(7));
                    user.setUser_status(rs.getInt(8));
                    list.add(user);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Users> getALlUsers() throws SQLException {
        List<Users> list = new ArrayList<>();
        String sql = "select * from Users";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10)
                );
                list.add(u);
            }
        } catch (Exception e) {
        }
        return list;
    }
    

    public Users getUserDetailByID(String user_id) throws SQLException {
        String sql = "SELECT u.userID,\n"
                + "       u.userName,\n"
                + "       u.gender,\n"
                + "       u.email,\n"
                + "       u.mobile,\n"
                + "       u.avatar,\n"
                + "       u.[address],\n"
                + "       r.roleName,\n"
                + "	   u.userStatus\n"
                + "FROM Users AS u\n"
                + "JOIN Roles AS r ON u.roleID = r.roleID\n"
                + "WHERE u.userID = ?;";

        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, user_id);
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
                        rs.getInt(9));
            }

        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return null;
    }

    // Function to get by full name asc
    public class UserComparatorAZ implements java.util.Comparator<Users> {

        private Collator collator;

        public UserComparatorAZ() {
            collator = Collator.getInstance(new Locale("vi", "VN"));
            collator.setStrength(Collator.SECONDARY);
        }

        @Override
        public int compare(Users a, Users b) {
            if (a.getUserName() == null && b.getUserName() != null) {
                return 1;
            }
            if (a.getUserName() != null && b.getUserName() == null) {
                return -1;
            }
            if (a.getUserName() == null && b.getUserName() == null) {
                return 0;
            }
            return collator.compare(a.getUserName(), b.getUserName());
        }
    }

    public List<Users> sortUserByFullnameAsc(List<Users> list) {
        Collections.sort(list, new UserComparatorAZ());
        return list;
    }

    // Function to get by full name desc
    public class UserComparatorZA implements java.util.Comparator<Users> {

        private Collator collator;

        public UserComparatorZA() {
            collator = Collator.getInstance(new Locale("vi", "VN"));
            collator.setStrength(Collator.SECONDARY);
        }

        @Override
        public int compare(Users a, Users b) {
            if (a.getUserName() == null && b.getUserName() != null) {
                return -1;
            }
            if (a.getUserName() != null && b.getUserName() == null) {
                return 1;
            }
            if (a.getUserName() == null && b.getUserName() == null) {
                return 0;
            }
            return collator.compare(a.getUserName(), b.getUserName());
        }
    }

    public List<Users> sortUserByFullnameDesc(List<Users> list) {
        Collections.sort(list, new UserComparatorZA());
        return list;
    }

    // Function to get by gender desc
    public class UserComparatorGenderZA implements java.util.Comparator<Users> {

        private Collator collator;

        public UserComparatorGenderZA() {
            collator = Collator.getInstance(new Locale("vi", "VN"));
            collator.setStrength(Collator.SECONDARY);
        }

        @Override
        public int compare(Users a, Users b) {
            if (a.getGender() == null && b.getGender() != null) {
                return -1;
            }
            if (a.getGender() != null && b.getGender() == null) {
                return 1;
            }
            if (a.getGender() == null && b.getGender() == null) {
                return 0;
            }
            return collator.compare(a.getGender(), b.getGender());
        }
    }

    public List<Users> sortUserByGender(List<Users> list) {
        Collections.sort(list, new UserComparatorGenderZA());
        return list;
    }

    // Function to get by  email asc
    public class UserComparatorEmailAZ implements java.util.Comparator<Users> {

        private Collator collator;

        public UserComparatorEmailAZ() {
            collator = Collator.getInstance(new Locale("vi", "VN"));
            collator.setStrength(Collator.SECONDARY);
        }

        @Override
        public int compare(Users a, Users b) {
            if (a.getEmail() == null && b.getEmail() != null) {
                return 1;
            }
            if (a.getEmail() != null && b.getEmail() == null) {
                return -1;
            }
            if (a.getEmail() == null && b.getEmail() == null) {
                return 0;
            }
            return collator.compare(a.getEmail(), b.getEmail());
        }
    }

    public List<Users> sortUserByEmailAsc(List<Users> list) {
        Collections.sort(list, new UserComparatorEmailAZ());
        return list;
    }

    public class UserComparatorPhoneZA implements java.util.Comparator<Users> {

        private Collator collator;

        public UserComparatorPhoneZA() {
            collator = Collator.getInstance(new Locale("vi", "VN"));
            collator.setStrength(Collator.SECONDARY);
        }

        @Override
        public int compare(Users a, Users b) {
            if (a.getMobile() == null && b.getMobile() != null) {
                return -1;
            }
            if (a.getMobile() != null && b.getMobile() == null) {
                return 1;
            }
            if (a.getMobile() == null && b.getMobile() == null) {
                return 0;
            }
            return collator.compare(a.getMobile(), b.getMobile());
        }
    }

    public List<Users> sortUserByPhoneDesc(List<Users> list) {
        Collections.sort(list, new UserComparatorPhoneZA());
        return list;
    }

    public List<Users> getAllUserBySearch(String searchContent) throws SQLException {
        List<Users> list = new ArrayList<>();

        try {
            if (connection != null) {
                String sql = "SELECT \n"
                        + "    u.userID, \n"
                        + "    u.userName, \n"
                        + "    u.gender, \n"
                        + "    u.email, \n"
                        + "    u.mobile,\n"
                        + "	u.[address],\n"
                        + "    r.roleName\n"
                        + "FROM \n"
                        + "    Users AS u \n"
                        + "JOIN \n"
                        + "    Roles AS r ON u.roleID = r.roleID\n"
                        + "WHERE \n"
                        + "    u.userName LIKE ? OR u.email LIKE ? OR u.mobile LIKE ?";

                PreparedStatement st;
                st = connection.prepareStatement(sql);
                st.setString(1, "%" + searchContent + "%");
                st.setString(2, "%" + searchContent + "%");
                st.setString(3, "%" + searchContent + "%");
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Users user = new Users();
                    user.setUserID(rs.getInt(1));
                    user.setUserName(rs.getString(2));
                    user.setGender(rs.getString(3));
                    user.setEmail(rs.getString(4));
                    user.setMobile(rs.getString(5));
                    user.setAddress(rs.getString(6));
                    user.setUser_role_name(rs.getString(7));
                    list.add(user);
                }
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return list;
    }

    public List<Users> getAllUserByGender(String gender) throws SQLException {
        List<Users> list = new ArrayList<>();

        try {
            if (connection != null) {

                String sql = "SELECT u.userID,\n"
                        + "u.userName,\n"
                        + "u.gender,\n"
                        + "u.email,\n"
                        + "u.mobile,\n"
                        + "u.[address],\n"
                        + "r.roleName,\n"
                        + "u.userStatus\n"
                        + "FROM Users AS u \n"
                        + "JOIN Roles AS r ON u.roleID = r.roleID \n"
                        + "WHERE u.gender = ?;";
                PreparedStatement st;
                st = connection.prepareStatement(sql);
                st.setString(1, gender);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Users user = new Users();
                    user.setUserID(rs.getInt(1));
                    user.setUserName(rs.getString(2));
                    user.setGender(rs.getString(3));
                    user.setEmail(rs.getString(4));
                    user.setMobile(rs.getString(5));
                    user.setAddress(rs.getString(6));
                    user.setUser_role_name(rs.getString(7));
                    user.setUser_status(rs.getInt(8));
                    list.add(user);
                }
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return list;
    }

    public List<Users> getAllUserByRole(String roleId) throws SQLException {
        List<Users> list = new ArrayList<>();

        try {
            if (connection != null) {

                String sql = "SELECT u.userID, u.userName, u.gender, u.email, u.mobile, u.[address], r.roleName, u.userStatus\n"
                        + "FROM Users u \n"
                        + "JOIN Roles r ON u.roleID = r.roleID \n"
                        + "WHERE r.roleID = ?;";
                PreparedStatement st;
                st = connection.prepareStatement(sql);
                st.setString(1, roleId);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Users user = new Users();
                    user.setUserID(rs.getInt(1));
                    user.setUserName(rs.getString(2));
                    user.setGender(rs.getString(3));
                    user.setEmail(rs.getString(4));
                    user.setMobile(rs.getString(5));
                    user.setAddress(rs.getString(6));
                    user.setUser_role_name(rs.getString(7));
                    user.setUser_status(rs.getInt(8));
                    list.add(user);
                }
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) throws SQLException {
//        userDAO dao = new userDAO();
//        List<Users> listG = dao.getAllUserByGender("nu");
//        List<Users> listR = dao.getAllUserByRole("1");
//        Users listD = dao.getUserDetailByID("1");
//        System.out.println("TEST GET USERS: ");
//        System.out.println(listD);
//        for (Users users : listD) {
//            System.out.println(users);
//        }
        try {
            String searchContent = "hoang"; // Thay bằng nội dung tìm kiếm mong muốn

            // Tạo một đối tượng UserDAO để thực hiện tìm kiếm
            userDAO_1 userDAO = new userDAO_1();

            // Gọi phương thức getAllUserBySearch để lấy danh sách người dùng dựa trên nội dung tìm kiếm
            List<Users> userList = userDAO.getAllUserBySearch(searchContent);

            // Hiển thị thông tin của các người dùng được trả về
            if (userList.isEmpty()) {
                System.out.println("Không tìm thấy người dùng nào.");
            } else {
                System.out.println("Danh sách người dùng:");
                for (Users user : userList) {
                    System.out.println("ID: " + user.getUserID());
                    System.out.println("Tên: " + user.getUserName());
                    System.out.println("Giới tính: " + user.getGender());
                    System.out.println("Email: " + user.getEmail());
                    System.out.println("Mobile: " + user.getMobile());
                    System.out.println("Địa chỉ: " + user.getAddress());
                    System.out.println("Vai trò: " + user.getUser_role_name());
                    System.out.println("---------------------------");
                }
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi thực hiện tìm kiếm: " + e.getMessage());
        }
    }
}
