/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Shipping;

/**
 *
 * @author Admin
 */
public class ShippingDAO extends DBContext {

    public Shipping getShipping() {
        String sql = "select id, name, phone, address from Shipping";
        Shipping s = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                s = new Shipping(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getString("address"));
            }
        } catch (Exception e) {
        }
        return s;
    }

    public void addShipping(Shipping s) {
        String sql1 = "select top 1 id from [order] order by id desc";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt("id");
                String sql2 = "insert into Shipping values (?,?,?,?)";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setString(1, s.getName());
                st2.setString(2, s.getPhone());
                st2.setString(3, s.getAddress());
                st2.setInt(4, oid);
                st2.executeUpdate();
            }
        } catch (Exception e) {
        }
    }
}
