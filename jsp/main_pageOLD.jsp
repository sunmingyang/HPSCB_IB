<%@ include file="/common/Include.jsp" %>
<% String Arr=null;
int j; %>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Welocome User......"/>
<html:form action="/jsp/login.do">
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>

<tiles:put name="content" type="String">
<body onkeyDown="StopKeyHandler()">

<table style="background-left:1px" background="orange" >
<tr>
<td valign="top" align="right">
<% LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");  
if(userInfo!=null)
{ %>

<font color="#a52a2a">
<script language="JavaScript">
Arr=splitString('<bean:message bundle="<%= lang %>" key="7058"/>','/');
document.write(Arr[0] );
</script>
 <%=(String)(userInfo.getsIbUsr_Hname())%>
 <br>
Welcome <%=(String)(userInfo.getsIbUsr_Ename())%><b></b> !!!
</font><br>
<% } %>

<%  String loginTime= (String)request.getAttribute("lastLoginTime");
	if(request.getAttribute("lastLoginTime")!=null){%>
	<font color="#a52a2a">
	LastLoginOn:  
<%=loginTime%><%}%>
	</font>
</td>
</tr>
</table>
<br>
<table width=150 cellpadding="-1" cellspacing="-1" id="tabela" style="padding-right:20px">
     <TR bgcolor="brown"> 
     <TH><font color="#FFFFFF"> <bean:message bundle="hindi" key= "1027"/></font>  </TH>
       </font>  </TH>
	</tr>
	<tr>
	<td colspan="5" >

<% if(userInfo!=null)
{ 
String[] acc_nums =userInfo.getsIbUsr_AccNums();

j=acc_nums.length;
System.out.print("array length"+j);


if(j!=0)
{ %>

<div style="display:block;width:100%;height:60px;overflow:auto;">
<table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="white" 
style="border-left:none;border-top:none;border-right:none;border-bottom:none;" >
<%
for(int i=0;i<j;i++)
{ %>


<tr bgcolor="EBDADC">

<td width="120" align="right"><%= acc_nums[i] %></td>
<% } // fr ends
}
} // if ends
%>

</tr>

</table>
</div>

</td></tr>
</table>
</body>
</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>





