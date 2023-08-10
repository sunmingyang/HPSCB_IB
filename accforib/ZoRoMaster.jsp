<%@ include file="/common/Include.jsp" %>

<script language="JavaScript" src="/jsp/scripts/chng_pass.js">

</script>

<script language="JavaScript">

function callingzo()
{
	document.forms[0].action="../openaction.do?src=addzo";
	document.forms[0].method = "POST";
	document.forms[0].submit();
}

function callingro()
{
	document.forms[0].action="../openaction.do?src=addro";
	document.forms[0].method = "POST";
	document.forms[0].submit();
}


function startpoint()
{
  
 //document.getElementById("ZO").value="";

//document.getElementById("RO").value="";

   //document.getElementById("srocode").value="";
   //document.getElementById("sronid").value="";
   //document.getElementById("srotext").value="";
<%
	if(session.getAttribute("count")=="c")
	{
		System.out.println("in jsp in conition");
	%>
		//alert("aaya...");
		document.forms[0].action="../openaction.do?src=zoLoadFormaster"
		document.forms[0].method="POST";
		document.forms[0].submit();
	<%
	}
%>
		
	//document.getElementById("sronid").focus();

}



function callrovalue()
{
	  // alert("in call for ZO");
	    document.forms[0].action="../openaction.do?src=rovalue"
		document.forms[0].method="POST";
		document.forms[0].submit();
}


function bringbrndata()
{
	//alert(" bringing brn data");
    	<%
	if(session.getAttribute("count")=="c")
	{
		System.out.println("in jsp in conition");
	%>
		document.forms[0].action="../openaction.do?src=brndata"
		document.forms[0].method="POST";
		document.forms[0].submit();
	<%
	}
%>
}



function savinginsbrn()
{
	if(document.getElementById("RO").value=="")
	{
		alert("RO should not left blank");
		document.getElementById("RO").focus();
			
	}
	else
	{
	alert("in else");
	document.forms[0].action="../openaction.do?src=updatevalueinsbrn"
	document.forms[0].method="POST";
	document.forms[0].submit();
	}

}


function Back(){
	
	document.forms[0].action="/CommonCancelAction.do?reqForm=bactoUserOperation"
	document.forms[0].method="post";
	document.forms[0].submit();
}
</script>


<%
String gotroro[][]=null;
if(session.getAttribute("szoloadmaster")!=null)
	{
	System.out.println("in session ggetzoro attribute on adding szoloadmaster");
    gotroro=(String[][])session.getAttribute("szoloadmaster");
	//session.removeAttribute("szoloadmaster");
	}	

%>


<%
String gotro[][]=null;
if(session.getAttribute("sroload")!=null)
	{
	
	System.out.println("in session gget attribute on adding ro");
    gotro=(String[][])session.getAttribute("sroload");
	session.removeAttribute("sroload");
	}	

%>

<%
String gotbrndata[][]=null;
if(session.getAttribute("brnload")!=null)
	{
	
	System.out.println("in session gget attribute on adding ro");
    gotbrndata=(String[][])session.getAttribute("brnload");
	
	}	

%>


<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="ZO RO Entry"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>

<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=zoRoMasterEntry"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=zoRoMasterEntry&src=userOperation"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="page_header" type="String" >
	<!-- <bean:message bundle="hindi" key="7007" /> -->
</tiles:put>
<tiles:put name="content" type="String">

<body onLoad="startpoint(),bringbrndata()" style="margin:0 0 0 0;">

	<html:form action= "/jsp/login">
<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > User Operation >> ZO-RO Master Entry</td>
	</tr>
	<tr>
		<td align="center">

<table  cellpadding="0" cellspacing="0" BORDER=0 width=340 bordercolor="" >
		<tr> 
			<td align="center"> 
			<table class="miniStmtBackBorder" width="500">
					<tr class="miniStmtBack">
						<td align="center">
				<table cellpadding="0" cellspacing="0" width="70%" >
					  <tr> 
						<td colspan="4" align="center" class="tableHeader">Linking Branch To ZO and RO
					    </td>
					  </tr>

				      <tr> 
						<td colspan="4">&nbsp;</td>
					  </tr>

					  <tr>
					  </td>				
					        <td class="normalText">&nbsp Select ZO </td>
						    <td>&nbsp:  
						    <select tabindex="" name="ZO" style="width:115" id="ZO" onChange="callrovalue()">
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
					<td>&nbsp &nbsp &nbsp
						<input type="button" value="ADD ZO"  onClick="callingzo()"/>
					</td>
					</tr>


					<tr><td><br></td></tr>
					<tr>
					</td>				
					        <td class="normalText">&nbsp Select RO </td>
						    <td>&nbsp:  
						    <select tabindex="" name="RO" style="width:115" id="RO" >
				       <% 
							if(gotro != null)
							 {
								 System.out.println("in option ");
							 int col=1;
							 int idcode=0;
							 for(int index = 0 ; index < gotro.length; index++)
							  {
					   %>
						     <option value ='<%=gotro[index][idcode]%>'><%=gotro[index][col]%></option>
				   
				       <%
				               }
			                  }
			            %>

					        </select>
					</td>
					<td>&nbsp &nbsp &nbsp
						<input type="button" value="ADD RO"  onClick="callingro()"/>
					</td>
					</tr>

					<tr><td><br></td></tr>
					<tr>										
					        <td class="normalText">&nbsp Select Branch </td>
						    <td>&nbsp:  
						    <select tabindex="" name="BR" style="width:115" id="BR">
				       <% 
							if(gotbrndata != null)
							 {
								 System.out.println("in option ");
							 int col=1;
							 int idcode=0;
							 for(int index = 0 ; index < gotbrndata.length; index++)
							  {
					   %>
						     <option value ='<%=gotbrndata[index][idcode]%>'><%=gotbrndata[index][col]%></option>
				   
				       <%
				               }
			                  }
			            %>

					        </select>
					</td>
					</tr>
					<tr><td><br></td></tr>

					<tr>
					<td align="center" colspan=4>
					<input type="button" value="  OK  "  onClick="savinginsbrn()"/>
					<input type="button" value="CANCEL"  onClick="Back()"/>
					</td>
					</tr>
				</table>
             </td>
          </tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>

    </html:form>
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

</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
<%
if(session.getAttribute("ZORO")!=null)
{%>

	<script>
		
		//alert("in get session zoro"+ '<%=(String)session.getAttribute("ZORO") %>');
    	document.getElementById("ZO").value ='<%=(String)session.getAttribute("ZORO") %>';

	</script>
		

	<% 
		session.removeAttribute("ZORO");
}

%>





