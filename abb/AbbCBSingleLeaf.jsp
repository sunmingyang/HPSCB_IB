<%@ include file="/common/Include.jsp" %>

<%
String branchlist[][]=null;
if(session.getAttribute("sBranchInfo")!=null)
	{
     branchlist=(String[][])session.getAttribute("sBranchInfo");
	}	
%>

<%
String SingleStatus[]=null;
if(session.getAttribute("chkBookSingle")!=null)
	{
     SingleStatus=(String[])session.getAttribute("chkBookSingle");
	}	
%>


<HTML>
<body onLoad="fill()"> 
<html:form action= "/abb/enquiry" >


<table border = "0" align="center" width="90%" height="12%" cellSpacing="0" cellPadding= "0" vspace="0" >
	<TR >
		<TD valign="top">
			<IMG  alt="Azizi Bank" height ="90" width = "99%" src="/images/azizi2.bmp"  border="0">			
		</td>			
 		<TD valign="bottom" align="left" bgcolor="#91203E">		  			
			<img src="/images/home.bmp" border="0">
	    </td>
   </tr>
   <TR >
		<TD valign="bottom" >
	   	  <IMG  alt="Azizi Bank" height ="20" width = "104%" src="/images/header_page.jpg"  border="0">
        </td>
		<td>&nbsp;</td>
   </tr>


 </table>


<br>
<br>
<table border="0" width="50%" cellpadding="0" cellspacing="0" bgcolor="#FDE4E3" align='center'>                
	
	<thead>  
	   <th align="center" rowspan="2" colspan="2" >
		  <b>Cheque Book Single Leaf Enquiry</b>
	   </th>
	  </tr>
	</thead>
				   <tr>
						<td  style="padding-left:10px" width="450" class="simple"> 
							<bean:message bundle="<%=lang%>" key= "425"/> 
					    </td>
						<td align="left">
							<html:select property="sBranchInfo"  style="width:200px;" tabindex="0">
								<%if(branchlist!=null)
								{
								 for(int i=0;i<branchlist.length;i++)
								  {%>
									<html:option value="<%=branchlist[i][1] %>"> 
									<%=branchlist[i][1] %>
									</html:option>
								  <%}
								}%>
							 </html:select>
						 </td>						
				</tr>
					<!--Second row-->	
				<tr>
						<td  style="padding-left:10px" width="450" class="simple"> 
							Cheque Book Number 
						</td>
						<td align="left" colspan="3">
							<html:text   property="sLeafno" styleId="sLeafno"size="10" onkeypress="javascript:isValidNumber()" tabindex="2"/>
					   </td>
			    </tr><!--end of sec row-->
		
			 </table><!--end of inner table--->
		   </tr>
	   	 </td>
	</table>
<br>
<% 
			 if(SingleStatus!= null)
				{
				System.out.println("SingleStatus not null");
				int j = SingleStatus.length;
				System.out.print("length of the array ::"+j);
					if(j!=0)
						{
			%>
	<table border="1" align="center" width="98%" cellpadding="-1" cellspacing="-1" id="table">
		<thead>
			<tr bgcolor="brown"> 
				<TH width="1%" ><font color="#FFFFFF"> S.No.</font></TH>
				<TH width="10%" ><font color="#FFFFFF"> Account Number</font></TH>
				<TH width="5%" ><font color="#FFFFFF"> Cheque Series</font></TH>
				<TH width="8%" ><font color="#FFFFFF"> Issus  Date</font></TH>
				<TH width="8%" ><font color="#FFFFFF"> Cheque Start No.</font></TH>
				<TH width="8%"><font color="#FFFFFF">	Cheque End No.</font></TH>
				<TH width="8%"><font color="#FFFFFF">  Enquired Leaf</font></TH>
				<TH width="6%"><font color="#FFFFFF"> Leaf Status</font></TH>
			</tr>
		</thead>
			
						<tbody  class="scrolling" style="max-height:20px;">
						<%
						 for(int i=0;i<1;i++)
						 {
						  int k=0;
						%>
			   <tr>
				    <td  align="center" id="text<%=i%><%=k++%>" >
				       <%=i+1%>
					</td>
					<!--Account number-->
					<td align="center"  id="text<%=i%><%=k++%>">
						<%=SingleStatus[0]%>
					</td>
					<!--Cheque Series-->
					<td  align="center" id="text<%=i%><%=k++%>">
						<%= SingleStatus[5] %>
					</td>
					<!--Issue Date-->
					<td  align="center" id="text<%=i%><%=k++%>" >
						<%= SingleStatus[3] %>
					</td>
					<!--Cheque Start No-->
					<td align="center" id="text<%=i%><%=k++%>">
						<%= SingleStatus[1] %>
					</td>
					<!--Cheque End no-->
					<td align="center" id="text<%=i%><%=k++%>">
						<%= SingleStatus[2] %>
					</td>
					<!--Enquierd leaf-->
					<td align="center" id="text<%=i%><%=k++%>">
						<%= SingleStatus[6] %>
					</td>
					<!--Status-->
					<td align="center" id="text<%=i%><%=k++%>">
						<%= SingleStatus[4] %>
					</td>	
				</tr>

				<%}%>
				</tbody>
				<%}%>
				<%}%>
		</table>
	

		<table align="center">
			<input   value="   <bean:message bundle='<%=lang%>' key='86'/>    " class="Button" type="button" tabindex="3" style="width:100px" onclick="statement_submit()" > 
			<input type="button" value="Back" onclick="backmini()" class="button" tabindex="5" style="width:100px"/>
			<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " class="Button" type="button" tabindex="4" style="width:100px"
			onclick="helpopen()"/>
			
	 </table>


</html:form>
</body>
</html>
<script language="JavaScript">


function statement_submit()
{	
//if(document.getElementById("sAccno").value=="")
	//{alert("Please insert Account Number");
	//document.getElementById("sAccno").focus();	
		//return false;}
		//else{

disabledControlsOnAction(document.forms[0]);
document.forms[0].action="/abb/enquiry.do?action=abbCheckSingleStatus";
document.forms[0].method="post";
document.forms[0].submit();
		//}
}
function backmini()
	{
		window.location.href="/abb/abb_home.jsp";				
	}
function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=CBSingle","child", bar);
}


function fill()
{
document.getElementById("sBranchInfo").focus();
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
