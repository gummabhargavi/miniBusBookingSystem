<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bean" class="Training.BusBookingProject.TravelscheduleDAO"/>
<c:set var="show" value="${bean.SearchTravelId('S001')}"/>
                 <td><c:out value="${show.addressstart}"/></td>

</body>
</html>