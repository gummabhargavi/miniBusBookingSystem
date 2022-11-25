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
<jsp:useBean id="UserDAO" class="Training.BusBookingProject.UserDAO"/>
<c:out value="${param.userid}"/>
<c:out value="${param.bookingId}"/>
<c:set var="userid" value="${param.userid}"/>
<c:set var="bid" value="${param.bookingId}"/>
<c:out value="${UserDAO.BookingDelete(bid)}"/>
<c:redirect url="ShowTickets.jsp?id=${userid}"/>
</body>
</html>