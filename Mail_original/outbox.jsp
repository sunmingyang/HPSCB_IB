<%@ include file = "/common/Include.jsp" %>
<!--File include section........................starts..-->
			<%@ page import ="easycbs.common.mail.common.MailMessage"%>
			<%@ page import ="easycbs.common.mail.common.MailMessageInfo"%>
<!--File include section........................ends.-->

<HTML>
<% MailMessage[] messages =null;
if(session.getAttribute("sessionMessages")!=null){
	messages=(MailMessage[])session.getAttribute("sessionMessages");

}
%>
<script>
var totalMessages=0;	
function onSent(){
	alert('Going to sent');
	document.forms[0].action="<%=request.getContextPath()%>/mail/mailOutBoxAction.do?action=executeOnSentAll";
	document.forms[0].method="post";
	document.forms[0].submit();	

 }
function checkonLoadOutBox(){
<%
if(request.getAttribute("success")!=null){%>
	alert("<bean:message bundle='<%=errorLang%>' key='1122'/>");
	<%}%>
<logic:messagesPresent property="Error-SNA">
	alert("<bean:message bundle='<%=errorLang%>' key='2474'/>");
</logic:messagesPresent>
<logic:messagesPresent property="Error-NRF">
	alert("<bean:message bundle='<%=errorLang%>' key='1903'/>");
</logic:messagesPresent>
<logic:messagesPresent property="Error-RNU">
	alert("<bean:message bundle='<%=errorLang%>' key='421'/>");
</logic:messagesPresent>

makeScrollableTable('messages',true,'auto');
}
 </script>
<BODY onload="checkonLoadOutBox()">
<html:form action="/mail/mailOutBoxAction" >
<TABLE id="messages" width="100%" border="0" CELLPADDING =0 cellspacing=0 >
<thead class="scrolling">
	<tr style="background-color:<%=headerColor%> " >
	<th colspan="8" align="center"><u><bean:message bundle = "<%=lang%>" key = "7299"/></u></th>
	</tr>
	<tr style="background-color:<%=headerColor%>" >
	<th><bean:message bundle = "<%=lang%>" key = "7153"/></th>
<!--	<th align="left"><input type= "checkBox" name="statusAll"+i id="statusAll" onclick="selectAllMails(totalMessages)"/></th>-->
	<th><bean:message bundle = "<%=lang%>" key = "549"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "107"/></th>
	<th><bean:message bundle = "<%=lang%>" key ="7294"/></th>
	<th><bean:message bundle = "<%=lang%>" key ="7293"/></th>
	<th></th>
	<th><bean:message bundle = "<%=lang%>" key = "43"/></th>
</tr>
</thead>
<tbody class="scrolling">
<%if(messages!=null){
for(int i=0;i<messages.length;i++){
%>
<TR bgcolor="white">
	<td align ="center"><%=(i+1)%>.</td>
<!--	<td align="left"><input type= "checkBox" name='isSelected<%=i%>' id='isSelected<%=i%>'/></td>-->
	<td align="center"><%=messages[i].getFromAddress()%></td>
	<td align="center"><%=messages[i].getToAddress()%></td>
	<td align="center"><%=messages[i].getCcAddress()%></td>
	<td align="center"><%=messages[i].getSubject()%></td>
	<td align="center"> <%if(messages[i].Attachments!=null && !messages[i].Attachments.isEmpty() ){%>
	<img src="../images/attach1.bmp" /> <%}%></td>
	<td align="center"><%=messages[i].getSentDate()%></td>
</TR>
<%}}%>
</tbody>
<tfoot>
<tr style="background-color:<%=headerColor%>">
<%if(messages!=null){%>
	<td colspan="7" align="center"><b><%=messages.length%>Pending Messages</b></td>

<%}else{%>
	<td colspan="7" align="center"><B>No Pending Messages<B></td>
<%}%>
</tr>
</tfoot>
</TABLE>
<input type="text" name="mailID" id="mailID">
<table width="100%" border="0" CELLPADDING =0 cellspacing=0>
<tr><td align = "center">
	<input type="button" name = "sent" id="sent" value = "<bean:message bundle = '<%=lang%>' key ='7241'/>" onClick = "onSent()"/>
	<input type="button" name = "cancel" id="cancel" value = "<bean:message bundle = '<%=lang%>' key ='87'/>" />
	</td></tr>
</table>
</html:form>
</BODY>
</HTML>
<script>
function selectAllMails(tableLength){
		var i=0;

	var selOrNot=0;
	document.getElementById("mailID").value="";

	for(i=0;i<tableLength;i++){

		if(document.getElementById("isSelected"+i).checked ==true)
			selOrNot=selOrNot+1;
		document.getElementById("isSelected"+i).checked =true;
		document.getElementById("statusAll").checked =true;

		}
	if(selOrNot==tableLength){

		for(i=0;i<tableLength;i++){
				document.getElementById("isSelected"+i).checked =false;
				document.getElementById("statusAll").checked =false;
		}
	document.getElementById("mailID").value="";
}
}
</script>