<%@ include file="/common/Include.jsp" %>
<script>
function backpage()
{
	document.forms[0].action="/openaction.do?src=addeditbranch";
	document.forms[0].submit();
}
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=addbranch"/>
<tiles:put name="page_header" type="String" />
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
<tiles:put name="content" type="String">
<body>
<html:form action="/accforib/activate" >
<br>
<br>
<br>
<br>
<center>
<table align="center">
	<tr>
		<td class="tdforconfirmMsg">
		<% 
		String editadd=(String)request.getAttribute("addeditbr");
		if(editadd.equals("add")){ %>
		<font color="Green" face="verdana">New Branch is Added Successfully</font>
		<%}else{%>
		<font color="Green" face="verdana">
		Branch Information is Updated Successfully</font>
		<%}%>
		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="button" name="back"  value=" Back " onclick="backpage()" /> 
		</td>
	</tr>
</table>
</center>
</html:form>
</body>
</tiles:put>
</tiles:insert>