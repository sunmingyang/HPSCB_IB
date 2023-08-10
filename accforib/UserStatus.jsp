<%@ include file="/common/Include.jsp" %>
<%
String AdminName=(String)session.getAttribute("AdminName");
String userlist[][]=null;
	String flag=null;
	if(session.getAttribute("userinfo")!=null){
		userlist=(String[][])session.getAttribute("userinfo");
}
%>
<script>
function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=StatusNew","child", bar);
}

function detailInfo()
{
    selectValue();	document.forms[0].action="/accforib/activate.do?action=getUserStatus";
	document.forms[0].submit();
}
function printpage()
{
window.print();
}
function backpage()
{
document.forms[0].action="<%=request.getContextPath()%>/navigate.do?action=executeOpen&src=userStatuslog&dest=back";
		document.forms[0].submit();

}


function disUser()
{	
	document.getElementById("flag").value="User";
	document.getElementById("brncode").value="";
	   Admin.style.display="none";
	   User.style.display="block";
}
function disAdmin()
{
	document.getElementById("flag").value="Admin";
	 Admin.style.display="block";
	 User.style.display="none";
}
function first()
{		
		if(document.getElementById("radio1").checked==true)
		{
			Admin.style.display="none";
	        User.style.display="block";
		}
	if(document.getElementById("radio2").checked==true)
		{	
			Admin.style.display="block";
			User.style.display ="none";
		}
}
function selectValue(){
	if(document.getElementById("userStatus").value=="All")
   document.getElementById("userid").disabled=true;
else
	document.getElementById("userid").disabled=false;
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
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=reports"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=UserStatusReport&src=reports"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>

<tiles:put name="content" type="String">
<html:form action= "/accforib/activate">
<body  onload="first()"> <!-- onload="javascript:makeScrollableTable('tabela','false','auto')" > --> <br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > Reports  >>  User Status Report </td>
	</tr>
	<tr>
		<td align="center">

  <table  cellpadding="0" cellspacing="0"  width=491 class="miniStmtBackBorder">
		<tr class="miniStmtBack">
	         <td width="100%" > 
			
			 <table align="center" border ="0" width="100%">
				<tr>
			 <td></td><td class="normalText">
		      User ID<html:radio property="flag" value="User"  styleId="radio1" onclick="disUser()"/>
		    
		      &nbsp;&nbsp;Admin ID<html:radio property="flag" value="Admin" onclick="disAdmin()" styleId="radio2"  />
		</td>
			 </tr>
				<tr>
					<td class="normalText">
						Branch Code
					</td>
					<td>
						:&nbsp;<html:text property="brncode" maxlength="5"/>
					</td>
				</tr>
				<tr>
					<td class="normalText" id="User">
						User ID
					</td>
					<td class="normalText"id="Admin">
						Admin ID
					</td>
					<td>
						:&nbsp;<html:text property="userid" styleId="userid" maxlength="15"/>
					</td>
			 	 </tr>
				 <tr>
					<td class="normalText">
						Specify User Status
					 </td>
					 <td>:&nbsp;<html:select property="userStatus" styleId="userStatus" onblur="selectValue()">
						 <html:option value="activated">Activated</html:option>
						 <html:option value="deactivated">Deactivated</html:option>
						 <html:option value="created">created</html:option>
						 <html:option value="Locked">Locked</html:option>
						 <html:option value="All">All</html:option>
					</html:select>				 
					 </td>
					 <td align="left">
					 <input type="button" name="Detail" value="Detail" onclick="detailInfo()"/>
					 </td>
				 </tr>
				<tr>
					<td colspan="3">
					<%
			if(userlist!=null){
				for(int i=0;i<userlist.length;i++){
					if(i==0){
			%>
			<br>
			<div id="Coin1"  align="left" style="overflow:auto;display:block;width:450px;height:150px;">
			<table border="2" bordercolor="#ffffff" align="center" width="90%" cellpadding="0" cellspacing="0" id="table">
				<TR>
						  <TD class="dataTableTH">
						  <bean:message bundle="hindi" key= "2010"/></TD>
  					      <TD class="dataTableTH">Branch Code</TD>
					      <TD class="dataTableTH">User Name</TD>
						  <TD class="dataTableTH"><bean:message bundle="hindi" key= "1027"/></TD>
  					      <TD class="dataTableTH">IB Status </TD>
					</tr>
				
			<%}%>	
				<tbody>
					<tr  <%out.println(i%2==0?"class=trforReportRow1":"class=trforReportRow2");%>>
						<td  align="center" class="dataTableTD"><%=i+1%></td>
						<td class="dataTableTD"><%= userlist[i][3]%></td>
						<td class="dataTableTD"><%= userlist[i][0]%></td>
						<td class="dataTableTD"><%= userlist[i][1]%></td>
						<%if(userlist[i][2].equals("C")){%>
						<td class="dataTableTD">Created</td>
						<%}%>
						<%if(userlist[i][2].equals("A")){%>
						<td class="dataTableTD">Activated</td>
						<%}%>
						<%if(userlist[i][2].equals("D")){%>
						<td class="dataTableTD">Deactivated</td>
						<%}%>
						<%if(userlist[i][2].equals("L")){%>
						<td class="dataTableTD">Locked</td>
						<%}%>
					<% if(i==userlist.length-1){%>
						</table>		
						</div>
					<%	}
					}
					} %>
				<table border="0" width="100%">
				<tr>
					<td align="center" colspan="2">
						<!-- <input type="button" name="back"  value="Back To Menu" onclick="backpage()" class="button"/> -->
						<input   value="<bean:message bundle='<%=lang%>' key='33'/>" type="button" tabindex="5" onclick="helpopen()"/>
	
					<%if(userlist!=null){%>
					<input type="button" name="Print1" onclick="printpage()" value="Print">
					<%}%>
					</td>
				</tr>	
				</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<div id="diverrmessage">
							<logic:messagesPresent property="NoRecord">
								<font color="Red" face="verdana"><html:errors property="NoRecord"/></font>
							</logic:messagesPresent>
							<logic:messagesPresent property="invalidbranch">
								<font color="Red" face="verdana"><html:errors property="invalidbranch"/></font>
							</logic:messagesPresent>
							<logic:messagesPresent property="invaliduser">
								<font color="Red" face="verdana"><html:errors property="invaliduser"/></font>
							</logic:messagesPresent>
						</font>
						</div>
					</td>
					</tr>
				</table>
			 </td>
		 </tr>
</table>	
</td>
</tr>
</table>
</body>
</html:form>
</tiles:put>
</tiles:insert>