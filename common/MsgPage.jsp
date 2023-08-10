<%@ include file="/common/Include.jsp" %>
<script>
function backpage()
{
	document.forms[0].action="/openaction.do?src=showerror";
	document.forms[0].submit();
}
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="page_header" type="String" />
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=showerror"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<html:form action="/accforib/activate" >
<br>
<br>
<br>
<table>
	<tr>
		<td class="tdforconfirmMsg">
		<% 
		String editadd=(String)request.getAttribute("addeditbr");
		if(editadd.equals("add")){ %>
		<font color="Green" face="verdana">New Branch is Added Successfully</font>
		<%}else if(editadd.equals("edit")){%>
		<font color="Green" face="verdana">
		Branch Information is Updated Successfully</font>
		<%}else if(editadd.equals("errorconf")){%>
		<font color="Green" face="verdana">
		Error is Added Successfully.</font>
		<%}%>

		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="button" name="back"  value=" Back " onclick="backpage()" /> 
		</td>
	</tr>
</table>
</html:form>
</tiles:put>
</tiles:insert>