<%@ include file="/common/Include.jsp" %>
<%
String usrName = (String)session.getAttribute("user");
%>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<script language="JavaScript">
function onLoad(yy)
{
	if (yy!=null)
	{
	disabledControlsOnAction(document.forms[0],"ibreq");
	}
}
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Request"/>
<%if(request.getParameter("row")==null){ %>
<tiles:put name="menu" value="/common/user_left.jsp?src=request"/>
<%}%>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
Request >> <bean:message bundle="hindi" key="7189" />
</tiles:put>
<tiles:put name="content" type="String">
<body onLoad="onLoad(<%=request.getParameter("row")%>)">
<html:form action="/request/reqchk.do">

<div id="diverrmessage">
<logic:messagesPresent property="NoServer">
<html:errors property="NoServer"/>
</logic:messagesPresent>
</div>

<table width=587 >
<tr>
	<td colspan="5" align="right">
		<input type="button" name="back" onClick="back_req(<%= request.getParameter("row") %>,'FD')" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>">
		<input type="button" onClick="help_req()"
		 class="button" value="<bean:message bundle='<%=lang%>' key='6288'/>">
			<input type="hidden"  id="sPrev_page" name="sPrev_page" value='fdReq'>
	</td>
</tr>
</table>

<table border="1"  cellpadding="0" cellspacing="0"  bordercolor="brown" style="border-left:none;border-right:none;border-top:none;border-bottom:none;">
	<tr>
		<td width="655">
			<table cellpadding="0" cellspacing="0" >
			<tr><td>
<% 
//	LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");   
//if(userInfo!=null)
//{ 
	String userInfo[][]=(String[][])session.getAttribute("userInfo");
