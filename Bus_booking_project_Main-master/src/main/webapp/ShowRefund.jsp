<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>
<style>
table{
margin-top: 5ex;
}
thead{
background-color:F5BDB1;
}
</style>
<body>
<h1 class="text-center">Show All Refunds</h1>  
      <jsp:useBean id="beanDao" class="Training.BusBookingProject.BusDAO"/>
      <table border="3" align="center">
      <thead>
        <tr>
          <th>RefundId</th>
          <th>PaymentId</th>
          <th>UserId</th>
          <th>WalletId</th>
          <th>Amount</th>
          <th>RefundDate</th>
          <th>RefundStatus</th>
          <th>Approved</th>
         </tr>
       </thead>  
         <c:forEach var="showRefund" items="${beanDao.showRefund()}">
           <tr>
             <td><c:out value="${showRefund.refundId}"/></td>
             <td><c:out value="${showRefund.paymentId}"/></td>
             <td><c:out value="${showRefund.userId}"/></td>
             <td><c:out value="${showRefund.walletId}"/></td>
             <td><c:out value="${showRefund.amount}"/></td>
             <td><c:out value="${showRefund.refundDate}"/></td>
             <td>
             <c:if test="${showRefund.refundStatus!='SUCCESSFULL'}">
             	<h5 class="text-danger font-weight-bold"><c:out value="${showRefund.refundStatus}"/></h5>
             </c:if>
             <c:if test="${showRefund.refundStatus=='SUCCESSFULL'}">
             	<h5 class="text-success font-weight-bold"><c:out value="${showRefund.refundStatus}"/></h5>
             </c:if>
             </td>
             <td>
             <c:if test="${showRefund.refundStatus!='SUCCESSFULL'}">
             		<a href="refundapp.jsp?refundid=${showRefund.refundId}"><button class="btn btn-success" type="button">Approved</button></a>
             </c:if>	
             </td>
            <tr> 
         </c:forEach>  
      </table>




</body>
</html>