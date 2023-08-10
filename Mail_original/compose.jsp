<%@ include file = "/common/Include.jsp"%>

<!--File include section........................starts..-->
			<%@ page import ="easycbs.common.mail.common.EnabledDisabledControls"%>
			<%@ page import ="java.io.*"%>
			<%@ page import ="java.util.ArrayList"%>
			<%@ page import ="java.lang.reflect.Method"%>
			<%@ page import ="java.net.*"%>
<!--File include section........................ends.-->

<% String result="";
	String userType = "";
%>

<script language="javaScript" src="<%=request.getContextPath()%>/Mail/JS/mail.js"></script>
<script>
	function onLoadComposeMail(){
	<%if(request.getAttribute("operation")!=null){
		result=(String)request.getAttribute("operation");
		if(result.trim().equalsIgnoreCase("success")){%>
			alert('<bean:message bundle = "<%=errorLang%>" key = "1122"/>');
		<%}else if(result.trim().equalsIgnoreCase("failed")){%>
			alert('<bean:message bundle = "<%=errorLang%>" key = "1123"/>');
	<%}}%>
<%
		if(request.getAttribute("enabledDisabledControls")!=null){
			EnabledDisabledControls controls = (EnabledDisabledControls)request.getAttribute("enabledDisabledControls");
			ArrayList listDisable = controls.getListDisable();
			for(int i = 0 ; i<listDisable.size();i++){
				%>
					//alert("<%=listDisable.get(i)%>");
					document.getElementById("<%=listDisable.get(i)%>").disabled = true;
				<%
			}
			ArrayList listReadonly = controls.getListReadOnly();
			for(int i = 0 ; i<listReadonly.size();i++){
				%>
					//alert("<%=listReadonly.get(i)%>");
				document.getElementById("<%=listReadonly.get(i)%>").readOnly = true;
				<%
			}
			

		}else{ %>
			document.getElementById("reply").disabled = true;
		<% }
		if(session.getAttribute("userType")!=null && session.getAttribute("userType").equals("B")){
			userType = (String)session.getAttribute("userType");
			%>if(!document.getElementById("send").disabled){
				document.getElementById("send_Att_div").style.display ="block";
			}
				<%
		}

%>
		if(document.getElementById("send").disabled){
			document.getElementById("recv_Att_div").style.display ="block";
		}
		if(recv_Att_div.style.display=="block" && isNull('document.forms[0]','attachedFiles')) {
			document.getElementById("recv_Att_div").style.display ="none";
		}
		else{

			alert("after executeOnAttachment");
				//var bar = "width = 300, height= 100, left=300, top=300 scrollbars=yes ";
				//var win = open("/BancMate/Mail/getAttachment.jsp" ,"child",bar);
}//else ends
}//function ends

	function openAttachment(){
		var param = document.getElementById("attachedFiles").value;
		if(recv_Att_div.style.display=="block" && !isNull('document.forms[0]','attachedFiles')) {
			//alert("file name :: "+param);
			document.forms[0].action="<%=request.getContextPath()%>/mail/mailComposeAction.do?action=executeOnAttachment";
			document.forms[0].method="post";
			document.forms[0].submit();
		}else{
			alert('<bean:message bundle = "<%=lang%>" key = "260"/>');
		}
			//var bar = "width = 800, height= 700, left=10, top=10 scrollbars=yes ";
			//		var win = open("/BancMate/Mail/getAttachment.jsp" ,"child",bar);
			//win.close();
	}
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="menu" value="../common/mail_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="../common/line.html"/>
<tiles:put name="page_header" type="String" >
<bean:message bundle='<%=lang%>' key='7213' />
</tiles:put>
<tiles:put name='content' type='String'>


<body topmargin="0"  onload="onLoadComposeMail()">
<html:form action="/mail/mailComposeAction?action=executeOnSubmit" enctype="multipart/form-data">

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
<table align="center" width="100%">
<tr><td colspan="2"><hr></td></tr>
	<tr>
		<td align="center"><bean:message bundle = "<%=lang%>" key = "549"/>:
		</td>
		<td><html:text property ="fromemail" styleId="fromemail" size="50" style="FONT-SIZE: 8pt; TEXT-TRANSFORM : none " /> </td>
	</tr>
	<tr>
		<td align="center"><bean:message bundle = "<%=lang%>" key ="107"/>:</td>
	    <td><html:text property ="toemail" styleId="toemail" size="50" style="FONT-SIZE: 8pt; TEXT-TRANSFORM : none"/> </td>
	</tr>
	<tr>
		<td align="center"><bean:message bundle = "<%=lang%>" key ="7294"/>:</td>
		<td><html:text property ="ccemail" styleId="ccemail" size="50" style="FONT-SIZE: 8pt; TEXT-TRANSFORM : none"/></td>
	</tr>
	<tr>
		<td  align="center"><bean:message bundle = "<%=lang%>" key ="7293"/>:</td>
		<td><html:text property ="subject" styleId="subject" size="30" style="FONT-SIZE: 8pt; TEXT-TRANSFORM : none"/></td>
	</tr>
	
<tr><td colspan="2"><hr></td></tr>
<tr><td colspan="2"><div id ="send_Att_div" style="display:none; "><bean:message bundle = "<%=lang%>" key ="7295"/> Files :	<html:file property ="isFile"  styleId="isFile" /></div>
<div id ="recv_Att_div" style="display:none; "> 
<img src="../images/attach1.bmp"  onclick="openAttachment()"> 
<html:text property ="attachedFiles" readonly = "true" styleId="attachedFiles" size="50" styleClass="LabelText" style="COLOR:blue;FONT-SIZE: 8pt; TEXT-TRANSFORM : none"/></div>
			</td></tr>
	
	 <tr>
		<td  align="center" colspan="2" ><b>
		<bean:message bundle = "<%=lang%>" key ="286"/></b></td>
	</tr>
	 <tr>
		<td colspan="2" align="center">
		<html:textarea property="msg" styleId="msg" rows="10" cols="50"/></td>
		</tr>
		
<tr><td colspan="2"><hr color="#a52a2a"></td></tr>
<tr><td colspan="2"><br></td></tr>
	<tr>
		<tr>
			<td colspan="2" align="center">
<input type ="button" id="send" class="Button" name="send" value="<bean:message bundle = '<%=lang%>' key ='7241'/>" onclick="onSubmitMail('<bean:message bundle = '<%=errorLang%>' key ='53'/>','<%=request.getContextPath()%>')">
			<input type ="button" class="Button" id ="reset" name="reset" value="<bean:message bundle = '<%=lang%>' key ='7000'/>" >
			<input type ="button" class="Button" id ="reply" name="reply" value="<bean:message bundle = '<%=lang%>' key ='7300'/>"  onclick="replyFromCompose('<%=userType%>')">
			<input type ="button" class="Button" id="cancel" name="cancel" value="<bean:message bundle = '<%=lang%>' key ='87'/>"  onclick = "onCancelCompose('<%=request.getContextPath()%>')">
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

