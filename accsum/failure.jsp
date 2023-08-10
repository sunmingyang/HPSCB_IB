<%@ include file="/common/Include.jsp" %>

<script language="JavaScript" src="/accsum/scripts/accSum.js">
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="failure"/>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="content" type="String">


<body> 
	<html:form action="/accsum/acc_sum.do">
	<br><br><br><br><br><br><br><br>
	<center>
		<table>
			<tr>
				<td style = "font-size:20px;color:#993300">
					Operation could not be done as Branch is disconnected.
				</td>
			</tr>
		</table>
	</center>

	</html:form>
</body> 
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>