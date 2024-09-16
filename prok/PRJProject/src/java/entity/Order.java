package entity;
import java.sql.Date;

public class Order {
    private int order_id;
    private int user_id;
    private Date order_date;
    private double total_amount;
    private int shippingId;
    private int isAccept;
    private int isEdited;
    private int orderCount; // Thêm trường này

    // Thêm getter và setter cho orderCount
    public int getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(int orderCount) {
        this.orderCount = orderCount;
    }

    // Các phương thức hiện có

    public int getIsEdited() {
        return isEdited;
    }

    public void setIsEdited(int isEdited) {
        this.isEdited = isEdited;
    }

    public int getIsAccept() {
        return isAccept;
    }

    public void setIsAccept(int isAccept) {
        this.isAccept = isAccept;
    }

    public Order(int user_id, double total_amount, int shippingId) {
        this.user_id = user_id;
        this.total_amount = total_amount;
        this.shippingId = shippingId;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    public Order() {
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date + 
               ", total_amount=" + total_amount + ", shippingId=" + shippingId + ", isAccept=" + isAccept + 
               ", isEdited=" + isEdited + ", orderCount=" + orderCount + '}';
    }
}