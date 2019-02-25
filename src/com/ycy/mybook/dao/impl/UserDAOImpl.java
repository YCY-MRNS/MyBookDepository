package com.ycy.mybook.dao.impl;

import com.ycy.mybook.dao.UserDAO;
import com.ycy.mybook.domian.User;

/**
 * @program: MyBook
 * @description: 、
 * @author: ChangYue
 * @create: 2019-02-11 17:54
 */
public class UserDAOImpl extends BaseDAO<User> implements UserDAO {


    @Override
    public User getUser(String username) {
        String sql = "select * from userinfo where username = ?";
        return query(sql, username);
    }

}
