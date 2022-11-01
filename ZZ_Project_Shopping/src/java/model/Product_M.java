/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Product_M {
     private int pid;
         private String name,code,color,image;
         private double price;
         private String description;
         private int quantity;
         private int cateID;
         private boolean status;

    public Product_M() {
    }

    public Product_M(int pid, String name, String code, String color, String image, double price, String description, int quantity, int cateID, boolean status) {
        this.pid = pid;
        this.name = name;
        this.code = code;
        this.color = color;
        this.image = image;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.cateID = cateID;
        this.status = status;
    }
    public Product_M(int pid, String name, String code, String color, String image, double price, String description, int quantity) {
        this.pid = pid;
        this.name = name;
        this.code = code;
        this.color = color;
        this.image = image;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
    }
    public Product_M( String name, String code, String color, String image, double price, String description, int quantity, int cateID) {
        this.name = name;
        this.code = code;
        this.color = color;
        this.image = image;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.cateID = cateID;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
         
}
