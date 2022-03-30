package com.BestRestaurant.DAO;

import java.io.Serializable;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.BestRestaurant.Entity.AccountBean;

@Repository
@Transactional
public class AccountDao {

  @Autowired
  private SessionFactory factory;

  // 取得該id所有account資料
  public AccountBean getAccountBeanByAccount(String inputAccount) {
    Session session = factory.getCurrentSession();
    String hql = "from AccountBean where account=:account";

    Query<AccountBean> query = session.createQuery(hql, AccountBean.class);

    query.setParameter("account", inputAccount);
    AccountBean account = query.uniqueResult();

    if (account != null) {
      return account;
    } else {
      return null;
    }

  }// end of getAccountBeanByAccount


  public AccountBean getAccountById(int id) {
    Session session = factory.getCurrentSession();
    return session.get(AccountBean.class, id);
  }

  // 更新密碼
  public boolean updatePwd(AccountBean account, String newPwd) {
    try {
      factory.getCurrentSession().update(account);
      account.setPwd(newPwd);

      return true;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }

  }

  // 新增帳號
  public int insertAccountData(AccountBean accountBean) {
    Session session = factory.getCurrentSession();
    Serializable id = session.save(accountBean);
    return (int) id;
  }

  public List getAllAccounts() {
    Session session = factory.getCurrentSession();
    String hql = "SELECT a.account FROM AccountBean as a";
    Query query = session.createQuery(hql);
    return query.getResultList();
  }


}
