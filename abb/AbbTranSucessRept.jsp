<%@ include file="/common/Include.jsp" %>

<%
String sucessReport[][]=null;
if(session.getAttribute("SucessRept")!=null)
	{
     sucessReport=(String[][])session.getAttribute("SucessRept");
	}	
%>

<%
String balance[][]=null;
if(session.getAttribute("Balance")!=null)
	{
     balance=(String[][])session.getAttribute("Balance");
	System.out.println("VALUE OF BALANE IS" +balance);
	}	
%>



<HTML>
<body onLoad="fill()"> 
<html:form action= "/abb/enquiry">


<table width="100%" height="12%" border="0" cellpadding="0" cellspacing="0">
	<TR>
		<TD valign="top">
			<IMG  alt="Azizi Bank" height ="90" width = "99%" src="/images/azizi2.bmp" 
						border="0">	
					
		</td>			
 		<TD valign="bottom" align="left" bgcolor="#91203E">		  			
			<img src="/images/home.bmp" border="0">
	    </td>
   </tr>
 
</table>

<br>
<table border="0" width="33%" cellpadding="0" cellspacing="0" bgcolor="#FDE4E3" align='center'>                
	<thead>  
	   <tr>
	   <th align="center" rowspan="2" colspan="2" >
		  <b>ABB Sucessfull Transaction Report</b>
	   </th>
	   </tr>
	</thead>
    </table>
<br>
<table align="center">
<tr>
<td>
<font color="red">FROM DATE(dd/mm/yyyy)</font>

<html:text property="sFromDate" styleId="sFromDate" tabindex="1" maxlength="11"/> <br>

<font color="red">TO DATE(dd/mm/yyyy)</font> &nbsp; &nbsp;&nbsp;

<html:text property="sToDate" styleId="sToDate" tabindex="1" maxlength="11"/>



</td>
</tr>
</table>
<% 
	if(sucessReport!= null)
	{
		System.out.println("Fail Report  not null");
		int j = sucessReport.length;
		System.out.print("length of the array ::"+j);
		if(j!=0)
		{
		%>

<table border="1" width="98% cellpadding="-1" cellspacing="-1" id="table">
	<thead>
		 <TR bgcolor="brown"> 
			<TH width="1%" ><font color="#FFFFFF"> <bean:message bundle="hindi" key= "259"/></font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Trans. Date</font></TH>
			<TH width="5%" ><font color="#FFFFFF"> Trans. No.</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Source Branch</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Target Branch</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> From Account </font></TH>
			<TH width="10%" ><font color="#FFFFFF"> To Account </font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Amount</font></TH>
			<TH width="5%"><font color="#FFFFFF"> Tran. Type</font></TH>
			<TH width="20%"><font color="#FFFFFF">Status</font></TH>
			
		</TR>
	</thead>

			<tbody  class="scrolling" style="max-height:150px;">
			<%
			for(int i=0;i<j;i++)
			{
			int k=0;
			%>
	<tr <%out.println(i%2==0?"class=trforReportRowl":"class=trforReportRow2");%> >
		<td align="center" id="text<%=i%><%=k++%>" ><%=i+1%></td>
		<td align="center" id="text<%=i%><%=k++%>"><%= sucessReport[i][0] %></td>
		<td align="center" id="text<%=i%><%=k++%>"><%= sucessReport[i][1] %></td>
		<td align="center" id="text<%=i%><%=k++%>"><%= sucessReport[i][2] %></td>
		<td align="center" id="text<%=i%><%=k++%>"><%= sucessReport[i][3] %></td>
		<%
			if(!sucessReport[i][7].equals("CS"))
				{
			%>
		<td align="center" id="text<%=i%><%=k++%>"><%= sucessReport[i][4] %></td>
		<% }else{ %>
		<td align="center" id="text<%=i%><%=k++%>">   </td>
		<% } %>
		<td align="center" id="text<%=i%><%=k++%>"><%= sucessReport[i][5] %></td>
		<td align="right" id="text<%=i%><%=k++%>"><%= sucessReport[i][6] %>&nbsp</td>
		<td align="center" id="text<%=i%><%=k++%>"><%= sucessReport[i][7] %></td>
		<td align="left" id="text<%=i%><%=k++%>">&nbsp<%= sucessReport[i][8] %></td>
	</tr>
	<%}%>
</tbody>
<%}%>
</table>


<br>


<table border="1" align="left" width="50% cellpadding="-1" cellspacing="-1" id="table">
	<thead>
		 <TR bgcolor="brown"> 
			<TH width="1%" ><font color="#FFFFFF"> <bean:message bundle="hindi" key= "259"/></font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Source Branch</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Target Branch</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Debit Amount</font></TH>
		</TR>
	</thead>
<% 
	if(balance!= null)
	{
		System.out.println("balane  not null");
		int j1 = balance.length;
		System.out.print("length of the balance array ::"+j);
		if(j1!=0)
		{
		%>
			<tbody  class="scrolling" style="max-height:100px;">
			<%
			for(int i=0;i<j1;i++)
			{
			int k=0;
			%>
	<tr <%out.println(i%2==0?"class=trforReportRowl":"class=trforReportRow2");%> >
					<td  align="center" id="text<%=i%><%=k++%>" ><%=i+1%>
					</td>
					
					<td align="center"  id="text<%=i%><%=k++%>">
						<%=balance[i][0]%>
					</td>
					
					
					<td  align="center" id="text<%=i%><%=k++%>"><%= balance[i][1] %>
					</td>
					
					<td  align="right" id="text<%=i%><%=k++%>" ><%= balance[i][2] %>
					</td>

					

					</tr>

				<%}%>
					</tbody>
				<%}%>
				<%}%>
	</table>
<%}%>
<br><br>
<table align="center">
<tr><td>
<input type="button" name="ok" id="ok" class="Button" 	value="show"	onclick="saveData()" style="width:100px" tabindex="2"> 
<input type="button" value="Back" onclick="backmini()" class="button" style="width:100px" tabindex="3"/>

