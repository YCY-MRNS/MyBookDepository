package com.ycy.mybook.dao.impl;

import com.ycy.mybook.dao.BookDAO;
import com.ycy.mybook.domian.Book;
import com.ycy.mybook.domian.BookPage;
import com.ycy.mybook.domian.BookWithCondition;

import java.util.List;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-01-27 12:35
 */
public class BookDAOImpl extends BaseDAO<Book> implements BookDAO {

    @Override
    public void addBook(Book book) {
        String sql = "INSERT IGNORE INTO books(type,title,author,content,img,price,remainNums,press,words,href,published) VALUE(?,?,?,?,?,?,?,?,?,?,?);";
        insert(sql, book.getType(), book.getTitle(), book.getAuthor(),
                book.getContent(), book.getImg(), book.getPrice(), book.getRemainNums(), book.getPress()
                , book.getWords(), book.getHref(), book.getPublished());
    }

    @Override
    public Book getSingleBook(int id) {
        String sql = "select * from books where id = ?";
        return query(sql, id);
    }

    @Override
    public BookPage<Book> getPageBook(BookWithCondition bwc, String mode) {

        BookPage<Book> bookPage = new BookPage<>(bwc.getCurrentPage());
        bookPage.setTotalNumber(getTotalBookNumber(bwc));
        bookPage.setPageNo(bwc.getCurrentPage());
        bwc.setCurrentPage(bookPage.getPageNo());
        bookPage.setList(getBookWithCondition(bwc, 18, mode));

        return bookPage;
    }

    @Override
    public List<Book> getAllBook() {
        String sql = "select id,TYPE,title,author,content,img,price,remainNums,press,words,href,published from books where id < 6010";
        return queryForList(sql);
    }

    @Override
    public List<Book> getRandBook(int num) {
        String sql = "SELECT * FROM books ORDER BY RAND() limit ?";
        return queryForList(sql, num);
    }


    @Override
    public List<Book> getBookWithCondition(BookWithCondition bwc, int pageSize, String mode) {
        String sql = "";
        switch (mode) {
            case "default":
                sql = "SELECT * FROM books WHERE price >=? AND price <=? AND title LIKE ? AND author LIKE ?" +
                        " AND press LIKE ? LIMIT ?,?";
                break;
            case "orderByPriceDesc":
                sql = "SELECT * FROM books WHERE price >=? AND price <=? AND title LIKE ? AND author LIKE ?" +
                        " AND press LIKE ? ORDER BY price DESC LIMIT ?,?";
                break;
            case "orderByPriceAsc":
                sql = "SELECT * FROM books WHERE price >=? AND price <=? AND title LIKE ? AND author LIKE ?" +
                        " AND press LIKE ? ORDER BY price ASC LIMIT ?,?";
                break;
            case "orderByPublishedDesc":
                sql = "SELECT * FROM books WHERE price >=? AND price <=? AND title LIKE ? AND author LIKE ?" +
                        " AND press LIKE ? ORDER BY published DESC LIMIT ?,?";
                break;
            case "orderByPublishedAsc":
                sql = "SELECT * FROM books WHERE price >=? AND price <=? AND title LIKE ? AND author LIKE ?" +
                        " AND press LIKE ? ORDER BY published ASC LIMIT ?,?";
                break;
        }

        return queryForList(sql, bwc.getMinPrice(), bwc.getMaxPrice(), bwc.getTitle(), bwc.getAuthor(),
                bwc.getPress(), (bwc.getCurrentPage() - 1) * pageSize, pageSize);
    }


    @Override
    public long getTotalBookNumber(BookWithCondition bwc) {
        String sql = "SELECT COUNT(id) FROM books WHERE price >=? AND price <=? AND title LIKE ? AND author LIKE ?" +
                " AND press LIKE ?";
        return getSingleVal(sql, bwc.getMinPrice(), bwc.getMaxPrice(), bwc.getTitle(), bwc.getAuthor(),
                bwc.getPress());
    }
}
