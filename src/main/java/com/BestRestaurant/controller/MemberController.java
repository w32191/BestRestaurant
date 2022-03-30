package com.BestRestaurant.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.BestRestaurant.Entity.AccountBean;
import com.BestRestaurant.Entity.MemberBean;
import com.BestRestaurant.service.MemberDataService;

@Controller
@SessionAttributes(names = {"accountBean", "daoResult"})
public class MemberController {

  @Autowired
  private MemberDataService memberDataService;

  // 左方選單點帳號管理時
  @GetMapping(path = "/memberController.manage")
  public String manageMembers(@ModelAttribute("accountBean") AccountBean accountBean, Model m) {

    m.addAttribute("memberList",
        memberDataService.manageMembers(accountBean.getPerssion(), accountBean.getId()));

    return "manageUsers";
  }// end of manageMembers()

  // 更新密碼點update按鈕時
  @PostMapping(path = "/doChangePwd")
  public String doChangePwd(@RequestParam("inputCurrentPassword") String inputCurrentPassword,
      @RequestParam("inputNewPassword") String inputNewPassword,
      @RequestParam("inputConfirmNewPassword") String inputConfirmNewPassword,
      @ModelAttribute("accountBean") AccountBean account, Model model) {

    Map<String, String> resultMap = new HashMap<String, String>();
    model.addAttribute("result", resultMap);

    if (!inputNewPassword.equals(inputConfirmNewPassword)) {
      resultMap.put("error", "ERROR : 兩次密碼不相同");
      return "changePwd";
    } else if (inputCurrentPassword == null || inputCurrentPassword.length() == 0) {
      resultMap.put("error", "ERROR : 請輸入舊密碼");
      return "changePwd";
    } else if (!inputCurrentPassword.equals(account.getPwd())) {
      resultMap.put("error", "ERROR : 舊密碼錯誤");
      return "changePwd";
    } // end of 1st if()

    boolean result = memberDataService.changePwd(account, inputNewPassword);

    if (result) {
      resultMap.put("result", "Result : 更新成功");
      return "changePwd";
    } else {
      resultMap.put("error", "ERROR : 發生錯誤");
      return "changePwd";
    } // end of 2nd if()

  }// end of doChangePwd()


  // 點刪除帳號按鈕時
  @GetMapping("/member.delete/id/{id}")
  @ResponseBody
  public String doDeleteMember(@PathVariable("id") String idStr) {
    System.out.println(idStr);
    int id = Integer.parseInt(idStr);
    boolean result = memberDataService.deleteMember(id);

    if (result) {
      return "success";
    } else {
      return "fail";
    }

  }// end of doDeleteMember()

  // 新增帳號
  @PostMapping("/insertMember")
  public String insertMember(@RequestParam("insertName") String name,
      @RequestParam("insertAccount") String account, @RequestParam("insertPwd") String pwd,
      @RequestParam("insertGender") int gender, @RequestParam("insertAddress") String address,
      @RequestParam("insertTel") String tel, @RequestParam("insertPerssion") int perssion,
      @RequestParam(name = "isLogin", defaultValue = "true") String isLogin,
      Model m) {

    MemberBean member =
        new MemberBean(name, gender, address, tel, new AccountBean(account, pwd, perssion));

    boolean result = memberDataService.insertMember(member);

    if (result) {
      m.addAttribute("daoResult", "InsertSuccess");
    } else {
      m.addAttribute("daoResult", "InsertFail");
    }

    if (isLogin.equals("true")) {
      return "redirect:/manageU";
    } else {
      return "login";
    }

  }// end of insertMember()

  // 更新帳號資料
  @PostMapping("updateMember")
  public String updateMember(@RequestParam("updateName") String updateName,
      @RequestParam("updateAccount") String updateAccount,
      @RequestParam("updateGender") int updateGender,
      @RequestParam("updateAddress") String updateAddress,
      @RequestParam("updateTel") String updateTel,
      @RequestParam("updatePerssion") int updatePerssion, @RequestParam("updateId") int updateId,
      Model m) {

    // 先將傳進來的資料 放進
    AccountBean newAccount = new AccountBean();
    newAccount.setId(updateId);
    newAccount.setAccount(updateAccount);
    newAccount.setPerssion(updatePerssion);

    MemberBean newMember = new MemberBean();
    newMember.setId(updateId);
    newMember.setName(updateName);
    newMember.setGender(updateGender);
    newMember.setAddress(updateAddress);
    newMember.setTel(updateTel);

    newMember.setAccountBean(newAccount);

    boolean result = memberDataService.updateMember(newMember);

    if (result) {
      m.addAttribute("daoResult", "UpdateSuccess");
      return "redirect:/manageU";
    } else {
      m.addAttribute("daoResult", "UpdateFail");
      return "redirect:/manageU";
    }
  } // end of updateMember()

}
