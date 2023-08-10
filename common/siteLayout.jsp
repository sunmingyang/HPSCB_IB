<%@ page import="easycbs.bancmateib.common.dto.BMConfig" %>
<%@ include file="/common/Include.jsp" %>
<script>
	window.history.forward(1);//for disabling back button of browser.

</script>
<html>
  <head>
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <meta name="description" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>
	  <tiles:getAsString name="title" ignore="true"/>
	</title>
	<script language="JavaScript" src="/scripts/common.js" type="text/javascript"></script> 	
	<%@ page import="javax.servlet.*"%>
  </head>
<body onkeyDown="StopKeyHandler()" onunload="detectCloseWin()" class="siteLayoutBody" >
<div> 
<table width="95%" align="center" valign="center"  cols="3" cellpadding="0" cellspacing="0" >
		<tr>
			<td colspan=3 >		  
				<tiles:insert attribute="header" ignore="true" />
				</td>
		</tr>
		<tr style="position:relative">
			<td valign="top" colspan="3"  class="header_marquee">
				<tiles:insert attribute="header_marquee" ignore="true" />
			</td>
		</tr>
		<!-- <tr style="height:5;position:relative"><td colspan=3></td></tr> -->
		<tr>
			<td colspan="3">
				<TABLE cellSpacing=0 class="page_header" cellPadding=0 width="100%"  border="0" bgcolor="blue" height="100%" >  
				<tr>
					<td>
						&nbsp;&nbsp;
						<font color=white size="2px" face="verdana"> 
						<tiles:insert attribute="page_header" ignore="true" />
						</font>
					</td>
					<%
					String userInfo1=(String)session.getAttribute("validToken");  
					if(userInfo1!=null)
					{%>
				 	<TD  nowrap="nowrap">
							<% if(userInfo1.equals("admin")) { %>								
								<font color="#ffffff"><b>
								<a href="/jsp/home.jsp">
								<img src="/images/home1.jpg" border="0">
								</a></b></font>&nbsp;
							<%}else{ %>	
								<font color="#ffffff"><b>
								<a href="/jsp/main_page.jsp">
								<img src="/images/home1.jpg" border="0">
								</a></b></font>&nbsp;
							<%}%>
							<html:link property="pp" action="/jsp/login.do?action=ibUsrLogout">
							<font color="white"><b>
							<bean:message bundle='<%=lang %>' key='3697'/></b></font></html:link>
						</TD>
						<%}else{%>
						<TD  nowrap="nowrap">
							<font color="#ffffff"><b>
							<a href="/jsp/loginform.jsp">
							<img src="/images/home1.jpg" border="0">
							</a></b></font>&nbsp;
						</TD>
						 <%}%>
					<td align="right" width="20%" nowrap>
								<%
							ServletContext context = session.getServletContext();
							int conn=Integer.parseInt(context.getAttribute("connecteduser").toString());
							String usr=(String)session.getAttribute("validToken");
							if(usr!=null)
							{
								if(usr.equals("admin"))
									out.print("<font color='#99FF00'> <b>1"+conn+"</b></font><font color='#FFFFFF'> User Online </font>&nbsp;&nbsp;&nbsp;&nbsp;");
							}
							%>
						<!-- 	<applet code="easycbs.bancmateib.applet.TimeApplet.class" codebase="/jsp/plugin/applet/" height="12" width="100" ></applet>  -->
						</td>
					</tr>
				</TABLE>
			</td>
		</tr>

		<tr style="height:20;position:relative;background-color:#BEDEEB">
			<td colspan=3 nowrap>
				<tiles:insert attribute="menu_tab" ignore="true" />
			</td>
		</tr>
		
		<!-- <tr style="height:8;position:relative"><td colspan=3></td></tr> -->
		
		<tr style="position:relative">
	    <td width="18%" style="background-color:#ffffff" height="250">
	     <tiles:insert attribute="menu" ignore="true" />
	    </td>
   			<!-- <td colspan=2>content</td> -->
			<td valign="top" align="center" colspan="2"  height="250" bgcolor="#ffffff">
				<tiles:insert attribute="content" ignore="true"/>
			</td>
		</tr>

		<tr style="height:25;position:relative"><td colspan=3 bgcolor="#ffffff">&nbsp;</td></tr>

		<tr style="height:20;position:relative;background-color:#BEDEEB">
			<td colspan=3>
			</td></tr>	
		<tr class="page_header">
			<td colspan="3">
				&nbsp; 
			</td>
		</tr>
		 <tr class="footer">
			<td colspan=3 >
				&nbsp;
			</td>
		</tr> 

	</table>
</div>
	

	</body>
	<html:form action="/jsp/login">
	</html:form>
	</html>
