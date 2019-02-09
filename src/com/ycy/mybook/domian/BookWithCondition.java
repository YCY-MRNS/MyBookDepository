package com.ycy.mybook.domian;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-01-28 21:07
 */
public class BookWithCondition {
    private String title;
    private String press;
    private String author;
    private int minPrice = 0;
    private int maxPrice = Integer.MAX_VALUE;
    private int currentPage;
    private String mode;
    private String type;

    public BookWithCondition() {
    }

    public BookWithCondition(String title, String press, String author, int minPrice, int maxPrice, int currentPage, String mode, String type) {
        this.title = title;
        this.press = press;
        this.author = author;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
        this.currentPage = currentPage;
        this.mode = mode;
        this.type = type;
    }

    public BookWithCondition(String title, String press, String author, int minPrice, int maxPrice, int currentPage) {
        this.title = title;
        this.press = press;
        this.author = author;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
        this.currentPage = currentPage;
    }

    public BookWithCondition(String title, String press, String author, int minPrice, int maxPrice) {
        this.title = title;
        this.press = press;
        this.author = author;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
    }

    public BookWithCondition(String title) {
        this.title = title;
    }

    public BookWithCondition(int minPrice, int maxPrice, int currentPage) {
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
        this.currentPage = currentPage;
    }

    public BookWithCondition(String title, String press) {
        this.title = title;
        this.press = press;
    }

    public BookWithCondition(String title, String press, String author) {
        this.title = title;
        this.press = press;
        this.author = author;
    }

    public String getTitle() {
        if (title == null) {
            return "%%";
        } else {
            return "%" + title + "%";
        }
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPress() {
        if (press == null) {
            return "%%";
        } else {
            return "%" + press + "%";
        }
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getAuthor() {
        if (author == null) {
            return "%%";
        } else {
            return "%" + author + "%";
        }
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(int minPrice) {
        this.minPrice = minPrice;
    }

    public int getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(int maxPrice) {
        this.maxPrice = maxPrice;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "BookWithCondition{" +
                "title='" + title + '\'' +
                ", press='" + press + '\'' +
                ", author='" + author + '\'' +
                ", minPrice=" + minPrice +
                ", maxPrice=" + maxPrice +
                ", currentPage=" + currentPage +
                ", mode='" + mode + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
