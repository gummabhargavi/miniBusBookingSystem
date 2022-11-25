<%@page import="Training.BusBookingProject.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<title>Insert title here</title>
</head>
<body>
<center>
<c:set var="userId" value="${userid}" />
<jsp:useBean id="beanwalt" class="Training.BusBookingProject.UserDAO"/>

	<h2> Total : <c:out value="${beanwalt.wallettll(userId)}"/></h2><br/><br/>
         
 	<%-- <h2> 	Total phonepe : <c:out value="${beanwalt.Wallet_type(userid,'PHONE_PAY')}"/></h2><br/><br/>
 	<h2> 	Total GOOGLE_PAY : <c:out value="${beanwalt.Wallet_type(userid,'GOOGLE_PAY')}"/></h2><br/><br/> --%>
 		
 		
 		<button><a href="UserWallet.jsp?id=${userId}">Add</a></button>
</center>
</body>
</html>