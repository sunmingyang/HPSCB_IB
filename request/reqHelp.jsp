<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Request"/>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="content" type="String">
<br>
<br>
<br>
<table width=527>
	<tr>
		<td align="centre">Help page is under construction!!</td>
		<td colspan="5" align="right">
<input type="button" onClick="back_req(<%=(String)request.getParameter("row")%>,'HELP')" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>">
		</td>
	</tr>
</table>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert >