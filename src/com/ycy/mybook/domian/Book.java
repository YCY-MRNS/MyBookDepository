package com.ycy.mybook.domian;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-01-27 12:31
 */
public class Book {

    private Integer id;
    private String title;
    private String author;
    private String content;
    private String href;
    private String type;
    private String img;
    private String published;
    private String press;
    private double price;
    private double words;
    private int remainNums;

    public Book() {
    }

    public Book(String title, String author, String content, String href, String type, String img, String published, String press, double price, double words, int remainNums) {
        this.title = title;
        this.author = author;
        this.content = content;
        this.href = href;
        this.type = type;
        this.img = img;
        this.published = published;
        this.press = press;
        this.price = price;
        this.words = words;
        this.remainNums = remainNums;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPublished() {
        return published;
    }

    public void setPublished(String published) {
        this.published = published;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getWords() {
        return words;
    }

    public void setWords(double words) {
        this.words = words;
    }

    public int getRemainNums() {
        return remainNums;
    }

    public void setRemainNums(int remainNums) {
        this.remainNums = remainNums;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", content='" + content + '\'' +
                ", href='" + href + '\'' +
                ", type='" + type + '\'' +
                ", img='" + img + '\'' +
                ", published='" + published + '\'' +
                ", press='" + press + '\'' +
                ", price=" + price +
                ", words=" + words +
                ", remainNums=" + remainNums +
                '}';
    }
}
