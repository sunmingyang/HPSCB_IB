<%@ include file="/common/Include.jsp" %>
<% 
	String Arr= null, usrName="";
	String userInfo[][] = null;
	int j; 
	usrName = (String)session.getAttribute("user");
	userInfo = (String [][])session.getAttribute("userInfo");
	String brnCode=userInfo[0][1];
//out.writeln(""+request.setAttribute("brnCode",brnCode));
	System.out.println("Branch Code is this -->"+brnCode);
	String loginTime = (String)request.getAttribute("lastLoginTime");
    String totallogin = (String)request.getAttribute("totallogin");
%>
<script>
	function download(){
		<% if(session.getAttribute("details")!=null){ %>
			document.forms[0].action="/TransactionAction.do?action=downloadFeeColectionReciept";
			document.forms[0].submit();
		<%}%>
	}
</script>

<head>

</head>

<body  onload="download()">
<html:form action="/TransactionAction.do?action=downloadFeeColectionReciept">
	<br><br>
	<table width="61%" align="center" border=0 bordercolor="#0270CF" cellspacing=0 cellpadding=0>
	<tr>
	<td style="text-align:center;font-size:large;color:red;" >
	<%=request.getAttribute("response")%>
	<%request.removeAttribute("response");%>
	</td>
</tr>
</table></html:form>
</body>


<style>
.weldataTableTH{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		height: 20;
        font-weight: bold;
        color: #EBD172;
        text-decoration: none;
		background-color: #686868;

}

</style>


