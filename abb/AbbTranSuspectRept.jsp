<%@ include file="/common/Include.jsp" %>

<%
String SuspectRept[][]=null;
if(session.getAttribute("SuspectRept")!=null)
	{
	 System.out.println("in page in session SuspectRept");
     SuspectRept=(String[][])session.getAttribute("SuspectRept");
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
		  <b>Reversal of Suspected Transaction</b>
	   </th>
	   </tr>
	</thead>
    </table>
<br>
<% 
	if(SuspectRept!= null)
	{
		System.out.println("Fail Report  not null");
		int j = SuspectRept.length;
		System.out.print("length of the array ::"+j);
		if(j!=0)
		{
		%>

<table border="1" width="98% cellpadding="-1" cellspacing="-1" id="table">
	<thead>
		 <TR bgcolor="brown"> 
			<TH width="1%" ><font color="#FFFFFF"> <bean:message bundle="hindi" key= "259"/></font></TH>
			<TH width="10%" ><font color="#FFFFFF"> From Branch</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> From Account </font></TH>
			<TH width="10%" ><font color="#FFFFFF"> To Branch</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> To Account</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Trans. Date</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Amount</font></TH>
			<TH width="5%"><font color="#FFFFFF"> Tran. Type</font></TH>
			<TH width="5%" ><font color="#FFFFFF"> Trans. No.</font></TH>		
			
	
			<TH width="20%"><font color="#FFFFFF">Doc Series</font></TH>
			<TH width="20%"><font color="#FFFFFF">Doc No</font></TH>
			<TH width="20%"><font color="#FFFFFF">Reversal</font></TH>
			
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
		<td align="center" id="text<%=i%><%=k++%>"><%= SuspectRept[i][0] %></td>
		<td align="center" id="text<%=i%><%=k++%>"><%= SuspectRept[i][1] %></td>
		<td align="center" id="text<%=i%><%=k++%>"><%= SuspectRept[i][2] %></td>
		<td align="center" id="text<%=i%><%=k++%>"><%= SuspectRept[i][10] %></td>
		<td align="center" id="text<%=i%><%=k++%>"><%= SuspectRept[i][3] %></td>
		<%
			if(!SuspectRept[i][7].equals("CS"))
				{
			%>
		<td align="center" id="text<%=i%><%=k++%>"><%= SuspectRept[i][4] %></td>
		<% }else{ %>
		<td align="center" id="text<%=i%><%=k++%>">   </td>
		<% } %>
		<td align="center" id="text<%=i%><%=k++%>"><%= SuspectRept[i][5] %></td>
		<td align="right" id="text<%=i%><%=k++%>"><%= SuspectRept[i][6] %>&nbsp</td>

		<td align="left" id="text<%=i%><%=k++%>">&nbsp<%= SuspectRept[i][8] %></td>
		<td align="left" id="text<%=i%><%=k++%>">&nbsp<%= SuspectRept[i][9] %></td>
		<td align="center"><input type="checkbox"  id=<%= i%> value="<%= SuspectRept[i][6] %>"></td>
	</tr>
	<%}%>
	      
</tbody>
<table align="center">
<tr>
<td><input type="button" name="ok" id="ok" class="Button" 	value="DoReversal" onclick="DoReversal()" style="width:100px" tabindex="2"> </td>
<td><input type="button" value="Back" onclick="" class="button" style="width:100px" tabindex="3"/></td>
<input type="hidden" name="suspectlen" id="suspectlen" value="">
</tr>
</table>
<%}%>
<br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

			
</table>    



<%}%>

</html:form>


</body>
</html>

<script>
 



function DoReversal()
{
alert("in doreversal");
<%
if(SuspectRept!= null)
	{
		System.out.println("Fail Report  not null");
		int j = SuspectRept.length;
		System.out.print("length of the array ::"+j);
		if(j!=0)
		{
		%>
		var z="";
<%	for(int i=0;i<j;i++)
	{
	int k=0;
	%>
if(document.getElementById('<%= i%>').checked==true)
	{
	
	alert("ya checked"+document.getElementById('<%= i%>').value);
	z=z+document.getElementById('<%= i%>').value + ",";
	alert("value of z="+z);
	}
	<%}
	  }
      }%>

document.getElementById("suspectlen").value = "Slen";
document.forms[0].action="/openaction.do?src="+z
document.forms[0].method="post";
document.forms[0].submit();	
}




function fill()
{
	makeScrollableTable('table','false','auto');
	//document.getElementById("sFromDate").focus();
}



</script>

<script>
<%      
	String errorCode=""; 
    if(session.getAttribute("repterror") != null){
		 errorCode = (String)session.getAttribute("repterror");
 	 	 System.out.println("Removing Session Data....................abbTrans Success"); 	
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


