<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>User Change Password</title>
</head>
<body>
<jsp:include page="UserHeader.jsp"/>

     <form action="" method="" class="text-center">
				<div class="col-30">
					<label for="text">User ID :</label>
				</div>
				<div class="col-80">
					<input type="text" name="username"/><br/><br/>
				</div>
				<div class="col-30">
					<label for="text">New Password :</label>
				</div>
				<div class="col-80">
					<input type="text" name="newpass"/><br/><br/>
				</div>
		<input type="submit" value="ForgetPassword"/><br/><br/>
		</form>
		<c:if test="${param.username!= null}">
		<c:set var="username" value="${param.username}"/>
		<c:set var="newpss" value="${param.newpass}"/>
		<jsp:useBean id="userdao" class="Training.BusBookingProject.UserDAO"/>
		<c:out value="${userdao.ForgetPwd(username,newpss)}"/>
       </c:if>
      

    </body>
</html>
