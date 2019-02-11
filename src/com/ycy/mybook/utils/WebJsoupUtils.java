package com.ycy.mybook.utils;

import com.ycy.mybook.domian.Book;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-01-27 11:31
 */

public class WebJsoupUtils {

    private static List<Book> bookList = new ArrayList<>();
    private static List<Book> bookLists= new ArrayList<>();


    /*中国图书网*/
    public static List<Book> getBookInfoForBookChina(int P) throws IOException {
        Book book = new Book();
        Document document = Jsoup.connect("http://www.bookschina.com/books/kinder/").get();
        Elements elements = document.getElementsByTag("h2");
        for (Element e : elements) {
            String href = e.select("a[href]").attr("abs:href");
            String subHref = "";
            if (href.length() > 10) {
                subHref = href.substring(0, href.length()-1) + "_0_0_11_0_1_"+ P +"_0_0/";
                System.out.println(subHref);
                Document bookList = Jsoup.connect(subHref).get();
                String type = bookList.select("div.dropMenu").select("a[href]").text();
                Elements lists = bookList.getElementsByClass("bookList");
                for (Element list : lists) {
                    Elements li = list.select("li");
                    for (Element l : li) {
                        Elements cover = l.getElementsByClass("cover");
                        Elements a = cover.select("a[href]");
                        Elements imgTag = a.select("img[src]");
                        String url = a.attr("abs:href");
                        String img = imgTag.attr("data-original");

                        Elements infor = l.getElementsByClass("infor");
                        String title = infor.select("h2.name").tagName("a").text();

                        Elements otherInfor = infor.select("div.otherInfor");
                        String author = otherInfor.select("a.author").text();
                        String publishedStr = otherInfor.select("span.pulishTiem").text();
                        String press = otherInfor.select("a.publisher").text();

                        String priceStr = infor.select("div.priceWrap").select("span.sellPrice").text();
                        String content = infor.select("p.recoLagu").text();

                        double price = getDigitalWithStr(priceStr);
                        String published = getData(publishedStr);

                        book = new Book(title, author, content, url, type, img, published, press, price, 0, 100);
                        bookLists.add(book);
                    }
                }
            }
        }
        System.out.println(bookLists.size());
        return bookLists;
    }

    /**
     * @param url
     * @param page
     * @return
     */
    public static List<Book> getBookInfoForDangDang(String url, int page) {
        Book book = new Book();
        Document document = null;
        try {
            document = Jsoup.connect(url + page + ".html").get();
            Element book_list = document.getElementById("book_list");
            Elements elements = book_list.getElementsByTag("a");
            for (Element e : elements) {
                String href = e.attr("href");
                Document details = Jsoup.connect(href).get();
                Elements explain_box = details.getElementsByClass("explain_box");
                String press = explain_box.get(0).getElementById("publisher").getElementsByTag("a").text();
                String publishedStr = explain_box.get(0).select("p:nth-child(3)").text();
                String published = getData(publishedStr);
                String wordsStr = explain_box.get(0).select("p:nth-child(4)").text();
                double words = 0;
                try {
                    words = getDigitalWithStr(wordsStr);
                } catch (Exception ignored) {
                }

                String typeStr = explain_box.get(0).select("p:nth-child(5)").select("span:nth-child(1)").text();
                String type = null;
                try {
                    type = getTypeWithStr(typeStr);
                } catch (Exception ignored) {
                }
                String img = e.getElementsByClass("bookcover").select("img").attr("src");
                String title = e.getElementsByClass("title").text();
                String author = e.getElementsByClass("author").text();
                String content = e.getElementsByClass("des").text();
                String priceStr = e.getElementsByClass("now").text();
                double price = 0;
                try {
                    price = getDigitalWithStr(priceStr);
                } catch (Exception ignored) {
                }
                book = new Book(title, author, content, href, type, img, published, press, price, words, 100);
                bookList.add(book);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return bookList;
    }

    private static String getData(String str) {
        String digitalStr = "";
        if (str != null) {
            digitalStr = str.replaceAll("[^0-9 -]", "");
        }
        return digitalStr;
    }

    private static double getDigitalWithStr(String str) {
        String digitalStr = "";
        if (str != null) {
            digitalStr = str.replaceAll("[^0-9 .]", "");
        }
        return Double.parseDouble(digitalStr);
    }

    private static String getTypeWithStr(String str) {
        return str.substring(0, str.length() - 1);
    }

}
