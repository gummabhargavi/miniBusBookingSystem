<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>

<body>
       <h1>Driver Details</h1>
     <form method="get" action="UpdateDriver.jsp">
         Driver Id :
            <input type="text" name="driver_id"/> <br/><br/> 
         Driver Name :
            <input type="text" name="driver_name"/> <br/><br/> 
         Driver lic no :
            <input type="text" name="driver_lic_no"/> <br/><br/>   
         Contact No :
           	<input type="number" name="contact_no"/> <br/><br/>  
		 <input type="submit" value="Update Driver"/>  
				
     </form>
     <c:if test="${param.driver_id!=null}">
      <jsp:useBean id="beanDao" class="Training.BusBookingProject.BusDAO"/>
      <jsp:useBean id="driver" class="Training.BusBookingProject.DriverDetails"/>
      <jsp:setProperty property="*" name="driver"/>
      <c:out value="${beanDao.updateDriver(driver)}"/>
     </c:if>
     <a href="ShowDriver.jsp">ShowDriver</a>
</body>
</html>