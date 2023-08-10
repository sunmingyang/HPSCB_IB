<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>

<html:form action="/jsp/login.do">

<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
<bean:message bundle='<%=lang%>' key='2161' />
</tiles:put>
<tiles:put name="content" type="String">
<html:form action="/accsum/acc_sum.do">
<br>
<br>
<br><br>

	<body>
		<table border="1" width="70%">
		<tr>
		</tr>
			<tr align="center">
				<td>
				<a href="/accsum/accSum.jsp">Account Summary</a>
				</td>
			</tr>
			<tr>
			</tr>
			<tr align="center">
				<td>
				<a href="/accsum/miniStmt.jsp?success=mini">Mini Statement</a>
				</td>
			</tr>
			<tr>
			</tr>

			<tr align="center">
				<td>
				<a href="/accsum/acc_sum.do?action=setDetail">Detailed Statement</a>
				</td>
			</tr>
			<tr>
			</tr>
			<tr align="center">
				<td>
				<a href="/accsum/AccountDetails1.jsp"> Account Details</a>
				</td>
			</tr>
			<tr>
			</tr>
			
	</table>
</body>

</html:form>

</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
