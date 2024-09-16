/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author MH
 */
public class Account {
    private int user_id;
    private String userName;
    private String password;
    private String full_name;
    private String phone_number;
    private int isAdmin;
    private int isSell;
    private int active;

    public Account(int user_id, String userName, String password, String full_name, String phone_number, int isAdmin, int isSell, int active) {
        this.user_id = user_id;
        this.userName = userName;
        this.password = password;
        this.full_name = full_name;
        this.phone_number = phone_number;
        this.isAdmin = isAdmin;
        this.isSell = isSell;
        this.active = active;
    }

    public Account() {
    }

    

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "Account{" + "user_id=" + user_id + ", userName=" + userName + ", password=" + password + ", full_name=" + full_name + ", phone_number=" + phone_number + ", isAdmin=" + isAdmin + ", isSell=" + isSell + ", active=" + active + '}';
    }

    
    

 

    
    
}
