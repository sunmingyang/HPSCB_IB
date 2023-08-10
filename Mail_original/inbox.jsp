<%@ include file="/common/Include.jsp" %>
			<%@ page import ="easycbs.common.mail.common.MailMessage"%>
			<%@ page import ="easycbs.common.mail.common.MailMessageInfo"%>


<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="menu" value="../common/mail_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="../common/line.html"/>
<tiles:put name="page_header" type="String" >
<bean:message bundle='<%=lang%>' key='7213' />
</tiles:put>
<tiles:put name='content' type='String'>

<!--File include section........................starts..-->
<!--File include section........................ends.-->


<% MailMessage[] messages =null;
if(session.getAttribute("sessionMessages")!=null){
	messages=(MailMessage[])session.getAttribute("sessionMessages");

}

//temporary set in session
session.setAttribute("userType","B");
%>
<script>
var totalMessages=0;	
 function onLoadInBox()
 {			
			makeScrollableTable('messages',true,'auto');
			<%if(messages!=null){%>
				totalMessages=<%=messages.length%>;	
			<%}%>
<logic:messagesPresent property="Error-421">
	alert("<bean:message bundle='<%=errorLang%>' key='421'/>");
</logic:messagesPresent>
<logic:messagesPresent property="Error-302">
	alert("<bean:message bundle='<%=errorLang%>' key='302'/>");
</logic:messagesPresent>
<logic:messagesPresent property="Error-1903">
	alert("<bean:message bundle='<%=errorLang%>' key='1903'/>");
</logic:messagesPresent>
}
function onDeleteInBox(){
	 var id=""
	for(var i=0; i<totalMessages; i++){
		if(document.getElementById("isSelected"+i).checked){
			id=id+(i+1)+",";
		}
	}
	if(id!=""){
		document.getElementById('mailID').value=id;
		document.forms[0].action="<%=request.getContextPath()%>/mail/mailInBoxAction.do?action=executeOnDelete";
		document.forms[0].method="post";
		document.forms[0].submit();
		//alert("id = "+id);
	}else{
		alert("no row selected");
	}
 }
 </script>

<BODY onload="onLoadInBox()" >
<html:form action="/mail/mailInBoxAction" >
<TABLE id="messages" width="80%" border="1" CELLPADDING =0 cellspacing=0  align="center" style="border-left:none;">
<thead class="scrolling">
	<tr style="background-color:<%=headerColor%> " >
	<th colspan="7" align="center"><u><bean:message bundle = "<%=lang%>" key = "7298"/></u></th>
	</tr>

	<tr style="background-color:<%=headerColor%>" >
	<th><bean:message bundle = "<%=lang%>" key = "1710"/></th>
	<th align="left"><input type= "checkBox" name="statusAll"+i id="statusAll" onclick="selectAllMails(totalMessages)"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "7295"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "549"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "7293"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "43"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "177"/></th>
</tr>
</thead>
<tbody class="scrolling">
<%if(messages!=null){
for(int i=0;i<messages.length;i++){
%>
<TR bgcolor="white">
	<td align ="center" class="TableText"><%=(i+1)%>.</td>
	<td align="left"  class="TableText" >
	<input type= "checkBox" class="TableText" name='isSelected<%=i%>' id='isSelected<%=i%>'/></td>
	  <td align ="center" class="TableText"> 
        <%if(messages[i].Attachments!=null && !messages[i].Attachments.isEmpty() ) {%>
        <img src="../images/Attachment.gif" alt="Attached File" style="CURSOR: hand;"> 
        <%}%>
      </td>
	<td align="center" class="TableText"><%=messages[i].getFromAddress()%></td>
	<td align="center" class="TableText">
	<u><b><input type="text"  class="TableText" style="CURSOR: hand;COLOR:blue;font-weight:bold;" readOnly onClick ="readMail('<%=messages[i].getMessageID()%>')" value="<%=messages[i].getSubject()%>"/>
	</b></u></td>
	<td align="center" class="TableText"><%=messages[i].getSentDate()%></td>
	<td align ="center" class="TableText"><% if(messages[i].getFlag().equals("S")){ %>
	<img src="../images/Seen.jpg" />
	<%}else{%>
		<img src="../images/Unseen.jpg" />
	<%}%>
	</td>
</TR>
<%}}%>
</tbody>
<tfoot>
<tr>
<%if(messages!=null){%>
	<td colspan="7" align="center" class="TableText"><b><%=messages.length%> Mails Received</b></td>

<%}else{%>
	<td colspan="7" class="TableText">&nbsp;</td>
<%}%>
</tr>
</tfoot>
</TABLE>
<input type="hidden" name="mailID" id="mailID">
<table width="100%" border="0" CELLPADDING =0 cellspacing=0>
<tr><td align = "center"><hr color="brown"></td></tr>
<tr><td align = "center">
	<input type="button" class="Button" name = "delete" id="delete" value = "<bean:message bundle = '<%=lang%>' key = '161'/>" onClick = "onDeleteInBox()">
	<input type="button" class="Button" name = "cancel" id="cancel" value = "<bean:message bundle = '<%=lang%>' key = '87'/>" onClick="onCancelInbox()">
	<input type="button" class="Button" name = "compose" id="compose" value = "<bean:message bundle = '<%=lang%>' key = '7297'/>" onClick="onCompose()" >
	</td></tr>
</table>
</html:form>
</BODY>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
</tiles:insert>
<script>
function onCancelInbox(){
	alert('Cancel pending');
	}
function onCompose(){
		document.forms[0].action="<%=request.getContextPath()%>/Mail/compose.jsp";
		document.forms[0].method="post";
		document.forms[0].submit();
}
function readMail(id){
		document.getElementById('mailID').value=id;
		document.forms[0].action="<%=request.getContextPath()%>/mail/mailInBoxAction.do?action=executeonRead";
		document.forms[0].method="post";
		document.forms[0].submit();
}
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