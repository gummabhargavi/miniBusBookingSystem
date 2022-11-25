package Training.BusBookingProject;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class PaymentDAO {
SessionFactory sessionFactory;
Session session;
	
	public String paymentId() {
		sessionFactory=SessionHelper.getConnection();
		Session session;
		session=sessionFactory.openSession();
		Criteria cr=session.createCriteria(PaymentDetail.class);
		List<PaymentDetail> plst=cr.list();
		if (plst.size()==0) {
			return "P001";
		}
		String ScheduleIds=plst.get(plst.size() - 1).getPaymentId();
		int ids = Integer.parseInt(ScheduleIds.substring(1));
		String bid=String.format("P%03d",++ids);
		return bid;
		}
	
	 public double walletAmount(String UserId) {
		 sessionFactory =SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query query = session.createQuery("SELECT SUM(walletAmount) FROM Wallet where userId=:a").setParameter("a",UserId);
		 List<Double>wall=query.list();
		return wall.get(0);
	 }
	
	public String addPayment(PaymentDetail paymentDetail){
		 	UserDAO udao=new UserDAO();
		 	Wallet wallet = udao.searchWalletByUserId(paymentDetail.getUserId());
		 	
		 	double bamt=paymentDetail.getAmount();
		 	double amount = wallet.getWalletAmount();
		 	
		 	
		 	if(bamt >= amount) {
		 		return"not pay";
		 		
		 	}else {
				paymentDetail.setPaymentId(paymentId());
				paymentDetail.setPaymentStatus(PaymentStatus.SUCCESSFULL);
				
				sessionFactory=SessionHelper.getConnection();
				session=sessionFactory.openSession();
				Transaction tr = session.beginTransaction();
				session.save(paymentDetail);
				tr.commit();
				session.close();
				
				session=sessionFactory.openSession();
				UserDAO dao=new UserDAO();
				Booking booking=dao.SearchBookingId(paymentDetail.getBookingId());
				
				tr = session.beginTransaction();
				booking.setBookingStatus(BookingStatus.APPROVED);
				session.saveOrUpdate(booking);
				tr.commit();
				session.close();
				
				
				session=sessionFactory.openSession();
				
				wallet.setWalletAmount(amount - bamt);
				
				Transaction trans = session.beginTransaction();
				session.update(wallet);
				trans.commit();		
				return "Payment Details Added";
		 	}
	 }
	
	
	public Date convertDate(String strDate) throws ParseException{
		java.util.Date test = new SimpleDateFormat("yyyy-MM-dd").parse(strDate);
		java.sql.Date sqlDate=new java.sql.Date(test.getTime());
		return sqlDate;
	   }
	
	public PaymentDetail SearchPayment(String bookingid ){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Criteria cr = session.createCriteria(PaymentDetail.class);
			cr.add(Restrictions.eq("bookingId", bookingid));
			List<PaymentDetail> paydtel = cr.list();
			return paydtel.get(0);
		}
	
	
	 public String BookingDelete(String BookingId) {
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 UserDAO udao=new UserDAO();
		 Booking booking=udao.SearchBookingId(BookingId);
		 PaymentDetail paysearchid=SearchPayment(BookingId);
		 
		 if(paysearchid.getPaymentStatus()==PaymentStatus.SUCCESSFULL) {
		 	Refund refund=new Refund();
		 	refund.setPaymentId(paysearchid.getPaymentId());
		 	refund.setAmount(paysearchid.getAmount());
		 	refund.setRefundStatus(RefundStatus.PENDING);
		 	refund.setUserId(paysearchid.getUserId());
		 	refund.setWalletId(paysearchid.getWalletId());
		 	Criteria cr = session.createCriteria(Refund.class);
		 	Transaction trns=session.beginTransaction();
		 	session.save(refund);
		 	trns.commit(); 	
		 	
		 	Transaction tr=session.beginTransaction();
			paysearchid.setPaymentStatus(PaymentStatus.REFUNDED);;
			session.update(paysearchid);
			tr.commit();
		 	
		}
			 Transaction tr=session.beginTransaction();
			 booking.setBookingStatus(BookingStatus.CANCELLED);
			 session.update(booking);
			 tr.commit();
			 return "delete...";
		 
	 }
	 public List<PaymentDetail> showPayment(){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query q = session.createQuery("from PaymentDetail");
		 Criteria cr = session.createCriteria(PaymentDetail.class);
		 List<PaymentDetail> pmtLst = q.list();
		 return pmtLst;
	 }
	 public List<PaymentDetail> showPaymentSucessFull(){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query q = session.createQuery("from PaymentDetail where paymentStatus='SUCCESSFULL'");
		 Criteria cr = session.createCriteria(PaymentDetail.class);
		 List<PaymentDetail> pmtLst = q.list();
		 return pmtLst;
	 }
	 
	 public List<Refund>userrefund(String userid){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query q = session.createQuery("from Refund where userId=:n").setParameter("n", userid);
		 Criteria cr = session.createCriteria(PaymentDetail.class);
		 List<Refund> refundLst = q.list();
		 return refundLst;
	 }
	 
	 public Refund refundidsearch(int refundid){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query q = session.createQuery("from Refund where refundId=:n").setParameter("n", refundid);
		 List<Refund> refundLst = q.list();
		 return refundLst.get(0);
	 }
	 
	 
	 public PaymentDetail paysearchwalletid(String Walletid) {
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query q = session.createQuery("from PaymentDetail where walletId= :n").setParameter("n", Walletid);
		 List<PaymentDetail> payLst = q.list();
		 return payLst.get(0);
	 }
	 
     public void Approvedrefund(int refundid) {
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 
		 Refund refund = refundidsearch(refundid);
		 
		 java.util.Date date=new java.util.Date();
		 java.sql.Date sqlDate=new java.sql.Date(date.getTime());
		 refund.setRefundDate(sqlDate);
		 
		 refund.setRefundStatus(RefundStatus.SUCCESSFULL);
		 
		 session.update(refund);
		 session.beginTransaction().commit();
		 session.close();
		 
		 
		 PaymentDetail paydetail = paysearchwalletid(refund.getWalletId());
		 paydetail.setPaymentStatus(PaymentStatus.REFUNDED);
		 
		 session=sessionFactory.openSession();
		 session.update(paydetail);
		 session.beginTransaction().commit();
		 session.close();
		 
		 
		 Wallet wallet = new UserDAO().searchWalletByUserId(paydetail.getUserId());
		 wallet.setWalletAmount(wallet.getWalletAmount() + paydetail.getAmount());
		 
		 session=sessionFactory.openSession();
		 session.update(wallet);
		 session.beginTransaction().commit();
	 }
	
}
