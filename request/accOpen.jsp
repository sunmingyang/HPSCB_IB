<%@ include file="/common/Include.jsp" %>
<%String usrName = (String)session.getAttribute("user");
String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
	
%>
<script>

	function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=Ibtrans","child", bar);
}


</script>
<BODY ><!-- onload="loadfun()"> -->

<tiles:insert page="../common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Internet banking"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=accOpen"/>
	<tiles:put name="menu" value="/common/user_left.jsp?src=accOpen"/>
	<tiles:put name="page_header" type="String">
		&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
<bean:message bundle="hindi" key= "7022"/>
	</tiles:put>
	<tiles:put name="content" type="String">

<br>

	 <table>
		 <tr>
			<td class="tdforconfirmMsg">
			 Account open request Internet Banking
			 </td>
		 </tr>
	</table>
	
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
</body>