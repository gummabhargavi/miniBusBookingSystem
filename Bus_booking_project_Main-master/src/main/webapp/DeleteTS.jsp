<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

   <jsp:useBean id="dao" class="Training.BusBookingProject.TravelscheduleDAO"/>
    <c:set var ="id" value="${param.id}"/>
    <c:out value="${id}"/>
    <c:out value="${dao.deleteTs(id)}"/>
    <c:redirect url="ShowTSchedule.jsp"/>

</body>
</html>