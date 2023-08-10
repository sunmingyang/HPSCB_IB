activation<%@ include file="/common/Include.jsp" %>
<%
String AdminName=(String)session.getAttribute("AdminName");

	String userlist[][]=null;
	int discrtl=0;
	String flag=null;
	if(session.getAttribute("userinfo")!=null){
		userlist=(String[][])session.getAttribute("userinfo");
		
}
%>
<script language="JavaScript" src="/accforib/scripts/AccForIB.js"></script>
<script>
function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=UserActive","child", bar);
}
	function activate()
	{
		document.forms[0].action="/accforib/activate.do?action=saveUserInfo";
		document.forms[0].submit();
	}
	
	
	
	function onloadfun()
	{
		
		<%
			if(request.getAttribute("flag")!=null)
			{
				flag=(String)request.getAttribute("flag");
			%>
				document.getElementById("flag").value='<%=flag%>';
			<%}	%>
		//		alert(document.getElementById("flag").value)
				if(document.getElementById("flag").value=="deactivate")
				document.getElementById("save").value="Deactivate";
				else if(document.getElementById("flag").value=="AdminBanned")
				document.getElementById("save").value="Deactivate";
		//	makeScrollableTable('tabela','false','auto')
				<logic:messagesPresent property="saved">		
					document.getElementById("maindiv").style.display="none";
					document.getElementById("subdiv").style.display="block";
					document.getElementById("subdiv1").style.display="none";
				</logic:messagesPresent>
	}



	function activateacc()
	{
		alert("inside activateacc") ;
		var cnt=0;
		<%
			System.out.println("vinay:" + userlist);
			if(userlist!=null){
				
		for(int i=0;i<userlist.length;i++){
			if(userlist[i][2].equals("A") )
		discrtl++;
	}
		for(int i=0;i<userlist.length;i++)
		{
		%>
			if(document.getElementById("check<%=i%>").checked)
			{
				cnt++;
			}
		<%}%>
		var disableCnt='<%=discrtl%>';

		if(cnt>disableCnt)
		{
			document.getElementById("save").disabled=false;
			document.getElementById("length").value='<%=userlist.length%>';
		}
		else
		{
			document.getElementById("save").disabled=true;
		}
		<%}%>
	}
	function deactivateacc()
	{
		var count=0;
		<%
			if(userlist!=null){
		for(int i=0;i<userlist.length;i++)
		{
		%>
			if(document.getElementById("check<%=i%>").checked==true)
			{
				count=1;
			}
		<%}%>
			if(count==1)
			{	
				document.getElementById("save").disabled=false;
				document.getElementById("length").value='<%=userlist.length%>';
			}
			else
				document.getElementById("save").disabled=true;
		<%}%>
	}
	function backpage()
	{
		document.forms[0].action="<%=request.getContextPath()%>/navigate.do?action=executeOpen&src=usractivation&dest=back";
		document.forms[0].submit();
	}
	function gocon()
	{
		var fl=document.getElementById("flag").value;
		document.forms[0].action="/openaction.do?src="+fl;
		//alert(document.forms[0].action);
		document.forms[0].submit();
	}
	function checklen()
	{
		//alert("called");
		if(document.getElementById("userid").value!="")
		{
			document.getElementById("button").disabled="false";
		}
		else
		{
			document.getElementById("button").disabled="true";
		}
	}

	function getDetail()
	{
			//alert(document.getElementById("windowname").value);
				if(document.getElementById("windowname").value=="AdminBanned"){
					if(document.getElementById("userid").value=='<%=AdminName%>'){
						alert("Admin cannot banned himself");
						}
			   else  acclist();		
			   }else acclist();
	}
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>
</tiles:put>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=zoRoMasterEntry"/>
<%if(request.getAttribute("flag")!=null)
{
	if(flag.equals("activate")){%>
		<tiles:put name="menu" value="/common/user_left.jsp?mode=userActivation&src=userOperation"/>
	<%
	}else if(flag.equals("deactivate")) {%>
		<tiles:put name="menu" value="/common/user_left.jsp?mode=userDeActivation&src=userOperation"/>
	<%}
		else if(flag.equals("AdminBanned")) {%>
		<tiles:put name="menu" value="/common/user_left.jsp?mode=userBaned&src=userOperation"/>
	<%}
}%>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<html:form action= "/accforib/activate">

