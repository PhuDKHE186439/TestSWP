/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author MH
 */
public class Product {
    
    private int product_id;
    private String product_name;
    private String description;
    private int price;
    private int memory;
    private String image;
    private int quantity;
    private int cate_id;
    private int user_id;

    public Product(int product_id, String product_name, String description, int price, int memory, String image, int quantity, int cate_id, int user_id) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.description = description;
        this.price = price;
        this.memory = memory;
        this.image = image;
        this.quantity = quantity;
        this.cate_id = cate_id;
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getMemory() {
        return memory;
    }

    public void setMemory(int memory) {
        this.memory = memory;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Product{" + "product_id=" + product_id + ", product_name=" + product_name + ", description=" + description + ", price=" + price + ", memory=" + memory + ", image=" + image + ", quantity=" + quantity + ", cate_id=" + cate_id + ", user_id=" + user_id + '}';
    }

    
    
    
}
