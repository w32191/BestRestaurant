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
      memberDao.insertMember(member);
      return true;
    } else {
      return false;
    }
  } // end of insertMember()


  public boolean updateMember(MemberBean newMember) {
    // 先查詢是否已經有這個帳號
    AccountBean result = accountDao.getAccountBeanByAccount(
        newMember.getAccountBean().getAccount());
    if (result == null) {
      // 從資料庫取出原有的資料
      MemberBean oldMember = memberDao.getMemberById(newMember.getId());
      System.out.println("ID : " + oldMember.getId());

      oldMember.getAccountBean().setAccount(newMember.getAccountBean().getAccount());
      oldMember.getAccountBean().setPerssion(newMember.getAccountBean().getPerssion());
      oldMember.setGender(newMember.getGender());
      oldMember.setName(newMember.getName());
      oldMember.setAddress(newMember.getAddress());
      oldMember.setTel(newMember.getTel());
      memberDao.updateMember(oldMember);
      return true;
    } else {
      return false;
    }


  }// end of updateMember()

}

