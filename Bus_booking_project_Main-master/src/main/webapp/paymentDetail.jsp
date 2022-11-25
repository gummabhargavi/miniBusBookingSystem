<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="Training.BusBookingProject.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<title>Insert title here</title>
</head>
<style>
table{
margin-top: 5ex;
}
thead{
background-color:F5BDB1;
}
</style>
<body>
<c:out value="${userid}"/>
<c:if test="${param.bookingId!=null}">
	<jsp:useBean id="booked" class="Training.BusBookingProject.UserDAO"/>	
	<c:forEach var="showBook" items="${booked.SearchBookId(param.bookingId)}">
		<c:set var="tamt" value="${showBook.totalAmount}"/>
	</c:forEach>
</c:if>
<form action="" method="get" class="text-center mt-5">
	User ID:
	<input type="text" name="userId" value="${param.userid}"/><br/><br/>
	Wallet ID:
	<input type="text" name="walletId"/><br/><br/>
	Wallet Type :
	<select name="paytype">
		<option value="PHONE_PAY">Phone_pe</option>
		<option value="GOOGLE_PAY">GPay</option>
		<option value="PAYTM">Paytm</option>
	</select><br/><br/>
	Booking ID:
	<input type="text" name="bookingId" value="${param.bookingId}"/><br/><br/>
	Amount:
	<input type="number" name="amount" value="${tamt}"/><br/><br/>
	Comment :
	<textarea rows="5" cols="25"></textarea><br/><br/>
	<button type="submit" class="btn btn-primary">Pay</button>
</form>
<c:if test="${param.walletId!=null }">
<jsp:useBean id="pay" class="Training.BusBookingProject.PaymentDetail"/>
<jsp:useBean id="dao" class="Training.BusBookingProject.PaymentDAO"/>
<jsp:setProperty property="userId" name="pay"/>
<jsp:setProperty property="walletId" name="pay"/>
<jsp:setProperty property="bookingId" name="pay"/>
<jsp:setProperty property="amount" name="pay"/>
<jsp:setProperty property="paytype" name="pay"/>
<c:out value="${dao.addPayment(pay)}"/>
</c:if>



