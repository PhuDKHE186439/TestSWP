/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MH
 */
public class DAOOrder extends DBContext {
    
    public List<Order> getAllOrderByStatus(int Status){
        List<Order> Orders = new ArrayList<>();
        try {
            String sql = "select * from Orders where isAccept ="+Status;
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt(1));
                order.setUser_id(rs.getInt(2));
                order.setOrder_date(rs.getDate(3));
                order.setTotal_amount(rs.getDouble(4));
                order.setShippingId(rs.getInt(5));
                order.setIsAccept(rs.getInt(6));
                order.setIsEdited(rs.getInt(7));
                

                Orders.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Orders;
    }
    
    public void editOrder(int order_id,int isAccepted){
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET \n"
                + "      [isAccept] =	?\n"
                + "      ,[isEdited] = ?\n"
                + " WHERE order_id = ?";
        try {
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, isAccepted);
            ps.setInt(2, 1);
            ps.setInt(3, order_id);
            
            
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int createReturnId(Order order) {
        try {
            String sql = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([user_id]\n"
                    + "           ,[order_date]\n"
                    + "           ,[total_amount]\n"
                    + "           ,[shipping_ID]\n"
                    + "           ,[isAccept]\n"
                    + "           ,[isEdited])\n"                    
                    + "     VALUES\n"
                    + "           (?,GETDATE(),?,?,0,0)";
            PreparedStatement stm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, order.getUser_id());
            stm.setDouble(2, order.getTotal_amount());
            stm.setInt(3, order.getShippingId());
            stm.executeUpdate();

            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Order> getAllOrder() {
        List<Order> Orders = new ArrayList<>();
        try {
            String sql = "select * from Orders";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt(1));
                order.setUser_id(rs.getInt(2));
                order.setOrder_date(rs.getDate(3));
                order.setTotal_amount(rs.getDouble(4));
                order.setShippingId(rs.getInt(5));
                order.setIsAccept(rs.getInt(6));
                order.setIsEdited(rs.getInt(7));
                

                Orders.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Orders;
    }
    
    public List<Order> getOrderByUserID(int id) {
        List<Order> Orders = new ArrayList<>();
        try {
            String sql = "select * from Orders where user_id = "+id;
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt(1));
                order.setUser_id(rs.getInt(2));
                order.setOrder_date(rs.getDate(3));
                order.setTotal_amount(rs.getDouble(4));
                order.setShippingId(rs.getInt(5));
                order.setIsAccept(rs.getInt(6));
                order.setIsEdited(rs.getInt(7));

                Orders.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Orders;
    }
    
    public Order getOrderByOrderID(int id) {
        Order order = new Order();
        try {
            String sql = "select * from Orders where order_id = ? ";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            
            while (rs.next()) {                
                
            
    
                order.setOrder_id(id);
                order.setUser_id(rs.getInt(2));
                order.setOrder_date(rs.getDate(3));
                order.setTotal_amount(rs.getDouble(4));
                order.setShippingId(rs.getInt(5));
                order.setIsAccept(rs.getInt(6));
                order.setIsEdited(rs.getInt(7));
                }
                
            
        } catch (Exception ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }
    
    
    public static void main(String[] args) {
        DAOOrder dao = new DAOOrder();
        List<Order> list = dao.getAllOrder();
        for(Order o : list){
            System.out.println(o.getOrder_id());
            System.out.println(o.getOrder_date());
        }
//        System.out.println(dao.getOrderByOrderID(5));


    }
    
}
