package com.ycy.mybook.utils;

import com.ycy.mybook.domian.Book;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

public class WebJsoupUtilsTest {

    @Test
    public void getBookInfo() {
        for (int i = 2; i < 10; i++) {
            List<Book> bookInfo = WebJsoupUtils.getBookInfoForDangDang("http://e.dangdang.com/list-RJXT-dd_sale-0-", i);
            for (Book book : bookInfo) {
                System.out.println(book.getImg());
            }
        }

    }

    @Test
    public void getBookInfoForBookChina() throws IOException {
//        WebJsoupUtils.getBookInfoForBookChina();
    }
}