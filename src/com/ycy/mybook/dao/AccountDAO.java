package com.ycy.mybook.dao;

import com.ycy.mybook.domian.Account;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-02-11 17:30
 */
public interface AccountDAO {

    public abstract Account get(Integer accountId);

    /**
     * 更新account的余额
     * @param accountId account id
     * @param amount 需要扣除的钱
     */
    public void updateBalance(Integer accountId ,float amount);

}
