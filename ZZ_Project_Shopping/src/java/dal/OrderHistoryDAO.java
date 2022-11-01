/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Cart;
import model.OrderDetail;
import model.OrderHistory;

/**
 *
 * @author Admin
 */
public class OrderHistoryDAO extends DBContext {

    public void addOrderHistory(Account a, Cart c) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String sql1 = "select top 1 id from [Shipping] order by id desc";
        int sid = 0;
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs1 = st1.executeQuery();
            if (rs1.next()) {
                sid = rs1.getInt("id");
            }
        } catch (Exception e) {
        }
        int oid=0;
        String sql2 = "select top 1 id from [order] order by id desc";
        try {
            PreparedStatement st2 = connection.prepareStatement(sql2);
            ResultSet rs2 = st2.executeQuery();
            if (rs2.next()) {
                 oid = rs2.getInt("id");
            }
        } catch (Exception e) {
        }
        String sql = "insert into OrderHistory values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getId());
            st.setDouble(2, c.getTotalMoney() / 2 );
            st.setString(3, "Thành công");
            st.setString(4, date);
            st.setString(5, date);
            st.setInt(6, sid);
            st.setInt(7,oid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    public List<OrderHistory> getAllOrderDetail(){
        String sql="select * from [OrderHistory]";
        ArrayList<OrderHistory> list= new ArrayList<>();
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                OrderHistory o= new OrderHistory(rs.getInt("id"),
                        rs.getInt("accountId"), 
                        rs.getDouble("totalPrice"), 
                        rs.getString("note"),
                        rs.getDate("createdDate"),
                        rs.getDate("confirmDate"),
                        rs.getInt("shippingId"),
                        rs.getInt("orderId"));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<OrderHistory> getAllOrderDetailByAccountId(int id){
        String sql="select * from [OrderHistory] where accountId = ?";
        ArrayList<OrderHistory> list= new ArrayList<>();
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, id );
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                OrderHistory o= new OrderHistory(rs.getInt("id"),
                        rs.getInt("accountId"), 
                        rs.getDouble("totalPrice"), 
                        rs.getString("note"),
                        rs.getDate("createdDate"),
                        rs.getDate("confirmDate"),
                        rs.getInt("shippingId"),
                        rs.getInt("orderId"));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
