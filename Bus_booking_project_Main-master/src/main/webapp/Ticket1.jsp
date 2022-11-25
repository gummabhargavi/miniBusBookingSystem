<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Css/bootstrap.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="js/jquery-3.5.1.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
.card{
height:100%;
width:100%;
border-color: black;
border-radius:3ex;
border: 5px solid #942519;
}
.Head{
background-color:#32CCBC;
text-align: center;
font-family:inherit;
text-decoration: underline;
font-weight: bolder;
font-size: 5ex;
color: white;

}

.city{
font-size:3ex;
text-align: left;
color: red;

}

.Date{
font-size:3ex;
text-align: center;
margin-top:-3ex;
color:red;
}
.busno{
font-size:3ex;
text-align:right;
margin-top:-3.5ex;
color: red;
}
label{
color: navy;
font-size:2.5ex;
}
button{
margin-top:5ex;
margin-left: 50%;
}
</style>
<script type="text/javascript">
  setTimeout(() => {
	  document.location.reload();
	}, 3000);

</script>
</head>
<body>
<c:set var="main" value="${param.bookingId}" scope="application"/>
<jsp:useBean id="beanDao" class="Training.BusBookingProject.UserDAO"/>
<div class="container-fluid mt-5">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
 				<table class="table table-bordered">
 					 <thead>
    					 <tr>
   		 					<th scope="col" colspan="3">
   		 						<div class="Head">
   									 Bus Ticket
   									   
   		 						</div>
   							 </th>
   						 </tr>
   						 
   						 
   						 
    					 <tr>
   							 <th scope="col" colspan="4">
   								 <div class="row">
   		 							<div class="col-sm-12">
   		 								<div class="city"><c:out value="${Tadd}"/>  TO  <c:out value="${Fadd}"/></div>
   		 								<div class="Date"><c:out value="${DDate}"/></div>
   		 								<div class="busno ">Bus No:ABCD1234</div>
   									</div>
   								 </div>
   		 
   							 </th>
    					</tr>
    					
    					
   						 <tr >
      					      <th scope="col">Passenger Name : <label class="text-capitalize"><c:out value="${pname}"/></label></th>
      					      <th scope="col">Seat Number : <label class="text-capitalize"><c:out value="${seatno}"/></label>  </th>
      					      <th scope="col">Booking ID :</th>
   						 </tr>
   						  <tr>
      					      <th scope="col">Passenger Gender : <label class="text-capitalize"><c:out value="${pgender}"/></label></th>
      					      <th scope="col" >Bus Type : <label class="text-capitalize"><c:out value="AC"/></label></th>
      					      <th scope="col" >Schedule ID : <label class="text-capitalize"><c:out value="${ss}"/></label></th>
   						 </tr>
   						 <tr>
      					      <th scope="col">Passenger Age : <label class="text-capitalize"><c:out value="${page}"/></label></th>
      					      <th scope="col">End Date : <label class="text-capitalize"><c:out value="${EDate}"/></label> </th>
      					      <th scope="col">Departure Time : <label class="text-capitalize"><c:out value="${Dtime}"/></label> </th>
   						 </tr>
   						  <tr>
      					      <th scope="col" colspan="2">Boarding Address : <label class="text-capitalize"><c:out value="${addressstrat}"/></label></th>
      					      <th scope="col">Total Amount : <label class="text-capitalize"><c:out value="${totalamt}"/></label></th>
   						 </tr>
   						 
   						 
 				  </thead>
</table>
			
			</div>
		</div>
		<button type="button" onclick="window.print();" class="btn btn-primary">Print</button>
	</div>
</div>
<c:forEach var="showBus" items="${beanDao.SearchBookId(main)}">
                 <c:set var="bdate" value="${showBus.bKdate}" scope="application"/>
                 <c:set var="pname" value="${showBus.pname}" scope="application"/>
                 <c:set var="page" value="${showBus.page}" scope="application"/>
                 <c:set var="pgender" value="${showBus.pgender}" scope="application"/>
                 <c:set var="totalamt" value="${showBus.totalAmount}" scope="application"/>
                 <c:set var="ss" value="${showBus.scheduleId}" scope="application"/>
                  <c:set var="seatno" value="${showBus.seatNo}" scope="application"/>
                   <c:set var="totalamt" value="${showBus.totalAmount}" scope="application"/>
</c:forEach>
 <jsp:useBean id="bean" class="Training.BusBookingProject.TravelscheduleDAO"/>
<c:set var="show" value="${bean.SearchTravelId(ss)}"/>
				<c:set var="addressstrat" value="${show.addressstart}" scope="application"/>
				<c:set var="Dtime" value="${show.departuretime}" scope="application"/>
				<c:set var="DDate" value="${show.scheduledate}" scope="application"/>
				<c:set var="addressend" value="${show.addressend}" scope="application"/>
				<c:set var="EDate" value="${show.estimatearrivaldate}" scope="application"/>
				<c:set var="Tadd" value="${show.startingpoint}" scope="application"/>
				<c:set var="Fadd" value="${show.destinationpoint}" scope="application"/>


</body>
</html>