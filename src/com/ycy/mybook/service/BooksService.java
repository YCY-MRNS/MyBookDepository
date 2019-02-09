package com.ycy.mybook.service;

import com.ycy.mybook.dao.BookDAO;
import com.ycy.mybook.dao.impl.BookDAOImpl;
import com.ycy.mybook.domian.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.List;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-01-28 21:56
 */
public class BooksService {
    private static BookDAO bookDAO = new BookDAOImpl();

    public static List<Book> getBooks() {
        return bookDAO.getRandBook(50);
    }

    public static BookPage<Book> getPageBooks(BookWithCondition bwc,String mode) {
        return bookDAO.getPageBook(bwc,mode);
    }

    public static Book getSingleBook(int id) {
        return bookDAO.getSingleBook(id);
    }

    public static boolean addCart(Integer id, ShoppingCart shoppingCart) {
        Book singleBook = getSingleBook(id);
        if (singleBook != null) {
            shoppingCart.addBookItem(singleBook);
            return true;
        }
        return false;
    }

    public static ShoppingCart getShoppingCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ShoppingCart sc = (ShoppingCart) session.getAttribute("shoppingCart");
        if (sc == null) {
            sc = new ShoppingCart();
            session.setAttribute("shoppingCart", sc);
        }
        return sc;
    }

    public static void deleteCartItem(Integer id, ShoppingCart cart) {
        cart.removeItem(id);
    }

    public static void updateItemQuantity(ShoppingCart cart, Integer id, int quantity) {
        if (cart != null) {
            cart.updateItem(id, quantity);
        }
    }

    public static void incermentItem(ShoppingCart cart, Integer id) {
        Collection<ShoppingCartItem> items = cart.getItems();
        for (ShoppingCartItem item : items) {
            if (item.getBook().getId().equals(id)) {
                item.increment();
            }
        }
    }
}
