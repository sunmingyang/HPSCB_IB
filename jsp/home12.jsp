<%@ include file="/common/Include.jsp" %>
<%
String AdminName=(String)session.getAttribute("AdminName");
%>
<%
	String connected[][] = null;
	int connect=0,disconnect=0;
	if(session.getAttribute("BrStatus1") != null)
		{
			System.out.println("in brstatus1 on jsp");
		connected = (String[][])session.getAttribute("BrStatus1");
		for(int i = 0;i<connected.length;i++){
			if(connected[i][3].trim().equals("C"))
				{
				System.out.println("in connected");
				connect++;
			     }
			else if(connected[i][3].trim().equals("D"))
				{
				System.out.println("in disconnected");
				disconnect++;
			    }
		}
		
	}
	
%>

<script>
function startpoint()
{
 document.getElementById("RO").value="";
//alert("getting value for zo");

	<%
    
	if(session.getAttribute("count")=="c")
	{
		System.out.println("in jsp in conition");
	%>
		document.forms[0].action="/openaction.do?src=zoLoadforhome"
		document.forms[0].method="POST";
		document.forms[0].submit();
	<%
	}
    %>


}


function callrovalue()
{
	   //  alert("in call for ZO");
	    document.forms[0].action="/openaction.do?src=rovalueforhome"
		document.forms[0].method="POST";
		document.forms[0].submit();
}

function callforBranchonRo()
{
	alert("calling  branch for ro selected");
        document.forms[0].action="/openaction.do?src=getbranchROselected"
		document.forms[0].method="POST";
		document.forms[0].submit();

}

</script>

<%
String gotroro[][]=null;
if(session.getAttribute("szoloadmaster")!=null)
	{
	System.out.println("in session home attribute on adding szoloadmaster");
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

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>

<tiles:put name="menu" value="/common/left.jsp"/>
<tiles:put name="page_header" type="String">
Welcome&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</tiles:put>
<tiles:put name="content" type="String">


<body onLoad="startpoint()">
<form>

<table style="BORDER-TOP-STYLE: none; border-COLOR: brown; BORDER-BOTTOM-STYLE: none;BORDER-RIGHT-STYLE: none; border-size=1;" width="100%">
<% if (request.getParameter("process")!=null )
{ %>
<tr>
<td class="heading">Logged Out Succesfully !!!</td></tr>
<tr><td>&nbsp;</td></tr>
<%
session.removeAttribute("userInfo");
 } %>
<!-- <tr><td>
<font color="brown" class=active><b>How do I register?</b></font></td></tr>
<tr><td>
My-Bank  Internet Banking is convenient banking! Almost all the banking transactions<bR> for which you need to visit the branch can be done on our internet banking site, My-Bank.com.<bR>
From checking your account balance to transaction history to transferring funds to paying bills,<bR> you can do everything here. Its convenience banking – anytime, anywhere!<bR> To avail of this convenience, you have to get registered</a>
<br>
</td></tr>-->
<tr><td>
<br>
<font color="brown" class=active><b>
<!-- How do I register? -->&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;</b></font> <br>
<!-- To use My-Bank Internet Banking you need to get registered. You can either register<br> online or download the form, fill it up and drop it at any My-Bank <br>branch or ATM drop box.<br>

Once you are registered (ie; you have received your Internet <br>Banking User ID and Password) you need to login to access your internet account. -->
</td>
</tr> 

<table align="center" border="1" width="50%">
    <thead>  
	   <th align="center" rowspan="2" colspan="2" >
		  <b>Getting Connected Branches</b>
	   </th>
	  </tr>
	</thead>
<tr>
					  </td>				
					        <td><font color="brown">&nbsp Select ZO </td>
						    <td>&nbsp  
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
					</tr>
                    <br>
					
					<tr>
					</td>				
					        <td><font color="brown">&nbsp Select RO </td>
						    <td>&nbsp  
						    <select tabindex="" name="RO" style="width:115" id="RO" onChange="callforBranchonRo()" >
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
					</tr>

					
</table>
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

