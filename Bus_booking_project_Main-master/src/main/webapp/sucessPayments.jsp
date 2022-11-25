<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>
<body>

<form action="showPayment.jsp" method="get">
<jsp:useBean id="dao" class="Training.BusBookingProject.PaymentDAO"/>
	<table border="3" align="center">
	<tr>
		<th>Payment ID</th>
		<th>User ID</th>
		<th>Wallet ID</th>
		<th>Booking ID</th>
		<th>Amount</th>
		<th>Payment Date</th>
		<th>Payment Type</th>
		<th>Payment_Status</th>
	</tr>	
	<c:forEach var="show" items="${dao.showPaymentSucessFull()}">
	<tr>
	<td><c:out value="${show.paymentId}"/></td>
		<td><c:out value="${show.userId}"/></td>
			<td><c:out value="${show.walletId}"/></td>
			<td><c:out value="${show.bookingId}"/></td>
			<td><c:out value="${show.amount}"/></td>
		    <td><c:out value="${show.paydate}"/></td>
			<td><c:out value="${show.paytype}"/></td>
			<td><c:out value="${show.paymentStatus}"/></td>
	</c:forEach>
	</table>

</form>

</body>
</html>