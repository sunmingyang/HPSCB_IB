<%@ include file="/common/Include.jsp" %>
<%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
<%String usrName = (String)session.getAttribute("user");
String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
String accountNo=usrInfo[0][0];
String appServer = BMConfig.getProperty("CBSWEBURL") ;
%>
<script>

function onload()
{ 
	
document.getElementById('if').src="<%=appServer%>/OpenAction.do?param=13009";
//alert(document.getElementById('if').src);

}
</script>
<tiles:insert page="../common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Internet banking"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=application"/>
	<tiles:put name="menu" value="/common/user_left.jsp?src=application"/>
	<tiles:put name="page_header" type="String">
		&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
<bean:message bundle="hindi" key= "7022"/>
	</tiles:put>
	<tiles:put name="content" type="String">

<br>
<body onload='onload()'>
<iframe  name='if' id="if" width="100%" height="400">
 
</iframe>

</body>	
	
	</tiles:put>
	 <tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/> 
</tiles:insert>
