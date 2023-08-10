<%@ include file="/common/Include.jsp" %>

<HTML>
<BODY >

<form >	

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
		 <bean:message bundle="<%=lang%>" key= "1027"/> 
		</td>
			<td align="left">
			<input type="text"  name="sAccountno" style="width:100"  Id="sAccountno"  class="" readOnly/> 			  
		</td>		
	</tr>
		
        <tr>
			<td  style="padding-left:10px" > 
			 <bean:message bundle="<%=lang%>" key= "2222"/> 
			</td>
			
			<td align="left">
			<input type="text"  name="sTxnno" style="width:100"  Id="sTxnno"  class="" readOnly/> 			  
			</td>
		</tr>
		<tr>
			<td  style="padding-left:10px" > 
			 <bean:message bundle="<%=lang%>" key= "3088"/> 
			</td>
			
			<td align="left">
			<input type="text"  name="sTxnType" style="width:100"  Id="sTxnType"  class="" readOnly/> 			  
			</td>
		</tr>

         <tr>
			<td  style="padding-left:10px" > 
			 <bean:message bundle="<%=lang%>" key= "43"/> 
			</td>
			
			<td align="left">
			<input type="text"  name="sTxnDate" style="width:100"  Id="sTxnDate"  class="" readOnly/> 			  
			</td>
		</tr>
		<tr>
			<td  style="padding-left:10px"> 
			 <bean:message bundle="<%=lang%>" key= "39"/> 
			</td>
			
			<td align="left">
			<input type="text"  name="sTxnAmount" style="width:100"  Id="sTxnAmount"  class="" readOnly/> 			  
			</td>
		</tr>
		<tr><td>&nbsp;&nbsp;</td></tr>
	</table><!--end of inner table--->
  </td>
</tr>

<tr>
 <td  align="center" colspan="1">
	<input type="button" name="ok" id="ok" class="Button" value='<bean:message bundle="hindi" key="86"/>'	style="width:70px" > 
	<input type="button" name="print" id="print" class="Button" value='<bean:message bundle="hindi" key="130"/>' style="width:70px" > 
 </td>
</tr>
</table>


 
</form>
</BODY>
</HTML>

