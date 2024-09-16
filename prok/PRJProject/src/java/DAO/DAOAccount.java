/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;



import entity.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MH
 */
public class DAOAccount extends DBContext{
     public void updateAccount(Account account) {

        try {
            String sql = "UPDATE [Users]\n"
                    + "   SET [active] = ?\n"
                    + " WHERE user_id = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, account.getActive());
            stm.setInt(2, account.getUser_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public Account getAccountByUsername(String username) {
        try {
            String sql = "SELECT * FROM Users where  username =  ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setUser_id(rs.getInt(1));
                account.setUserName(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setFull_name(rs.getString(4));
                account.setPhone_number(rs.getString(5));
                account.setIsSell(rs.getInt(6));
                account.setIsAdmin(rs.getInt(7));
                account.setActive(rs.getInt(8));
               
                return account;
            }
        } catch (Exception ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Users where isAdmin != 1";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setUser_id(rs.getInt(1));
                account.setUserName(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setFull_name(rs.getString(4));
                account.setPhone_number(rs.getString(5));
                account.setIsSell(rs.getInt(6));
                account.setIsAdmin(rs.getInt(7));
                account.setActive(rs.getInt(8));

                list.add(account);
            }
        } catch (Exception ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public Account login (String user,String pass){
        String sql = "select * from [Users] where [username] ='"+user+"' and [password] ='"+pass+"'";

        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            
            while (rs.next()) {   
                int user_id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String fullName = rs.getString(4);
                String phone = rs.getString(5);
                int isAdmin = rs.getInt(6);
                int isSell = rs.getInt(7);
                int active = rs.getInt(8);
                
                Account ac = new Account(user_id, username, password, fullName, phone, isAdmin, isSell, active);
                return ac;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
        
    }
    
    public Account checkAccountExist (String user){
        String sql = "select * from [Users] where [username] ='"+user+"'";

        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            
            while (rs.next()) {   
                int user_id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String fullName = rs.getString(4);
                String phone = rs.getString(5);
                int isAdmin = rs.getInt(6);
                int isSell = rs.getInt(7);
                int active = rs.getInt(8);
                
                Account ac = new Account(user_id, username, password, fullName, phone, isAdmin, isSell, active);
                return ac;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
        
    }
    
    
    
    public void signup(String user, String pass,  String full_name,  String phone_number) {
        String sql = "INSERT INTO [dbo].[Users]\n" +
"           ([username]\n" +
"           ,[password]\n" +
"           ,[full_name]\n" +
"           ,[phone_number]\n" +
"           ,[isAdmin]\n" +
"           ,[isSell]\n" +
"           ,[active])\n" +
"     VALUES\n" +
"           (?,?,?,?,?,?,?)";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, user);
            pre.setString(2, pass);
            pre.setString(3, full_name);
            pre.setString(4, phone_number);
            pre.setString(5, "0");
            pre.setString(6, "0");
            pre.setString(7, "1");
            
            pre.executeUpdate();

        } catch (Exception e) {
        }
    } 
   
    
    public static void main(String[] args) {
        DAOAccount dao = new DAOAccount();
      
         
        
        
    }
}
