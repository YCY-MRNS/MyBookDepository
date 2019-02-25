package com.ycy.mybook.dao.impl;

import com.ycy.mybook.dao.AccountDAO;
import com.ycy.mybook.domian.Account;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-02-11 17:30
 */
public class AccountDAOImpl extends BaseDAO<Account> implements AccountDAO {


    @Override
    public Account get(Integer accountId) {
        String sql = "SELECT * FROM account WHERE accountId =?";
        return query(sql, accountId);
    }

    @Override
    public void updateBalance(Integer accountId, float amount) {
        String sql = "Update account set balance = balance - ? where accountId = ?";
        update(sql, amount, accountId);
    }

}
