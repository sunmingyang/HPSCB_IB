<%@ include file="/common/Include.jsp" %>
<%String usrName = (String)session.getAttribute("user");
%>
<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>

<html:form action="/jsp/login.do">

<tiles:put name="menu" value="/common/user_left.jsp?src=acc"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<bean:message bundle='<%=lang%>' key='2161' />
</tiles:put>
<tiles:put name="content" type="String">
<html:form action="/accsum/acc_sum.do" >
<br>
<br>
<br>
<br>
	<body>
		<table border="0" width="25%" cellspacing=0 cellpadding=0 >
		<tr>
		</tr>
			<tr align="center">
				<td class="tdformenu1">
				<a href="/accsum/acc_sum.do?action=getAccSummary">Account Summary</a>
				</td>
			</tr>
			<tr>
			</tr>
			<tr align="center">
				<td class="tdformenu1">
				<a href="/accsum/miniStmt.jsp?success=mini">Mini Statement</a>
				</td>
			</tr>
			<tr>
			</tr>
			<tr align="center">
				<td class="tdformenu1">
				<a href="/accsum/acc_sum.do?action=setDetail">Detailed Statement</a>
				</td>
			</tr>
			<tr>
			</tr>
			<tr align="center">
				<td class="tdformenu1">
				<a href="/accsum/AccountDetails1.jsp"> Account Details</a>
				</td>
			</tr>
			
			
	</table>
</body>

</html:form>

</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
</tiles:insert>
<style>
.tdformenu1{

		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: #92610E;
		height:20;
        text-decoration: none;
		background-color:#E0E0E0;


}

</style>