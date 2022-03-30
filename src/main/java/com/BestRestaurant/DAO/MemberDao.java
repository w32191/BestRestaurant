package com.BestRestaurant.DAO;

import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.BestRestaurant.Entity.MemberBean;

@Repository
@Transactional
public class MemberDao {

  @Autowired
  private SessionFactory factory;


  @SuppressWarnings("unchecked")
  public List<MemberBean> getAllMembers() {
    Session session = factory.getCurrentSession();
    String hql = "from MemberBean";

    return (List<MemberBean>) session.createQuery(hql).getResultList();
  }// end of getAllMembers()


  public MemberBean getMemberById(int id) {
    Session session = factory.getCurrentSession();
    return session.get(MemberBean.class, id);
  }// end of getMemberById()


  // 刪除
  public boolean deleteMember(int id) {
    Session session = factory.getCurrentSession();
    String hqlStr = "from MemberBean where accountBean.id=:id";
    try {
      MemberBean result =
          session.createQuery(hqlStr, MemberBean.class).setParameter("id", id).uniqueResult();
      session.delete(result);
      return true;

    } catch (Exception e) {
      e.printStackTrace();

      return false;
    }

  }// end of deleteMember(int id)


  // 新增
  public boolean insertMember(MemberBean member) {
    Session session = factory.getCurrentSession();
    try {
      session.save(member);

      return true;
    } catch (Exception e) {
      System.out.println("Soething wrong!!!!");
      e.printStackTrace();
      return false;
    }
  } // end of insertMember()

  // 更新
  public boolean updateMember(MemberBean member) {
    Session session = factory.getCurrentSession();
    try {
      session.save(member);
      return true;
    } catch (Exception e) {
      return false;
    }
  }// end of updateMember()
}
