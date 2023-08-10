<%@ include file = "/common/Include.jsp" %>
<!--File include section........................starts..-->
				<%@ page import ="easycbs.bancmateib.mail.common.MailMessage"%>
			<%@ page import ="easycbs.bancmateib.mail.common.MailMessageInfo"%>
<!--File include section........................ends.-->

<HTML>
<% MailMessage[] messages =null;
if(session.getAttribute("sessionMessages")!=null){
	messages=(MailMessage[])session.getAttribute("sessionMessages");

}
String AdminName=null;
if(session.getAttribute("AdminName")!=null)
{
	AdminName=(String)session.getAttribute("AdminName");
}
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
<script language="javaScript" src="<%=request.getContextPath()%>/Mail/JS/mail.js"></script>
<script>
var totalMessages=0;	

function checkonLoadOutBox()
{
	


<%
	if(request.getAttribute("deletedSentItems")!=null)
	{	%>
			document.forms[0].action="<%=request.getContextPath()%>/mail/mailSentFolderAction.do?action=executeonLoad";
		document.forms[0].method="post";
		document.forms[0].submit();
		
		
<%	}

	if(messages!=null)
{%>
	totalMessages=<%=messages.length%>;	
<%}%>
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

function readMail(id){
		document.getElementById('mailID').value=id;
		document.forms[0].action="<%=request.getContextPath()%>/mail/mailSentFolderAction.do?action=executeonSentItemsRead";
		document.forms[0].method="post";
		document.forms[0].submit();
}
 </script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" type="string" value="SentFolder"/>
<tiles:put name="menu" value="../common/mail_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="../common/line.html"/>
<tiles:put name="page_header" type="String" >
<tiles:put name="menu_tab" value="../common/menu_tab.jsp?menumode=<%=menumode %>&src1=<%=menumode %>"/>
<tiles:put name="menu" value="../common/user_left.jsp?mode=Sent&src=Mail"/> <!-- Added by abhishek for mail work. -->
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>&nbsp;&nbsp;&nbsp;
Sent-Folder
</tiles:put>
<tiles:put name='content' type='String'>
<BODY onload="checkonLoadOutBox()">
<html:form action="/mail/mailSentFolderAction" >
<TABLE id="messages" width="100%" border="0" CELLPADDING =0 cellspacing=0 >
<thead class="scrolling">
	<tr style="background-color:<%=headerColor%> " >
	</tr>
	<tr style="background-color:<%=headerColor%>" >
	<th align="left"><input type= "checkBox" name="statusAll"+i id="statusAll" onclick="selectAllMails(totalMessages)"/></th>
	<th><bean:message bundle = "<%=lang%>" key = "7153"/></th>
<!--	<th align="left"><input type= "checkBox" name="statusAll"+i id="statusAll" onclick="selectAllMails(totalMessages)"/></th>-->
	<!-- <th><bean:message bundle = "<%=lang%>" key = "549"/></th> -->
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
	<td align="left"  class="TableText" >
	<input type= "checkBox" class="TableText" name='isSelected<%=i%>' id='isSelected<%=i%>'/></td>
	<td align ="center"><%=(i+1)%>.</td>
<!--	<td align="left"><input type= "checkBox" name='isSelected<%=i%>' id='isSelected<%=i%>'/></td>-->
<!--	<td align="center "><%=messages[i].getFromAddress()%></td>  -->
	<td align="center"><%=messages[i].getToAddress()%></td>
	<td align="center"><%=messages[i].getCcAddress()%></td>
	<td align="center"><input type ="text" class="TableText" style="CURSOR: hand;COLOR:blue;font-weight:bold;" readOnly value="<%=messages[i].getSubject()%>" onclick="readMail('<%=messages[i].getMessageID()%>')"></td>
	<td align="center"> <%if(messages[i].Attachments!=null && !messages[i].Attachments.isEmpty() ){%>
	<img src="/images/attach.gif" /> <%}%></td>
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
<input type="hidden" name="mailID" id="mailID">
<table width="100%" border="0" CELLPADDING =0 cellspacing=0>
<tr><td align = "center">
	
	<input type="button" class="button" name = "cancel" id="cancel" value = "<bean:message bundle = '<%=lang%>' key ='87'/>" onClick="onCancelOutBox('<%=request.getContextPath()%>')" />
	<input type="button" class="Button" name = "delete" id="delete" value = "<bean:message bundle = '<%=lang%>' key = '161'/>" onClick = "onDeleteInBox()">
	</td></tr>
</table>
</html:form>
</BODY>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
</tiles:insert>
</HTML>
<script>
function selectAllMails(tableLength){
	//alert("in function selectAllMails");
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

function onDeleteInBox()
	{
		var id=""
	<%	for(int i=0; i<messages.length; i++)
		{	%>
			if(document.getElementById("isSelected"+<%=i%>).checked)
			{	
				
				//id=id+(i+1)+",";
				id=id+'<%=messages[i].getMessageID()%>'+",";
			}
	<%	} %>
		if(id!="")
			{
				document.getElementById('mailID').value=id;
				document.forms[0].action="<%=request.getContextPath()%>/mail/mailSentFolderAction.do?action=executeOnDeleteSentItems";
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