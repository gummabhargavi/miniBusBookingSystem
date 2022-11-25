<%@page import="Training.BusBookingProject.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<title>Insert title here</title>
</head>
<body>
<c:out value="${userid}"/>
<h1 style="text-align: center; font-family: cursive;color: gray; text-decoration:underline;">Wallet</h1>
 <div class="container-fluid text-center"> 
 	<div class="row">
 		<div class="col-12">
 		<form>
          
        Wallet Amount :
          <input type="number" name="walletAmount"/> <br/><br/> 
       User Id :
          <input type="text" name="userId" value="${param.id}"/> <br/><br/>
          <input type="submit" value="Add Wallet"/> <br/><br/>
     
     </form>
     <c:if test="${param.walletAmount!=null}">
           <jsp:useBean id="bean" class="Training.BusBookingProject.UserDAO"/>
           <c:set var="amount" value="${param.walletAmount}"/>
           <c:set var="user" value="${param.userId}"/>
           ${bean.addWallet(user, amount)}
           <c:redirect url="ShowWallet.jsp?userid=${user}"/>
          </c:if>
  
 		</div>
	
 		
 	</div>
 </div>
 
 
</body>
</html>