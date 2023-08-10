<%@ include file="/common/Include.jsp" %>
<%
	String AdminName=(String)session.getAttribute("AdminName");
	String userlocklist[][]=null;
	String flag=null;
	if(session.getAttribute("userlocklist")!=null){
		userlocklist=(String[][])session.getAttribute("userlocklist");
		System.out.println("Length: "+userlocklist.length);
}
//System.out.println("Length: "+userlocklist.length);
%>

<script language="JavaScript" src="/accforib/scripts/AccForIB.js"></script>
<script>

function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=usrlock","child", bar);
}
function unlock()
{

	var count=0;
<%if(userlocklist!=null){
				for(int i=0;i<userlocklist.length;i++){
%>					
	if(document.getElementById("check<%=i%>").checked==true)
			{
				count=1;
			}
		<%}%>
			if(count==1)
			{	
				//alert("select"+count);
				document.getElementById("save").disabled=false;
				document.getElementById("length").value='<%=userlocklist.length%>';
			}
			else
				{
		//		alert("deselect"+count);
				document.getElementById("save").disabled=true;
			}
		<%}%>
}
function selectallcheck()
{
	if(document.getElementById("selectAll").value==" SelectAll ")
	{
		<%if(userlocklist!=null){
				for(int i=0;i<userlocklist.length;i++){
		%>
				document.getElementById("check<%=i%>").checked=true;
				document.getElementById("save").disabled=false;
				document.getElementById("selectAll").value="DeselectAll";
				document.getElementById("length").value='<%=userlocklist.length%>';
		<%}}%>
	}
		else if(document.getElementById("selectAll").value=="DeselectAll")
	{
		<%if(userlocklist!=null){
				for(int i=0;i<userlocklist.length;i++){
		%>
				document.getElementById("check<%=i%>").checked=false;
				document.getElementById("save").disabled=true;
				document.getElementById("selectAll").value=" SelectAll ";
		<%}}%>
	}
}
function savestate()
{
	document.getElementById("flag").value="save";
	document.forms[0].action="/accforib/activate.do?action=saveUnlock";
	document.forms[0].submit();
}
function backpage()
{
	document.forms[0].action="/navigate.do?action=executeOpen&src=unlock&dest=back";
	document.forms[0].submit();
}
function lockdetail()
{ 
	document.getElementById("flag").value="show";
	document.forms[0].action="/accforib/activate.do?action=saveUnlock";
	document.forms[0].submit();
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
<tiles:put name="menu" value="/common/user_left.jsp?mode=autoUnLock&src=userOperation"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<html:form action= "/accforib/activate">

<body onload="javascript:makeScrollableTable('tabela','false','200')">
<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > User Operation >> Unlock Users </td>
	</tr>
	<tr>
		<td align="center">

  <table  cellpadding="0" cellspacing="0" BORDER=0 width=491 bordercolor="brown">
		<tr>
			<td align="center">
			<table class="miniStmtBackBorder" height="59" width="100%" cellspacing="0" cellpadding="0">
				<tr class="miniStmtBack" >
					<td align="right" class="normalText">
						User Id
					</td>
					<td align="left">
						:&nbsp;<html:text property="userid" size="20"/>
						<html:hidden property="flag" styleId="flag"/>
					</td>
					<td>
						<input type="button" value="Detail" onclick="lockdetail()">
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
         <td width="100%" height="59"> 
		 <br>
		 <%
			if(userlocklist!=null) {
				for(int i=0;i<userlocklist.length;i++){
					if(i==0){
			%>
			
			<html:hidden property="length" styleId="length"/>
			<br>
<table border="2" bordercolor="#ffffff" align="center" width=491 cellpadding="0" cellspacing="0">
    <tr> 
		<TD class="dataTableTH">
			<bean:message bundle="hindi" key= "2010"/></TD>
		<TD class="dataTableTH">
			 User Name 	  </TD>
		<TD class="dataTableTH">
			Branch Code   </TD>
  		<TD class="dataTableTH">
			IB Status     </TD>
		<TD class="dataTableTH">
			UnLock		  </TD>
	</tr>
<%}%>	
	<tbody>
					<tr <%out.println(i%2==0?"class=trforReportRow1":"class=trforReportRow2");%>>
						<td  class="dataTableTD" align="center"><%=i+1%></td>
						<td  class="dataTableTD" align="center"><%= userlocklist[i][0]%></td>
						<td  class="dataTableTD" align="center"><%= userlocklist[i][2]%></td>
						<td class="dataTableTD" align="center" ><font color="red">Locked</font></td>
						<td>
							<input type="checkbox" name="check<%=i%>" id="check<%=i%>" onclick="unlock()"></td>
					<% if(i==userlocklist.length-1){%>
						</table>		
					<%	}

					}
					} %>
			<table border="0" width="100%">
				<tr>
					<td align="center" >
						<!--<input type="button" name="back"  value="Back To Menu" onclick="backpage()" /> -->
						<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " 
						type="button" tabindex="5"  onclick="helpopen()"/>
					</td>
					<%if(userlocklist!=null) {%>
					<td align="center" >
						<input type="button" name="selectAll" onclick="selectallcheck()" 	value=" SelectAll " >
						<input type="button" name="save" id="save" onclick="savestate()" value="Un-Lock">
					</td>
					<%}%>
				</tr>	
			</table>
			</td>
		</tr>
		<tr>
			<td align="center">
				<div id="diverrmessage">
					<logic:messagesPresent property="saved">
						<font color="Green" face="verdana"><html:errors property="saved"/></font>
					</logic:messagesPresent>
				
				
					<logic:messagesPresent property="NoRecord">
						<font color="Red" face="verdana">No User is Locked</font>
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
</html:form>
</tiles:put>
</tiles:insert>