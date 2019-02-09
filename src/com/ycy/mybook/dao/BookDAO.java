package com.ycy.mybook.dao;

import com.ycy.mybook.domian.Book;
import com.ycy.mybook.domian.BookPage;
import com.ycy.mybook.domian.BookWithCondition;

import java.util.List;

public interface BookDAO {
    public abstract void addBook(Book book);

    public abstract Book getSingleBook(int id);

    public abstract BookPage<Book> getPageBook(BookWithCondition bwc,String mode);

    public abstract List<Book> getAllBook();

    public abstract List<Book> getRandBook(int num);

//    public abstract List<Book> getOrderByBook(BookWithCondition bwc, int pageSize);

    public abstract List<Book> getBookWithCondition(BookWithCondition bwc, int pageSize, String mode);

//    public abstract List<Book> getBookWithOderBy(BookWithCondition bwc, int pageSize);

    public abstract long getTotalBookNumber(BookWithCondition bwc);
}
