<%@page import="Training.BusBookingProject.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<title>Insert title here</title>
<script type="text/javascript">
	function fun() {
		confirm("Are you sure to Cancel the Ticket");
		$("#error").html("**Successfull**");  
	
	}

</script>
</head>
<body>
<h1 style="text-align: center; font-family: cursive;color: gray; text-decoration:underline;">Booked Ticket's</h1>
<div id="error" style="color:red; text-align: center; font-weight: bolder;"></div>
<c:set value="${param.userid}" var="uu"/>
<table class="table">
  <thead class="thead-dark">
    <tr>
   	  <th scope="col">Seat No.</th>
     <th scope="col">Booking Date</th>
      <th scope="col">Passenger Name</th>
      <th scope="col">Passenger Age</th>
      <th scope="col">Passenger Gender</th>
      <th scope="col">Amount</th>
      <th scope="col">Cancel</th>
      <th scope="col">Ticket Download</th>
    </tr>
  </thead>
  <tbody>
    <c:if test="${param.userid!= null}" >
    <jsp:useBean id="UserDAO" class="Training.BusBookingProject.UserDAO"/>
     <c:forEach var="showBus" items="${UserDAO.Final_ticket(uu)}" >
    <tr>
    			
          <td><h4><c:out value="${showBus.seatNo}"/></h4></td>
          <td><c:out value="${showBus.bKdate}"/></td>
          <td><c:out value="${showBus.pname}"/></td>
          <td><c:out value="${showBus.page}"/></td>
          <td><c:out value="${showBus.pgender}"/></td>
          <td><c:out value="${showBus.totalAmount}"/></td>
        	 <td>
   			<a href="Appdeletetckt.jsp?Bookedid=${showBus.bookingId}&userid=${param.userid}" onclick="fun()"><button class="btn btn-danger">Cancel</button></a>  
		</td>
		 <td>
		<a href="Ticket1.jsp?bookingId=${showBus.bookingId}"><button class="btn btn-success">Download</button></a>
		</td>
		<!-- <button onclick="window.print();">Print me</button> -->
    </tr>
    </c:forEach>
      </c:if>
  </tbody>
</table>
</body>
</html>