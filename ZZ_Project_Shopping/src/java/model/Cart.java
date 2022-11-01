/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }
     public void setItems(List<Item> items) {
        this.items = items;
    }

    // tra ve so luong order trong gio hang
    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    // trả về item khi mà biết id
    private Item getItemById(int id) {
        for (Item item : items) {
            if (item.getProduct().getPid() == id) {
                return item;
            }
        }
        return null;
    }

    //them san pham trong gio hang
    public void addItem(Item t) {
        // th1: da co trong gio hang
        if (getItemById(t.getProduct().getPid()) != null) {
            //Cong don so luong
            Item m = getItemById(t.getProduct().getPid());
            // m la so luong ban dau trong gio hang, t la so luong them vao
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    // xoa san pham trong gio hang
    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    // tong tien cua tat ca hoa don
    public double getTotalMoney() {
        double t = 0;
        for (Item item : items) {
            t += item.getQuantity() * item.getPrice();
        }
        return t;
    }

    private Product_M getProductById(int id, List<Product_M> list) {
        for (Product_M p : list) {
            if (p.getPid() == id) {
                return p;
            }
        }
        return null;
    }

    // tu cookie tra ve danh sach cac item
    public Cart(String txt, List<Product_M> list) {
        items = new ArrayList<>();
        try {

            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                // tach theo dau " : "
                for (String i : s) {
                    String[] n = i.split(":");
                    // n[0] la pid, n[1] la so luong
                    int id =Integer.parseInt(n[0]);
                    int quantity=Integer.parseInt(n[1]);
                    Product_M p=getProductById(id, list);
                    Item t= new Item(p,quantity,p.getPrice()/2);
                    addItem(t);
                }
            }
        } catch (Exception e) {
        }
    }
}
