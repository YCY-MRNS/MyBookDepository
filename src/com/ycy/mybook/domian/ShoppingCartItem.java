package com.ycy.mybook.domian;

/**
 * @program: MyBook
 * @description: 购物车item的实体类
 * @author: ChangYue
 * @create: 2019-01-31 13:41
 */
public class ShoppingCartItem {
    private Book book;
    private int quantity;

    public ShoppingCartItem(Book book) {
        this.book = book;
        this.quantity = 1;
    }

    public Book getBook() {
        return book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getBookMoney() {
        return book.getPrice() * quantity;
    }

    public void increment() {
        quantity++;
    }

    public void reduce() {
        if (quantity > 0) {
            quantity--;
        }
    }
}
