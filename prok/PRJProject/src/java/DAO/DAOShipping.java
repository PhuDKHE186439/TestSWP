/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Shipping;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MH
 */
public class DAOShipping extends DBContext{
    public int createReturnId(Shipping shipping) {
        try {
            String sql = "INSERT INTO [dbo].[Shipping]\n"
                    + "           ([name]\n"
                    + "           ,[phone]\n"
                    + "           ,[address])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            
            PreparedStatement stm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, shipping.getName());
            stm.setString(2, shipping.getPhone());
            stm.setString(3, shipping.getAddress());
            stm.executeUpdate();
            
            ResultSet rs = stm.getGeneratedKeys();
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(DAOShipping.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
