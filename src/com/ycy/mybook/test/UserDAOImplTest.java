package com.ycy.mybook.test;

import com.ycy.mybook.dao.UserDAO;
import com.ycy.mybook.dao.impl.UserDAOImpl;
import com.ycy.mybook.domian.User;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserDAOImplTest {
    private UserDAO dao = new UserDAOImpl();

    @Test
    public void getUser() {
        User tom = dao.getUser("tom");
        System.out.println(tom.toString());
    }
}