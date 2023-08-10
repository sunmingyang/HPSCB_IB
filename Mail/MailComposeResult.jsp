<%@ include file="/common/Include.jsp" %>

<%
String AdminName=(String)session.getAttribute("AdminName");
String userId=(String)session.getAttribute("userId");
String sentAddress="";
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
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" type="string" value="MAIL-INBOX"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="../common/line.html"/>
<tiles:put name="page_header" type="String" >
<tiles:put name="menu_tab" value="../common/menu_tab.jsp?menumode=<%=menumode %>&src1=<%=menumode %>"/>
<tiles:put name="menu" value="../common/user_left.jsp?mode=Sent&src=Mail"/> <!-- Added by abhishek for mail work. -->
<br /> <br />
<font color="#99FF00">
<%if(usrName!=null) out.print(usrName);%>!
</font>
</tiles:put>
<tiles:put name='content' type='String'>
<!--File include section........................starts..-->
<!--File include section........................ends.-->


<% //MailMessage[] messages =null;
if(request.getAttribute("sentAddress")!=null)
{
	sentAddress=(String)request.getAttribute("sentAddress");
	System.out.println("sent address not null "+sentAddress);
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

 function goForCompose()
 {	
	 document.forms[0].action="/mail/mailComposeAction.do?action=executeOnLoad";
	 document.forms[0].submit();
		
 }

 function goInbox()
 {
	 document.forms[0].action="/mail/mailInBoxAction.do?action=executeonLoad";
	 document.forms[0].submit();

 }

 </script>

<BODY >
<html:form action="/mail/mailInBoxAction" >
<TABLE id="messages" width="80%" border="1" CELLPADDING =0 cellspacing=0  align="center" style="border-left:none;">
your Mail Successfully Sent To:<%=sentAddress%>
</TABLE>
<table width="100%" border="0" CELLPADDING =0 cellspacing=0>
<tr><td align = "center"><hr color="brown"></td></tr>
<tr><td align = "center">
	<input type="button" class="Button" name = "backButton" id="backButton" value = "Back" onClick = onClick="onCancelOutBox('<%=request.getContextPath()%>')">
	<input type="button" class="Button" name = "composeButton" id="composeButton" value = "Compose" onClick = "goForCompose()">
	<input type="button" class="Button" name = "InboxButton" id="InboxButton" value = "Inbox" onClick = "goInbox()">
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


</script>