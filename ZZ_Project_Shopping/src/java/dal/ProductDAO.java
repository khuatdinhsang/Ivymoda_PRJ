/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;
import model.Product_M;
import model.UserInfo;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DBContext {

    public List<Product> getListProductByCategory(int cid) {
        List<Product> list = new ArrayList<>();
        CategoryDAO d = new CategoryDAO();
        String sql = "select * from  product where cateID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = d.getCategoryById(cid);
                Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getString("code"), rs.getString("color"), rs.getString("image"),
                        rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), c, rs.getBoolean("status"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product_M> getAllProduct() {
        List<Product_M> list = new ArrayList<>();
        CategoryDAO d = new CategoryDAO();
        String sql = "select * from  product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_M p = new Product_M(rs.getInt("id"), rs.getString("name"), rs.getString("code"), rs.getString("color"), rs.getString("image"),
                        rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("cateID"), rs.getBoolean("status"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product_M getProductById(int id) {
        String sql = "select * from product where id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product_M p = new Product_M(rs.getInt("id"), rs.getString("name"), rs.getString("code"),
                        rs.getString("color"), rs.getString("image"), rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("cateID"), rs.getBoolean("status"));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product_M> getTop5ProductByCateID(int cid) {
        List<Product_M> listTop5 = new ArrayList<>();
        String sql = "select top 5 * from Product where cateID= ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_M p = new Product_M(rs.getInt("id"), rs.getString("name"), rs.getString("code"),
                        rs.getString("color"), rs.getString("image"), rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("cateID"), rs.getBoolean("status"));
                listTop5.add(p);
            }
        } catch (Exception e) {
        }
        return listTop5;
    }

    public List<Product_M> search(String color, Double price1, Double price2, int cid) {
        List<Product_M> list = new ArrayList<>();
        String sql = "select * from product where 1=1 ";

        if (color != null && !color.equals("")) {
            sql += " and color like N'%" + color + "%'";

        }
        if (price1 != 0) {
            sql += " and price>=" + price1;
        }
        if (price2 != 0) {
            sql += " and price<=" + price2;
        }
        if (cid != 0) {
            sql += " and cateID= " + cid;
        }
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_M p = new Product_M(rs.getInt("id"), rs.getString("name"), rs.getString("code"),
                        rs.getString("color"), rs.getString("image"), rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("cateID"), rs.getBoolean("status"));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product_M> getAscPriceProduct(int cid) {
        List<Product_M> getListAsc = new ArrayList<>();
        String sql = "select * from product where 1=1";
        if (cid != 0) {
            sql += " and cateID= " + cid;
        }
        sql += " order by price";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_M p = new Product_M(rs.getInt("id"), rs.getString("name"), rs.getString("code"),
                        rs.getString("color"), rs.getString("image"), rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("cateID"), rs.getBoolean("status"));
                getListAsc.add(p);
            }
        } catch (Exception e) {
        }
        return getListAsc;
    }

    public List<Product_M> getDescPriceProduct(int cid) {
        List<Product_M> getListDesc = new ArrayList<>();
        String sql = "select * from product where 1=1";
        if (cid != 0) {
            sql += " and cateID= " + cid;
        }
        sql += " order by price desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_M p = new Product_M(rs.getInt("id"), rs.getString("name"), rs.getString("code"),
                        rs.getString("color"), rs.getString("image"), rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("cateID"), rs.getBoolean("status"));
                getListDesc.add(p);
            }
        } catch (Exception e) {
        }
        return getListDesc;
    }

    public List<Product_M> getListProductByCategory1(int cid) {
        List<Product_M> list = new ArrayList<>();
        CategoryDAO d = new CategoryDAO();
        String sql = "select * from  product";
        if (cid != 0) {
            sql += " where cateID = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_M p = new Product_M(rs.getInt("id"), rs.getString("name"), rs.getString("code"), rs.getString("color"), rs.getString("image"),
                        rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("cateID"), rs.getBoolean("status"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product_M> searchProduct(String key, int cid) {
        List<Product_M> list = new ArrayList<>();
        String sql = "select * from product where 1=1";
        if (key != null && !key.equals("")) {
            sql += " and (code like N'%" + key + "%' or name like N'%" + key + "%' or description like N'%" + key + "%')";
        }
        if (cid != 0) {
            sql += " and cateID= " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_M p = new Product_M(rs.getInt("id"), rs.getString("name"), rs.getString("code"),
                        rs.getString("color"), rs.getString("image"), rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("cateID"), rs.getBoolean("status"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void delete(int id) {
        CategoryDAO cD = new CategoryDAO();
        ProductDAO pD = new ProductDAO();
        Product_M p = pD.getProductById(id);
        String sql = "delete from Product where id =?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
        }
        int cateID = p.getCateID();
        int quantity = cD.getQuantityById(cateID) - p.getQuantity();
        String sql2 = "update Category set quantity= ? where cid = ?";
        PreparedStatement st2;
        try {
            st2 = connection.prepareStatement(sql2);
            st2.setInt(1, quantity);
            st2.setInt(2, cateID);
            st2.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public int countProduct() {
        String sql = "select count(id) as num from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int sum = rs.getInt("num");
                return sum;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void addNewProduct(Product_M u) {
        CategoryDAO cD = new CategoryDAO();
        String sql = "insert into Product values (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getName());
            st.setString(2, u.getCode());
            st.setString(3, u.getColor());
            st.setString(4, u.getImage());
            st.setDouble(5, u.getPrice());
            st.setString(6, u.getDescription());
            st.setInt(7, u.getQuantity());
            st.setInt(8, u.getCateID());
            st.setBoolean(9, true);
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        int quantity = cD.getQuantityById(u.getCateID()) + u.getQuantity();
        String sql2 = "update Category set quantity= ? where cid = ?";
        PreparedStatement st2;
        try {
            st2 = connection.prepareStatement(sql2);
            st2.setInt(1, quantity);
            st2.setInt(2, u.getCateID());
            st2.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public void UpdateProduct(Product_M u) {

        String sql = "update product set name =?, "
                + "code= ?, color =?, image=?,"
                + " price=?, description=?, quantity=? "
                + "where id= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getName());
            st.setString(2, u.getCode());
            st.setString(3, u.getColor());
            st.setString(4, u.getImage());
            st.setDouble(5, u.getPrice());
            st.setString(6, u.getDescription());
            st.setInt(7, u.getQuantity());
            st.setInt(8, u.getPid());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getQuantityBycId(int cid) {
        String sql = "select sum (quantity) as sum from Product where cateID= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int sum = rs.getInt("sum");
                return sum;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product_M> getListByPage(ArrayList<Product_M> list, int start, int end) {
        ArrayList<Product_M> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product_M> getAllProductOrderDetail() {
        ProductDAO pD = new ProductDAO();
        List<Product_M> list = new ArrayList<>();
        String sql = "select productId, quantity, price from OrderDetail";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            int pId = 0;
            int quantity = 0;
            double price = 0;
            while (rs.next()) {
                pId = rs.getInt("productId");
                quantity = rs.getInt("quantity");
                price = rs.getDouble("price");
                Product_M p = pD.getProductById(pId);
                p.setQuantity(quantity);
                p.setPrice(price);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product_M> getProductByOrderId(List<Integer> oid) {
        ProductDAO pD = new ProductDAO();
        List<Product_M> list = new ArrayList<>();
        for (int i = 0; i < oid.size(); i++) {
            String sql = "select productId, quantity, price from OrderDetail where order_id = ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, oid.get(i));
                ResultSet rs = st.executeQuery();
                int pId = 0;
                int quantity = 0;
                double price = 0;
                while (rs.next()) {
                    pId = rs.getInt("productId");
                    quantity = rs.getInt("quantity");
                    price = rs.getDouble("price");
                    Product_M p = pD.getProductById(pId);
                    p.setQuantity(quantity);
                    p.setPrice(price);
                    list.add(p);
                }
            } catch (Exception e) {
            }
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO c = new ProductDAO();
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(13);
        list.add(14);
        System.out.println(c.getProductByOrderId(list));
    }
}
