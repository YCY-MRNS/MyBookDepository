package com.ycy.mybook.domian;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-02-11 17:28
 */
public class User {

    private Integer userId;
    private String username;
    private int accountId;

    public User(Integer userId, String username, int accountId) {
        this.userId = userId;
        this.username = username;
        this.accountId = accountId;
    }

    public User() {
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", accountId=" + accountId +
                '}';
    }
}


