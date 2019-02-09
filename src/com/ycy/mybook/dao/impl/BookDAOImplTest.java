package com.ycy.mybook.dao.impl;

import com.ycy.mybook.dao.BookDAO;
import com.ycy.mybook.domian.Book;
import com.ycy.mybook.domian.BookPage;
import com.ycy.mybook.domian.BookWithCondition;
import com.ycy.mybook.utils.WebAddressUtils;
import com.ycy.mybook.utils.WebJsoupUtils;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

public class BookDAOImplTest {

    private BookDAO bookDAO = new BookDAOImpl();

    @Test
    public void addBook() {
//        for (int i = 6; i < 10; i++) {
////            List<Book> bookInfoByJsoup = WebJsoupUtils.getBookInfoForDangDang(WebAddressUtils.THE_IT_PAGE, i);
//            try {
//                List<Book> books = WebJsoupUtils.getBookInfoForBookChina(i);
//                for (Book book : books) {
//                    if (book.getImg() != null && book.getType() != null) {
//                        bookDAO.addBook(book);
//                    }
//                }
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
    }


    @Test
    public void getSingleBook() {
        Book singleBook = bookDAO.getSingleBook(5994);
        System.out.println(singleBook);
    }

    @Test
    public void getAllBook() {
        List<Book> allBook = bookDAO.getAllBook();
        for (Book book : allBook) {
            System.out.println(book.toString());
        }
    }

    @Test
    public void getRemainBook() {
    }

    @Test
    public void getTotalBookNumber() {
        System.out.println(bookDAO.getTotalBookNumber(new BookWithCondition("java", null, null, 0, 12, 1)));
    }


    @Test
    public void getRandBook() {
        List<Book> randBook = bookDAO.getRandBook(4);
        for (Book book : randBook) {
            System.out.println(book.toString());
        }
    }

    @Test
    public void getBookWithCondition() {
        List<Book> bookWithCondition = bookDAO.getBookWithCondition(new BookWithCondition("e", null, null, 0, 12123, 1), 18, "orderByPrice");
        for (Book book : bookWithCondition) {
            System.out.println(book.getTitle() + " " + book.getPrice());
        }
    }


    @Test
    public void getPageBook() {
        BookWithCondition excel = new BookWithCondition("java", null, null, 0, 123123, 1);
        BookPage<Book> pageBook = bookDAO.getPageBook(excel, "");
        List<Book> list = pageBook.getList();
        for (Book book : list) {
            System.out.println(book.toString());
        }
    }

}