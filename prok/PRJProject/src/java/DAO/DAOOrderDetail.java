/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Cart;
import entity.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MH
 */
public class DAOOrderDetail extends DBContext{
        public void saveCart(int orderId, Map<Integer, Cart> carts) {
        try {

            String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                    + "           ([order_id]\n"
                    + "           ,[product_id]\n"
                    + "           ,[quantity])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, orderId);
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer productId = entry.getKey();
                Cart cart = entry.getValue();
                stm.setInt(1, orderId);
                stm.setInt(2, cart.getProduct().getProduct_id());
                stm.setDouble(3, cart.getQuantity());
                stm.executeUpdate();
            }

        } catch (Exception ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<OrderDetail> getAllOrderDetailById(int id) {
        List<OrderDetail> OrderDetails = new ArrayList<>();
        try {
            String sql = "select * from OrderDetails where order_id =  ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail order = new OrderDetail(id, id, id, id);
                order.setOrder_detail_id(rs.getInt(1));
                order.setOrder_id(rs.getInt(2));
                order.setProduct_id(rs.getInt(3));
                order.setQuantity(rs.getInt(4));

                OrderDetails.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return OrderDetails;
    }

    public void delete(int id) {

        try {

            String sql = "DELETE FROM [OrderDetails]\n"
                    + "      WHERE order_detail_id = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        DAOOrderDetail dao = new DAOOrderDetail();

        
    }
}
