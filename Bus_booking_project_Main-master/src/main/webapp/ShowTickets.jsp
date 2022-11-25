<%@page import="Training.BusBookingProject.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<title>Insert title here</title>
</head>
<body>
<c:set value="${param.id}" var="uu"/>
<h1 style="text-align: center; font-family: cursive;color: gray; text-decoration:underline;">Ticket's Process</h1>
<a href="showalltravel.jsp?userid=${uu}"><button class="btn btn-success align-content-center">Add member</button></a>
<table class="table">
  <thead class="thead-dark">
    <tr>
   	  <th scope="col">Schedule ID</th>
      <th scope="col">Seat No.</th>
      <th scope="col">Fare Amount</th>
      <th scope="col">Total Amount</th>
      <th scope="col">Passenger Name</th>
      <th scope="col">Passenger Age</th>
      <th scope="col">Passenger Gender</th>
       <th scope="col">Status</th>
      <th scope="col">Payment</th>
      <th scope="col">Cancel</th>
    </tr>
  </thead>
  <tbody>
    <c:if test="${param.id!= null}" >
    <jsp:useBean id="UserDAO" class="Training.BusBookingProject.UserDAO"/>
     <c:forEach var="showBus" items="${UserDAO.ShowBookingOp(uu)}" >
    <tr>
    			
    			 <td><c:out value="${showBus.scheduleId}"/></td>
                 <td><c:out value="${showBus.seatNo}"/></td>
                 <td><c:out value="${showBus.fareAmount}"/></td>
                 <td><c:out value="${showBus.totalAmount}"/></td>
                 <td><c:out value="${showBus.pname}"/></td>
                 <td><c:out value="${showBus.page}"/></td>
                 <td><c:out value="${showBus.pgender}"/></td>
                 <td><c:out value="${showBus.bookingStatus}"/></td>
                 
                 <td>
                 <c:if test="${showBus.bookingStatus != 'APPROVED' && showBus.bookingStatus!='CANCELLED'}">
                	 <a href="paymentDetail.jsp?bookingId=${showBus.bookingId}&userid=${param.id}&amt=${showBus.totalAmount}"><button class="btn btn-success">Payment</button></a>
                 </c:if>
                 
                 </td>
               	 <td>
          			<a href="clnt.jsp?bookingId=${showBus.bookingId}&userid=${param.id}"><button class="btn btn-danger">Cancel</button></a>  
      			</td>
    </tr>
    </c:forEach>
      </c:if>
  </tbody>
</table>

</body>
</html>