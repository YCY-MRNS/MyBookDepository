package com.ycy.mybook.servlet;

import com.google.gson.Gson;
import com.ycy.mybook.domian.*;
import com.ycy.mybook.service.BooksService;
import com.ycy.mybook.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "BookServlet", urlPatterns = {"/bookServlet"})
public class BookServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String methodName = request.getParameter("method");
        try {
            Method declaredMethod = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            declaredMethod.setAccessible(true);
            declaredMethod.invoke(this, request, response);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    protected void updateItemQuantity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String quantityStr = request.getParameter("quantity");
        int id = 0;
        int quantity = 0;
        try {
            id = Integer.parseInt(idStr);
            quantity = Integer.parseInt(quantityStr);
        } catch (NumberFormatException ignored) {
        }
        ShoppingCart shoppingCart = BooksService.getShoppingCart(request);

        if (id > 0 && quantity > 0)
            BooksService.updateItemQuantity(shoppingCart, id, quantity);

        //传回json数据
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("bookNumber", shoppingCart.getBookNum());
        result.put("totalMoney", shoppingCart.getTotalPrice());
        result.put("perPrice", shoppingCart.getPerItemPrice(id));

        Gson gson = new Gson();
        String json = gson.toJson(result);
        response.setContentType("text/javascript");
        response.getWriter().print(json);
    }

    protected void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException ignored) {
        }
        ShoppingCart shoppingCart = BooksService.getShoppingCart(request);
        BooksService.deleteCartItem(id, shoppingCart);

        if (shoppingCart.isEmpty()) {
            request.getRequestDispatcher("/IsEmpty.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("/basket.jsp").forward(request, response);
    }


    protected void checkout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    protected void toCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/basket.jsp").forward(request, response);
    }

    private UserService userService = new UserService();


    protected void payment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String accountId = request.getParameter("card-number");

        String error = "";

        User user = userService.getUser(username);
        if (user != null) {
            int cardNumber = user.getAccountId();
            if (!accountId.trim().equals(cardNumber + "")) {
                error = "用户名和卡号不匹配！";
            }
        }

        if (!error.equals("")) {
            request.setAttribute("error", error);
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            return;
        }

    }


    public StringBuffer validateBookNumber(HttpServletRequest request){
        return null;
    }


    protected void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = 0;
        boolean flag = false;
        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException ignored) {
        }
        ShoppingCart shoppingCart = null;
        if (id > 0) {
            shoppingCart = BooksService.getShoppingCart(request);
            flag = BooksService.addCart(id, shoppingCart);
        }
        if (flag) {
            Map<String, Object> result = new HashMap<>();
            result.put("shoppingItemNumber", shoppingCart.getBookNum());
            result.put("totalPrice", shoppingCart.getTotalPrice());
            Gson gson = new Gson();
            String toJson = gson.toJson(result);
            response.setContentType("text/javascript");
            response.getWriter().print(toJson);
            return;
        }
        response.sendRedirect("error.jsp");
    }

    protected void getSingleBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException ignored) {
            response.sendRedirect("error.jsp");
        }

        Book singleBook = BooksService.getSingleBook(id);
        request.setAttribute("singleBookInfo", singleBook);

        request.getRequestDispatcher("/bookInfo.jsp").forward(request, response);

    }

    protected void getBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int currentPage = 1;
        int minPrice = 0;
        int maxPrice = Integer.MAX_VALUE;

        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        String currentPageStr = request.getParameter("currentPage");
        String title = request.getParameter("title");
        String mode = request.getParameter("mode");
        if (mode == null) {
            mode = "default";
        }

        try {
            currentPage = Integer.parseInt(currentPageStr);
        } catch (NumberFormatException ignored) {
        }
        try {
            minPrice = Integer.parseInt(minPriceStr);
        } catch (NumberFormatException ignored) {
        }
        try {
            maxPrice = Integer.parseInt(maxPriceStr);
        } catch (NumberFormatException ignored) {
        }
        BookWithCondition condition = new BookWithCondition(title, null, null, minPrice, maxPrice, currentPage);
        BookPage<Book> pageBooks = BooksService.getPageBooks(condition, mode);

        if (pageBooks != null) {
            request.setAttribute("books", pageBooks);
            request.setAttribute("minPrice", minPrice);
            request.setAttribute("maxPrice", maxPrice);
            request.setAttribute("title", title);
            request.setAttribute("mode", mode);
            request.getRequestDispatcher("/book.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
