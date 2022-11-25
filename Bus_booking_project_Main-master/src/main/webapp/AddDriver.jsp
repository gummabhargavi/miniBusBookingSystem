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
<jsp:useBean id="beanDao" class="Training.BusBookingProject.BusDAO"/>
<form method="get" action="" class="text mt-5">
<center>
		Enter Name :
		<input type="text" name ="driver_name"/><br/><br/>
		Enter Lic-no :
		<input type="text" name ="driver_lic_no"/><br/><br/>
		Enter contact-no :
		<input type="number" name ="contact_no"/><br/><br/>
		<button type="button" class="btn btn-primary">Insert</button><br/><br/>
	</center>
	
<c:if test="${param.driver_name!= null && param.driver_lic_no != null}" >
	<jsp:useBean id="beanDriverDetailsDAO" class="Training.BusBookingProject.BusDAO" />
	<jsp:useBean id="beanDriverDetails" class="Training.BusBookingProject.DriverDetails" />
	<jsp:setProperty property="*" name="beanDriverDetails" />
	<h4 class="text text-danger text-center" id="error"><c:out value="${beanDriverDetailsDAO.addDriver(beanDriverDetails)}"/></h4>
</c:if>
</form>
</body>
</html>