<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>
<style>
thead{
background-color:F5BDB1;
}
</style>
<body>
   <form method="get" action="ShowTSchedule.jsp">
        <jsp:useBean id="beanDao" class="Training.BusBookingProject.TravelscheduleDAO"/>
          <div class="heading">
           <h1 class="text-center">Show All TravelSchedule</h1>   
             <h6 class="text-danger text-center">**Someitems Not Delete, So it's Running the Travel </h6> 
      		<a href="TravelScheduleAI.jsp"><button class="btn btn-success m-5" type="button">Add</button></a>
          </div>
          
               
         <table border="3" align="center" class="table-bordered table-hover w-100 h-50">
         <thead class="text-capitalize text-center">
            <tr>
              <th> Schedule Id </th>
              <th> Bus Id </th>
              <th>Driver Id</th>
              <th>Starting Point</th>
              <th>Destination Point</th>
              <th>Schedule Date</th>
              <th>Departure Time</th>
              <th>Estimatearrival Date</th>
              <th>Estimatearrival Time</th>
              <th>Fare Amount</th>
              <th>Remark</th>
              <th>Update</th>
              <th>Delete</th>
            </tr>
          </thead>  
           <c:forEach var="showBus" items="${beanDao.showTSchedule(ts)}" >
              <tr>
                 <td><c:out value="${showBus.scheduleid}"/></td>
                 <td><c:out value="${showBus.busid}"/></td>
                 <td><c:out value="${showBus.driverid}"/></td>
                 <td><c:out value="${showBus.startingpoint}"/></td>
                 <td><c:out value="${showBus.destinationpoint}"/></td>
                 <td><c:out value="${showBus.scheduledate}"/></td>
                 <td><c:out value="${showBus.departuretime}"/></td>
                 <td><c:out value="${showBus.estimatearrivaldate}"/></td>
                 <td><c:out value="${showBus.estimatearrivaltime}"/></td>
                 <td><c:out value="${showBus.fareamount}"/></td>
                 <td><c:out value="${showBus.remark}"/></td>
                 <td><button class="btn btn-success" type="button">Update</button></td>
                 <td><a href="DeleteTS.jsp?id=${showBus.scheduleid}"><button class="btn btn-danger" type="button">Delete</button></a></td>
              </tr>
           </c:forEach>   
         </table>
     
         
           
           
          
   
     </form>

</body>
</html>