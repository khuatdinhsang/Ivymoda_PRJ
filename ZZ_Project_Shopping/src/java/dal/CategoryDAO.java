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
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from [Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"),rs.getString("cname"),rs.getInt("quantity"));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
     public Category getCategoryById(int cid) {
        String sql = "select * from category where cid =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("cid"), rs.getString("cname"), rs.getInt("quantity"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
     }
     public int getAlQuantityByCategory() {
        String sql = "select sum (quantity) as sum from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int sum=rs.getInt("sum");
                return sum;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
     }
     public int getQuantityById(int cid) {
        String sql = "select sum (quantity) as sum from Category where cid= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int sum=rs.getInt("sum");
                return sum;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
     }
//     public static void main(String[] args) {
//        CategoryDAO c= new CategoryDAO();
//         System.out.println(c.getCategoryById(6));
//    }
   
}
