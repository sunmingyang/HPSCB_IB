<%@ include file="/common/Include.jsp" %>
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


<%
String branchlist[][]=null;
String errorCode ="",loginBranch ="";
      if(session.getAttribute("loginBranchCode") != null){
          loginBranch = (String)(session.getAttribute("loginBranchCode")); 
	  }	
if(session.getAttribute("sBranchInfo")!=null)
	{
     branchlist=(String[][])session.getAttribute("sBranchInfo");
	}	
%>


<br>
	<table BORDER=5 width="40%" bordercolor="brown" align="center" cellpadding="0" cellspacing="0" >
	 <tr>
		<td>
			<table border="0" width="100%" cellpadding="0" cellspacing="0" bgcolor="#FDE4E3" align='center'>                
	
	<thead>  
	   <th align="center" rowspan="2" colspan="2" >
		  <b>ABB A/c Enquiry</b>
	   </th>
	  </tr>
	</thead>

			   <td  style="padding-left:10px" width="450" class="simple"> 
				  <bean:message bundle="<%=lang%>" key= "425"/> 
			   </td>

			   <td align="left">
			      <html:select property="sBranchInfo"  style="width:200px;" tabindex="1">
				    <%if(branchlist!=null)
				     {
					   for(int i=0;i<branchlist.length;i++)
						  {
						   if(!loginBranch.equals(branchlist[i][1]))
							  {
							   %>
								<html:option value="<%=branchlist[i][1] %>"> 
								  <%=branchlist[i][1] %>
								</html:option>
							  <%
							  }
						}
				     }%>
			        </html:select>
			     </td>					

				<!--Second row-->	
				<tr>
				   <td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "1027"/> 
				   </td>

				   <td align="left" >
					  <html:text   property="sAccno" styleId="sAccno" size="37" maxlength="20" onkeypress="javascript:isValidNumber()" tabindex="2" />
		  
			       </td>
			  </tr><!--end of sec row-->
		   </table><!--end of inner table--->
	    </tr> 
      </td>
  </table><!--End of outer table-->
<br>

<table align="center">
<input   value="   <bean:message bundle='<%=lang%>' key='131'/>    " class="Button" type="button" tabindex="3" style="width:100px"  id="ok" onclick="view_submit()" > 

<input   value="   <bean:message bundle='<%=lang%>' key='7000'/>    " class="Button" type="button" tabindex="5" style="width:100px" onclick="reset_submit()" /> 

</table>
<br>
	<table BORDER=1 width="40%" bordercolor="brown" align="center"  cellpadding="0" 	cellspacing="0" >
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%" border="0">
				<tr>
					<td  style="padding-left:10px" width="450" class="simple">
						<bean:message bundle="<%=lang%>" key= "89"/> 
					</td>
					<td>
						<html:text   property="sAccName" styleId="sAccName"size="37" tabindex="-1" readonly ="true" />
					</td>
			    </tr>

				<tr>
					<td  style="padding-left:10px" width="450" class="simple"> 
						<bean:message bundle="<%=lang%>" key= "717"/> 
					</td>
					<td>
						<html:text   property="sAccCurbal" styleId="sAccCurbal"size="37" tabindex="-1" readonly ="true"  />
					</td>
				</tr>
				
				<tr>
					<td  style="padding-left:10px" width="450" class="simple">
					 <bean:message bundle="<%=lang%>" key= "716"/> 
				    </td>
					<td>
					  <html:text   property="sAccStatus" styleId="sAccStatus"size="37" tabindex="-1" readonly ="true" onkeypress="javascript:isValidNumAlpha()"/>
					</td>
		    	</tr>			
			
				<tr>
					<td  style="padding-left:10px" width="450" class="simple"> 
						<bean:message bundle="<%=lang%>" key= "217"/> 
				    </td>
				    <td>
						<html:text   property="sAccCurency" styleId="sAccCurrency"size="37" tabindex="-1" readonly ="true" onkeypress="javascript:isValidNumAlpha()"/>
				   </td>
			    </tr>
			
				<tr>
					<td  style="padding-left:10px" width="450" class="simple">
					   <bean:message bundle="<%=lang%>" key= "82"/> 
					</td>
					<td>
						<html:text   property="sModeOp" styleId="sModeOp"size="37" tabindex="-1" readonly ="true" onkeypress="javascript:isValidNumAlpha()"/>
					</td>
			    </tr>			
				
				<tr>
					<td  style="padding-left:10px" width="450" class="simple"> 
						<bean:message bundle="<%=lang%>" key= "356"/> 
					</td>
					<td>
						<html:text   property="sAuthSign" styleId="sAuthSign"size="37" tabindex="-1" readonly ="true" onkeypress="javascript:isValidNumAlpha()"/>
					</td>
			    </tr>

				<tr>
					<td  style="padding-left:10px" width="450" class="simple"> 
						<bean:message bundle="<%=lang%>" key= "493"/> 
					</td>
					<td>
						<html:text   property="sAccCategory" styleId="sAccCategory"size="37" tabindex="-1" readonly ="true" onkeypress="javascript:isValidNumAlpha()"/>
					</td>
				</tr>		
			 </table>
			</td>
		</tr>
	</table>		

