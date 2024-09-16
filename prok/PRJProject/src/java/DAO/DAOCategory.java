/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Category;
import entity.Product;
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
public class DAOCategory  extends DBContext{
    public List<Category> getCategory(String sql){
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
        public static void main(String[] args) {
        DAOCategory dao = new DAOCategory();
        List<Category> list = dao.getCategory("select * from Categories");
        for(Category cate: list){
            System.out.println(cate);
        }
    }
}