<body onload="onloadfun()"><br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > 
		<%if(request.getAttribute("flag")!=null)
		{
			if(flag.equals("activate")){%>
				User Operation >>  User Activation
		<%
		}	else if(flag.equals("deactivate")) {%>
				User Operation >>  User Deactivation
			<%}
			else if(flag.equals("AdminBanned")) {%>
				User Operation >>  Admin Baned
			<%}
		}%> <input type="hidden" name ="windowname" id="windowname" value='<%=flag%>' > </td>
	</tr>
	<tr>
		<td align="center">

  <table  cellpadding="0" cellspacing="0" BORDER=0 width=491 bordercolor="brown">
		<tr >
         <td width="100%" height="59"> 
		 <br><div id="maindiv">
			<table width="100%" class="miniStmtBackBorder"><tr class="miniStmtBack"><td>
			<table width="100%">
				<tr >
					<td class="normalText" align="left" width="100"> 
						Branch Code</td>
				    <td align="left">
						:&nbsp;<html:text  property="brncode" size="20" maxlength="20" tabindex="1" /><!-- onkeypress="checklen()"/> --> 
						
			        </td>
			    
				</tr>
				<tr>
					<td class="normalText" align="left" width="100"> 
						<%if(request.getAttribute("flag")!=null)
						{
							if(flag.equals("AdminBanned")){%>
								Admin Id
						<%
						}	else  {%>
								User Id
							<%}
							
						}%>
		</td>

				    <td align="left">
						:&nbsp;<html:text  property="userid" styleId="userid" size="20" maxlength="20" tabindex="2" /><!-- onkeypress="checklen()"/> --> 
						 <html:hidden property="flag" styleId="flag"/>
			        </td>
				    <td>
						<input name="button" type="button"
						onClick="getDetail()" tabindex="3" value='<bean:message bundle="<%=lang%>" key="940"/>' > <!-- disabled> -->
						<html:hidden property="length" styleId="length" />
					</td>
				</tr>
			</table></td></tr></table>
			<%
			if(userlist!=null){
				for(int i=0;i<userlist.length;i++){
					if(i==0){
			%>
			<br>
<table border="2" bordercolor="#ffffff" align="center" width=491 cellpadding="0" cellspacing="0">
    <tr> 
		<TD class="dataTableTH">
			<bean:message bundle="hindi" key= "2010"/></TD>
		<TD class="dataTableTH">
			Branch Code	  </TD>
		<TD class="dataTableTH">
			User Name	  </TD>
		<TD class="dataTableTH">
			<bean:message bundle="hindi" key= "1027"/> </TD>
  		<TD class="dataTableTH">
			IB Status     </TD>
	</tr>
<%}%>	
				<tbody>
					<tr>
						<td  align="center" class="dataTableTD"><%=i+1%></td>
						<td class="dataTableTD"><%= userlist[i][3]%></td>
						<td class="dataTableTD"><%= userlist[i][0]%></td>
						<td class="dataTableTD"><%= userlist[i][1]%></td>
						<%if(userlist[i][2].equals("C")){%>
						<td class="dataTableTD"><!-- <input type="checkbox"  name="check<%=i%>" onclick="activateacc()"> -->Created</td>
						<%}%>
						<%if(userlist[i][2].equals("A")){%>
						<td class="dataTableTD">
						<%if(flag.equals("activate")){%>
							<!-- <input type="checkbox"  name="check<%=i%>" checked disabled> -->Activated
						<%}else if(flag.equals("deactivate")) {%>
							<!-- <input type="checkbox"  name="check<%=i%>" onclick="deactivateacc()"> -->Activated
							<%}
							else if(flag.equals("AdminBanned")) {%>
							<!-- <input type="checkbox"  name="check<%=i%>" onclick="deactivateacc()"> -->Activated
							<%}%>
						</td>
						<%}%>
						<%if(userlist[i][2].equals("D")){%>
						<td class="dataTableTD"><!-- <input type="checkbox"  name="check<%=i%>" onclick="activateacc()"> -->Deactivated</td>
						<%}%>
						<%if(userlist[i][2].equals("L")&& !(flag.equals("AdminBanned"))){%>
						<td class="dataTableTD"><!-- <input type="checkbox"  name="check<%=i%>" onclick="activateacc()"> -->Activated(Locked)</td>
						<%}%>
						<%if(userlist[i][2].equals("L")){%>
						<td class="dataTableTD"><!-- <input type="checkbox"  name="check<%=i%>" onclick="activateacc()"> -->Deactivate(Locked)</td>
						<%}%>






						<%if(userlist[i][2].equals("C")){%>
						<td class="dataTableTD">*1<input type="checkbox"  name="check<%=i%>" id="check<%=i%>" onclick="activateacc()"></td>
						<%}%>
						<%if((userlist[i][2].equals("A")) || (userlist[i][2].equals("L"))){%>
						<td class="dataTableTD">
						<%if(flag.equals("activate")){%>
							*2<input type="checkbox"  name="check<%=i%>" checked disabled>
						<%}else if(flag.equals("deactivate")) {%>
							<input type="checkbox"  name="check<%=i%>" onclick="deactivateacc()">
							<%}
						else if(flag.equals("AdminBanned")&& userlist[i][2].equals("A")) {%>
						    *3<input type="checkbox"  name="check<%=i%>" onclick="deactivateacc()">
							<%}
						else if(flag.equals("AdminBanned") && userlist[i][2].equals("L")) {%>
							*4<input type="checkbox"  name="check<%=i%>" checked disabled>
							<%}%>
						</td>
						<%}%>
						<%if(userlist[i][2].equals("D")){%>
						<td class="dataTableTD">
						<%if(flag.equals("activate")){%>
						<input type="checkbox"  name="check<%=i%>" onclick="activateacc()">
						<%}else if(flag.equals("deactivate")) {%>
						<input type="checkbox"  name="check<%=i%>" checked disabled>
						<%}
						else if(flag.equals("AdminBanned")) {%>
						<input type="checkbox"  name="check<%=i%>" checked disabled>
						<%}%>
						</td>
						<%}%>
					<% if(i==userlist.length-1){%>
						</table>		
					<%	}
					}
					} %>
					</div>
				
					<div id="diverrmessage">

					<logic:messagesPresent property="saved">
						<center>
						<font color="Green" face="verdana">Record saved successfully </center> 
						</font>
						<!-- <script>
							document.getElementById("maindiv").style.display="block";
							document.getElementById("subdiv").style.display="block";
						</script> -->
					</logic:messagesPresent>
				</font>

					<logic:messagesPresent property="NoRecord">
						<font color="red" face="verdana"><html:errors property="NoRecord"/></font>
					</logic:messagesPresent>
					<logic:messagesPresent property="invaliduser">
						<font color="red" face="verdana"><html:errors property="invaliduser"/>
					</logic:messagesPresent>
					<logic:messagesPresent property="invalidbranch">
						<font color="red" face="verdana">Invalid Branch Code</font>
					</logic:messagesPresent>
				</font>
				</div>
			<div id="subdiv1">
			<br>
				<table border="0" width="100%">
				<tr>
					<td align="center" colspan="2">
						<!-- <input type="button" name="back1"  value="Back To Menu" onclick="backpage()" />   -->
						<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " type="button" onclick="helpopen()"/>
					
						<input type="button" name="save" id="save" onclick="activate()" value="Activate" disabled >
					</td>
				</tr>	
				</table>
			</div>
			<div id="subdiv" style="display:none;">
				<table border="0" width="100%">
				<tr>
					<td align="center" colspan="2" >
						<!-- <input type="button" name="back2"  value="Back To Menu" onclick="backpage()" class="button"/>  -->
						<input type="button" name="continue" value="Continue <%=flag%>" onclick="gocon()" >
					 </td>	
					
				</tr>	
				</table>
			</div>

			</td>
		</tr>
		<tr>
			<td>
				
			</td>
		</tr>
	</table>
</td>
</tr>
</table>
</html:form>
</tiles:put>
</tiles:insert>