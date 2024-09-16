/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author MH
 */
public class Cart {
    private int quantity;
    private Product Product;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return Product;
    }

    public void setProduct(Product Product) {
        this.Product = Product;
    }

    @Override
    public String toString() {
        return "Cart{" + "quantity=" + quantity + ", Product=" + Product + '}';
    }

    public Cart(int quantity, Product Product) {
        this.quantity = quantity;
        this.Product = Product;
    }
        
}
