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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.UserInfo;

/**
 *
 * @author Admin
 */
public class UserInfoDAO extends DBContext{
    public void insertUser(UserInfo u){
        String sql="insert into UserInfo values (?,?,?,?,?,?,?,?,?,?)";
        try {
             PreparedStatement st = connection.prepareStatement(sql);
             st.setString(1, u.getFirstName());
             st.setString(2, u.getLastName());
             st.setDate(3, u.getDob());
             st.setBoolean(4, u.isGender());
             st.setString(5, u.getEmail());
             st.setString(6, u.getPhone());
             st.setString(7,u.getUsername());
             st.setString(8, u.getPassword());
             st.setString(9,u.getAddress());
             st.setInt(10, u.getAcountID());
             st.executeUpdate();
             
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public List<UserInfo> getListUser(){
        String sql="select * from UserInfo";
        ArrayList<UserInfo> listUser= new ArrayList<>();
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
                UserInfo u= new UserInfo(rs.getInt("id"),
                        rs.getString("First_Name"), 
                        rs.getString("Last_Name"),
                        rs.getDate("Birthday"),
                        rs.getBoolean("Gender"), 
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("UserName"),
                        rs.getString("Password"),
                        rs.getString("Address"),
                        rs.getInt("AccountId"));
                listUser.add(u);
            }
        } catch (Exception e) {
        }
        return listUser;
    }
    public UserInfo getUserByAccountID(int id){
        String sql="select * from UserInfo where AccountId= ?";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs=st.executeQuery();
            if (rs.next()){
                UserInfo u= new UserInfo(rs.getInt("id"),
                        rs.getString("First_Name"), 
                        rs.getString("Last_Name"),
                        rs.getDate("Birthday"),
                        rs.getBoolean("Gender"), 
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("UserName"),
                        rs.getString("Password"),
                        rs.getString("Address"),
                        rs.getInt("AccountId"));
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }
    public UserInfo getUserById(int id){
        String sql="select * from UserInfo where id= ?";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs=st.executeQuery();
            if (rs.next()){
                UserInfo u= new UserInfo(rs.getInt("id"),
                        rs.getString("First_Name"), 
                        rs.getString("Last_Name"),
                        rs.getDate("Birthday"),
                        rs.getBoolean("Gender"), 
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("UserName"),
                        rs.getString("Password"),
                        rs.getString("Address"),
                        rs.getInt("AccountId"));
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }
     public void editUser(UserInfo u ){
        String sql="update UserInfo set First_Name =?, Last_Name =?, Birthday =?, Gender= ?, Email =?, PhoneNumber =?, address =? where AccountId =?";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setString(1, u.getFirstName());
             st.setString(2, u.getLastName());
             st.setDate(3, u.getDob());
             st.setBoolean(4, u.isGender());
             st.setString(5, u.getEmail());
             st.setString(6, u.getPhone());
             st.setString(7,u.getAddress());
             st.setInt(8, u.getAcountID());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
     public void delete(int id) {
         UserInfoDAO uD= new UserInfoDAO();
         UserInfo u= uD.getUserById(id);
         int AccountID=u.getAcountID();
        String sql = "delete from UserInfo where id =?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
        }
        String sql1 = "delete from Account where id = ?";
        PreparedStatement st2;
        try {
            st2 = connection.prepareStatement(sql1);
            st2.setInt(1, AccountID);
            st2.executeUpdate();
        } catch (SQLException ex) {
        }
        
    }
     public int countUserInfo() {
        String sql = "select count(id) as num from UserInfo";
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
     public ArrayList<String> getEmailFromUser(){
         ArrayList<String> listEmail=new ArrayList<>();
         String sql="select email from UserInfo";
         try {
             PreparedStatement st=connection.prepareStatement(sql);
                 ResultSet rs= st.executeQuery();
                 while(rs.next()){
                     String s= rs.getString("email");
                     listEmail.add(s);
                 }

         } catch (Exception e) {
         }
         return listEmail;
     }
     public ArrayList<String> getListUsername(){
         ArrayList<String> listUserName=new ArrayList<>();
         String sql="select username from Account";
         try {
             PreparedStatement st=connection.prepareStatement(sql);
                 ResultSet rs= st.executeQuery();
                 while(rs.next()){
                     String s= rs.getString("username");
                     listUserName.add(s);
                 }

         } catch (Exception e) {
         }
         return listUserName;
     }
      public boolean checkDuplicateEmail(String email) {
        String sql = "select Email from UserInfo where Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
        }
        return false;
    }
      public int getAccountId(String email) {
        String sql = "select AccountId from UserInfo where Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
        }
        return 0;
    }
       public void updatePass(String password, int AccountId) {
        try {
            String sql = "UPDATE [dbo].[UserInfo]\n"
                    + "   SET \n"
                    + "      [Password] = ?\n"
                    + "\n"
                    + " WHERE AccountId = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, AccountId);
            st.executeUpdate();
        } catch (Exception ex) {
        }
    }
}
