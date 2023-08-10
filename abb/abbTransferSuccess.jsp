<%@ include file="/common/Include.jsp" %>
<%@ page import = "easycbs.bancmateib.fundtransfer.actionform.ABBTransferForm"%>
<% 
  
  ABBTransferForm abbForm = null;
 
%>

<HTML>

<script>
function bodyOnLoad()
{	
   
	
<%
	if(session.getAttribute("ABBTransferForm")!=null) {
		abbForm=(ABBTransferForm)session.getAttribute("ABBTransferForm");
%>
		
		document.getElementById("sBranchFrom").value='<%=abbForm.getsFromBranch()%>';
		document.getElementById("sAcnoFrom").value ='<%=abbForm.getsAcnoFrom()%>';
		document.getElementById("sBranchTo").value='<%=abbForm.getsToBranch()%>'
		document.getElementById("sAcnoTo").value ='<%=abbForm.getsAcnoTo()%>';
		
		document.getElementById("sAmount").value = '<%= abbForm.getsAmount2()%>';
		document.getElementById("sDate").value = '<%= abbForm.getsABBCurrentDate()%>';
		
	<%
		session.removeAttribute("ABBTransferData");
	}

	%>
	<%
	if(session.getAttribute("uniqueTxnNo")!=null) {
	%>
		document.getElementById("sTxnNo").value = '<%=session.getAttribute("uniqueTxnNo")%>' ;
	<%
		session.removeAttribute("uniqueTxnNo");
	}

	%>


}


</script>

<BODY onLoad="bodyOnLoad()">

<form>	


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

<!-- 
<table border = "0" align="center" width="99%" height="12%" cellSpacing="0" cellPadding= "0" vspace="0" >
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

-->

 <br>


<table BORDER="1" width="35%" bordercolor="brown" align="center" cellpadding="0" cellspacing="0" >
<tr>
 <td>
 <table cellpadding="0" cellspacing="0" width="100%" border="0" align="center">
	<tr> 
	   <td colspan="2" align="center" bgcolor="brown">
		<font color="ffffff" size="2" ><b>ABB Voucher Transaction Info</b></font> 
		</td>
	</tr>
	<tr>
	 <td>&nbsp;</td>
	</tr>
	<tr>
	<td  style="padding-left:10px"> 
		 <bean:message bundle="<%=lang%>" key= "7443"/>
		</td>
			<td align="left">
			<input type="text"  name="sBranchFrom" style="width:100"  Id="sBranchFrom"  class="" readOnly/> 			  
		</td>	
	</tr>
	<tr>
		<td  style="padding-left:10px"> 
		 <bean:message bundle="<%=lang%>" key= "1181"/>Debit
		</td>
			<td align="left">
			<input type="text"  name="sAcnoFrom" style="width:100"  Id="sAcnoFrom"  class="" readOnly/> 			  
		</td>		
	</tr>

<tr>
		<td  style="padding-left:10px"> 
		 <bean:message bundle="<%=lang%>" key= "7444"/>
		</td>
			<td align="left">
			<input type="text"  name="sBranchTo" style="width:100"  Id="sBranchTo"  class="" readOnly/> 			  
		</td>		
	</tr>
	<tr>
		<td  style="padding-left:10px"> 
		 <bean:message bundle="<%=lang%>" key= "1181"/>Credit
		</td>
			<td align="left">
			<input type="text"  name="sAcnoTo" style="width:100"  Id="sAcnoTo"  class="" readOnly/> 			  
		</td>		
	</tr>

	<!-- 	
	<tr>
		<td  style="padding-left:10px"> 
		 <bean:message bundle="<%=lang%>" key= "7431"/> 
		</td>
			<td align="left">
			<input type="text"  name="sFromBranch" style="width:100"  Id="sFromBranch"  class="" readOnly/> 			  
		</td>		
	</tr>

	<tr>
		<td  style="padding-left:10px"> 
		 <bean:message bundle="<%=lang%>" key= "7432"/> 
		</td>
			<td align="left">
			<input type="text"  name="sToBranch" style="width:100"  Id="sToBranch"  class="" readOnly/> 			  
		</td>		
	</tr>
        
-->
         <tr>
			<td  style="padding-left:10px" > 
			 <bean:message bundle="<%=lang%>" key= "43"/> 
			</td>
			
			<td align="left">
			<input type="text"  name="sDate" style="width:100"  Id="sDate"  class="" readOnly/> 			  
			</td>
		</tr>
		<tr>
			<td  style="padding-left:10px"> 
			 <bean:message bundle="<%=lang%>" key= "39"/> 
			</td>
			
			<td align="left">
			<input type="text"  name="sAmount" style="width:100"  Id="sAmount" align="right"  class="" readOnly/> 			  
			</td>
		</tr>
		<tr>
			<td  style="padding-left:10px"> 
			 <bean:message bundle="<%=lang%>" key= "2222"/> 
			</td>
			
			<td align="left">
			<input type="text"  name="sTxnNo" style="width:100"  Id="sTxnNo"  class="" readOnly/> 			  
			</td>
		</tr>
		<tr><td>&nbsp;&nbsp;</td></tr>
	</table><!--end of inner table--->
  </td>
</tr>

<tr>
 <td  align="center" colspan="1">
	<input type="button" name="ok" id="ok" class="Button" onclick="closeWindow()"
			value='<bean:message bundle="hindi" key="86"/>'	style="width:70px" > 
 </td>
</tr>
</table>


 
</form>
</BODY>

<script>
function closeWindow()
{
	

	document.forms[0].action="/CommonCancelAction.do?reqForm=TrOperations"
	document.forms[0].method="post";
	document.forms[0].submit();

}

</script>

</HTML>

