<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.io.*" %>
<%
int l=0;
Date todate=new Date(); 
String strdate=todate.toString();
String nstrdate=strdate.substring(0,19);
String data[]=(String[])session.getAttribute("accDetail");
session.removeAttribute("accDetail");
LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");  
String[] acc_nums=null;
String[] acc_curr=null;
if(userInfo!=null)
{
	acc_nums =userInfo.getsIbUsr_AccNums();
	l=acc_nums.length;
	System.out.print("array length"+l);
	acc_curr =userInfo.getsIbUsr_Currency();
	if(acc_curr!=null){
	if(acc_curr.length>=1)
		System.out.print("curr1 is"+acc_curr[0]);
	if(acc_curr.length>=2)
	System.out.print("curr2 is"+acc_curr[1]);
	}
}
%>
<script>
function submitPage()
{
	document.forms[0].action="/accsum/acc_sum.do?action=AccDetail";
	document.forms[0].submit();
}
function backAccDet()
{
	document.forms[0].action="/accsum/AccountsMain.jsp"
	document.forms[0].submit();
}

</script>
<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<script language="JavaScript\" src="/scripts/common.js\"></script>
<script language=JavaScript src="/scripts/ScrollableTable.js\"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="content" type="String">

<body>

	<table align="right">
		<tr>
			<td>
			<input type="button" value="Back" onclick="backAccDet()" class="button"/>
			<td>
		</tr>
</table>
<html:form action="/accsum/acc_sum.do">
<table align="center">
	<tr>
		<td>
			Account No:
		</td>
		<td>
		<html:select property="sAccnum">
		<%if(l!=0)
		{ 
			for(int i=0;i<l;i++)
			{
				%>
				<html:option value='<%=acc_nums[i]%>'>
				<%=acc_nums[i]%>
				</html:option>
				<%}}%>
		</html:select>
		</td>
		<td>
		<input type="button" value="Account Detail" onclick="submitPage()" class="button">
		</td>
	</tr>
</table>
<table border="1" align="center"  width="90%">
<%
	if(data!=null)
	{
					
%>
	<tr>		
		<th color="#CC0033" colspan="2" align="center">	
			<font size="3px">Account Information of <%=data[11]%></font>
		</th>
	</tr>
	<tr  bgcolor=#FDE4E3>
		<td>
		Account No.
		</td>
		<td>
			<%=data[0]%>
		</td>
	</tr>

	<tr height=8px>
		<td colspan="2">
		</td>
	</tr>
	<tr  bgcolor=#FDE4E3>
		<td>
		Account type
		</td>
		<td>
			<%=data[5]%>/<%=data[4]%>
		</td>
	</tr>
	<tr height=8px>
		<td colspan="2">
		</td>
	</tr>
	<tr  bgcolor=#FDE4E3>
		<td>
		Currency
		</td>
		<td>
			<%=data[13]%>
		</td>
	</tr>
	<tr height=8px>
		<td colspan="2">
		</td>
	</tr>
		<tr  bgcolor=#FDE4E3>
		<td>
		Account Name
		</td>
		<td>
			<%=data[12]%>/<%=data[11]%>
		</td>
	</tr>
	<tr height=8px>
		<td colspan="2">
		</td>
	</tr>
		<tr  bgcolor=#FDE4E3>
		<td>
		Account Status
		</td>
		<td>
			<%=data[10]%>
		</td>
	</tr>
	<tr height=8px>
		<td colspan="2">
		</td>
	</tr>
	<tr  bgcolor=#FDE4E3>
		<td>
		Account Open Date
		</td>
		<td>
			<%=data[1]%>
		</td>
	</tr>
	<tr height=8px>
		<td colspan="2">
		</td>
	</tr>
		<tr  bgcolor=#FDE4E3>
		<td>
		Account Balance
		</td>
		<td>
			<%=data[2]%>
		</td>
	</tr>
	<tr height=8px>
		<td colspan="2">
		</td>
	</tr>
		<tr  bgcolor=#FDE4E3>
		<td>
		Available Balance
		</td>
		<td>
			<%=data[7]%>
		</td>
	</tr>
	<tr height=8px>
		<td colspan="2">
		</td>
	</tr>
	<tr  bgcolor=#FDE4E3>
		<td>
		Unclear Balance
		</td>
		<td>
			<%=data[8]%>
		</td>
	</tr>
	<tr height=8px>
		<td colspan="2">
		</td>
	</tr>
<%	if(!data[14].equals("0.0")){%>
	<tr  bgcolor=#FDE4E3>
		<td>
		Sanction Limit
		</td>
		<td>
			<%=data[14]%>
		</td>
	</tr>
	<tr height=8px>
		<td colspan="2">
		</td>
	</tr>
	<%}%>
<%	if(!data[15].equals("0.0")){%>
	<tr  bgcolor=#FDE4E3>
		<td>
		Drawing Power
		</td>
		<td>
			<%=data[15]%>
		</td>
	</tr>
	<tr height=8px>
		<td colspan="2">
		</td>
	</tr>
	<%}%>
	<tr>
		<th color="#CC0033" colspan="2" align="center">
			<font size="2px"><b>Information till <%=nstrdate%>
		</th>
	</tr>
	<%}%>
</table>
</html:form>
</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>



