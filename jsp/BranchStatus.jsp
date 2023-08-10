<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<%  String AdminName=(String)session.getAttribute("AdminName");
	String connected[][] = null;
	int connect=0,disconnect=0;
	if(session.getAttribute("BrStatus") != null){
		connected = (String[][])session.getAttribute("BrStatus");
		for(int i = 0;i<connected.length;i++){
			if(connected[i][3].trim().equals("C")){
				connect++;
			}
			else if(connected[i][3].trim().equals("D")){
				disconnect++;
			}
		}
		
	}
	
%>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>

<html:form action="/jsp/login.do">

<tiles:put name="menu" value="/common/left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font></tiles:put>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=reports"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=BranchStatusReport&src=reports"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">

<html:form action="/openaction">
<body onload = "makeScrollableTable('tabel',true,'200')">
<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > Reports  >>  Branch Status Report </td>
	</tr>
	<tr>
		<td align="center">
		
		<table align="center" border = "0" cellpadding="5" cellspacing="5">
			<tr>
				<td>
					<table height="100%" align="left" border = "0" cellpadding="1" cellspacing="1" >
					<tr>
						<td width="20%" class="normalText" >
							Total Branch
						</td >
						<td width="40%" class="normalText"><b>&nbsp;
							<%=connected.length%>
						</td>
						
					</tr>
					<tr>
						<td class="normalText">
							Connect 	
						</td>
						<td class="normalText" style = "COLOR:#00CC33;" width="40%"><b>&nbsp;
							<%=connect%>
						</td>
						<td width="50%" align="top" class="normalText">
						<img src="/images/green.gif" width="12px" height="12px">
							Connect	
						</td>
						
					</tr>
					<tr>
						<td class="normalText">
							Disconnect	
						</td>
						<td class="normalText" style = "COLOR:red;"><b>&nbsp;
							<%=disconnect%>
						</td>
						<td align="top" class="normalText"><img src="/images/red.gif" width="12px" height="12px" >
							Disconnect
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td>
				<table border="2" bordercolor="#ffffff" align="center" width="90%" cellpadding="0" cellspacing="0" id="table">
				
					<thead>
						<!-- For Header -->
						<TR >
							<!-- Sr.no -->
							<TH class="dataTableTH">
								Sr.No.
							</TH>
							<!-- Branch Code -->
							<TH class="dataTableTH">
								Branch Code
							</TH>
							<!-- Branch Name -->
							<TH class="dataTableTH">
								Branch Name
							</TH>
							<!-- Status -->
							<TH class="dataTableTH">
								Status
							</TH>
						</TR>
					</thead>
					<tbody >
					<%	if(connected != null)
						{
							for(int i = 0; i < connected.length; i++)
							{
								System.out.println("i---------------->["+i+"]");
							%>
								<TR >
									<!-- S.no -->
									<TD  align=center nowrap class="dataTableTD"><b>
										<%= i+1  %>
									</TD>
									<!-- Branch Code -->
									<TD  align=right nowrap class="dataTableTD"><b>
										<%= connected[i][1] %>
									</TD>
									<!-- Branch Name -->
									<TD  align=right nowrap class="dataTableTD"><b>
										<%= connected[i][2].trim() %>
									</TD>
									<!-- Status -->
									<%
										if(connected[i][3].trim().equals("C")){
										%>
										<TD align=center nowrap class="dataTableTD">
										<img src="/images/green.gif" width="12px" height="12px"><b></TD>
									<%	}else if(connected[i][3].trim().equals("D")){
										%>
										<TD align=center nowrap class="dataTableTD">
										<img src="/images/red.gif" width="12px" height="12px"><b></TD>
									<%	}
										%>
								</TR>
						<%	}
						}	%>
					</tbody>
				</table>
			</td>
		</tr>
	</table>
	<table>
		<tr align="center">
			<td align="center">
				<input type="button" name="refresh" value="Refresh" onclick="pageRefresh()" 
			</td>
			
			<td align="center">
			<!-- 	<input type="button" name="back" value="Back To Menu" onclick="goback()" class="button"> -->
		<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    "  type="button" tabindex="5" 
	onclick="helpopen()"/>
	
		
			</td>
		</tr>
		
	</table>

</td>
</tr>
</table>
	</body>
</html:form>

</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>

<script>
function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=brnstatus","child", bar);
}
function goback()
{
	window.location.href="/reports/ReportOperations.jsp"
	
}
function pageRefresh()
{
	window.location.href="/jsp/BranchStatus.jsp"
}
</script>
