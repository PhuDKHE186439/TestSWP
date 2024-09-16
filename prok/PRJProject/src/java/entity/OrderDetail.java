/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author MH
 */
public class OrderDetail {
    private int order_detail_id;
    private int order_id;
    private int product_id;
    private int quantity;

    public OrderDetail(int order_detail_id, int order_id, int product_id, int quantity) {
        this.order_detail_id = order_detail_id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.quantity = quantity;
    }

    public int getOrder_detail_id() {
        return order_detail_id;
    }

    public void setOrder_detail_id(int order_detail_id) {
        this.order_detail_id = order_detail_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "order_detail_id=" + order_detail_id + ", order_id=" + order_id + ", product_id=" + product_id + ", quantity=" + quantity + '}';
    }
    
}