<br>

	<table align="center" >
      <tr>
		<td style="padding-left:10px" >
				
			<input   value=" <bean:message bundle='<%=lang%>' key='7445'/>    " class="Button" type="button" tabindex="4" style="width:100px" onclick="statement_submit()" > 
			
			<input type="button" value="Back" onclick="backmini()" style="width:100px" class="button"/>

			<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " class="Button" type="button" tabindex="6" style="width:100px" onclick="helpopen()" > 
		</td>
		</tr>
	</table>

</html:form>
</body>
</HTML>
<script language="JavaScript">
function backmini()
{
document.forms[0].action="/CommonCancelAction.do?reqForm=EnqBack";
document.forms[0].method="post";
document.forms[0].submit();				
}

function statement_submit()
{	
if(document.getElementById("sAccno").value=="")
	{alert("Please insert Account Number");
	document.getElementById("sAccno").focus();	
		return false;}
 
else{
if(document.getElementById("sAccName").value=="")
	{alert("Please insert valid Account Number");
	document.getElementById("sAccno").focus();	
		return false;}

//session.setAttribute("nCurBal",document.getElementById("sAccCurbal").value);
disabledControlsOnAction(document.forms[0]);
document.forms[0].action="/abb/AbbminiStmt.jsp?success=mini";
document.forms[0].method="post";
document.forms[0].submit();
}	
}

function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=AccountEnquiry","child", bar);
}



function reset_submit()
{
	document.getElementById("sAccno").value="";
	document.getElementById("sAccName").value="";
	document.getElementById("sAccStatus").value="";
	document.getElementById("sAccCurbal").value="";
	document.getElementById("sAccCurency").value="";
	document.getElementById("sModeOp").value="";
	document.getElementById("sAuthSign").value="";
	document.getElementById("sAccCategory").value="";
	document.getElementById("sAccno").focus();

	return false;
}


function view_submit()
{	if(document.getElementById("sAccno").value=="")
	{alert("Please insert Account Number");
	document.getElementById("sAccno").focus();	
		return false;}
else{
//disableRestButtons('ok');
   document.getElementById("sAccName").value="";
	document.getElementById("sAccStatus").value="";
	document.getElementById("sAccCurbal").value="";
	document.getElementById("sAccCurency").value="";
	document.getElementById("sModeOp").value="";
	document.getElementById("sAuthSign").value="";
	document.getElementById("sAccCategory").value="";
disabledControlsOnAction(document.forms[0]);
document.forms[0].action="/abb/enquiry.do?action=abbEnquiry";
document.forms[0].method="post";
document.forms[0].submit();
    }

}

function disableRestButtons(btnName){
	document.getElementById(btnName).style.background = "#FDB5B7";     
	document.getElementById(btnName).disabled = true;
		
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
		 //session.removeAttribute("abbCashErrorCode");
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