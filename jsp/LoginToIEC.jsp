<%@ include file="/common/Include.jsp" %>
<%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>

<% 

	String Arr= null, usrName="";
	String userInfo[][] = null;
	String sUserId="";
	String sPAN="";
	String sTimeStamp="";
	String sIFSC="";
	String sData="";
	String sSignature="";
	sUserId=(String)session.getAttribute("userId");
	sData=(String)session.getAttribute("data");
	sSignature=(String)session.getAttribute("signature");
	int j; 
	usrName = (String)session.getAttribute("user");
	userInfo = (String [][])session.getAttribute("userInfo");
	String acno=userInfo[0][0];
				
					
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>LoginToEFiling</title>
<script> 
function pageSubmit() { 
	alert("before action ");
	document.forms[0].action = "https://uatfoportal.incometax.gov.in/services/login/banksso.html";
	document.forms[0].method="POST";
	alert("before page submit");
	document.forms[0].submit() ;
}
</script>
</head>

<body onload="pageSubmit()">
<form name="LoginToEFiling" method="post"  action="https://uatfoportal.incometax.gov.in/services/login/banksso.html" >

<input type="hidden" name="data" value="<%=sData%>"/> 
<input type="hidden" name="signature" value="<%=sSignature%>"/>


</form>

</body>
</html>