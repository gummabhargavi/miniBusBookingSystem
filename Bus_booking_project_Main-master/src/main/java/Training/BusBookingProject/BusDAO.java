package Training.BusBookingProject;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;


public class BusDAO {
	
	SessionFactory sessionFactory;
	
	public List<Bus> showBus(String bus){
		sessionFactory = SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		Query query = session.createQuery("from Bus");
		Criteria cr = session.createCriteria(Bus.class);
		List<Bus> busList=query.list();
		return busList;
		
	}
	
	public List<Refund> showRefund(){
		sessionFactory = SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		Query query = session.createQuery("from Refund");
		Criteria cr = session.createCriteria(Refund.class);
		List<Refund> refundList=query.list();
		return refundList;
		
	}
	
	public String generateBusId(){
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 Criteria cr = session.createCriteria(Bus.class);
		 List<Bus> busList = cr.list();
		 if(busList.size()==0){
			 return "B001";
		 }
		 session.close();
		 String id = busList.get(busList.size()-1).getBusId();
		 int id1 = Integer.parseInt(id.substring(1));
		 id1++;
		 String id2 = String.format("B%03d", id1);
		return id2;
		 
		}
   
	public String addBus(Bus bus){
		String busId=generateBusId();
		bus.setBusId(busId);
		bus.setBusstatus(Bus_Status.AVAILABLE);
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Bus.class);
		Transaction trans = session.beginTransaction();
		session.save(bus);
		trans.commit();
		return "Bus Added Successfully...";
		
	}
	
	
	
	public java.sql.Date ConvertDate(String dt) throws ParseException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date d1 =  sdf.parse(dt);
		return new java.sql.Date(d1.getTime()) ;
		
	}
	
	public String addRefund(Refund refund){
//		String refundId= generateRefundId();
//		refund.setRefundId(refundId);
		refund.setRefundStatus(RefundStatus.PENDING);
		java.sql.Date sqlDate=new java.sql.Date(refund.getRefundDate().getTime());
		refund.setRefundDate(sqlDate);
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Refund.class);
		Transaction trans = session.beginTransaction();
		session.save(refund);
		trans.commit();
		return "Refund Added Successfully...";
	}
	
	public List<Bus_Status>showAvailable(){
		sessionFactory=SessionHelper.getConnection();
		Session session;
		session=sessionFactory.openSession();
		Criteria cr=session.createCriteria(Bus.class);
		cr.add(Restrictions.eq("busstatus",Bus_Status.AVAILABLE));
		Projection projection = Projections.property("busId");
		cr.setProjection(projection); 
		List<Bus_Status>list = cr.list();
		return list;
	}
	
	
		public String generateDriverId() {
			sessionFactory=SessionHelper.getConnection();
			Session session=sessionFactory.openSession();
			Criteria cr=session.createCriteria(DriverDetails.class);
			List<DriverDetails> driverdetails =cr.list();
			session.close();

			if(driverdetails.size()==0) {
				return "D001";
			}
			else {
				String id = driverdetails.get(driverdetails.size()-1).getDriver_id();
					int id1 = Integer.parseInt(id.substring(1));
					id1++;
					String id2 = String.format("D%03d", id1);
					return id2;
				}
			}

			public String addDriver(DriverDetails driver) {
				driver.setDriverstatus(DriverStatus.AVAILABLE);
				sessionFactory = SessionHelper.getConnection();
				Session session = sessionFactory.openSession();
				String DriverId=generateDriverId();
				driver.setDriver_id(DriverId);
				Criteria cr = session.createCriteria(DriverDetails.class);
				Transaction tran = session.beginTransaction();
				session.save(driver);
				tran.commit();
				return "Details Added   ";
	
	
			}
		
			public List<DriverStatus>showDriverAvailable(){
				sessionFactory=SessionHelper.getConnection();
				Session session;
				session=sessionFactory.openSession();
				Criteria cr=session.createCriteria(DriverDetails.class);
				cr.add(Restrictions.eq("driverstatus",DriverStatus.AVAILABLE));
				Projection projection = Projections.property("driver_id");
				cr.setProjection(projection); 
				List<DriverStatus> list = cr.list();
				return list;
			}
			
			public Bus SearchBusId(String BusId) {
				sessionFactory=SessionHelper.getConnection();
				Session session=sessionFactory.openSession();
				Criteria cr = session.createCriteria(Bus.class);
				cr.add(Restrictions.eq("busId",BusId));
				List<Bus>buslist = cr.list();
				return buslist.get(0);
			}
			
			public String updateBus(Bus bus) {
				 sessionFactory = SessionHelper.getConnection();
				 Session session = sessionFactory.openSession();
				 Criteria cr = session.createCriteria(Bus.class);
				 Transaction trans = session.beginTransaction();
				 session.update(bus);
				 trans.commit();
				return "Record Updated";

				 
			 }
			
			 public String deleteBus(String busId) {
				 sessionFactory = SessionHelper.getConnection();
				 Session session = sessionFactory.openSession();
				 Bus bus=SearchBusId(busId);
				 Transaction t = session.beginTransaction();
				 try {
					 session.delete(bus);
					 t.commit();
					return "Record delete";
				} catch (Exception e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
					return ("Not Delete ."+e.getMessage());
					
					
				}
				
	 }
				//ShowDriver		
			 
	            public List<DriverDetails> show(){
		    	sessionFactory=SessionHelper.getConnection();
				Session session=sessionFactory.openSession();
				Criteria cr=session.createCriteria(DriverDetails.class);
				List<DriverDetails> driverlist = cr.list();
				return driverlist;
	            }
//updateDriver
	            
	            public String updateDriver(DriverDetails driver){
	            sessionFactory = SessionHelper.getConnection();
	            Session session = sessionFactory.openSession();
	            Transaction tran = session.beginTransaction();
	            session.update(driver);
	            tran.commit();
	            return "Details updated Successsfully  ";
	            }
	            
	          //deleteDriver		
	            public String deleteDriver(String DiverID) {
	   			 sessionFactory = SessionHelper.getConnection();
	   			 Session session = sessionFactory.openSession();
	   			 DriverDetails driver=SearchDiverId(DiverID);
	   			 Transaction t = session.beginTransaction();
	   			 
	   		try {
	   			session.delete(driver);
	   			 t.commit();
	   			 return "Deleted Sucessfully  ";
	            
	            }catch(Exception e) {
	            	e.printStackTrace();
	            	return ("Record NOt Delete. "+e.getMessage());
	            }
	   		
	  
	   			
	   		}
	            public DriverDetails SearchDiverId(String DriverID) {
	        		sessionFactory=SessionHelper.getConnection();
	        		Session session=sessionFactory.openSession();
	        		Criteria cr = session.createCriteria(DriverDetails.class);
	        		cr.add(Restrictions.eq("driver_id",DriverID));
	        		List<DriverDetails> DriverList = cr.list();
	        		return DriverList.get(0);
	        	}

}
