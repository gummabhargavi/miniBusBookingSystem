<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>
<style>
thead{
background-color:F5BDB1;
}
</style>

<body>
    <form method="get" action="ShowDriver.jsp">
      <jsp:useBean id="beanDao" class="Training.BusBookingProject.BusDAO"/>
          <div class="heading">
           <h1 class="text-center">Show All Driver's</h1>  
          <h6 class="text-danger text-center">** Booked Driver Not Deleted </h6> 
      		<a href="AddDriver.jsp"><button class="btn btn-success m-5" type="button">Add Driver</button></a>
          </div>
      
      <table border="3" align="center" class="table text-center w-75">
      <thead>
        <tr>
          <th>DriverId</th>
          <th>DriverName</th>
          <th>DriverLicNo</th>
          <th>ContactNo</th>
          <th>UpdateDriver</th>
          <th>DeleteDriver</th>
          </tr>
        </thead> 
         <c:forEach var="showDriver" items="${beanDao.show()}">
           <tr>
             <td><c:out value="${showDriver.driver_id}"/></td>
             <td><c:out value="${showDriver.driver_name}"/></td>
             <td><c:out value="${showDriver.driver_lic_no}"/></td>
            
            
            
            <c:if test="${showDriver.driverstatus=='BOOKED'}">
            	<td class="text-danger font-weight-bold text-center"><c:out  value="${showDriver.driverstatus}"/></td>
            </c:if>
            <c:if test="${showDriver.driverstatus!='BOOKED'}">
            <td class="text-success font-weight-bold text-center"><c:out  value="${showDriver.driverstatus}"/></td>
            
            </c:if>
            
            
            
           
            
             <td><a href="UpdateDriver.jsp" ><button class="btn btn-success" type="button">Update</button></a></td>
             <td><a href="DeleteDriver_2.jsp?id=${showDriver.driver_id}"><button class="btn btn-danger" type="button">delete</button></a></td>
          
            <tr> 
         
         </c:forEach>  
      </table>
    </form>
</body>
</html>