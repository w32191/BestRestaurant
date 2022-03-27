package com.BestRestaurant.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

@Entity
@Table(name = "account")
@Component
public class AccountBean {


  @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  @Column(name = "account")
  private String account;

  @Column(name = "pwd")
  private String pwd;

  @Column(name = "perssion")
  private int perssion;

  @OneToOne(mappedBy = "accountBean")
  private MemberBean memberBean;

  public AccountBean() {}


  public AccountBean(String username, String pwd2) {
    this.account = username;
    this.pwd = pwd2;
  }

  public AccountBean(String username, String pwd2, int perssion) {
    this.account = username;
    this.pwd = pwd2;
    this.perssion = perssion;
  }


  public MemberBean getMemberBean() {
    return memberBean;
  }


  public void setMemberBean(MemberBean memberBean) {
    this.memberBean = memberBean;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }

  public String getPwd() {
    return pwd;
  }

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }

  public int getPerssion() {
    return perssion;
  }

  public void setPerssion(int perssion) {
    this.perssion = perssion;
  }
}
