<%@ include file="/common/Include.jsp" %>
<%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
<!DOCTYPE HTML>
<%
	String appServer = BMConfig.getProperty("CBSWEBURL") ;
%>
<html>
<head>
<%
	String newUserName = "";
%>
<title>Internet Banking | HPSCB Bank</title>
<script
	src="<%=request.getContextPath()%>/new_ui/IB_UI/js/js-image-slider.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/new_ui/IB_UI/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/scripts/common.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new_ui/IB_UI/css/style-1.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new_ui/IB_UI/css/app.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new_ui/IB_UI/css/ApplyNow.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new_ui/IB_UI/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new_ui/products/account/newUser.css" />
<link
	href="<%=request.getContextPath()%>/new_ui/IB_UI/css/js-image-slider.css"
	rel="stylesheet" type="text/css" />

<script>
function isNumberKey(evt)
{
	   
	   var keyCode = (evt.which) ? evt.which : evt.keyCode;
	   if (keyCode != 46 && keyCode > 31 && (keyCode < 48 || keyCode > 57))
       return false;

   return true;
}
	function setField(id,val1)
	{
		var val=document.getElementById(id).value;
		if(val=="")
		{
			document.getElementById(id).value=val1;
			/*document.getElementById(id+"Div").style.display="block";
			document.getElementById(id+"Div").style.opacity="5";*/
		}
		else if(val==val1)
		{
			document.getElementById(id).value="";
			/*document.getElementById(id+"Div").style.display="none";
			document.getElementById(id+"Div").style.opacity="0";*/
		
		}
		else
		{
			/*document.getElementById(id+"Div").style.display="none";
			document.getElementById(id+"Div").style.opacity="0";*/
		}
	}
function loadBasicDetails(){
	<% if (request.getParameter("AppId")!=null){%>
	document.getElementById('if').src='<%=request.getContextPath()%>/new_ui/products/account/return.jsp?appId=<%=request.getParameter("AppId")%>';
	<%}else{%>
		document.getElementById('if').src="<%=appServer%>/OpenAction.do?param=13621&requestFrom=SavingAcc&requestFor=Savings Account&source=tabbanking&custRole=C&custID=ACC";
	<%}%>
}

</script>
</head>
<body
	onload='loadBasicDetails()'>
	<div class="clearfix" style="height:auto">
		<div id="main-container">
			<div id="sub-container">
				<div class="top-bar" style="height: 55px;">
					<img
						src="<%=request.getContextPath()%>/new_ui/IB_UI/images/animation_new.jpg"
						alt="bank_Logo" style="float: left;" /> The H.P. STATE
					CO-OPERATIVE BANK LTD.
				</div>
				<!-- <div id="content"></div>  -->
			</div>
			<!--class="clearfix" id="main" role="main"-->
			<!-- <div>
				 --><iframe  name='if' id="if" width="100%" height="560">
					
				</iframe>

			<!-- </div> -->
		</div>
	</div>
	<footer>
		<div class="middleContainer"></div>
	</footer>

</body>
</html>