package com.ycy.mybook.service;

import com.ycy.mybook.dao.UserDAO;
import com.ycy.mybook.dao.impl.UserDAOImpl;
import com.ycy.mybook.domian.User;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-02-11 20:59
 */
public class UserService {

    private UserDAO dao = new UserDAOImpl();

    public User getUser(String username) {
        return dao.getUser(username);
    }

}
