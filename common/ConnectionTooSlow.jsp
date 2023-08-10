<%@ include file="/common/Include.jsp" %>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" />
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
<tiles:put name="content" type="String">
<%
	if((String)session.getAttribute("validToken") != null)
	{
    	String userInfo1=(String)session.getAttribute("validToken");  
		if(userInfo1.equals("admin"))
		{%>
			<tiles:put name="menu" value="/common/left.jsp"/>		
		<%}
		else
		{%>	
			<tiles:put name="menu" value="/common/user_left.jsp"/>
		<%}
	}
%>

<html>
<body>
	Connection Too Slow 
	<!--<br><a href="javaScript:history.go(-1)">Try Again</a>-->
	<br><a href="/jsp/LoginOption.jsp">Try Again</a>

</body>
</html>
</tiles:put>
</tiles:insert>