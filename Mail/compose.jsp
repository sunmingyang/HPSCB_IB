<%@ include file = "/common/Include.jsp"%>

<!--File include section........................starts..-->
			<%@ page import ="easycbs.bancmateib.mail.common.EnabledDisabledControls"%>
			<%@ page import ="java.io.*"%>
			<%@ page import ="java.util.ArrayList"%>
			<%@ page import ="java.lang.reflect.Method"%>
			<%@ page import ="java.net.*"%>
<!--File include section........................ends.-->
<%! String deleteRecord="";%>
<%	String result="";
	String userType = "";
	String disableToAddress="";
	String readingMail="";
	String src="1",menumode="",src1="";
	String usrName = (String)session.getAttribute("user");
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
<%
String AdminName=(String)session.getAttribute("AdminName");

String userId=(String)session.getAttribute("userId");
System.out.println("in jsp page "+(String)session.getAttribute("userId"));

%>
<script language="javaScript" src="<%=request.getContextPath()%>/Mail/JS/mail.js">

</script>
<script>
	function onLoadComposeMail()
	{


	<%
		
		if(request.getAttribute("disableToAddress")!=null)
		{
			disableToAddress=(String)request.getAttribute("disableToAddress");
			System.out.println("disableToaddress is:::"+disableToAddress);
		}
		if(disableToAddress.equals("Y"))
		{
	%>
			//document.getElementById("toemail").disabled=true
			disableYN="Y"
	<%	}
		if(request.getAttribute("sessionMailNo")!=null)
		{
			System.out.println("sessionMailNo is not null");
			//session.removeAttribute("sessionMailNo");
			readingMail="Y";
	%>		
			readingMail="Y";
	<%	}
		if(request.getParameter("mailID")!=null)
		{
			deleteRecord=request.getParameter("mailID");
		}	
		if(request.getAttribute("operation")!=null)
		{
			result=(String)request.getAttribute("operation");
			if(result.trim().equalsIgnoreCase("success")){%>
			alert('<bean:message bundle = "<%=errorLang%>" key = "1122"/>');
			<%}else if(result.trim().equalsIgnoreCase("failed")){%>
			alert('<bean:message bundle = "<%=errorLang%>" key = "1123"/>');
	<%}}%>
	<%
		if(request.getAttribute("enabledDisabledControls")!=null)
		{
			EnabledDisabledControls controls = (EnabledDisabledControls)request.getAttribute("enabledDisabledControls");
			ArrayList listDisable = controls.getListDisable();
			for(int i = 0 ; i<listDisable.size();i++)
			{
				%>
					//alert("<%=listDisable.get(i)%>");
					document.getElementById("<%=listDisable.get(i)%>").disabled = true;
				<%
			}
			ArrayList listReadonly = controls.getListReadOnly();
			for(int i = 0 ; i<listReadonly.size();i++)
			{
				%>
					//alert("<%=listReadonly.get(i)%>");
				document.getElementById("<%=listReadonly.get(i)%>").readOnly = true;
				<%
			}
			

		}
		//if(session.getAttribute("userType")!=null && session.getAttribute("userType").equals("B"))
		//{
		//	userType = (String)session.getAttribute("userType");

		//	if(readingMail.equals("Y")){
			%>
				//document.getElementById("send_Att_div").style.display ="block";
				
				
			if(!document.getElementById("send").disabled)
			{
				document.getElementById("send_Att_div").style.display ="block";
			}
			<%
					
			if(AdminName!=null){	%>
			AdminFlag="Y"
			<%}

		
		if(readingMail.equals("Y")){
			%>
				document.getElementById("recv_Att_div").style.display ="block";
				document.getElementById("send_Att_div").style.display ="none";
				
			
		<%}%>
		if(document.getElementById("send").disabled)
		{
			document.getElementById("recv_Att_div").style.display ="block";
		}
		if(recv_Att_div.style.display=="block" && isNull('document.forms[0]','attachedFiles')) 
		{
			document.getElementById("recv_Att_div").style.display ="none";
		}
		else
		{

			
			//var bar = "width = 300, height= 100, left=300, top=300 scrollbars=yes ";
			//var win = open("/BancMate/Mail/getAttachment.jsp" ,"child",bar);
		}//else ends
}//function ends

	function openAttachment()
		{
			var param = document.getElementById("attachedFiles").value;
			if(recv_Att_div.style.display=="block" && !isNull('document.forms[0]','attachedFiles')) 
			{
				//alert("file name :: "+param);
				document.forms[0].action="<%=request.getContextPath()%>/mail/mailComposeAction.do?action=executeOnAttachment";
				document.forms[0].method="post";
				document.forms[0].submit();
			}
			else
			{
				alert('<bean:message bundle = "<%=lang%>" key = "260"/>');
			}
				//var bar = "width = 800, height= 700, left=10, top=10 scrollbars=yes ";
				//		var win = open("/BancMate/Mail/getAttachment.jsp" ,"child",bar);
				//win.close();
		}

	function onDeleteInBox()
	{
		
				//alert("in delete method "+'<%=deleteRecord%>');
				document.getElementById('mailID').value='<%=deleteRecord%>,';
				document.forms[0].action="<%=request.getContextPath()%>/mail/mailInBoxAction.do?action=executeOnDelete";
				document.forms[0].method="post";
				document.forms[0].submit();
				//alert("id = "+id);
			
	}

	function resetField()
	{
		document.getElementById('toemail').value=""
		document.getElementById('ccemail').value=""
		document.getElementById('subject').value=""

	}

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
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" type="string" value="COMPOSE MAIL"/>
<tiles:put name="menu" value="../common/mail_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="../common/line.html"/>
<tiles:put name="page_header" type="String" >
<tiles:put name="menu_tab" value="../common/menu_tab.jsp?menumode=<%=menumode %>&src1=<%=menumode %>"/>
<tiles:put name="menu" value="../common/user_left.jsp?mode=Compose&src=Mail"/> <!-- Added by abhishek for mail work. -->
<font color="#99FF00"><%if(usrName!=null) out.print(usrName);%>!
</font>
<font color="white">
	<%
		if(readingMail.equals("Y"))
	{%>
		
		Read-Mail
	<%}
	else{%>
	Compose-Mail
	<%}%>
	</font>
