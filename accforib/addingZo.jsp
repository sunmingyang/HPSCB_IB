<%@ include file="/common/Include.jsp" %>

<script language="JavaScript" src="/jsp/scripts/chng_pass.js">
</script>

<script language="JavaScript">

function addinzo()
{
	
	alert("hello1");
	if(document.getElementById("szonid").value=="")
	{
     
     alert("id should not be left blank"); 
	 document.getElementById("szonid").focus();
	}
    else if(document.getElementById("szocode").value=="")
	{
     
     alert("code should not be left blank"); 
	 document.getElementById("szocode").focus();
	}
	else if(document.getElementById("szotext").value=="")
	{
     
	 alert("ename should not be left blank");
	 document.getElementById("szotext").focus();
	}
	else 
	{
	alert("hello2");
	document.getElementById("szocode").value;
	document.getElementById("szonid").value;
	document.getElementById("szotext").value;
	document.forms[0].action="../openaction.do?src=zoidname";
	document.forms[0].method = "POST";
	document.forms[0].submit();
	}

}

function startpoint()
{
    document.getElementById("szocode").value="";
	document.getElementById("szonid").value="";
	document.getElementById("szotext").value="";

	document.getElementById("szonid").focus();
}

function Back(){
	
	document.forms[0].action="/CommonCancelAction.do?reqForm=bactoZoRoMaster"
	document.forms[0].method="post";
	document.forms[0].submit();
}


   
</script> 

<!--
<%
String gotzoro[][]=null;
if(session.getAttribute("szoro")!=null)
	{
     gotzoro=(String[][])session.getAttribute("szoro");
	 session.removeAttribute("szoro");
	}	

%>
-->

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Login Page"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="menu" value="/common/left.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
	<bean:message bundle="hindi" key="7007" />
</tiles:put>
<tiles:put name="content" type="String">
<body onload='startpoint()'>

	<form>
<br>
<br>
<table  cellpadding="0" cellspacing="0" BORDER=1 width=400 bordercolor="" >
		<tr> 
			<td align="center"> 
				<table cellpadding="0" cellspacing="0" width="100%" >
					  <tr> 
						<td colspan="4" align="center" bgcolor="brown">
							<font color="ffffff">ZO Master Entry</font> 
					    </td>
					  </tr>
				      <tr> 
						<td colsapn="4">&nbsp;</td>
					  </tr>

					  <tr>
						<td><font color="brown">&nbsp &nbsp Enter Zone id
						</td>
						<td>&nbsp
							<input type="text" name="szonid" id="szonid" value="">
						</td>
					</tr>
					<tr><td><br></td></tr>
					  <tr>
						<td><font color="brown">&nbsp &nbsp Enter Zone Code
						</td>
						<td>&nbsp
							<input type="text" name="szocode" id="szocode" value=""> &nbsp <font color="red">*</font>
						</td>
					</tr>
					<tr><td><br></td></tr>
					<tr>
						<td><font color="brown">&nbsp &nbsp Enter Zone Name
						</td>
						<td>&nbsp
							<input type="text" name="szotext" id="szotext" value="">
						</td>
					</tr>
					<tr><td><br></td></tr>
							
					<tr>
					<td align="center">
					<input type="button"  value="OK" class="Button" onClick="addinzo()"/>
					</td>
					<td align="left">&nbsp 
					<input type="button" value="CANCEL" class="Button" onClick="Back()"/>
					</td>
					</tr>

			</table>
             </td>
				

			 </tr>
			 </tr>
			 </table>
		<br>
		<br>

<!--
<% 
	if(gotzoro!= null)
	{
		System.out.println("Fail Report  not null");
		int j = gotzoro.length;
		System.out.print("length of the array ::"+j);
		System.out.println("Value is  "+gotzoro[0][0]);
		if(j!=0)
		{
		%>
<table border="1" align="center" width="98% cellpadding="-1" cellspacing="-1" id="table">
	<thead>
		 <TR bgcolor="brown"> 
            <TH width="1%" ><font color="#FFFFFF">Sr.No</font></TH> 
			<TH width="3%" ><font color="#FFFFFF">Zone Kid</font></TH>
			<TH width="10%" ><font color="#FFFFFF">Zone Code</font></TH>
			<TH width="10%" ><font color="#FFFFFF">Zone Ename</font></TH>
		 </TR>
	</thead>

<tbody  class="scrolling" style="max-height:200px;">
<%
	for(int i=0;i<j;i++)
	{System.out.print("length of the i::"+i);
	int k=0;
%>
	<tr <%out.println(i%2==0?"class=trforReportRowl":"class=trforReportRow2");%> >
		<td  align="center" id="text<%=i%><%=k++%>" ><%=i+1%></td>
		<td align="center" id="text<%=i%><%=k++%>"><%= gotzoro[i][0] %></td>
		<td align="center" id="text<%=i%><%=k++%>"><%= gotzoro[i][1] %></td>
		<td align="center" id="text<%=i%><%=k++%>"><%= gotzoro[i][2] %></td>
	</tr>
	<%}%>
</tbody >
<%
	
	}%>
</table>

<%

}%>
-->

			   
    </form>

</body>



<script>
<%      
	String errorCode=""; 
    if(session.getAttribute("status") != null){
		 errorCode = (String)session.getAttribute("status");
 	 	 System.out.println("Removing Session Data....................111"); 	
		 session.removeAttribute("status");
   }

   if(errorCode!=null && (!errorCode.trim().equals("")))
   { %> 

			document.write("<br>");
			document.write("<TABLE width=\"100%\" id = \"ErrorTab\" >");
			document.write("<TR>");
			document.write("<TD style=\"background-color:brown;color:white;WIDTH:100%;\" align=top>");
			document.write("<strong>");
			document.write("'<%=errorCode%>'");	
			document.write("</strong>");
			document.write("</TD>");
			document.write("</TR>");
 		    document.write("</TABLE>");
   <%
	   errorCode = null;
   }
    

 %>	
 </script>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>







