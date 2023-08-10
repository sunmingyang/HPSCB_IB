	<%@ include file="/common/Include.jsp" %>
	<script language="JavaScript" src="/jsp/scripts/chng_pass.js"></script>
	<script language="JavaScript" src="/scripts/MD5.js"></script>  
	<% 
	String userName ="",sMode="";
	if(session.getAttribute("user")!=null){
	userName = (String)session.getAttribute("user");
	}
	String AdminName=(String)session.getAttribute("AdminName");
	System.out.println("AdminName----"+AdminName);
	String custRole=(String)session.getAttribute("custRole");
	String acsuserId [][] = null ;  
	if(session.getAttribute("acslist")!=null){
		acsuserId = (String[][])session.getAttribute("acslist");
		System.out.println("CORPORATE USER  LIST ----"+acsuserId[0][0]);
	} 

	if(request.getParameter("sMode")!=null){
	sMode = (String)request.getParameter("sMode");
	System.out.println("In Corporate BAnking password change mode is::"+sMode);
	}  
	String  date=DateTimeFunction.getIbDateTime();
		date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);

	 
	%>

	<script>
	var urlmode = '<%=sMode%>';
	function helpopen()
	{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=usechange","child", bar);
	}
	function CheckPassword()
	{ 
	var oldpassLen=document.getElementById("sOld_Pass").value ;
	var newpassLen=document.getElementById("sNew_Pass").value ;

	if(document.getElementById("sNew_Pass").value=="")
	{
	alert("Please Fill PassWord");
	document.getElementById("sNew_Pass").focus();

	}
	else if(document.getElementById("sOld_Pass").value==document.getElementById("sNew_Pass").value){
	alert("Old PassWord and New PassWord are same Please Change New PassWord");
	document.getElementById("sNew_Pass").value=""
	document.getElementById("sNew_Pass").focus();
	return false;
	}
	else if(newpassLen.length<8){
	alert("Password Length Should be of 8 Charecter");	
	document.getElementById("sNew_Pass").value=""
	document.getElementById("sNew_Pass").focus();
	return false;
	}

	else if(document.getElementById("sNew_Pass").value !=
	document.getElementById("sCon_Pass").value)
	{
	alert("Pass Word Not Match");
	document.getElementById("sCon_Pass").value="";
	document.getElementById("sNew_Pass").focus();
	return false;
	}
	}
	function submitpage(mode)
	{ 
	 
	var oldpassLen=document.getElementById("sOld_Pass").value ;
	var newpassLen=document.getElementById("sNew_Pass").value ;
	if(document.getElementById("sOld_Pass").value=="")
	{
	alert("Please Fill PassWord");
	document.getElementById("sOld_Pass").focus();
	return false;
	}
	else if(document.getElementById("sNew_Pass").value=="")
	{
	alert("Please Fill New PassWord");
	document.getElementById("sNew_Pass").focus();
	return false;
	}
	else if(document.getElementById("sCon_Pass").value=="")
	{
	alert("Please Fill Conform passWord");
	document.getElementById("sCon_Pass").focus();
	return false;
	}

	else if(document.getElementById("sOld_Pass").value==document.getElementById("sNew_Pass").value){
	alert("Old PassWord and New PassWord are same Please Change New PassWord");
	document.getElementById("sNew_Pass").value=""
	document.getElementById("sNew_Pass").focus();
	return false;
	}
	else if(newpassLen.length<8){
	alert("Password Length is minimum of 8 Charecter");
	document.getElementById("sNew_Pass").value=""
	document.getElementById("sNew_Pass").focus();
	return false;
	}
	else if(document.getElementById("sNew_Pass").value=="")
	{
	alert("Please Fill PassWord");
	document.getElementById("sNew_Pass").focus();
	return false;
	}
	else if( document.getElementById("sNew_Pass").value!=
	document.getElementById("sCon_Pass").value)
	{	alert("Pass Word Not Match");
	document.getElementById("sCon_Pass").value=""; 
	document.getElementById("sNew_Pass").value="";
	document.getElementById("sNew_Pass").focus();
	return false;
	}

	else{
			if(mode ==='CorpBanking') {
				document.forms[0].action="/jsp/login.do?action=passWordChange&sMode=changeForCB"; 
				document.forms[0].submit();
			} else {
		 		document.forms[0].action="/jsp/login.do?action=passWordChange&sMode=changeForIB"; 
				document.forms[0].submit();
			}
		}
	}
	function goback()
	{
	document.forms[0].action="<%=request.getContextPath()%>/navigate.do?action=executeOpen&src=useridchange&dest=back";
	document.forms[0].submit();

	}
	function setencyPass(id)
	{
	
	document.getElementById(id).value= calcMD5(document.getElementById(id).value);;
	}
	</script>
	<tiles:insert page="/common/siteLayout.jsp" flush="true">

	<tiles:put name="title" value="PassWord Change"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
	<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=set"/>
	<tiles:put name="page_header" type="String">
	<font color="#99FF00"><b><%if(userName!=null) out.print(userName);%>!</b></font>
	<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>
	&nbsp;&nbsp;&nbsp;Password Change 
	</tiles:put>

	 <%if(sMode.equals("CorpBanking")){%>  
	<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking"/>
<%} else {%> 
		<tiles:put name="menu" value="/common/user_left.jsp?src=set"/>
	<%}%> 
	<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
	<tiles:put name="content" type="String">
	<html:form action= "/jsp/login">
	<div border="10 px:solid" style="
	border: 1px solid black; 
	border-radius: 20px;
	">
	<% if( custRole.equals("A") || custRole.equals("C")) { %>
	<table width = "100%"><tr><td align = "left">
	<p  id = "label" ><u style="
	color: blue;
	"> <B>Change Password</B>  </td> 
	</u>

	</td >
	<td align = "right"> <p><u style="
	color: blue;
	"> <B><%=date%></B></td></tr>
	</br>
	<tr>

	<table width="575" cellpadding="0" cellspacing="0"  class="miniStmtBackBorder">
	<tr class="userIdhangeBack">
	<!-- 		<td class="useridchangeimage" >&nbsp;</td> -->
	<td style="padding-left:85px"  > 

	<table align="center" border=0 bordercolor="#E0E0E0" cellspacing=2 cellpadding=0>
	<tr>
	<td colspan = "2">	<html:hidden property="sIbUsr_LogId" styleId="sIbUsr_LogId"  value='<%=AdminName%>' /> </td>
	</tr>

	<tr>
	<td colspan = "2">	<html:hidden property="sIbUsr_PassType" styleId="sIbUsr_PassType"  value='LoginPass' /> </td>
	</tr>
	<tr>
	<td class="normalHeadText" align="right" >
	Password :
	</td>
	<td align="left">
	<html:password property="sOld_Pass" styleId="sOld_Pass"  onkeypress="alphaNumWithoutSpace(this.event)" onchange="setencyPass(this.id);" tabindex="1"/>
	</td>
	</tr>
	<tr>
	<td class="normalHeadText" align="right" >
	New Password :
	</td>
	<td align="left">
	<html:password property="sNew_Pass" styleId="sNew_Pass" tabindex="2"  onchange="setencyPass(this.id);" onkeypress="alphaNumWithoutSpace(this.event)"/>
	</td>
	</tr>
	<tr>
	<td class="normalHeadText" align="right" >
	Conform Password :
	</td>
	<td align="left">
	<html:password property="sCon_Pass"  styleId="sCon_Pass" onchange="setencyPass(this.id);" onblur="CheckPassword()" tabindex="3" onkeypress="alphaNumWithoutSpace(this.event)"/>
	</td>
	<td align="left">

	</td>
	</tr>
	<tr><td></td>
	<td align="left" >
	<input type="Button" name="Save"  class = "Button" value="    Save   " onclick="submitpage('<%=sMode%>')" tabindex="4" >
	<input    class = "Button"  value="   <bean:message bundle='<%=lang%>' key='87'/>    " type="button" tabindex="5" style="width:100px" onclick="goback()"/>
	</td>
	</tr>
	</table>	 
<%}%>