<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " class="Button" type="button" tabindex="5" style="width:100px" onclick="helpopen()" >

	</td></tr>
	</table>



</html:form>


</body>
</html>

<script>
 
function backmini()
{<%session.removeAttribute("usrStrDate");%>
document.forms[0].action="/CommonCancelAction.do?reqForm=ReptBack"
document.forms[0].method="post";
document.forms[0].submit();				
}

function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=successReport","child", bar);
}


function saveData()
{		
	 	
	if(isValidDateFormat("sFromDate")==false)
	{
		alert("Please Enter valid from date in dd/mm/yyy format")
		document.getElementById("sFromDate").value="";
		document.getElementById("sFromDate").focus();
		return;
	}
else if(isValidDateFormat("sToDate")==false)
	{
		alert("Please Enter valid to date in dd/mm/yyy format")
		document.getElementById("sToDate").value="";
		document.getElementById("sToDate").focus();
		return;
	}
else if(isValidDateFormat("sToDate")==false)
	{
		alert("Please Enter valid to date in dd/mm/yyy format")
		document.getElementById("sToDate").value="";
		document.getElementById("sToDate").focus();
		return;
	}
else		
	{

	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="/abb/enquiry.do?action=abbSucessTrans"
	document.forms[0].method="post"
	document.forms[0].submit();
	}
}

function fill()
{
	makeScrollableTable('table','false','auto');
	document.getElementById("sFromDate").focus();
}

</script>

<script>
<%      
	String errorCode=""; 
    if(session.getAttribute("repterror") != null){
		 errorCode = (String)session.getAttribute("repterror");
 	 	 System.out.println("Removing Session Data....................111"); 	
		// session.removeAttribute("abbCashErrorCode");
   }

   if(errorCode!=null && (!errorCode.trim().equals("")))
   { %> 

			document.write("<br>");
			document.write("<TABLE width=\"100%\" id = \"ErrorTab\" >");
			document.write("<TR>");
			document.write("<TD style=\"background-color:brown;color:white;WIDTH:100%;\" align=top>");
			document.write("<strong>");
			document.write("'<%=errorCode%>' : "+"<bean:message bundle='errors' key='<%=errorCode%>'/>");	
			document.write("</strong>");
			document.write("</TD>");
			document.write("</TR>");
 		    document.write("</TABLE>");
   <%
	   errorCode = null;
   }
 %>	
</script>


