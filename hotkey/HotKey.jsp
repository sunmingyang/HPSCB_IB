<%@ include file = "/common/Include.jsp" %>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Calculator"/>
<tiles:put name="page_header" type="String" >
Calculators
</tiles:put>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="content" type="String">
<br>
<br>
<!-- <table width=527>
	<tr>
		<td align=right><input type="button" onClick="back_req()" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>">
		</td>
	</tr>
</table>
 --><table border="1" bordercolor="brown" style="border-left:none;border-right:none;border-top:none;border-bottom:none;" >
	<tr>
		<td>
		<table width=527 cellpadding="0" cellspacing="0">
		<tr>
			<td class="tbl_heading">Calculators</td></tr><tr><td>&nbsp;</td>
		</tr>
		<tr>
			<td>
<script language="javascript" src="/hotkey/HotKey.js">
</script>

		<body onkeypress = "escapeKey()" onKeydown ="hotKey(event)" 
		onload = "makeScrollableTable('tabela', true, 'auto')">
		<form >
			<TABLE id = "tabela" width = "100%">
				<thead>
				<tr>
					<td>
					</td>
					<td>
					</td>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>
					<!--EMI Calculator-->
					<a href="../hotkey/EMICalculator.jsp" class="nav">
					<bean:message bundle = '<%=lang%>' key = "5381"/>
					</a>
					</td>
				</tr>
				<tr>
					<td>
					<a href="../hotkey/LoanAmountCalculator.jsp" class="nav" >
					<!--Loan Amount Calculator-->
					<bean:message bundle = '<%=lang%>' key = "5081"/>
					</a>
					</td>
				</tr>
				</tbody>
			</TABLE>
		</form>
	</body>
	</tr>
</table>
</table>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert >
