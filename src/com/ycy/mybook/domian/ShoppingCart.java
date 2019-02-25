package com.ycy.mybook.domian;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-01-31 13:47
 */
public class ShoppingCart {
    private Map<Integer, ShoppingCartItem> books = new HashMap<>();

    /**
     * 修改数量
     *
     * @param id       修改商品的id
     * @param quantity 修改数量
     */
    public void updateItem(Integer id, int quantity) {
        ShoppingCartItem item = books.get(id);
        if (item != null) {
            item.setQuantity(quantity);
        }
    }

    /**
     * 移除商品
     *
     * @param id 购物车中商品的id
     */
    public void removeItem(Integer id) {
        books.remove(id);
    }

    /**
     * 清空购物车
     */
    public void claer() {
        books.clear();
    }

    /**
     * @return 是否为空
     */
    public boolean isEmpty() {
        return books.isEmpty();
    }

    /**
     * @return 总的钱
     */
    public double getTotalPrice() {
        double total = 0;
        for (ShoppingCartItem item : getItems()) {
            total += item.getBookMoney();
        }
        return total;
    }

    public double getPerItemPrice(Integer id) {
        for (ShoppingCartItem item : getItems()) {
            if (item.getBook().getId().equals(id)) {
                return item.getBookMoney();
            }
        }
        return 0;
    }

    /**
     * @return 购物车Map中的全部item
     */
    public Collection<ShoppingCartItem> getItems() {
        return books.values();
    }

    /**
     * @return 全部书的数量
     */
    public int getBookNum() {
        int total = 0;
        for (ShoppingCartItem item : books.values()) {
            total += item.getQuantity();
        }
        return total;
    }

    public Map<Integer, ShoppingCartItem> getBooks() {
        return books;
    }

    /**
     * 是否有该书
     *
     * @param book
     * @return
     */
    public boolean hasBook(Book book) {
        return books.containsKey(book.getId());
    }

    /**
     * 添加到购物车
     *
     * @param book
     */
    public void addBookItem(Book book) {
        //检查购物车里面有不 有 加一  没有 新建
        ShoppingCartItem shoppingCartItem = books.get(book.getId());
        //没有
        if (shoppingCartItem == null) {
            shoppingCartItem = new ShoppingCartItem(book);
            books.put(book.getId(), shoppingCartItem);
        } else {
            shoppingCartItem.increment();
        }
    }

    /**
     * 减少商品
     *
     * @param book
     */
//    public void reduceItem(Book book) {
//        ShoppingCartItem item = books.get(book.getId());
//        if (item != null) {
//            if (item.getQuantity() > 1) {
//                item.reduce();
//            } else {
//                removeItem(book.getId());
//            }
//        }
//    }

}
