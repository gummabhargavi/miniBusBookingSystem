<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
     <form action="ForgetPassword.jsp" method="post">
    <div class="row">
				<div class="col-30">
					<label for="forgetpassword">User Name :</label>
				</div>
				<div class="col-80">
					<input type="text" name="username" size="30"/><br/><br/>
				</div>
				<div class="col-30">
					<label for="forgetpassword">ForgetPassword :</label>
				</div>
				<div class="col-80">
					<input type="number" name="newpass" size="30"/><br/><br/>
				</div>
		<input type="submit" value="ForgetPassword"/> <br/><br/>
	</div>
		</form>
		<c:if test="${param.username!= null}">
		<c:set var="username" value="${param.username}"/>
		<c:set var="newpss" value="${param.newpass}"/>
		<jsp:useBean id="beandao" class="Training.BusBookingProject.AdminDAO"/>
		<c:out value="${beandao.ForgetPwd(username,newpss)}"/>


       </c:if>
      

    </body>
</html>
