<%@ include file="/common/Include.jsp" %>
<%
String AdminName=(String)session.getAttribute("AdminName");
%>

<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>

<html:form action="/jsp/login.do">

<tiles:put name="menu" value="/common/left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font> &nbsp;&nbsp;&nbsp;User Operations
</tiles:put>
<tiles:put name="content" type="String">
<html:form action="/openaction">
<br>
<br>
<br><br>

	<body>
	
		<table border="1" width="30%" style="font-size:15px;">
		<tr>
		</tr>
		<tr align="center">
				<td class="tdformenu">
				<font size="2px"><b>
				<a href="/openaction.do?src=zoro">ZoRoMasterEntry</a>
				</b></font>
				</td>
			</tr>
			<tr>
			</tr>
			<tr align="center"> 
				<td class="tdformenu">
				<font size="2px"><b>
				<a href="/openaction.do?src=create">User Creation</a>
				</b></font>
				</td>
			</tr>
			<tr>
			</tr>
			
			<tr align="center">
				<td class="tdformenu">
				<font size="2px"><b>
				<a href="/openaction.do?src=diffcreate">Add Account No In IB</a>
				</b></font>
				</td>
			</tr>


			<tr>
			</tr>
			<tr align="center">
				<td class="tdformenu">
			<font size="2px"><b>
				<a href="/openaction.do?src=activate">User Activation</a></b>
				</td>
			</tr>
			<tr>
			</tr>

			<tr align="center">
				<td class="tdformenu">
				<font size="2px"><b>
				<a href="<%=request.getContextPath()%>/openaction.do?src=deactivate">User Deactivation
				</td></b>
			</tr>
			<tr>
			</tr>
			<tr align="center">
				<td class="tdformenu">
				<font size="2px"><b>
				<a href="/openaction.do?src=AutoUnlock">Unlock Users</a></b>
				</td>
			</tr>
			<tr>
			</tr>
			
			<tr align="center">
				<td class="tdformenu">
				<font size="2px"><b>
					<a href="/openaction.do?src=AdminUsr">Admin User Create</a></b>
				</td>
			</tr>
			<tr>
			</tr>
			<tr align="center">
				<td class="tdformenu">
				<font size="2px"><b>
					<a href="/openaction.do?src=reprintpass">Reject Password Print</a></b>
				</td>
			</tr>
			<!-- <tr align="center">
				<td>
					<a href="/accforib/tempconfig.jsp">Different Server</a>
				</td>
			</tr>
 -->
			<tr>
			</tr>
			</font>
	</table>
</body>

</html:form>

</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
