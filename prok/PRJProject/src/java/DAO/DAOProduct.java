/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Category;
import entity.Product;
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
 * @author hi
 */
public class DAOProduct extends DBContext {

    public void editProduct(String id, String name, String description, String price, String memory, String image, String quantity, String category) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [product_name] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[memory] = ?\n"
                + "      ,[image_url] = ?\n"
                + "      ,[stock_quantity] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      \n"
                + " WHERE product_id = ?";
        try {
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            int id1 = Integer.parseInt(id);
            int quantity1 = Integer.parseInt(quantity);
            int price1 = Integer.parseInt(price);
            int memory1 = Integer.parseInt(memory);
            int cate1 = Integer.parseInt(category);

            ps.setString(1, name);
            ps.setString(2, description);
            ps.setInt(3, price1);
            ps.setInt(4, memory1);
            ps.setString(5, image);
            ps.setInt(6, quantity1);
            ps.setInt(7, cate1);
            ps.setInt(8, id1);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean insertProduct(String name, String description, String price, String memory, String image, String quantity, String category, String user_id) {
        String sql = "INSERT INTO Products (product_name, description, price, memory, image_url, stock_quantity, category_id, user_id) "
                + "VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            int quantity1 = 0;
            double price1 = 0;
            int memory1 = 0;
            int cate1 = 0;
            int id2 = 2;
            try {
                quantity1 = Integer.parseInt(quantity);
                price1 = Double.parseDouble(price);
                memory1 = Integer.parseInt(memory);
                cate1 = Integer.parseInt(category);
                
            } catch (NumberFormatException e) {
                System.out.println("khong the parse");
            }

            ps.setString(1, name);
            ps.setString(2, description);
            ps.setDouble(3, price1);
            ps.setInt(4, memory1);
            ps.setString(5, image);
            ps.setInt(6, quantity1);
            ps.setInt(7, cate1);
            ps.setInt(8, id2);

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            return false;
        }
    }

    public void deleteProductByProductID(String pid) {
        String sql = "DELETE FROM Products\n"
                + "      WHERE product_id =?";
        try(PreparedStatement pre = conn.prepareStatement(sql);) {
            pre.setString(1, pid);
            pre.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Product getLast() {
        String sql = "select top 1 * from products\n"
                + "order by product_id desc";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateProductQuantity(int productId, int newQuantity) {
        String sql = "UPDATE Products SET stock_quantity = ? WHERE product_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, newQuantity);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getProductByCateID(String id) {
        List<Product> list = new ArrayList<>();
        String sql = "select* from Products where category_id=" + id;
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                // int id=rs.getInt(1);
                String product_name = rs.getString(2);
                // String name=rs.getString("ProductName");
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int memory = rs.getInt(5);
                String image_url = rs.getString(6);
                int stock_quantity = rs.getInt(7);
                int category_id = rs.getInt(8);
                int user_id = rs.getInt(9);
                Product pro = new Product(product_id, product_name, description, price, memory, image_url, stock_quantity, category_id, user_id);
                list.add(pro);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByUserID(int user_id) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where user_id =" + user_id;
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int memory = rs.getInt(5);
                String image_url = rs.getString(6);
                int stock_quantity = rs.getInt(7);
                int category_id = rs.getInt(8);

                Product pro = new Product(product_id, product_name, description, price, memory, image_url, stock_quantity, category_id, user_id);
                list.add(pro);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products ";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int memory = rs.getInt(5);
                String image_url = rs.getString(6);
                int stock_quantity = rs.getInt(7);
                int category_id = rs.getInt(8);

                Product pro = new Product(product_id, product_name, description, price, memory, image_url, stock_quantity, category_id, category_id);
                list.add(pro);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProductByProductName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where [product_name] like '%" + txtSearch + "%'";
        try (Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE)){
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                // int id=rs.getInt(1);
                String product_name = rs.getString(2);
                // String name=rs.getString("ProductName");
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int memory = rs.getInt(5);
                String image_url = rs.getString(6);
                int stock_quantity = rs.getInt(7);
                int category_id = rs.getInt(8);
                int user_id = rs.getInt(9);
                Product pro = new Product(product_id, product_name, description, price, memory, image_url, stock_quantity, category_id, user_id);
                list.add(pro);
            }
        } catch (Exception e) {
            
        } 
        
        return list;
    }

    public Product getProductByProductID(int id) {

        String sql = "select * from Products where product_id=" + id;
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                // int id=rs.getInt(1);
                String product_name = rs.getString(2);
                // String name=rs.getString("ProductName");
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int memory = rs.getInt(5);
                String image_url = rs.getString(6);
                int stock_quantity = rs.getInt(7);
                int category_id = rs.getInt(8);
                int user_id = rs.getInt(9);
                return new Product(product_id, product_name, description, price, memory, image_url, stock_quantity, category_id, user_id);

            }
        } catch (Exception e) {
        }
        return null;

    }

    public List<Category> getCategory(String sql) {
        List<Category> category = new ArrayList<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int cateID = rs.getInt(1);
                String cateName = rs.getString(2);
                Category cate = new Category(cateID, cateName);
                category.add(cate);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }

    public List<Product> getProduct(String sql) {
        List<Product> product = new ArrayList<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int product_id = rs.getInt(1);
                // int id=rs.getInt(1);
                String product_name = rs.getString(2);
                // String name=rs.getString("ProductName");
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int memory = rs.getInt(5);
                String image_url = rs.getString(6);
                int stock_quantity = rs.getInt(7);
                int category_id = rs.getInt(8);
                int user_id = rs.getInt(9);

                Product pro = new Product(product_id, product_name, description, price, memory, image_url, stock_quantity, category_id, user_id);
                product.add(pro);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    public static void main(String[] args) {
        DAOProduct dao = new DAOProduct();
        String name = "2";
        String description = "2";     
        String price = "2";
        String memory = "2";
        String image = "2";
        String quantity = "2";
        String category = "2";   
        String user_id = "";
        //dao.updateProductQuantity(1, 1);
        dao.insertProduct(name, description, price, memory, image, quantity, category, user_id);
       
    }
}
