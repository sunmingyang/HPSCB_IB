<%@ include file="/common/Include.jsp" %>
<%String usrName = (String)session.getAttribute("user");
%>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Request"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
<bean:message bundle="hindi" key="7215" />
</tiles:put>
<tiles:put name="menu" value="/common/user_left.jsp?src=request"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="content" type="String">
<br>
<br>


<%  if(request.getParameter("success")!=null )
{
%>
<bean:message bundle='<%=lang %>' key='7220'/>
<% 
} 
%>

<%  if(request.getParameter("error")!=null )
{
%>
<bean:message bundle='<%=lang %>' key='626'/>
<% 
} 
%>
<form >

		<table border="1" width="30%">
		
	
		
		</table>
		<!-- </td>
	</tr>
</table> -->
</form>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert >