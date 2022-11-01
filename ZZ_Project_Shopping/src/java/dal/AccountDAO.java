/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {

    public Account check(String username, String password) {
        String sql = "select * from Account where username=? and password= ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getInt("role"));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }
    public ArrayList<Account> getListAccount() {
        ArrayList<Account> listAccount = new ArrayList<>();
        String sql = "select * from Account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt("id"), rs.getString("username"),
                        rs.getString("password"), rs.getInt("role"));
                listAccount.add(a);
            }
        } catch (Exception e) {
        }
        return listAccount;
    }

    public int getAccountID() {
        String sql = "select * from Account order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("id"), rs.getString("username"),
                        rs.getString("password"), rs.getInt("role"));
                int accountID = a.getId();
                return accountID;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public Account getAccountID(int id) {
        String sql = "select * from Account where id= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("id"), rs.getString("username"),
                        rs.getString("password"), rs.getInt("role"));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertAccount(Account a) {
        String sql = "insert into Account values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setInt(3, a.getRole());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void changePassword(String password,Account a) {
        String sql = "update Account set password =? where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, a.getId());

            st.executeUpdate();

        } catch (Exception e) {
        }
        String sql1 = "update UserInfo set password =? where AccountId =?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, password);
            st1.setInt(2, a.getId());
            st1.executeUpdate();
        } catch (Exception e) {
        }
    }
     public int countAccount() {
        String sql = "select count(id) as num from Account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int sum=rs.getInt("num");
                return sum;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
     }
     public void updatePass(String password, int accountId) {
        try {
            String sql = "UPDATE [dbo].[Account]\n"
                    + "   SET \n"
                    + "      [password] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, accountId);
            st.executeUpdate();
        } catch (Exception ex) {
        }
    }
     public String getPasswordById(int id){
         String sql="select password from Account where id = ?";
         try {
             PreparedStatement st= connection.prepareStatement(sql);
             st.setInt(1, id);
             ResultSet rs= st.executeQuery();
             if (rs.next()){
                 return rs.getString("password");
             }
         } catch (Exception e) {
         }
         return null;
     }


    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
        System.out.println(a.getAccountID());
    }
}