if(userInfo!=null)
{ 
//String[] acc_nums =userInfo.getsIbUsr_AccNums();
String[] acc_nums =new String[userInfo.length];
		for(int i=0;i<userInfo.length;i++)
			acc_nums[i]=userInfo[i][0];
//String[] acc_nums =userInfo.getsIbUsr_AccNums();
int j=acc_nums.length;

if(j!=0)
{ %>
				<table>
					<tr><td>
						<table align="center" width=589 cellpadding="0" cellspacing="0" id="tabela" border="0">
							<tr>
								<td colspan="5" class="tbl_heading">
								<bean:message bundle="hindi" key="7189" />
								</td>
							</tr>
							<tr>
								<td colspan="5" >&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2" align="left" class="heading">
								<bean:message bundle='<%=lang%>' key='7214'/>:
								</td>
								<td colspan="5" align="left">
									<select  name="sAccList" id ="sAccList" style="WIDTH: 220px">
										<% for(int l=0;l<j;l++)
										{ %>
										   <option ><%= (String)acc_nums[l] %></option>
										  <% } %>
										   </select>
  
								</td>
							</tr>
							<tr>
								<td width="13">&nbsp;</td>
							</tr>
							<tr>
								<td  colspan="2" class="heading" ><bean:message bundle='<%=lang%>' key='7134'/>
								</td>
						        <td width="157" align="left" class="simple">
									<input type="radio"  name="sScheme" id="sScheme"value="T" onclick="javascript:alert('please fill all the entries for traditional deposit scheme')" >
							        <bean:message bundle='<%=lang%>' key='7204'/></b>
								</td>
						        <td width="279" colspan="2" align="left"  class="simple"> 
									<input type="radio" name="sScheme" id="sScheme" value="C"
									onclick="javascript:alert('please do not fill the entries for traditional deposit scheme')" >
							        <bean:message bundle='<%=lang%>' key='7203'/></b>
								</td>      
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="2" align="right" class="simple">
								 (interest not compounded)	</td>
								<td colspan="2" align="left" class="simple">
								 &nbsp &nbsp(interest compounded)
		
								</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td class="heading" nowrap>
								<bean:message bundle='<%=lang%>' key='7205'/>:&nbsp;&nbsp;&nbsp;
								</td>
								<td width="138" class="heading">
								<bean:message bundle='<%=lang%>' key='5758'/>
								<select name = sYear>
								<option value="Year">Year</option>
								<% for(int i =0;i<4000;i++)
								{ %>
								<option><%= i %></option>
								<% } %>
								</select>
								</td>
								<td class="heading">
								<bean:message bundle='<%=lang%>' key='5759'/>
								<select name = sMonth>
								<option value="Month">Month</option>
								<% for(int i =1;i<=12;i++)
								{ %>
								<option><%= i %></option>
								<% } %>
								</select>
								</td>
								<td class="heading"><bean:message bundle='<%=lang%>' key='450'/>
								<select name =sDay>
								<option value="Day">Day</option>
								<% for(int i =1;i<=31;i++)
								{ %>
								<option><%= i %></option>
								<% } %>
								</select>
								</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td colspan="2" align="left" class="heading">
								<bean:message bundle='<%=lang%>' key='1471'/> (in Rs.)**</b>
								</td>
								<td colspan="3">
								<html:text   property="sAmt" styleId="sAmt" size="15" value="" onkeypress="isValidAmount(event, document.forms[0].sAmt)"
								maxlength="25"/>
								</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table align="center" width=587 cellpadding="-1" cellspacing="-1" id="tabela">
							<tr> 
								<Td colspan="5" width="370" class="tbl_heading" ><bean:message bundle='<%=lang%>' key='7211'/>:</Td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td  colspan="5" align="left" class="heading" >
									<bean:message bundle='<%=lang%>' key='7206'/>
								</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td align="center" class="heading">
									 <input type="radio" name="sDur" id="sDur" value="M">
									<bean:message bundle='<%=lang%>' key='3980'/>
								</td>
								<td class="heading">
									<input type="radio" name="sDur" id="sDur" value="Q" >
								   <bean:message bundle='<%=lang%>' key='7210'/>
								</td>      
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table align="center" width=587 cellpadding="-1" cellspacing="-1" id="tabela" border="0">
							<tr>
								<td colspan="2" align="left" class="heading">
								<bean:message bundle='<%=lang%>' key='7212'/></td>
							
								<td colspan="5" align="center">
									<select  name="sCredacc" id ="sCredacc"  style="WIDTH: 220px">
									<% for(int l=0;l<j;l++)
									{ %>
								   <option ><%= (String)acc_nums[l] %></option>
									  <% } %>
								   </select>
									<html:hidden property="usrid" value="aaa"></html:hidden>
									<br>
								</td>
							</tr>
							</tr>
								<td colspan="4" align="left" class="heading">
									<bean:message bundle='<%=lang%>' key='7207'/></b>
									<html:text   property="s_dd" styleId="s_dd" size="15" onkeypress="javascript:isValidNumber()" />
								</td>
							</tr>
						</table>
					</td>
				</tr>

			</table>
  <% } 
     }  
	HashMap req_detail=(HashMap)session.getAttribute("req_detail");   
	if(req_detail!=null)
	{ 
	
	ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
	ArrayList req_Sch=(ArrayList)req_detail.get("req_Sch");
	ArrayList req_Days=(ArrayList)req_detail.get("req_Days");
	ArrayList req_Month=(ArrayList)req_detail.get("req_Month");
	ArrayList req_Year=(ArrayList)req_detail.get("req_Year");
	ArrayList req_Amount=(ArrayList)req_detail.get("req_Amount");
	ArrayList req_Per=(ArrayList)req_detail.get("req_Per");
	
	int k=acc_nums.size();
	if(k!=0)
	{ 
	%>
	<table>
		<tr><td>
			<table align="center" width=589 cellpadding="0" cellspacing="0" id="tabela">
				<tr>
					<td colspan="5" class="tbl_heading">
						<bean:message bundle="hindi" key="7189" /></td></tr>
				<tr>
					<td colspan="5" >&nbsp;</td></tr>
				<tr>
					<td colspan="5" align="left" class="heading">
						<bean:message bundle='<%=lang%>' key='7214'/>:
					</td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<select  name="sAccList" id ="sAccList" style="WIDTH: 220px" disabled>
						 <%  if((String)acc_nums.get(Integer.parseInt((String)request.getParameter("row")))!=null)
								{%>
							   <option ><%= (String)acc_nums.get(Integer.parseInt((String)request.getParameter("row")))%></option>
								  <% } %>
							   </select>
					</td>
				</tr>
				<tr>
					<td width="13">&nbsp;</td>
				</tr>
				<tr>
					<td  colspan="2" class="heading" ><bean:message bundle='<%=lang%>' key='7134'/> </td>
			        <td width="157" align="left" class="simple">
						<%
						if((String)req_Sch.get(Integer.parseInt((String)request.getParameter("row")))!=null)
						{ %>
						<%  if( ((String)req_Sch.get(Integer.parseInt((String)request.getParameter("row")))).equalsIgnoreCase("T") )
						{ %>
						<input type="radio"  name="sScheme" id="sScheme" value="T" disabled="true" checked="true" >
						<% }
						} %>
					   <bean:message bundle='<%=lang%>' key='7204'/></b>
					</td>
			        <td width="279" colspan="2" align="left"  class="simple"> 
						<% 
						if((String)req_Sch.get(Integer.parseInt((String)request.getParameter("row")))!=null)
						{
						if(((String)req_Sch.get(Integer.parseInt((String)request.getParameter("row")))).equalsIgnoreCase("C") )
						{ %>
						<input type="radio" name="sScheme" id="sScheme" value="C" disabled="true" checked="true">
						<% }
						} %>
						<bean:message bundle='<%=lang%>' key='7203'/></b>
					</td>      
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="2" align="right" class="simple">
						 (interest not compounded)	</td>
					<td colspan="2" align="left" class="simple">
					 &nbsp &nbsp(interest compounded)
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td></tr>
				<tr>
					<td class="heading" >
						<bean:message bundle='<%=lang%>' key='7205'/>:
					</td>
					<td width="138" class="heading">
						<bean:message bundle='<%=lang%>' key='5758'/>
						<select name = sYear disabled>
						<% if( (String)req_Year.get(Integer.parseInt((String)request.getParameter("row"))) !=null)
						{%>
							<option selected><%= (String)req_Year.get(Integer.parseInt((String)request.getParameter("row")))  %></option>
						<% } %>
				     	</select>
					</td>
					<td class="heading">
						<bean:message bundle='<%=lang%>' key='5759'/>
						<select name = sMonth  disabled>
						<% if( (String)req_Month.get(Integer.parseInt((String)request.getParameter("row")))!=null)
						{%>
						<option selected><%= (String)req_Month.get(Integer.parseInt((String)request.getParameter("row")))  %></option>
						<% } %>
						</select>
					</td>
					<td class="heading"><bean:message bundle='<%=lang%>' key='450'/>
						<select name =sDay  disabled>
								<% if( (String)req_Days.get(Integer.parseInt((String)request.getParameter("row")))!=null)
						{%>
						
						<option selected><%= (String)req_Days.get(Integer.parseInt((String)request.getParameter("row")))  %></option>
						<% } %>
						</select>
						</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="left" class="heading">
						<bean:message bundle='<%=lang%>' key='1471'/> (in Rs.)**</b>
					</td>
					<td colspan="3">
						<% if( (String)req_Amount.get(Integer.parseInt((String)request.getParameter("row"))) !=null)
						{%>
						<input type="text"  name="sAmt" id="sAmt" size="15" value="<%= (String)req_Amount.get(Integer.parseInt((String)request.getParameter("row")))  %>" onkeypress="isValidAmount(event, document.forms[0].sAmt)"
							maxlength="25">
							<% } %>
					</td>
				</tr>
				<tr><td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<% if ((String)req_Sch.get(Integer.parseInt((String)request.getParameter("row")))!=null)
			{%>
			<% if(((String)req_Sch.get(Integer.parseInt((String)request.getParameter("row")))).equalsIgnoreCase("T") )
			{%>
			<table align="center" width=587 cellpadding="-1" cellspacing="-1" id="tabela">
				<tr> 
					<Td colspan="5" width="370" class="tbl_heading" ><bean:message bundle='<%=lang%>' key='7211'/>:</Td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td  colspan="5" align="left" class="heading" >
						<bean:message bundle='<%=lang%>' key='7206'/>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
			        <td align="center" class="heading">
						<% 	 if(((String)req_Per.get(Integer.parseInt((String)request.getParameter("row")))).equalsIgnoreCase("M") )
						{ %>
						 <input type="radio" name="sDur" id="sDur" value="M" checked disabled >
						 <% } %>
						<bean:message bundle='<%=lang%>' key='3980'/>
					</td>
			        <td class="heading">
						<% 	 if(((String)req_Per.get(Integer.parseInt((String)request.getParameter("row")))).equalsIgnoreCase("Q") )
						{ %>
						<input type="radio" name="sDur" id="sDur" value="Q" checked disabled >
						<% } %>
					       <bean:message bundle='<%=lang%>' key='7210'/>
					</td>      
				</tr>
				<tr>
					<td colspan="5" align="left" class="heading">
						<bean:message bundle='<%=lang%>' key='7212'/></td>
				</tr>
				<tr><td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<select  name="sCredacc" id ="sCredacc"  style="WIDTH: 220px" disabled>
						<%  if((String)acc_nums.get(Integer.parseInt((String)request.getParameter("row")))!=null)
						{%>
					   <option ><%= (String)acc_nums.get(Integer.parseInt((String)request.getParameter("row")))%></option>
						  <% } %>
						</select>
						<br>
					</td>
				</tr>
					<td colspan="4" align="left" class="heading"><bean:message bundle='<%=lang%>' key='7207'/></b>
						<html:text   property="s_dd" styleId="s_dd" size="15" onkeypress="javascript:isValidNumber()" />
					</td>
				</tr>
			</table>
			<% }
			} %>
		</td>
	</tr>
</table>
  <% } 
     }  
	 %>
	</td>
	</tr>
	<tr>
	<td>
		<table width=587>
			<tr>
				<td colspan="5" align="left">
				<br>
					<input type="button" onClick="return submit_fd()" class="button" value="<bean:message bundle='<%=lang%>' key='7119'/>">
					<input type="reset"  class="button" value="<bean:message bundle='<%=lang%>' key='7000'/>">
				</td>
			</tr>
		</table>
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
</tiles:insert >