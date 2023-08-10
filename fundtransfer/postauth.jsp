<%@ include file="/common/Include.jsp" %>
<html><script language="JavaScript">


</script>
	<head>
<title></title>
</head>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Login Page"/>
<tiles:put name="menu" value="../common/user_left.jsp"/>
<tiles:put name="line" value="../common/line.html"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
		<bean:message bundle="hindi" key= "7022"/> 
</tiles:put>	
	<body bgcolor=activeBorder style="margin:0" >
	 <b>Site is under construction.Please wait....<b>
	</body>
</html>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="../common/footer.jsp"/>
</tiles:insert>

