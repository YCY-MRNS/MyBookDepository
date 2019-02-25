package com.ycy.mybook.dao;

import com.ycy.mybook.domian.User;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-02-11 17:25
 */
public interface UserDAO {


    /**
     * 获得user信息
     * @param username 用户名
     * @return 用户对象
     */
    public abstract User getUser(String username);

}
