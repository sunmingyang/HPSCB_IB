<%@ include file="/common/Include.jsp" %>

<%
    String errorCode = "";
    if(session.getAttribute("errorCode") != null){
		errorCode = (String)session.getAttribute("errorCode");  
    }
%>
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


<br><br><br><br><br><br>
<center>
<table BORDER="0" width="100%" bordercolor="brown" align="center" cellpadding="0" cellspacing="0" >
	<tr>
	 <td align="center">
			<font size="4">Error Code: <%=errorCode%>&nbsp;:&nbsp;&nbsp;<bean:message bundle="errors"  key='<%=errorCode%>' /></font>
	 </td>
	</tr>
</table>


<br><br><br><br><br>
<table>
<tr>
 <td  align="center" colspan="1">
	<input type="button" name="ok" id="ok" class="Button" value='<bean:message bundle="hindi" key="86"/>'
	style="width:70px" onClick="back()" > 
 </td>
</tr>
</table>

 
</form>
</BODY>
</HTML>


<script>
function back(){

	document.forms[0].action = "/abb/abb_loginform.jsp";
    document.forms[0].method = "post";
	document.forms[0].submit();
}
</script>