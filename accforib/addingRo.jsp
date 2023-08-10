<%@ include file="/common/Include.jsp" %>

<script language="JavaScript" src="/jsp/scripts/chng_pass.js">
</script>

<script language="JavaScript">

function addinro()
{
	
	if(document.getElementById("sronid").value=="")
	{
     
     alert("id should not be left blank"); 
	 document.getElementById("sronid").focus();
	}
    else if(document.getElementById("srocode").value=="")
	{
     
     alert("code should not be left blank"); 
	 document.getElementById("srocode").focus();
	}
	else if(document.getElementById("srotext").value=="")
	{
     
	 alert("ename should not be left blank");
	 document.getElementById("srotext").focus();
	}
	else 
	{
	alert("hello2");
	document.getElementById("RO").value;
	document.getElementById("srocode").value;
	document.getElementById("sronid").value;
	document.getElementById("srotext").value;
	document.forms[0].action="../openaction.do?src=roaccess";
	document.forms[0].method = "POST";
	document.forms[0].submit();
	}

}

function startpoint()
{
	//alert("in startpoint");
   // document.getElementById("srocode").value="";
	//document.getElementById("sronid").value="";
	//document.getElementById("srotext").value="";
    document.getElementById("ZoOnload").value="zovalueonload";

<%
	if(session.getAttribute("count")=="c")
	{
		System.out.println("in jsp in conition");
	%>
		document.forms[0].action="../openaction.do?src=zoLoad"
		document.forms[0].method="POST";
		document.forms[0].submit();
	<%
	}
%>
	//document.getElementById("sronid").focus();

}



function Back()
{
	
	document.forms[0].action="/CommonCancelAction.do?reqForm=bactoZoRoMaster"
	document.forms[0].method="post";
	document.forms[0].submit();
}
   
</script>


<%
String gotroro[][]=null;
if(session.getAttribute("szoload")!=null)
	{
	System.out.println("in session gget attribute on adding ro");
    gotroro=(String[][])session.getAttribute("szoload");
	
	}	

%>


<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Login Page"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="menu" value="/common/left.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
	<bean:message bundle="hindi" key="7007" />
</tiles:put>
<tiles:put name="content" type="String">

<body onLoad="startpoint()">

	<form action="../openaction.do">
<br>
<br>
<table  cellpadding="0" cellspacing="0" BORDER=1 width=400 bordercolor="" >
		<tr> 
			<td align="center"> 
				<table cellpadding="0" cellspacing="0" width="100%" >
					  <tr> 
						   <td colspan="4" align="center" bgcolor="brown">
							<font color="ffffff">RO Master Entry</font> 
					       </td>
					  </tr>
				      <tr> 
						   <td colspan="4">&nbsp;</td>
					  </tr>

					  <tr>
					        <td><font color="brown">&nbsp &nbsp Select ZO </td>
						    <td>&nbsp  
						    <select tabindex="" name="RO" style="width:115" id="RO">
				       <% 
							if(gotroro != null)
							 {
								 System.out.println("in option ");
							 int col=1;
							 int idcode=0;
							 for(int index = 0 ; index < gotroro.length; index++)
							  {
					   %>
						     <option value ='<%=gotroro[index][idcode]%>'><%=gotroro[index][col]%></option>
				   
				       <%
				               }
			                  }
			            %>

						     </select>
						     </td>
					  </tr>
					<tr><td><br></td></tr>

					
					  <tr>
						    <td><font color="brown">&nbsp &nbsp Enter RO id  </td>
						    <td>&nbsp
							<input type="text" name="sronid" id="sronid" value="">
						    </td>
					  </tr>
					<tr><td><br></td></tr>


					  <tr>
						     <td><font color="brown">&nbsp &nbsp Enter RO Code </td>
						     <td>&nbsp
							 <input type="text" name="srocode" id="srocode" value=""> &nbsp <font color="red">*</font>
						     </td>
					</tr>
					<tr><td><br></td></tr>


					<tr>
						     <td><font color="brown">&nbsp &nbsp Enter RO Name </td>
						     <td>&nbsp
							 <input type="text" name="srotext" id="srotext" value="">
						     </td>
					</tr>
					<tr><td><br></td></tr>
							
					<tr>
					         <td align="center">
					         <input type="button"  value="OK" class="Button" onClick="addinro()"/>
					         </td>
					         <td align="left">&nbsp 
					         <input type="button" value="CANCEL" class="Button" onClick="Back()"/>
					         </td>
					</tr>
					
			</table>
			<input type="hidden" name="ZoOnload" id="ZoOnload" value="">
        </td>				
		</tr>
					
			
	 </table>
		<br>
		<br>


			   
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







