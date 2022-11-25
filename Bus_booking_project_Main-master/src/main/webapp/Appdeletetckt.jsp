<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="paymentDAO" class="Training.BusBookingProject.PaymentDAO"/>
	<c:set var="bid" value="${param.Bookedid}"/>
	<c:out value="${param.Bookedid}"/>
	<c:out value="${paymentDAO.BookingDelete(bid)}"/>
	<c:redirect url="ApprvdTickets.jsp?userid=${param.userid}"/>

</body>
</html>