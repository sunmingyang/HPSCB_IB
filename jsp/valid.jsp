
<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/jsp/scripts/chng_pass.js">
</script> 

 
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Forgot Password Request"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="content" type="String">
<body  topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" >
<html:form action= "/jsp/forpass.do">
<br><br><br>
<center>
<font color="Green" face="verdana">Your Forgot Password Request has been Successfully Saved !!!!</font>
<input type="button" value="ok" onclick="closeWindow()">
</center>
</html:form>
</body>
</tiles:put>
</tiles:insert>
<script>
function closeWindow(){
window.close();
}
</script>