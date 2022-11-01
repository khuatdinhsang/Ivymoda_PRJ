/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Cart;
import model.Item;
import model.UserInfo;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    public void addOrder(Account c, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //add order
            String sql = "insert into [order] values(?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setDouble(2, cart.getTotalMoney() / 2);
            st.setString(3, "");
            st.setString(4, date);
            st.setInt(5, 1);
            st.executeUpdate();
            // lay id cua order vua add
            String sql1 = "select top 1 id from [order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderDetail]\n"
                            + "           ([order_id]\n"
                            + "           ,[quantity]\n"
                            + "           ,[productId]\n"
                            + "           ,[price])\n"
                            + "     VALUES\n"
                            + "           (?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getQuantity());
                    st2.setInt(3, i.getProduct().getPid());
                    st2.setDouble(4, i.getPrice() / 2);
                    st2.executeUpdate();
                }
            }
            // cap nhat lai so luong san pham
            String sql3 = "update product set quantity= quantity- ? where id=?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getPid());
                st3.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public List<Integer> getIdOrderByAccountId(int a) {
        String sql = "select id from [order] where accountId =? ";
        List<Integer> list = new ArrayList<>();
        int s = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                s = rs.getInt("id");
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
