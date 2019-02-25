package com.ycy.mybook.domian;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-02-11 17:32
 */
public class Account {
    private Integer accountId;
    private int balance;

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public Account(Integer accountId, int balance) {
        this.accountId = accountId;
        this.balance = balance;
    }

    public Account() {
    }

    @Override
    public String toString() {
        return "Account{" +
                "accountId=" + accountId +
                ", balance=" + balance +
                '}';
    }
}
