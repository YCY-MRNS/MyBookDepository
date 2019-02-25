package com.ycy.mybook.test;

import com.ycy.mybook.dao.AccountDAO;
import com.ycy.mybook.dao.impl.AccountDAOImpl;
import com.ycy.mybook.domian.Account;
import org.junit.Test;

import javax.lang.model.element.VariableElement;

import static org.junit.Assert.*;

public class AccountDAOImplTest {

    private AccountDAO dao = new AccountDAOImpl();

    @Test
    public void get() {
        Account account = dao.get(1);
        System.out.println(account.toString());
    }

    @Test
    public void updateBalance() {
        dao.updateBalance(1,12);
    }
}