<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>
<script type="text/javascript">
var setInterval_ID = setInterval(my_alert_func, 2000);

function my_alert_func()
{
	document.getElementById("error").innerHTML=null;
	
}

</script>
<body>
       <h1 class="text-center m-3">Bus Details</h1>
       
     <form method="get" action="UpdateBus.jsp" class="text-center">
         Bus Id :
            <input type="text" name="busId" value="${param.bsid}"/> <br/><br/> 
         Bus No :
            <input type="text" name="busNo"/> <br/><br/>  
         Bus Type :
            <select name="busType">
						<option value="AC">AC</option>
						<option value="SLEEPER">SLEEPER</option>
						<option value="SEATER">SEATER</option>
						<option value="NON_AC">NON_AC</option>  
					</select>  <br/><br/> 
		Bus Services :
		    <select name="serviesType">
		       <option value="REGULAR">REGULAR</option>
		       <option value="WEEKEND">WEEKEND</option>
		       <option value="ALTERNATE_DAYS">ALTERNATE_DAYS</option>
		       <option value="EVENT">EVENT</option>   
		    </select>  <br/><br/> 
		NoOf Seats :
		 <input type="number" name="noOfSeats"/> <br/><br/>  
		 Status : 
		 <input type="text" name="busstatus" readonly="readonly" value="${param.status}"/> <br/><br/>  
		 <button  type="submit" class="btn btn-primary">Update Bus</button>
				
     </form>
     <c:if test="${param.busNo!=null}">
      <jsp:useBean id="beanDao" class="Training.BusBookingProject.BusDAO"/>
      <jsp:useBean id="bus" class="Training.BusBookingProject.Bus"/>
      <jsp:setProperty property="*" name="bus"/>
      <h2 class="text-danger text-center w-100 " id="error" ><c:out value="${beanDao.updateBus(bus)}"/></h2>
     </c:if>
     
</body>
</html>