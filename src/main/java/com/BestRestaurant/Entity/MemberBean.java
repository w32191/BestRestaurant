package com.BestRestaurant.Entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "member")
public class MemberBean {

  @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  @Column(name = "name")
  private String name;

  @Column(name = "gender")
  private int gender;

  @Column(name = "address")
  private String address;

  @Column(name = "tel")
  private String tel;

  @Transient
  @Column(name = "account_id")
  private int account_id;

  @OneToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "account_id", referencedColumnName = "id")
  private AccountBean accountBean;


  public MemberBean() {}


  public MemberBean(String name, int gender, String address, String tel, AccountBean account) {
    super();
    this.name = name;
    this.gender = gender;
    this.address = address;
    this.tel = tel;
    this.accountBean = account;
  }



  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getGender() {
    return gender;
  }

  public void setGender(int gender) {
    this.gender = gender;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public int getAccount_id() {
    return account_id;
  }

  public void setAccount_id(int account_id) {
    this.account_id = account_id;
  }

  public AccountBean getAccountBean() {
    return accountBean;
  }

  public void setAccountBean(AccountBean accountBean) {
    this.accountBean = accountBean;
  }



}
