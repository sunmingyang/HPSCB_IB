<%@ include file="/common/Include.jsp" %>
<%
String AdminName=(String)session.getAttribute("user");
%>

<%
	String connected[][] = null;
	int connect=0,disconnect=0;
	if(session.getAttribute("BrStatus") != null)
		{
		connected = (String[][])session.getAttribute("BrStatus");
		for(int i = 0;i<connected.length;i++){
			if(connected[i][3].trim().equals("C"))
				{
				System.out.println("in connected");
				connect++;
			     }
			else if(connected[i][3].trim().equals("D"))
				{
				System.out.println("in disconnected");
				disconnect++;
			    }
		}
			
	}
	
%>

<tiles:insert page="/common/siteLayout.jsp" flush="true">

<tiles:put name="title" value="Anywhere Branch Banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="menu" value="/abb/abbhome_left.jsp"/>
<tiles:put name="page_header" type="String">

Welcome&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</tiles:put>
<tiles:put name="content" type="String">

<table style="BORDER-TOP-STYLE: none; border-COLOR: brown; BORDER-BOTTOM-STYLE: none;BORDER-RIGHT-STYLE: none; border-size=1;" width="100%">
<% if (request.getParameter("process")!=null )
{ %>
<tr>
<td class="heading">Logged Out Succesfully !!!</td></tr>
<tr><td>&nbsp;</td></tr>
<%
session.removeAttribute("userInfo");
 } %>

</table>
<!--New Created by Nirmal kumar Sharma with Branch status. -->

<% if (session.getAttribute("BrStatus") != null )
{ %>
<html:form action= "/jsp/login">

<html:form action="/openaction">
<body onload = "makeScrollableTable('tabel',true,'200')">hiii
		<table align="center" border = "0" cellpadding="5" cellspacing="5">
			<tr>
				<td>
					<table height="100%" align="left" border = "0" cellpadding="1" cellspacing="1" >
					<tr>
						<td width="20%" >
							Total Branch
						</td >
						<td width="40%"><b>&nbsp;
							<%=connected.length%>
						</td>
						
					</tr>
					<tr>
						<td>
							Connect 	
						</td>
						<td style = "COLOR:#00CC33;" width="40%"><b>&nbsp;
							<%=connect%>
						</td>
						<td width="50%" align="top">
						<img src="/images/green.gif" width="12px" height="12px">
							Connect	
						</td>
						
					</tr>
					<tr>
						<td>
							Disconnect	
						</td>
						<td style = "COLOR:red;"><b>&nbsp;
							<%=disconnect%>
						</td>
						<td align="top"><img src="/images/red.gif" width="12px" height="12px" >
							Disconnect
						</td>
					</tr>
					<tr>
						
						
					</tr>

					</table>
				</td>
			</tr>
			<tr>
				<td>
				<table height="100%" border="1" align="center" cellpadding="0" cellspacing="1" id="tabel"
					style = "BORDER-COLLAPSE:collapse;BORDER-COLOR:brown;" >
					<thead>
						<!-- For Header -->
						<TR >
							<!-- Sr.no -->
							<TH>
								Sr.No.
							</TH>
							<!-- Branch Code -->
							<TH>
								Branch Code
							</TH>
							<!-- Branch Name -->
							<TH>
								Branch Name
							</TH>
							<!-- Branch Cdate -->
							<TH>
								Branch Date
							</TH>
							<!-- Branch DayOpen -->
							<TH>
								Branch DayOpen
							</TH>													
							<!-- Status -->
							<TH>
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
									<TD  align=center nowrap ><b>
										<%= i+1  %>
										<%System.out.println("in i+1");%>
									</TD>
									<!-- Branch Code -->
									<TD  align=right nowrap><b>
										<%= connected[i][1] %>
									</TD>
									<!-- Branch Name -->
									<TD  align=right nowrap><b>&nbsp
										<%= connected[i][2].trim() %>
									</TD>
									<!-- Branch cdate -->
									<TD  align=right nowrap><b>&nbsp &nbsp &nbsp
											
											<%= connected[i][4].substring(8,10).trim()
											%>/<%= connected[i][4].substring(5,7).trim()
											%>/<%= connected[i][4].substring(0,4).trim()%>
									</TD>
									<!-- Branch DayOpen -->
									<TD  align=center nowrap><b>
										<%= connected[i][5].trim() %>
									</TD>
																		
									<!-- Status -->
									<%
										if(connected[i][3].trim().equals("C")){
										%>
										<TD align=center nowrap><img src="/images/green.gif" width="12px" height="12px"><b></TD>
									<%	}else if(connected[i][3].trim().equals("D")){
										%>
										<TD align=center nowrap><img src="/images/red.gif" width="12px" height="12px"><b></TD>
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
		
			<td align="center">
				<input type="button" name="refresh" value="Refresh" onclick="pageRefresh()" class="button"
			
		</tr>
		
	</table>
</body>

</html:form>
</html:form>
<%
 } %>

</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>

<script>

function pageRefresh()
{
	document.forms[0].action="/CommonCancelAction.do?reqForm=Refresh"
	document.forms[0].method="post";
	document.forms[0].submit();		
}
</script>

