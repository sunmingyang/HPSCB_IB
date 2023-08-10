<%@ include file="/common/Include.jsp" %>
<%
String AdminName=(String)session.getAttribute("AdminName");
String userlist[][]=null;
String suspected="0",balanced="0";
int remains = 0;
	String flag=null;
	if(session.getAttribute("userinfo")!=null){
		userlist=(String[][])session.getAttribute("userinfo");
}
if(session.getAttribute("suspected")!=null){
		suspected=(String)session.getAttribute("suspected");	
}
if(session.getAttribute("balanced")!=null){
		balanced=(String)session.getAttribute("balanced");
}
try{
	remains = Integer.parseInt(suspected.trim()) - Integer.parseInt(balanced.trim());
}catch(Exception e)
{}
%>
<script>

function dayendopr()
{
	document.forms[0].action="/dayendaction.do?action=day";
	document.forms[0].submit();
}
function printpage()
{
window.print();
}
function backpage()
{
document.forms[0].action="/navigate.do?action=executeOpen&src=dayend&dest=back";
		document.forms[0].submit();

}
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>&nbsp;&nbsp;&nbsp;
Day End Operation
</tiles:put>
<tiles:put name="menu" value="/common/left.jsp"/>

<tiles:put name="content" type="String">
<html:form action= "/accforib/activate">
<body ><!-- onload="javascript:makeScrollableTable('tabela','false','auto')" > -->
  <table  cellpadding="0" cellspacing="0" BORDER=1 width=491 bordercolor="brown">
		<tr>
	        
				
					
			 	 </tr>
				 <tr>
					
				 </tr>
				<tr>
					<td colspan="3">
					<%
			if(userlist!=null){
				for(int i=0;i<userlist.length;i++){
					if(i==0){
			%>
			<br>
			<table border="1" align="center" width=427 cellpadding="-1" cellspacing="-1" id="tabela" bordercolor="a52a2a">
			<td align="left">
						<input type="button" name="back"  value="Day End Operation"  class="button"/>
			    
			<%}%>	
				<tbody>
					<tr  <%out.println(i%2==0?"class=trforReportRow1":"class=trforReportRow2");%>>
						<td  align="center"><%=i+1%></td>
						<td ><%= userlist[i][3]%></td>
						<td ><%= userlist[i][0]%></td>
						<td ><%= userlist[i][1]%></td>
						<%if(userlist[i][2].equals("C")){%>
						<td >Created</td>
						<%}%>
						<%if(userlist[i][2].equals("A")){%>
						<td >Activated</td>
						<%}%>
						<%if(userlist[i][2].equals("D")){%>
						<td >Deactivated</td>
						<%}%>
						<%if(userlist[i][2].equals("L")){%>
						<td >Locked</td>
						<%}%>
					<% if(i==userlist.length-1){%>
						</table>		
					<%	}
					}
					} %>
				<table border="0" width="100%">
				<tr>
					<td align="left">
						<input type="button" name="back"  value="Back To Menu" onclick="backpage()" class="button"/>
                  <td align="left">
					 <input type="button" name="Day End" value="Day End" onclick="dayendopr()" class="button"/>
					 </td>
						
				</tr>	
				</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<div id="diverrmessage">
						<font color="Red">
							<logic:messagesPresent property="NoRecord">
								<html:errors property="NoRecord"/>
							</logic:messagesPresent>
						</font>
						</div>
					</td>
					</tr>
					 <tr>
								 <script>
					<%
						if(session.getAttribute("suspected")!=null){ 
							session.removeAttribute("suspected");
							session.removeAttribute("balanced");
					%>
							document.write("<br>");
							document.write("<TABLE width=\"100%\" id = \"ErrorTab\" >");
							document.write("<TR>");
							document.write("<TD style=\"background-color:brown;color:white;WIDTH:100%;\" align=top>");
							document.write("<strong>");
							document.write("Total Number of Suspected Transactions: <%=suspected%>");	
							document.write("</strong>");
							document.write("</TD>");
							document.write("</TR>");
							document.write("<TR>");
							document.write("<TD style=\"background-color:brown;color:white;WIDTH:100%;\" align=top>");
							document.write("<strong>");
							document.write("Number of Updated Transactions: <%=balanced%>");	
							document.write("</strong>");
							document.write("</TD>");
							document.write("</TR>");
							document.write("<TR>");
							document.write("<TD style=\"background-color:brown;color:white;WIDTH:100%;\" align=top>");
							document.write("<strong>");
							document.write("Remaining Number of Suspected Transactions: <%=remains%>");	
							document.write("</strong>");
							document.write("</TD>");
							document.write("</TR>");
							document.write("</TABLE>");
						<%
							}
					%>
				</script>
				</tr>
				</table>
			 </td>
		 </tr>
		 <tr> </tr><tr> </tr><tr> </tr><tr> </tr> <tr> </tr><tr> </tr><tr> </tr><tr> </tr><tr> </tr>
</table>
</body>
</html:form>
</tiles:put>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>