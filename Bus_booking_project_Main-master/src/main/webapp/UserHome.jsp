<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="UserHeader.jsp"/>
<div class="container-fluid">
	<div class="row m-0" id="mainbtn">
		<div class="col-3 ">
			<a href="showalltravel.jsp?userid=${param.userid}"><button class="btn" id="funcbtn" style="background-color: #f75f5f" type="button"><h2>Booking</h2></button></a>
		</div>
		<div class="col-3">
			<a href="ShowWallet.jsp?userid=${param.userid}"><button class="btn" id="funcbtn" style="background-color: #caf75f" type="button"><h3>Wallet</h3></button></a>
		</div>
		<div class="col-3">
			<a href="ApprvdTickets.jsp?userid=${param.userid}"><button class="btn" id="funcbtn" style="background-color: #faf284" type="button"><h2>Ticket's</h2> </button>
		</div>
		<div class="col-3 p-0">
			<a href="UserRefund.jsp?userid=${param.userid}"><button class="btn" id="funcbtn" style="background-color: #84ccfa" type="button"><h2>Refund's</h2></button>
		</div>
	</div>
</div>
</body>
</html>