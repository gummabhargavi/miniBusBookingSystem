<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>
<body>
      <h1 class="text-center m-3">User Details</h1>
     <form method="get" action="UpdateUser.jsp" class="text text-center">
         User Id :
            <input type="text" name="userid" value="${param.id}"/> <br/><br/> 
         Full Name :
            <input type="text" name="fullname"/> <br/><br/> 
         ContactNo :
            <input type="text" name="contactno"/> <br/><br/>   
         EmailAddress :
           	<input type="email" name="emailaddress"/> <br/><br/>
         username :
           	<input type="text" name="username"/> <br/><br/>
          password :
           	<input type="number" name="password"/> <br/><br/> 	  	  
		 <button type="button" class="btn btn-primary">Update</button><br/><br/>
				
     </form>
     <c:if test="${param.userid!=null}">
      <jsp:useBean id="beanDao" class="Training.BusBookingProject.UserDAO"/>
      <jsp:useBean id="user" class="Training.BusBookingProject.User"/>
      <jsp:setProperty property="*" name="user"/>
      <c:out value="${beanDao.updateUser(user)}"/>
     </c:if>
     

</body>
</html>