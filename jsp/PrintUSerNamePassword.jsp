</html>
<script>
function printForm(){
	window.print();
	window.close(); //commmented by abhishek temporarily.
}
</script>
<%
String reprint=(String)session.getAttribute("reprint");
%>
<body  onload="printForm()">
<form name="printForm">
<table border ="0" >
<%if(reprint==null){%>
<tr><td nowrap>Account No ::  <%=session.getAttribute("acc_num")%></td></tr>
<tr><td nowrap>Account Holder Name :: <%=session.getAttribute("Name")%></td></tr>
<%}%>
<tr><td nowrap>User Id  :: <%=session.getAttribute("UsrId")%></td></tr>
<%System.out.println("..........."+session.getAttribute("UsrPassword"));%>
<tr><td nowrap>Password :: <font color="#000000"><%=session.getAttribute("UsrPassword")%></font>
</td></tr>
</table>

<table>
	<tr>
		<td>
			It must be at least Six character in length.
		</td>
	</tr>
	<tr>
		<td>
		It should contain at least one alphabetic and one numeric
		</td>
	</tr>
	<tr>
		<td>
			Password is case-sensitive. 
		</td>
	</tr>	

	<tr>
		<td>
		It must be significantly different from previous password
		</td>
	</tr>
	<tr>
		<td>
			It can not be same as the User Id
		</td>
	<tr>
	</tr>
		<td>
		It should not start or end with the initials of the person issued the User Id.
		</td>
	</tr>
<!-- Commented on 01/11/2008 by ajay	<tr>
		<td>
		Special character may be used to strengthen the password like $ , . ! % ^ *
		</td>
	</tr>
 -->	<tr>
		<td>
			It should not be information easily obtainable about you. This includes License plate, Social Security, Telephone Number, Street Address. 
		</td>
	</tr>	
</table>
</form>
</body>
</html>
<%

session.removeAttribute("acc_num");
session.removeAttribute("Name");
//session.removeAttribute("UsrId");
session.removeAttribute("UsrPassword");
session.removeAttribute("reprint");

%>








