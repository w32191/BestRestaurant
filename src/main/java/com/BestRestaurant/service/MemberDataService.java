package com.BestRestaurant.service;

import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.BestRestaurant.DAO.AccountDao;
import com.BestRestaurant.DAO.MemberDao;
import com.BestRestaurant.Entity.AccountBean;
import com.BestRestaurant.Entity.MemberBean;

@Service
@Transactional
public class MemberDataService {

  @Autowired
  private MemberDao memberDao;

  @Autowired
  private AccountDao accountDao;

  public List<MemberBean> manageMembers(int perssion, int id) {

    // controller 呼叫時傳入現在登入的帳號的權限＆ID
    if (perssion > 98) { // 如為管理者回傳全部的帳號資訊

      return memberDao.getAllMembers();
    } else {

      List<MemberBean> selfList = new ArrayList<MemberBean>();
      selfList.add(memberDao.getMemberById(id));
      return selfList;
    }
  }// end of manageMembers()


  public boolean changePwd(AccountBean accountBean, String newPwd) {
    return accountDao.updatePwd(accountBean, newPwd);
  }// end of changePwd()


  public boolean deleteMember(int id) {
    return memberDao.deleteMember(id);
  } // end of deleteMember()


  public boolean insertMember(MemberBean member) {
    // 先查詢是否已經有這個帳號
    AccountBean result = accountDao.getAccountBeanByAccount(member.getAccountBean().getAccount());

    if (result == null) {

      return memberDao.insertMember(member);
    } else {
      //已有帳號
      return false;
    }
  } // end of insertMember()


  public boolean updateMember(MemberBean newMember) {
    // 用ID將這個帳號資料從DB取出
    AccountBean daoResult = accountDao.getAccountById(newMember.getId());

    MemberBean oldMember;

    if (daoResult.getId() == newMember.getId() &&
        daoResult.getAccount().equals(newMember.getAccountBean().getAccount())) {
      //如果輸入的id跟account都相同，表示沒有要更改account
      oldMember = memberDao.getMemberById(newMember.getId());

    } else {

      //如果有換account，要先把原本的memberBean取出來
      oldMember = daoResult.getMemberBean();

      //先從DB取出所有的帳號字串
      List<String> accountList = accountDao.getAllAccounts();

      // 檢查新輸入的帳號，在資料庫是否已有相同帳號，若有return false
      if (accountList.contains(newMember.getAccountBean().getAccount())) {
        return false;
      }
    } //end of if()

    oldMember.getAccountBean().setAccount(newMember.getAccountBean().getAccount());
    oldMember.getAccountBean().setPerssion(newMember.getAccountBean().getPerssion());
    oldMember.setGender(newMember.getGender());
    oldMember.setName(newMember.getName());
    oldMember.setAddress(newMember.getAddress());
    oldMember.setTel(newMember.getTel());

    return memberDao.updateMember(oldMember);
  }// end of updateMember()

}

