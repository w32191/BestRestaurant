package com.BestRestaurant.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import com.BestRestaurant.Entity.AccountBean;
import com.BestRestaurant.service.LoginService;

@Controller
@SessionAttributes(names = "accountBean")
public class LoginController {

  @Autowired
  private LoginService loginService;


  // 登入
  @PostMapping(path = "/loginController.login")
  public String doLoginAction(@RequestParam("account") String username,
      @RequestParam("pwd") String pwd, Model model) {

    // 要放錯誤訊息的Map
    Map<String, String> errors = new HashMap<String, String>();
    model.addAttribute("errors", errors);

    // 判斷帳號密碼是否有輸入
    if (username == null || username.length() == 0) {
      errors.put("name", "請輸入帳號");
    } else if (pwd == null || pwd.length() == 0) {
      errors.put("pwd", "請輸入密碼");
    }

    //只要Map不是空的，表示有錯誤，回傳回login.jsp
    if (!errors.isEmpty()) {
      return "login";
    }

    //把使用者輸入的帳密，丟給service判斷是否登入成功
    Map<String, AccountBean> loginResult = loginService.doLogin(new AccountBean(username, pwd));

    if (loginResult.containsKey("登入正確")) {
      model.addAttribute("accountBean", loginResult.get("登入正確"));
      return "index";
    } else if (loginResult.containsKey("密碼錯誤")) {
      errors.put("result", "密碼錯誤");
      return "login";
    } else if (loginResult.containsKey("無此帳號")) {
      errors.put("result", "無此帳號");
      return "login";
    } else {
      errors.put("result", "發生錯誤");
      return "login";
    }

  }

  // 登出
  @GetMapping(path = "/logout")
  public String doLogout(SessionStatus status) {
    // 因登入後有把accountBean放進Session,
    // 所以登出後要setComplete() 去結束的這個Session
    status.setComplete();
    return "login";
  }


  // 點左側選單的修改密碼
  @GetMapping(path = "/toChangePwd")
  public String toChangePwdPage(HttpSession session) {
    // 因為是GET方法，所以要先判斷是否為登入中狀態
    AccountBean a = (AccountBean) session.getAttribute("accountBean");
    if (a != null) {
      //有登入，轉去changePwd.jsp
      return "changePwd";
    } else {

      return "redirect:unLogin";
    }
  }

  @GetMapping("/index")
  public String index(HttpSession session) {
    // 先判斷是否為登入中
    AccountBean a = (AccountBean) session.getAttribute("accountBean");
    if (a != null) {
      return "index";
    } else {
      return "redirect:unLogin";
    }
  }


  // 未登入狀態
  @GetMapping(path = "/unLogin")
  public String unLogin(Model model) {
    Map<String, String> errors = new HashMap<String, String>();
    errors.put("result", "請先登入");
    model.addAttribute("errors", errors);
    return "login";
  }
}
