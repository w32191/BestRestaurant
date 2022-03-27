package com.BestRestaurant.service;

import java.util.HashMap;
import java.util.Map;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.BestRestaurant.DAO.AccountDao;
import com.BestRestaurant.Entity.AccountBean;

@Service
@Transactional
public class LoginService {

  @Autowired
  private AccountDao accountDao;


  public Map<String, AccountBean> doLogin(AccountBean accountEntity) {

    AccountBean result = accountDao.getAccountBeanByAccount(accountEntity.getAccount());

    Map<String, AccountBean> resultMap = new HashMap<String, AccountBean>();

    if (result != null) {

      if (!result.getPwd().equals(accountEntity.getPwd())) {
        resultMap.put("密碼錯誤", null);
        return resultMap;

      } else {
        resultMap.put("登入正確", result);
        return resultMap;
      }
    } else {
      resultMap.put("無此帳號", null);
      return resultMap;
    }

  }// end of doLogin()

}
