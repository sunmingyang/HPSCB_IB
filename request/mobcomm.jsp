<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<script language="JavaScript">
function hello(yy)
{
	if (yy!=null)
	{
	disabledControlsOnAction(document.forms[0]);
	}
}
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Request"/>

<%if(request.getParameter("row")==null){ %>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<%}%>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="content" type="String">
 <br>
<br> 
<body onLoad="hello(<%=request.getParameter("row")%>)">

<html:form action="/request/reqchk.do" >

<table width="98%">
<tr>
	<td colspan="5" align="right" class="simple">
	 <input type="button" name="back"
	  onClick="back_req(<%=(String)request.getParameter("row")%>,'MOBILE')" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>"> 
      <input type="button" onClick="help_req()" class="button" value="<bean:message bundle='<%=lang%>' key='6288'/>">
	<input type="hidden"  id="sPrev_page" name="sPrev_page" value='mobcomm'>
	</td>
</tr>
</table>

<table width="98%"   cellpadding="-1" cellspacing="-1" border="1" bordercolor="brown" style="border-left:none;border-right:none;border-top:none;border-bottom:none;" >
<tr><td>
<table width="100%"  cellpadding="-1" cellspacing="-1">
<tr><td>

<table align="center" cellpadding="-1" cellspacing="-1" id="tabela" width="100%">
	
	<tr> 
		<Td colspan="5" class="tbl_heading"> Apply For Mobile Commerce</Td>
	</tr>
	<%
LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");   
if(userInfo!=null)
{ 
String[] acc_nums =userInfo.getsIbUsr_AccNums();
	int j=acc_nums.length;

if(j!=0)
{ %> 
		
	<tr><td colspan="5">&nbsp;</td></tr>
	<tr>
<td  align="left" class="heading">
		<bean:message bundle='<%=lang%>' key='7214'/>:
	<td colspan="4">
		<select  name="sAccList" id ="sAccList" style="WIDTH: 170px">
   	<% for(int l=0;l<j;l++)
	{ %>
	   <option ><%= (String)acc_nums[l] %></option>
      <% } %>
	   </select>
    
		</td>
	</tr>
	<tr>
		<td align="left" class="heading">
		<bean:message bundle='<%=lang%>' key='7191'/>**
		</td>
		<td colspan="4">
		<html:text   property="sname" styleId="sname" size="20" onkeypress="javascript:isValidAlpha()" />
		</td>
	</tr>
	<tr><td colspan="5" >&nbsp;</td></tr>
	<tr>
		<td align="left" class="heading">
		<bean:message bundle='<%=lang%>' key='7192'/>
	</td><td colspan="4">
		<select  name="smob" id ="smob" >
		<option> BSNL </option>
		<option> HUTCH </option>
		<option> AIRTEL </option>
		</select>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td  align="left" class="heading">
		Cellular No.**
		</td>
		<td><html:text property="scellno" styleId="scellno" size="20" onkeypress="javascript:isValidNumber()" maxlength ="11"/>
		</td>
	</tr>
	<tr><td colspan="5">&nbsp;</td></tr>
	<tr>
		<td align="left" class="heading">
		ICICI Phone Banking Relationship No.**
		</td><td colspan="4">
		<html:text   property="srelno" styleId="srelno" size="20" onkeypress="javascript:isValidNumAlpha()"/>
		</td>
	</tr>
	
	
	
	<% }
	 }
	 	HashMap req_detail=(HashMap)session.getAttribute("req_detail");   
	if(req_detail!=null)
	{ 
	
	ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
	ArrayList req_Name=(ArrayList)req_detail.get("req_frmName");
	ArrayList req_SerPr=(ArrayList)req_detail.get("req_SerPr");
	
	ArrayList req_MobNo=(ArrayList)req_detail.get("req_MobNo");
	ArrayList req_Rel=(ArrayList)req_detail.get("req_Rel");
	
	int k=acc_nums.size();
	if(k!=0)
	{ %>
	 
	 
	  <tr><td colspan="5">&nbsp;</td></tr>
	<tr>
		<td align="left" class="heading">
		<bean:message bundle='<%=lang%>' key='7191'/>**
		</td>
		<td>
		<input type="text"  name="sname" id="sname" readonly="true" size="20" value="<%= (String)req_Name.get(Integer.parseInt((String)request.getParameter("row")))%>">
		</td>
		
		
	</tr>
	<tr><td colspan="5">&nbsp;</td></tr>
	<tr>
		<td align="left" class="heading">
	<bean:message bundle='<%=lang%>' key='7192'/>
	</td>
	<td colspan="4">
	<select  name="smob" id ="smob" disabled >
	<option ><%= (String)req_SerPr.get(Integer.parseInt((String)request.getParameter("row")))%></option>
	</select>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="5" align="left" class="heading">
		Cellular No.**
		<input type="text"  value="<%= (String)req_MobNo.get(Integer.parseInt((String)request.getParameter("row")))%>"  name="scellno" id="scellno" size="20" maxlength ="11" readonly="true">
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="5" align="left" class="heading">
		ICICI Phone Banking Relationship No.**
		<input type="text"  name="srelno" id="srelno" size="20" value="<%= (String)req_Rel.get(Integer.parseInt((String)request.getParameter("row")))%>" readonly="true" >
		</td>
	</tr>
	
	<% } 
	} %> 
</table>
</td></tr>
<tr><td>
<table align="center" width="100%" cellpadding="-1" cellspacing="-1" id="tabela">
	<tr>
		<td colspan="5" align="center" class="simple">
		<input type="button" value = "<bean:message bundle='<%=lang%>' key='7124'/>" onClick=" return mob_comm()" class="button">
		</td>
	</tr>
</table>
</td></tr>
</table>
</td></tr>
</table>

</html:form>
</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>