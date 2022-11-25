package Training.BusBookingProject;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class UserDAO {

	SessionFactory sessionFactory;
	
// Show All User's
	
	public List<User> showUser(String user){
		sessionFactory = SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		Query query = session.createQuery("from User");
		Criteria cr = session.createCriteria(User.class);
		List<User> userList=query.list();
		return userList;	
		
	}
	
	//Update User
	
	public String updateUser(User user) {
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 Criteria cr = session.createCriteria(User.class);
		 Transaction trans = session.beginTransaction();
		 session.update(user);
		 trans.commit();
		return "***...Record Updated...***";

		 
	 }

  //Delete User
	
	 public String deleteUser(String userid) {
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 User user=SearchUserId(userid);
		 Transaction t = session.beginTransaction();
		 try {
			 session.delete(user);
			 t.commit();
			return "Record delete";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			return ("Not Delete ."+e.getMessage());
			
		}
		
	 }
	
	//Generate User ID
	 
		public String generateUserId() {
			
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession();
			Criteria cr = session.createCriteria(User.class);
			List<User> userList = cr.list();
			if (userList.size() == 0) {
				return "U001";
			}
			session.close();
			String id = userList.get(userList.size() - 1).getUserid();
			int id1 = Integer.parseInt(id.substring(1));
			id1++;
			String id2 = String.format("U%03d", id1);
			return id2;

		}
		
		//Add User:
		
	public String Adduser(User user) {
		String userid = generateUserId();
		user.setUserid(userid);
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Transaction trans = session.beginTransaction();
		session.save(user);
		trans.commit();
		session.close();
		
		session = sessionFactory.openSession();
		Wallet wallet = new Wallet();
		wallet.setWalletId(generateWalletId());
		wallet.setWalletAmount(0);
		wallet.setUserId(userid);
		
		session.save(wallet);
		session.beginTransaction().commit();
		
		return "User Details added Successfully";

	}
	
	//Search User by User ID

	public User SearchUserId(String UserId) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("userid", UserId));
		List<User> Userlist = cr.list();
		return Userlist.get(0);
	}

	
	
	
	
	//Generate Booking ID
	
	
	
	
	
	public String generateBookingId() {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Booking.class);
		List<Booking> bookingList = cr.list();
		if (bookingList.size() == 0) {
			return "K001";
		}
		session.close();
		String id = bookingList.get(bookingList.size() - 1).getBookingId();
		int id1 = Integer.parseInt(id.substring(1));
		id1++;
		String id2 = String.format("K%03d", id1);
		return id2;
	}

	
	
	// Add Booking
	
	
	public String addBooking(Booking booking) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		String bookId = generateBookingId();
		booking.setBookingStatus(BookingStatus.PENDING);
		booking.setBookingId(bookId);
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		// booking.setDateofBooking(sqlDate);
		Transaction t = session.beginTransaction();
		session.save(booking);
		t.commit();
		return "Added Booking Details";
	}
	
	
	//Show All Booking

	public List<Booking> showBooking(String booking) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Booking");
		Criteria cr = session.createCriteria(Booking.class);
		List<Booking> bookingLst = query.list();
		return bookingLst;
	}
	
	// Search Booking By User ID
	
	public Booking SearchBookingId(String UserId) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Booking.class);
		cr.add(Restrictions.eq("bookingId", UserId));
		List<Booking> bookinglist = cr.list();
		return bookinglist.get(0);
	}
	

	// Seat No. search By schedule ID

	public List<Booking> seats(String a) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("From Booking where scheduleId=:s").setParameter("s", a);
		List<Booking> leavelist1 = query.list();
		return leavelist1;
	}
	
	
	
	public List<Integer> book(String id) {
		List<Booking> booking = seats(id);
		List<Integer> seat = new ArrayList<Integer>();
		List<Integer> seat2 = new ArrayList<Integer>();
		for (Booking bookings : booking) {
			System.out.println(bookings.getSeatNo());
			int a = bookings.getSeatNo();
			seat.add(a);
		}
		for (int i = 1; i <= 20; i++) {
			if (!seat.contains(i)) {
				seat2.add(i);
			}

		}
		return seat2;
	}
	
	//Show  all Bookings by user ID
	
	public List<Booking>ShowBookingOp(String UserId){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("From Booking where userId=:u").setParameter("u", UserId);
		List<Booking> leavelist2 = query.list();
		return leavelist2;	
		
	}
	
	//delete Booking by booking id
	
	 public String CancelTicets(String BookingID) {
		 sessionFactory =SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 String hql = "DELETE FROM Booking WHERE booking_id=:book";
		 Query query = session.createQuery(hql);
		 query.setParameter("book", BookingID);
		 query.executeUpdate();
		 return "Gaurav";
	 }
	 
	 
	 
	 public String BookingDelete(String BookingId) {
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Booking booking=SearchBookingId(BookingId);
		 Transaction tr=session.beginTransaction();
		 session.delete(booking);
		 tr.commit();
		 try {
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			e.getMessage();
			return "Not Canceled";
		}
		 return "delete...";
		 
	 }
	
	
	//validation User
	
	public List<User> checkUsers(String user, String psswd) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("username", user));
		cr.add(Restrictions.eq("password", psswd));
		List<User> usrLst = cr.list();
		return usrLst;
	}
	
	public User searchUserByUserId(String userId) {
		return (User) SessionHelper.getConnection().openSession().createQuery("from User where userid = :userId").setParameter("userId", userId).list().get(0);
	}
	
	 
	 public String generateWalletId(){
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 Criteria cr = session.createCriteria(Wallet.class);
		 List<Wallet> walletList = cr.list();
		 if(walletList.size()==0){
			 return "W001";
		 }
		 session.close();
		 String id = walletList.get(walletList.size()-1).getWalletId();
		 int id1 = Integer.parseInt(id.substring(1));
		 id1++;
		 String id2 = String.format("W%03d", id1);
		return id2;
		 
		}
	 
	 public Wallet searchWalletByUserId(String userId) {
		return (Wallet) SessionHelper.getConnection().openSession().createQuery("from Wallet where userId = :userId").setParameter("userId", userId).list().get(0);
	}
	 
	 public void addWallet(String userId, double amount){
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession();
			
			Wallet wallet = searchWalletByUserId(userId);
			wallet.setWalletAmount(wallet.getWalletAmount() + amount);
	
			Transaction trans = session.beginTransaction();
			session.update(wallet);
			trans.commit();
			
		}
     
	 public String updateWallet(Wallet wallet) {
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 Criteria cr = session.createCriteria(Wallet.class);
		 Transaction trans = session.beginTransaction();
		 session.update(wallet);
		 trans.commit();
		return "***...Record Updated...***";

		 
	 }
	 
	 public double wallettll(String UserId) {
		 sessionFactory =SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
//		 SELECT SUM(E.salary), E.firtName FROM Employee E
//		 String sumHql = "SELECT SUM(salary) FROM employees WHERE idemployee = 31";
//		 Query sumQuery = s.createQuery(sumHql);
//		 System.out.println(sumQuery.list().get(0));
		 Query query = session.createQuery("SELECT SUM(walletAmount) FROM Wallet where userId=:a").setParameter("a",UserId);
		 List<Double>wall=query.list();
		 try {
			return wall.get(0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			String id=e.getMessage();
			return 00.00;
		}
		 
	 }
	 
	 public double Wallet_type(String UserId) {
		 sessionFactory =SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query query = session.createQuery("SELECT SUM(walletAmount) FROM Wallet where userId =:n").setParameter("n", UserId);
		 List<Double>wall=query.list();
		 try {
			return wall.get(0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			String id=e.getMessage();
			return 00.00;
		}
	 }
	 
	
	  public List<Booking> SearchBookId(String Bookedid){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query query = session.createQuery("From Booking where bookingId=:u").setParameter("u", Bookedid);
		List<Booking> leavelist2 = query.list();
		return leavelist2;	 
	 }
	 
	 public List<Wallet>SearchWalletId(String userId,String type){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query query = session.createQuery("From Wallet where userId=" + userId);
		List<Wallet>Wallet = query.list();
		return Wallet;	
		 
	 }
	 
	  public List<Booking> Final_ticket(String Userid){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query query = session.createQuery("From Booking where userId=:u and bookingStatus='APPROVED'" ).setParameter("u", Userid);
		List<Booking> leavelist2 = query.list();
		return leavelist2;	 
	 }
	  
	  
	  public String ForgetPwd(String id,String newpass){
			 sessionFactory = SessionHelper.getConnection();
		     Session session = sessionFactory.openSession();
		     User user=SearchUserId(id);
		     String userid=user.getUserid();
		     Query q=session.createQuery("Update User SET password=:np WHERE userid =:id").setParameter("np",newpass).setParameter("id",userid);
			 Transaction trans = session.beginTransaction();
			 q.executeUpdate();
			 trans.commit();
			return "password changed";
			
		}
	 
	 
	 
	
}
