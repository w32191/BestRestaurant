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


  public Map<String, AccountBean> doLogin(AccountBean inputAccount) {

    //先用輸入的account去資料庫找accountBean資料
    AccountBean daoResult = accountDao.getAccountBeanByAccount(inputAccount.getAccount());

    //放資料要傳給前端的Map
    Map<String, AccountBean> resultMap = new HashMap<String, AccountBean>();

    //如果Dao找回來有資料的話
    if (daoResult != null) {

      //判斷取回的密碼跟使用者輸入的密碼是否相等
      if (!daoResult.getPwd().equals(inputAccount.getPwd())) {
        resultMap.put("密碼錯誤", null);
        return resultMap;
      } else {
        //帳號密碼都正確的話，把整筆accountBean放進Map回傳
        resultMap.put("登入正確", daoResult);
        return resultMap;
      } //end of inner if()

    } else {
      resultMap.put("無此帳號", null);
      return resultMap;
    }//end of outer if()

  }// end of doLogin()

}
