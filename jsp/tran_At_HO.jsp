<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%
String AdminName=(String)session.getAttribute("AdminName");
%>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>

<tiles:put name="menu" value="/common/left.jsp"/>
<tiles:put name="page_header" type="String">
Welcome&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</tiles:put>
<tiles:put name="content" type="String">

<%
String failReport[][]=null;
if(session.getAttribute("tranFail")!=null)
	{
     failReport=(String[][])session.getAttribute("tranFail");
	}	
%>



<HTML>
<body onLoad="fill()"> 
<html:form action= "/abb/enquiry">

<br>
<% 
	Thread t = new Thread();
	t.sleep(5000);
	if(failReport!= null)
	{
		System.out.println("Fail Report  not null");
		int j = failReport.length;
		System.out.print("length of the array ::"+j);
		System.out.println("Value is  "+failReport[0][0]);
		if(j!=0)
		{
		%>
<table border="1" align="center" width="98% cellpadding="-1" cellspacing="-1" id="table">
	<thead>
		 <TR bgcolor="brown"> 
			<TH width="1%" ><font color="#FFFFFF"> <bean:message bundle="hindi" key= "259"/></font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Source Branch</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Target Branch</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> From Account </font></TH>
			<TH width="10%" ><font color="#FFFFFF"> To Account </font></TH>
			<TH width="10%" ><font color="#FFFFFF"> Amount</font></TH>
			<TH width="10%"><font color="#FFFFFF"> Tran. Type</font></TH>
			<TH width="10%"><font color="#FFFFFF">Status</font></TH>
			
		</TR>
	</thead>

			<tbody  class="scrolling" style="max-height:400px;">
			<%
			for(int i=0;i<j;i++)
			{System.out.print("length of the i::"+i);
			int k=0;
			%>
	<tr <%out.println(i%2==0?"class=trforReportRowl":"class=trforReportRow2");%> >
					<td  align="center" id="text<%=i%><%=k++%>" ><%=i+1%>
					</td>
					
					<td align="center"  id="text<%=i%><%=k++%>">
						<%=failReport[i][0]%>
					</td>
					
					
					<td  align="center" id="text<%=i%><%=k++%>"><%= failReport[i][1] %>
					</td>
					
					<td  align="center" id="text<%=i%><%=k++%>" ><%= failReport[i][2] %>
					</td>

					<td align="center" id="text<%=i%><%=k++%>"><%= failReport[i][3] %>
					</td>

					<td align="center" id="text<%=i%><%=k++%>"><%= failReport[i][4] %>
					</td>
				
					<td align="center" id="text<%=i%><%=k++%>"><%= failReport[i][5] %>
					</td>

					<td align="center" id="text<%=i%><%=k++%>"><%= failReport[i][6] %>
					</td>

					
					
					
					</tr>

				<%}%>
				</tbody >
				<%}%>
				
	</table>
			<%}%>



<br>
<!--
<table align="center">

<tr><td>
<input type="button" name="ok" id="ok" class="Button" 	value="show"	onclick="saveData()" style="width:100px" tabindex="2"> 
</td></tr>
</table>
-->

</html:form>



</body>
</html>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>	
<script>

function saveData()
{		
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="/abb/enquiry.do?action=abbTop10Trans"
	document.forms[0].method="post"
	document.forms[0].submit();
}
function fill()
{
	//makeScrollableTable('table','false','auto');
	saveData();
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
