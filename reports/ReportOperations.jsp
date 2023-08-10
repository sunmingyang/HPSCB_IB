<%@ include file="/common/Include.jsp" %>
<%String AdminName=(String)session.getAttribute("AdminName");%>
<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>

<html:form action="/jsp/login.do">

<tiles:put name="menu" value="/common/left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>&nbsp;&nbsp;&nbsp;Reports
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
				<a href="/openaction.do?src=statuslog">User Status Change Report</a>
				</b></font>
				</td>
			</tr>
			<tr>
			</tr>
			<tr align="center">
				<td class="tdformenu">
					<font size="2px"><b>
					<a href="/UserInfoForAdmin.do?action=firstExecute"  >Login/Logout History</a>
					</b>
				</td>
			</tr>
			<tr>
			</tr>

			<tr align="center">
				<td class="tdformenu">
				<font size="2px"><b><a href="/openaction.do?src=BranchStatus" >
				Branch Status Report</a>
				</td></b>
			</tr>
			<tr>
			</tr>
			
			<tr align="center">
				<td class="tdformenu">
				<font size="2px"><b>
				<a href="/openaction.do?src=UserStatus">User Status Report</a></b>
				</td>
			</tr>
			<tr>
			</tr>
			
			<tr align="center">
				<td class="tdformenu">
				<font size="2px"><b>
				<a href="/openaction.do?src=trnsopr">Transaction Report</a></b>
				</td>
			</tr>
			<tr>
			</tr>
			
			<tr align="center">
				<td class="tdformenu">
				<font size="2px"><b>
				<a href="/openaction.do?src=suspecttrn">Suspected Transaction Report</a></b>
				</td>
			</tr>
			<tr>
			</tr>

			 <tr align="center">
				<td class="tdformenu">
				<font size="2px">
				<b>
				<a href="/openaction.do?src=activitylog">
				User Activity Report
				</a>
				</b>
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
</tiles:insert>