</tiles:put>
<tiles:put name='content' type='String'>


<body topmargin="0"  onload="onLoadComposeMail()">
<html:form action="/mail/mailComposeAction?action=executeOnSubmit" enctype="multipart/form-data">
<input type="hidden" name="mailID" id="mailID">
<center>
<table border="0" CELLPADDING =0 cellspacing=0 width="527">
<TR>
<TD>
<table  width="100%" border="1" CELLPADDING =0 cellspacing=0 >
	<tr class="tbl_heading">
		<th colspan="7" align="center">
			<bean:message bundle="<%=lang%>" key="7297"/>
		</th>
	</tr>
	<tr>
	<TD>
<table align="center" width="100%" border="0">
	<tr>
		<td colspan="2"><hr></td>
	</tr>
	<!-- <%
	if(readingMail.equals("Y"))
	{ %>
	<tr>
		<td align="center"><bean:message bundle = "<%=lang%>" key = "549"/>:
		</td>
		<td><html:text property ="fromemail" styleId="fromemail" size="50" style="FONT-SIZE: 8pt; TEXT-TRANSFORM : none " /> </td>
	</tr>
	<%}%> -->
	<% if(usrName!=null)
	{ %>
	<tr>
		<td align="center"><!-- <bean:message bundle = "<%=lang%>" key = "549"/>: -->
		</td>
		<td><html:hidden property ="fromemail" styleId="fromemail" style="FONT-SIZE: 8pt; TEXT-TRANSFORM : none " /> </td>
	</tr>
	<tr>
		<td align="center"><bean:message bundle = "<%=lang%>" key ="107"/>:</td>
	    <td><html:text property ="toemail" styleId="toemail" size="50" style="FONT-SIZE: 8pt; TEXT-TRANSFORM : none"/> </td>
	</tr> 
	
	<tr>
		<td align="center"><bean:message bundle = "<%=lang%>" key ="7294"/>:</td>
		<td><html:text property ="ccemail" styleId="ccemail" size="50" style="FONT-SIZE: 8pt; TEXT-TRANSFORM : none"/>
		</td>
	</tr>
	<%}%>
	<tr>
		<td  align="center"><bean:message bundle = "<%=lang%>" key ="7293"/>:</td>
		<td><html:text property ="subject" styleId="subject" size="30" style="FONT-SIZE: 8pt; TEXT-TRANSFORM : none"/><input type ="button" class="Button" id ="reset" name="reset" 
		onclick="resetField()" value="<bean:message bundle = '<%=lang%>' key ='7000'/>" ></td>
	</tr>
	
	<tr>
		<td colspan="2"><hr></td>
	</tr>
	<tr>
		<td colspan="2">
			<div id ="send_Att_div" style="display:none; "><bean:message bundle = "<%=lang%>" key ="7295"/> Files :	<html:file property ="isFile"  styleId="isFile" size="35" />
			</div>
			<div id ="recv_Att_div" style="display:none; "> 
				<img src="/images/attach.gif"  onclick="openAttachment()"> 
				<html:text property ="attachedFiles" readonly = "true" styleId="attachedFiles" size="35" styleClass="LabelText" style="COLOR:blue;FONT-SIZE: 8pt; TEXT-TRANSFORM : none"/>
			</div>
		</td>
	</tr>
	
	 <tr>
		<td  align="center" colspan="2" >
			<b><bean:message bundle = "<%=lang%>" key ="286"/></b>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<html:textarea property="msg"  rows="10" cols="50"/>
		</td>
	</tr>
		
	<tr>
		<td colspan="2"><hr color="#a52a2a"></td>
	</tr>
	<tr>
		<td colspan="2"><br></td>
	</tr>
	<tr>
	<tr>
	
	
		<td align="center" colspan="2">
			<div id="divCompose" style="display:none;">
				<input type="button" class="Button" name = "back" id="back" value = "Back" onClick = "onCancelOutBox('<%=request.getContextPath()%>')">
				<input type ="button" id="send" class="Button" name="send" value="<bean:message bundle = '<%=lang%>' key ='7241'/>" onclick="onSubmitMail('<bean:message bundle = '<%=errorLang%>' key ='53'/>','<%=request.getContextPath()%>')">
				<%if(readingMail.equals("Y")){%>
				<input type="button" class="Button" name = "delete" id="delete" value = "<bean:message bundle = '<%=lang%>' key = '161'/>" onClick = "onDeleteInBox()">
				<input type ="button" class="Button" id ="reply" name="reply" value="<bean:message bundle = '<%=lang%>' key ='7300'/>"  onclick="replyFromCompose('<%=userType%>')">
				<%}%>
			</div>
			<div id="divReadMail" style="display:none;">
				<input type="button" class="Button" name = "delete" id="delete" value = "Back" onClick = "onCancelOutBox('<%=request.getContextPath()%>')">
				<%if(readingMail.equals("Y")){%>
				<input type="button" class="Button" name = "delete" id="delete" value = "<bean:message bundle = '<%=lang%>' key = '161'/>" onClick = "onDeleteInBox()">
				<input type ="button" class="Button" id ="reply" name="reply" value="<bean:message bundle = '<%=lang%>' key ='7300'/>"  onclick="replyFromCompose('<%=userType%>')">
				<%}%>
			</div>
			<div id="divReply" style="display:none;">
				<input type ="button" id="send" class="Button" name="send" value="<bean:message bundle = '<%=lang%>' key ='7241'/>" onclick="onSubmitMail('<bean:message bundle = '<%=errorLang%>' key ='53'/>','<%=request.getContextPath()%>')">
				<input type="button" class="Button" name = "delete" id="delete" value = "Back" onClick = "onBack()">
				<input type="button" class="Button" name = "delete" id="delete" value = "<bean:message bundle = '<%=lang%>' key = '161'/>" onClick = "onDeleteInBox()">
				
			</div>

		</td>
	
	
	</tr>
</table>
</TD></TR>
</TABLE>
</TD></TR>
</TABLE>
</center>
</html:form>
</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
</tiles:insert>
<script>
<%if(readingMail.equals("Y")){%>
	document.getElementById("divCompose").style.display="none";
	document.getElementById("divReadMail").style.display="block";
<%}else{%>
	document.getElementById("divCompose").style.display="block";
	document.getElementById("divReadMail").style.display="none";	
<%}%>
</script>
