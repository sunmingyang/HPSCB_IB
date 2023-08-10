<%@ include file="/common/Include.jsp" %>


<%

System.out.println("*****PASSWORD-POLICY***********");
System.out.println("*****PASSWORD-POLICY***********");
System.out.println("*****PASSWORD-POLICY***********");

%>


<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
<tiles:put name="content" type="String">

<html:form action= "/jsp/login">

<%

System.out.println("*****PASSWORD-POLICY11111***********");
System.out.println("*****PASSWORD-POLICY11111111***********");
System.out.println("*****PASSWORD-POLICY111111111***********");

%>
<script>
function passchange()
{
	document.forms[0].action="/jsp/login.do?action=getPassChange";
	document.forms[0].submit();
}



</script>
<html>
<body bgcolor="#FDE4E3">
<br /> <hr />
<table align="center" bgcolor="" >
	<tr>
		<td class="dataTableInfoTD"><b>
		<%= cprContextObj.getSbankename() %> :    Password Policy
		</b>
		</td>
	</tr>
	<tr>
		<td class="dataTableInfoTD">
			Your password must comprise of at least six character in length.
		</td>
	</tr>
	<tr>
		<td class="dataTableInfoTD">
		Password must contain at least one alphabet and one numeric,
		</td>
	</tr>
	<tr>
		<td class="dataTableInfoTD">
		Password must be significantly different from previous(history) password.
		</td>
	</tr>
	<tr>
		<td class="dataTableInfoTD">
			You should not keep your password similar to Login Userid. 
		</td>
	<tr>
	</tr>
		<td class="dataTableInfoTD">
		It should not start or end with the initials of the person issued the User Id.
		</td>
	</tr>
	<tr>
		<td class="dataTableInfoTD">
		Special character may be used for strong passwords like $ , . ! % ^ *
		</td>
	</tr>
	<tr>
		<td class="dataTableInfoTD">
			It should not be related to any of your personal information which is easily obtainable about you. 
			
		</td>
	</tr>
	<tr>
	<td class="dataTableInfoTD">
	This includes DOB, License Number, Social Security, Telephone, Mobile, Street Address etc. 
	</td></tr>
</table>
<br /> <hr />
<table>
	<tr>
	<td align="center">
		<input type="button" value=" Next " onclick="passchange()" style="background-color:brown;color:white;"/>		
	</td>
	</tr>

</table>
<style>
.dataTableInfoTD{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        text-decoration: none;
}
.dataTableInfoTDAlt{
	font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:5;
		padding-right:3;
        text-decoration: none;
		background-color:white;
		text-align:left;
}
</style>
	</body>
	</html>
	</html:form>
</tiles:put>
</tiles:insert>

