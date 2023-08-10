<%@ include file='/common/Include.jsp' %>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<script>
function Onload()
{
	if(document.getElementById("errormessage").options.length!=0)
	{
		document.getElementById("diverrmessage").style.display = "block";
		document.getElementById("errorhead").style.display = "block";
	}
	else
	{
		document.getElementById("diverrmessage").style.display = "none";
		document.getElementById("errorhead").style.display = "none";
	}
}
</script>
<% 
int errorcount=0;
%>
<link href="../styles/styles.css" rel="stylesheet" type="text/css">
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Request"/>
<tiles:put name="menu" value="../common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="../common/line.html"/>
<tiles:put name="page_header" type="String" >
<bean:message bundle="hindi" key="7123" />
</tiles:put>
<tiles:put name="content" type="String">
<br>
<br>
<body onLoad="Onload()">
<html:form action="/request/reqchk.do"  >
<% if (request.getParameter("cheque")!=null)
{ %>
<table><tr><td class="heading">
Not a Valid Cheque
</td></tr></table>
<% } %>
<table width="98%">
<tr>
	<td colspan="5" align="right" class="simple">
		<input type="button" onClick="back_req()" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>">
		<input type="button" onClick="help_req()" class="button" value="<bean:message bundle='<%=lang%>' key='6288'/>">
	</td>
</tr>
</table>
<table border="1" width="98%" bordercolor="brown" style="border-left:none;border-right:none;border-top:none;border-bottom:none;" >
<tr><td>
<table  cellpadding="0" width="100%" c cellspacing="0">
<tr><td>
<table align="center" width="100%" cellpadding="0" cellspacing="0" >
	<tr> 
		<Td width="270" colspan="5" class="tbl_heading">
		<bean:message bundle='<%=lang%>' key='7123'/></Td>
	</tr>
	<tr> 
		<Td width="270" colspan="5">&nbsp;</Td>
	</tr>
	<tr>
		<td colspan="5" align="left" class="simple">
		
		<bean:message bundle='<%=lang%>' key='1027'/>
		<% 
	LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");   
if(userInfo!=null)
{ 
String[] acc_nums =userInfo.getsIbUsr_AccNums();
		int j=acc_nums.length;
if(j!=0)
{ %>
		<select  name="sAccList" id ="sAccList"  style="WIDTH: 220px">
		     	<% for(int l=0;l<j;l++)
		{ %>
	
			 
			   <option ><%= (String)acc_nums[l] %></option>
			      <% } %>
			   </select>
			   
			      <%} 
			   } %>
		<html:hidden property="usrid" value="aaa"></html:hidden>
		
		</td>
	</tr>
	<tr><td colspan="5">&nbsp; </td></tr>
	<tr>
		<td  align="left" class="simple">
		
		<input type="radio" name="select" id="select" value="own" >
		 <bean:message bundle='<%=lang%>' key='7121'/>
		
		</td>
		
		<td class="simple"><bean:message bundle='<%=lang%>' key='7122'/>
		<input type="text" name="schk_no" id="schk_no" size="15" onkeypress="javascript:isValidNumAlpha()" />
	
	<input type="hidden"  id="sPrev_page" name="sPrev_page" value='chkStatus'>
		</td>
	</tr>
	 	<tr><td colspan="5">&nbsp; </td></tr>

	 <tr>
		<td colspan="4" align="left" class="simple">
		
	<input type="radio" name="select" id="select" value="other">
	<bean:message bundle='<%=lang%>' key='7131'/>
		
		</td>
	</tr>
	
</table>
</td></tr>
<tr><td>
<table align="center" width=586 cellpadding="-1" cellspacing="-1" id="tabela">
		<tr><td colspan="2">&nbsp; </td></tr>

	<tr>
		<td width="299" class="simple">
		<bean:message bundle='<%=lang%>' key='115'/> *
		<input type="text"  name="sfrm_dt" id="sfrm_dt" size="15" onkeypress="isValidDatechar()" >
		</td>
		<td width="285" class="simple">
		<bean:message bundle='<%=lang%>' key='116'/> *
		<input type="text" name="sto_dt" id="sto_dt" size="15" onkeypress="isValidDatechar()" >
		</td>
	</tr>
	<tr>
		<td style="padding-left:140px"  class="simple">
		<b> dd/mm/yyyy </b>
		<br>
		<br>
		</td>
		<td  style="padding-left:130px" class="simple">
		<b> dd/mm/yyyy </b>
		<br>
		<br>
		</td>
	</tr>
</table>
</td></tr>
<tr><td>
<table align="center" width="100%" cellpadding="-1" cellspacing="-1" id="tabela" >
	<tr>
		<td colspan="5" align="left" class="simple">
		<input type="button" value ="<bean:message bundle='<%=lang%>' key='7124'/>" onClick=" return chk_status()" class="button" >
		</td>
	</tr>
</table>
</td></tr>
<tr><td>
<table align="center" width=587 cellpadding="-1" cellspacing="-1" id="tabela">
<br>
** Please note that issue date refers to the date when the cheque book was issued.<br>
**The online cheque status will not be available when the branch is offline. If this happens,<br>
please try during the regular banking hours.
</table>
</td></tr></table>
 <tr> 
      <td align="left" valign="bottom" >
	   <div id ="errorhead" style="display:none;">
         <label > <font color="#FF0000"><u><bean:message bundle= "<%=lang%>" key= "1808"/></u></font></label>
        </div></td>
		</TR>
      <!--....................................Table for error messages.....................................-->
    		
 <tr>
      <td><div id="diverrmessage" style="display:none"> 
          <select name="errormessage"id="errormessage" size="2" style="background-color:activeBorder;FONT-SIZE:10px; WIDTH:400px;"onclick="goToErrorControl(this.form.errormessage)">
            <logic:messagesPresent property="Error" >
            <option value="">
			<%=++errorcount%>.&nbsp;<html:errors property="Error"/></option>
            </logic:messagesPresent> 
			</option>
			</select>
			</div>
		</td>
</tr>
</td></tr></table>

</body>
</html:form>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
</tiles:insert >