<% if (custRole.equals("F")) { %>
	<table width="575" cellpadding="0" cellspacing="0"  class="miniStmtBackBorder">
	<tr class="userIdhangeBack">
	<!-- 		<td class="useridchangeimage" >&nbsp;</td> -->
	<td style="padding-left:85px"  > 

	<table align="center" border=0 bordercolor="#E0E0E0" cellspacing=2 cellpadding=0>
	<tr>

	<% if(sMode.equals("CorpBanking"))
	{%>
	<td class="normalHeadText" align="right" >
	User Id
	</td>
	<td><html:select property="sIbUsr_LogId" styleId="sIbUsr_LogId"  value='<%=AdminName%>'>
	<% 	if(session.getAttribute("acslist")!=null)
	for(int l=0;l<acsuserId.length;l++)	{ 
	String	acsName =acsuserId[l][1]; %>
	<html:option value='<%=acsName%>'><%=acsName%></html:option>

	<%}%></html:select></td> <%}%> 
	<% if(sMode.equals("") || custRole.equals("A") || custRole.equals("C")) {%>
	<td colspan = "2">	<html:hidden property="sIbUsr_LogId" styleId="sIbUsr_LogId"  value='<%=AdminName%>' /> </td>
	<%}%> 


	</tr>

	<tr>

	<% if(sMode.equals("CorpBanking"))
	{%>
	<td class="normalHeadText" align="right" >
	Change Password For
	</td>
	<td><html:select property="sIbUsr_PassType" styleId="sIbUsr_PassType">
	<html:option value='LoginPass'>Login</html:option>
	<html:option value='TranPass'>Transaction</html:option>
	</html:select>
	</td> <%}%> 
	</tr>
	<tr>
	<td class="normalHeadText" align="right" >
	Password :
	</td>
	<td align="left">
	<html:password property="sOld_Pass" styleId="sOld_Pass"  onkeypress="alphaNumWithoutSpace(this.event)" onchange="setencyPass(this.id);" tabindex="1"/>
	</td>
	</tr>
	<tr>
	<td class="normalHeadText" align="right" >
	New Password :
	</td>
	<td align="left">
	<html:password property="sNew_Pass" styleId="sNew_Pass" tabindex="2"  onchange="setencyPass(this.id);" onkeypress="alphaNumWithoutSpace(this.event)"/>
	</td>
	</tr>
	<tr>
	<td class="normalHeadText" align="right" >
	Conform Password :
	</td>
	<td align="left">
	<html:password property="sCon_Pass"  styleId="sCon_Pass" onchange="setencyPass(this.id);" onblur="CheckPassword()" tabindex="3" onkeypress="alphaNumWithoutSpace(this.event)"/>
	</td>
	<td align="left">

	</td>
	</tr>
	<tr><td></td>
	<td align="left" >
	<input type="Button" name="Save"  class = "Button" value="    Save   " onclick="submitpage('<%=sMode%>')" tabindex="4" >
	<input    class = "Button"  value="   <bean:message bundle='<%=lang%>' key='87'/>    " type="button" tabindex="5" style="width:100px" onclick="goback()"/>
	</td>
	</tr>
	</table>	 
<%}%>
	<div id="diverrmessage" class="normalHeadText" align="center">
	<font color="#0066FF">
	<logic:messagesPresent property="PassWordSave">
	<U>PassWord Save Successfully</U>
	<script>
	if(!(mode ==='CorpBanking')) {
		alert("PassWord Changed Successfully \n Kindly Login Again.");			
		document.forms[0].action="/jsp/login.do?action=ibUsrLogout";
		document.forms[0].submit();
	} else {
		alert("PassWord Changed Successfully \n Kindly Login Again.");
	}
	</script>
	</logic:messagesPresent>
	<logic:messagesPresent property="PassWordNotMatch">
	<U>PassWord Not Match</U>
	</logic:messagesPresent>
	<logic:messagesPresent property="oldPassWordNotMatch">
	<U>Old PassWord Is Wrong</U>
	</logic:messagesPresent>				
	<logic:messagesPresent property="error">
	<U>Fatal Error</U>
	</logic:messagesPresent>
	<logic:messagesPresent property="LoginandTranSame">
	<U>Login and Tran Password Cannot be Same</U>
	</logic:messagesPresent>
	</font>
	</div>		
	</td>
	</tr>
	</table>
	</div>
	</div>
	</table>
	</html:form>
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	</tiles:insert>