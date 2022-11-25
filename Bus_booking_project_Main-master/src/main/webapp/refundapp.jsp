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
	<c:set var="id" value="${param.refundid}"/>
	<jsp:useBean id="bean" class="Training.BusBookingProject.PaymentDAO"/>
	${bean.Approvedrefund(id)}
	<c:redirect url="Showrefund.jsp"/>
</body>
</html>