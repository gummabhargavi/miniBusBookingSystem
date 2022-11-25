<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table class="table" border="3">
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
    <jsp:useBean id="UserDAO" class="Training.BusBookingProject.UserDAO"/>
     <c:forEach var="showBus" items="${UserDAO.ShowBookingOp('U001')}" >
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
                 <c:if test="${showBus.bookingStatus != 'APPROVED'}">
                	<button class="btn btn-success">Payment</button>
                 </c:if>
                 <c:if test="${showBus.bookingStatus=='APPROVED'}">
                	<button class="btn btn-success">Download</button>
                 </c:if>
                 </td>
               	 <td>
          			<button class="btn btn-danger">Cancel</button>
      			</td>
    </tr>
    </c:forEach>
  </tbody>
</table>


</body>
</html>