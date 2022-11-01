/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.OrderHistory;
import model.Product_M;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO extends DBContext {

    public List<Integer> getPidByOrderDetail() {
        String sql = "select productId from OrderDetail";
        List<Integer> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<OrderDetail> getOrderDetailByOrderId(int id) {
        String sql = "select * from [orderDetail] where order_id = ?";
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail o = new OrderDetail(rs.getInt("id"),
                        rs.getInt("order_id"),
                        rs.getInt("quantity"),
                        rs.getInt("productId"),
                        rs.getDouble("price"));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<OrderDetail> getOrderDetailByListOrderId(List<Integer> id) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        for (int i = 0; i < id.size(); i++) {
            String sql = "select * from [orderDetail] where order_id = ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, id.get(i));
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    OrderDetail o = new OrderDetail(rs.getInt("id"),
                            rs.getInt("order_id"),
                            rs.getInt("quantity"),
                            rs.getInt("productId"),
                            rs.getDouble("price"));
                    list.add(o);
                }
            } catch (Exception e) {
            }
        }
        return list;

    }

    public List<OrderDetail> getAllOrderDetail() {
        String sql = "select * from [orderDetail]";
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail o = new OrderDetail(rs.getInt("id"),
                        rs.getInt("order_id"),
                        rs.getInt("quantity"),
                        rs.getInt("productId"),
                        rs.getDouble("price"));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
