<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>
<style>
thead{
background-color:F5BDB1;
}
</style>

<body>
     <form method="get" action="ShowBus.jsp">
        <jsp:useBean id="beanDao" class="Training.BusBookingProject.BusDAO"/>
          <div class="heading">
          <h1 class="text-center">Show All Bus's</h1>  
      		<a href="AddBus.jsp"><button type="button" class="btn btn-success m-3">Add Bus</button></a>
      		<h6 class="text-danger text-center">** Booked Bus Not Deleted </h6> 
          </div>
          
               
         <table border="3" align="center" class="table-hover w-75 text-center">
         <thead class="thead-dark">
            <tr>
              <th>BusId</th>
              <th>BusNo</th>
              <th>BusType</th>
              <th>ServiesType</th>
              <th>NoOf Seats</th>
              <th>Status</th>
              <th>Update</th>
              <th>Delete</th>
            </tr>
            </thead>
           <c:forEach var="showBus" items="${beanDao.showBus(bus)}" >
              <tr>
                 <td><c:out value="${showBus.busId}"/></td>
                 <td><c:out value="${showBus.busNo}"/></td>
                 <td><c:out value="${showBus.busType}"/></td>
                 <td><c:out value="${showBus.serviesType}"/></td>
                 <td><c:out value="${showBus.noOfSeats}"/></td>
                 <c:if test="${showBus.busstatus=='BOOKED'}">
                 	<td class="text-danger font-weight-bold text-center"><c:out value="${showBus.busstatus}"/></td>
                 
                 
                 </c:if>
                 <c:if test="${showBus.busstatus!='BOOKED'}">
                 	<td class="text-success font-weight-bold text-center"><c:out value="${showBus.busstatus}"/></td>
                 </c:if>
                 <td><a href="UpdateBus.jsp?bsid=${showBus.busId}&status=${showBus.busstatus}"><button class="btn btn-success" type="button">Update</button></a></td>             
                 <td class="text-danger font-weight-bold text-center"><a href="BusDelete.jsp?id=${showBus.busId}"><button class="btn btn-danger" type="button">Delete</button></a></td>
              </tr>
           </c:forEach>   
         </table>
     
         
           
           
          
   
     </form>
</body>
</html>