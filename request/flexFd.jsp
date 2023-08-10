<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<script language="JavaScript">
function hello(yy)
{
	if (yy!=null)
	{
	disabledControlsOnAction(document.forms[0],"ibreq");
	}
}
</script>
<%@ include file="/common/header.jsp" %>

<body onLoad="hello(<%=request.getParameter("row")%>)">

<html:form action="/request/reqchk.do">
<table align="center" width="98%" cellpadding="0" cellspacing="0" id="tabela">
<tr>
	<td colspan="5" align="right">
		<input type="button"  name="back"  
		onClick="back_req(<%= request.getParameter("row") %>,'FFD')" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>">
		<input type="button" onClick="help_req()" class="button" value="<bean:message bundle='<%=lang%>' key='6288'/>">
	</td>
</tr>
</table>

<table width="87%" border="1"  bordercolor="brown" style="border-left:none;border-top:none;border-right:none;border-bottom:none;border-decoration:dotted" align="center">
<tr><td>
<table>
<tr><td colspan="5" >

<%  
		LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");   
		if(userInfo!=null)
		{ 
		String[] acc_nums =userInfo.getsIbUsr_AccNums();
		int j=acc_nums.length;

		if(j!=0)
		{ %>


<table width="100%" border="0">
	<tr>
		<td colspan="3" align="left" class="simple">
		<bean:message bundle='<%=lang%>' key='7133'/>
		</td>
		<td colspan="3" align="center">
		<select  name="sAccList" id ="sAccList"  style="WIDTH: 220px">
		<% for(int l=0;l<j;l++)	{ %>
		<option ><%= (String)acc_nums[l] %></option>
		<% } %>
		</select>
		</td>
	</tr>
	<tr>
	      <td colspan="3" align="left" class="simple">
			<bean:message bundle='<%=lang%>' key='7134'/></td>
			<td align="left" class="simple" colspan="1">
			 <input type="checkbox" name="s_chk1" id="s_chk1" value="A"><bean:message bundle='<%=lang%>' key='7208' />
			</td>
			<td align="left" CLASS="simple" colspan="3">
			<input type="checkbox" name="s_chk1" id="s_chk1" value="R"><bean:message bundle='<%=lang%>' key='7209' />
			<input type="hidden"  id="sPrev_page" name="sPrev_page" value='flexFd'>
		</td>
		<br>
	</tr>
	<tr>
		<td colspan="3" align="left" class="simple" >
		<bean:message bundle='<%=lang%>' key='7135'/>
		</td>
		
		<td align="center" class="simple" colspan="1" align="right">
		<html:text property="s_minamt" styleId="s_minamt" value="" size="15" maxlength="10" onkeypress="javascript:isValidNumber()" />
		</td>
	</tr>

	<tr>
	<td colspan="2"></td>
		<td align="center" class="simple" colspan="2" align="right">
	   	<bean:message bundle='<%=lang%>' key='7136'/>
		</td>
	</tr>
	<tr>
		<td colspan="3" align="left" class="simple">
		<bean:message bundle='<%=lang%>' key='7138'/>
		</td>
	
		<td align="center" class="simple" colspan="1">
		<html:text   property="s_minbal" styleId="s_minbal" size="15" maxlength="10" onkeypress="javascript:isValidNumber()" value="" />
		</td>
	</tr>
		
	<tr>
		<td colspan="2" ></td>
		<td align="center" class="simple" colspan="2">
		<bean:message bundle='<%=lang%>' key='7137'/>
		</td>
	</tr>
	<tr><td colspan="5">&nbsp;</td></tr>
	<tr>
		<td colspan="5" align="left" class="simple">
		<bean:message bundle='<%=lang%>' key='7141'/>
		
		</td>
	</tr>

		<td class="simple">
	<bean:message bundle='<%=lang%>' key='7145'/>
		</td>
		<td class="simple">
		<bean:message bundle='<%=lang%>' key='5758'/>
		<select name = "sYear">
		<option value="Year">Year</option>
		<% for(int i =0;i<50;i++)
		{ %>
		<option><%= i %></option>
		<% } %>
		</select>
		</td>
		<td class="simple">
		<bean:message bundle='<%=lang%>' key='5759'/>
		<select name = "sMonth">
		<option value="Month">Month</option>
		<% for(int i =0;i<=11;i++)
		{ %>
		<option><%= i %></option>
		<% } %>
		</select>
		</td>
		<td class="simple"><bean:message bundle='<%=lang%>' key='450'/>
		<select name ="sDay">

		<option value="Day">Day</option>
		<% for(int i =0;i<=30;i++)
		{ %>
		<option><%= i %></option>
		<% } %>
		</select>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="simple" ><bean:message bundle='<%=lang%>' key='7143'/></td>
		<td class="simple"><bean:message bundle='<%=lang%>' key='5758'/>
		<select name ="sYear1">
		<option value="Year">Year</option>
		<% for(int i =0;i<50;i++)
		{ %>
		<option><%= i %></option>
		<% } %>
		</select>
		</td>
		<td class="simple"><bean:message bundle='<%=lang%>' key='5759'/>
		<select name = "sMonth1">
		<option value="Month">Month</option>
		<% for(int i =0;i<=11;i++)
		{ %>
		<option><%= i %></option>
		<% } %>
		</select>
		</td>
		<td class="simple"><bean:message bundle='<%=lang%>' key='450'/>
		
		<select name ="sDay1">
				<option value="Day">Day</option>
		<% for(int i =0;i<=30;i++)
		{ %>
		<option><%= i %></option>
		<% } %>
		</select>
		</td>
	</tr><tr><td>&nbsp;</td></tr>
</table>
</td></tr>
<tr><td>


<% 
}
}
 	HashMap req_detail=(HashMap)session.getAttribute("req_detail");   
	if(req_detail!=null)
	{ 
	ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
	
	ArrayList req_DD=(ArrayList)req_detail.get("req_Days");
	ArrayList req_MM=(ArrayList)req_detail.get("req_Month");
	ArrayList req_YY=(ArrayList)req_detail.get("req_Year");
		
	ArrayList req_Amt=(ArrayList)req_detail.get("req_Amount");
	
	ArrayList req_newDD=(ArrayList)req_detail.get("req_newDays");
	ArrayList req_newMM=(ArrayList)req_detail.get("req_newMonth");
	ArrayList req_newYY=(ArrayList)req_detail.get("req_newYear");
	
	ArrayList req_BalAbv=(ArrayList)req_detail.get("req_BalAbove");
	
	int k=acc_nums.size();
	if(k!=0)
	{ 
	%>


<table width="100%" border="0">
	<tr align="center">
		<td align="center" style="color:brown;" colspan="5"><b>Request for Flexi Fixed Deposit </b>
		</td>
	</tr>
	<tr>
		<td colspan="5">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2" align="left" class="simple">
			<bean:message bundle='<%=lang%>' key='7133'/>
		</td>
		<td>
			<select  name="sAccList" id ="sAccList"  style="WIDTH: 220px" disabled>
			<option ><%= (String)acc_nums.get(Integer.parseInt((String)request.getParameter("row")))%></option>
			</select>
		</td>
	</tr>
	<tr>
	      <td colspan="2" align="left" class="simple">
			<bean:message bundle='<%=lang%>' key='7134'/>
		  </td>
		
		<td align="left" class="simple" colspan="1">
		 <input type="checkbox" name="s_chk1" id="s_chk1"><bean:message bundle='<%=lang%>' key='7208' />
		 </td>
	
		<td align="left" CLASS="simple" colspan="3">
		<input type="checkbox" name="s_chk2" id="s_chk2"><bean:message bundle='<%=lang%>' key='7209' />
		<input type="hidden"  id="sPrev_page" name="sPrev_page" value='flexFd'>
		</td>
		<br>
	</tr>
	
	<tr>
		<td colspan="3" align="left" class="simple" >
		<bean:message bundle='<%=lang%>' key='7135'/>
		</td>
		<td align="center" class="simple" colspan="3">
		<input type="text" name="s_minamt" id="s_minamt" value="<%= (String)req_Amt.get(Integer.parseInt((String)request.getParameter("row")))%>" readonly="true">
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		<td align="center" class="simple" colspan="2" >
	   	<bean:message bundle='<%=lang%>' key='7136'/>
		</td>
	</tr>
	<tr>
		<td colspan="3" align="left" class="simple">
		<bean:message bundle='<%=lang%>' key='7138'/>
		</td>
		<td align="center" class="simple" colspan="3">
		<input type="text" name="s_minbal" id="s_minbal" 
		value='<%= (String)req_BalAbv.get(Integer.parseInt((String)request.getParameter("row")))%>' >
		</td>
	</tr>
		
	<tr>
		<td colspan="2" >&nbsp;</td>
		<td align="center" class="simple" colspan="3">
		<bean:message bundle='<%=lang%>' key='7137'/>
		</td>
	</tr>
	<tr>
		<td colspan="5" align="left" class="simple">
		<bean:message bundle='<%=lang%>' key='7141'/>
		
		</td>
	</tr>
	<tr>
		<td class="simple">
		<bean:message bundle='<%=lang%>' key='7145'/>
		</td>
		<td class="simple">
		<bean:message bundle='<%=lang%>' key='5758'/>
		<select name = "sYear" disabled>
		<option><%= (String)req_YY.get(Integer.parseInt((String)request.getParameter("row")))%></option>
		
		</select>
		</td>
		<td class="simple">
		<bean:message bundle='<%=lang%>' key='5759'/>
		<select disabled>
		<option><%= (String)req_MM.get(Integer.parseInt((String)request.getParameter("row")))%></option>
		
		</select>
		</td>
		<td class="simple"><bean:message bundle='<%=lang%>' key='450'/>
	<select>
		<option><%= (String)req_DD.get(Integer.parseInt((String)request.getParameter("row")))%></option>
		</select>
		</td>
	</tr>
	<tr>
		<td class="simple" ><bean:message bundle='<%=lang%>' key='7143'/></td>
		<td class="simple"><bean:message bundle='<%=lang%>' key='5758'/>
		<select>
		<option><%= (String)req_newYY.get(Integer.parseInt((String)request.getParameter("row")))%></option>
		
		</select>
		</td>
		<td class="simple"><bean:message bundle='<%=lang%>' key='5759'/>
		<select name = "sMonth1">
		
		<option><%= (String)req_newMM.get(Integer.parseInt((String)request.getParameter("row")))%></option>
		</select>
		</td>
		<td class="simple"><bean:message bundle='<%=lang%>' key='450'/>
		<select name ="sDay1">
	
		<option><%= (String)req_newDD.get(Integer.parseInt((String)request.getParameter("row")))%></option>
		</select>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
</td></tr>
<tr><td>
<% }
} %>


<table align="center" width=587 cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="5" align="center">
		<input type="button" onClick="return quant_req()" class="button" value="<bean:message bundle='<%=lang%>' key='7119'/>">
		<input type="reset" class="button" value="<bean:message bundle='<%=lang%>' key='87'/>">
		</td>
	</tr>
</table>
</td></tr>
</table>
</td></tr>
</table>
</html:form>
</body>

