package Training.BusBookingProject;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class AdminDAO {
	
	SessionFactory sessionFactory;
	
	public int adminCheck(String adminName, String password){
		 sessionFactory = SessionHelper.getConnection();
	     Session session = sessionFactory.openSession();
	   // String cmd="select count(*) cnt from user_detail where username=?  and psswd = ?";
	     Criteria cr = session.createCriteria(Admin.class);
	     cr.add(Restrictions.eq("adminName", adminName));
	     cr.add(Restrictions.eq("password", password));
	     List<Admin> adminList=cr.list();
		 return adminList.size();
	     }
	
	public List<Admin> showAdmin(String admin){
		sessionFactory = SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		Query query = session.createQuery("from Admin");
		Criteria cr = session.createCriteria(Admin.class);
		List<Admin> adminList=query.list();
		return adminList;
		
		
	}
	//id=name,new=newpassword
		public String ForgetPwd(String id,String newpass){
			 sessionFactory = SessionHelper.getConnection();
		     Session session = sessionFactory.openSession();
		     Admin admin=Searchid(id);
		     int aid=admin.getAdminId();
		     Query q=session.createQuery("Update Admin SET password=:np WHERE adminId =:id").setParameter("np",newpass).setParameter("id",aid);
			 Transaction trans = session.beginTransaction();
			 q.executeUpdate();
			 trans.commit();
			return "password changed";
			
		}
		 
		public Admin Searchid(String adminName){
			 sessionFactory = SessionHelper.getConnection();
		     Session session = sessionFactory.openSession();
		    // Query query = session.createQuery("from Admin where admin=:u").setParameter("u", adminid);
		     Criteria cr = session.createCriteria(Admin.class);
		     cr.add(Restrictions.eq("adminName",adminName));
			 List <Admin> adminList=cr.list();
			 return adminList.get(0);       
		}



}
