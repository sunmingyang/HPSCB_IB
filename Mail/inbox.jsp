<%@ include file="/common/Include.jsp" %>
<%@ page import ="easycbs.bancmateib.mail.common.MailMessage"%>
<%

//System.out.println("inbox.jsp se");
String usrName = (String)session.getAttribute("user");
String src="1",menumode="",src1="";
if(request.getParameter("src")!=null){
	src=(String)request.getParameter("src");
}
if(request.getParameter("menumode")!=null){
	menumode=(String)request.getParameter("menumode");
	System.out.println("menu mode in inbox.jsp is this -->"+menumode);
}
if(request.getParameter("src1")!=null)
{
	src1=(String)request.getParameter("src1");
}

%>
<tiles:insert page="../common/siteLayout.jsp" flush="true">
<tiles:put name="title" type="string" value="MAIL-INBOX"/>
<tiles:put name="header" value="../common/header.jsp"/>
<tiles:put name="line" value="../common/line.html"/>
<tiles:put name="page_header" type="String" >
<tiles:put name="menu_tab" value="../common/menu_tab.jsp?menumode=<%=menumode %>&src1=<%=menumode %>"/>
<tiles:put name="menu" value="../common/user_left.jsp?mode=Inbox&src=Mail"/> <!-- Added by abhishek for mail work. -->
<font color="#99FF00"><%if(usrName!=null) out.print(usrName);%>!
</font>
<font color="white">
Mail-Inbox
</font>
</tiles:put>
<tiles:put name='content' type='String'>

<!--File include section........................starts..-->
<!--File include section........................ends.-->


<% MailMessage[] messages =null;
if(session.getAttribute("sessionMessages")!=null)
{
	messages=(MailMessage[])session.getAttribute("sessionMessages");

}

//temporary set in session
session.setAttribute("userType","B");
%>
<script language="javaScript" src="<%=request.getContextPath()%>/Mail/JS/mail.js"></script>

<script>
var totalMessages=0;	
	
 function onBack()
 {
	<%if(session.getAttribute("userInfo")!=null)
		{
			System.out.println("in mail_left not null");%>
			document.forms[0].action="/jsp/main_page.jsp";
			document.forms[0].submit();
	   <%}else
		{  	System.out.println("mail_left  null");%>
		   document.forms[0].action="/jsp/home.jsp";
			document.forms[0].submit();
      <%}%>


 }
 function onLoadInBox()
 {			
	
			makeScrollableTable('messages',true,'auto');
			<%if(messages!=null)
			  {%>
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

function onDeleteInBox()
	{
		var id=""
		for(var i=0; i<totalMessages; i++)
		{
			if(document.getElementById("isSelected"+i).checked)
			{
				id=id+(i+1)+",";
			}
		}
		if(id!="")
			{
				document.getElementById('mailID').value=id;
				document.forms[0].action="<%=request.getContextPath()%>/mail/mailInBoxAction.do?action=executeOnDelete";
				document.forms[0].method="post";
				document.forms[0].submit();
				//alert("id = "+id);
			}
		else
			{
				alert("no row selected");
			}
	}
 </script>

<BODY onload="onLoadInBox()" >
<html:form action="/mail/mailInBoxAction" >
<TABLE id="messages" width="80%" border="1" CELLPADDING =0 cellspacing=0  align="center" >
<thead class="scrolling">
	<tr style="background-color:<%=headerColor%> " >
	<th colspan="7" align="center"><u></u></th>
	</tr>

	<tr style="background-color:<%=headerColor%>" >
	
	<th align="left"><input type= "checkBox" name="statusAll"+i id="statusAll" onclick="selectAllMails(totalMessages)"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "1710"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "549"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "7293"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "43"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "7295"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "177"/></th>
</tr>
</thead>
<tbody class="scrolling">
<%if(messages!=null){
for(int i=0;i<messages.length;i++){
%>
<TR bgcolor="white">
	<td align="left"  class="TableText" >
	<input type= "checkBox" class="TableText" name='isSelected<%=i%>' id='isSelected<%=i%>'/></td>
	<td align ="center" class="TableText"><%=(i+1)%>.</td>
	  
	<td align="center" class="TableText"><%=messages[i].getFromAddress()%></td>
	<td align="center" class="TableText">
	<u><b><input type="text"  class="TableText" style="CURSOR: hand;COLOR:blue;font-weight:bold;" readOnly onClick ="readMail('<%=messages[i].getMessageID()%>')" value="<%=messages[i].getSubject()%>"/>
	</b></u></td>
	<td align="center" class="TableText"><%=messages[i].getSentDate()%></td>
	<td align ="center" class="TableText"> 
        <%if(messages[i].Attachments!=null && !messages[i].Attachments.isEmpty() ) {%>
        <img src="/images/attach.gif" alt="Attached File" style="CURSOR: hand;"> 
        <%}%>
    </td>
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
	<input type="button" class="Button" name = "back" id="back" value = "Back" onClick = "onBack()">	<input type="button" class="Button" name = "delete" id="delete" value = "<bean:message bundle = '<%=lang%>' key = '161'/>" onClick = "onDeleteInBox()">
</td></tr>
</table>
</html:form>
</BODY>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
</tiles:insert>
<script>
function onCancelInbox(){
	
	}
function onCompose(){
		document.forms[0].action="<%=request.getContextPath()%>/mail/mailComposeAction.do?action=executeOnLoad";
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