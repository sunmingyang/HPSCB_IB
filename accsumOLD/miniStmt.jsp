<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.io.*" %>


<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="content" type="String">


 <body onLoad="javascript:makeScrollableTable('table','false','auto'),onLoad1()"> 
<html:form action="/accsum/acc_sum.do">
<%	String arr=null;
	int l=0;
	ArrayList mini_date=null;
	ArrayList mini_Edesc=null;
	ArrayList mini_Hdesc=null;
	ArrayList mini_crdr=null;
	ArrayList mini_amt=null;
	HashMap mini_stmt=null;
	String flag="m";
	if(request.getAttribute("flag")!=null)
		 flag=(String)request.getAttribute("flag");

	LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");  
	String[] acc_nums=null;
	String[] acc_curr=null;
	if(userInfo!=null){
		acc_nums =userInfo.getsIbUsr_AccNums();
		l=acc_nums.length;
		System.out.print("array length"+l);
		acc_curr =userInfo.getsIbUsr_Currency();
		if(acc_curr!=null){
			if(acc_curr.length>=1)
				System.out.print("curr1 is"+acc_curr[0]);
			if(acc_curr.length>=2)
				System.out.print("curr2 is"+acc_curr[1]);
		}
	}
	if(session.getAttribute("mini_stmt")!=null)	{
		mini_stmt=(HashMap)session.getAttribute("mini_stmt"); 
		session.removeAttribute("mini_stmt");
		if(mini_stmt!=null) { 
			mini_date =(ArrayList)mini_stmt.get("mini_date");
			mini_Edesc=(ArrayList)mini_stmt.get("mini_Edesc");
			mini_Hdesc=(ArrayList)mini_stmt.get("mini_Hdesc");
			mini_crdr=(ArrayList)mini_stmt.get("mini_crdr");
			mini_amt=(ArrayList)mini_stmt.get("mini_amt");
			String acc_no=(String)mini_stmt.get("acc_no");
		}
	}
%>

<table>
	<tr>
		<td>
			<div id="diverrmessage" style="display:none">
				<logic:messagesPresent property="Empty">
				<html:errors property="Empty"/>
				</logic:messagesPresent>

				<logic:messagesPresent property="NoServer">
				<html:errors property="NoServer"/>
				</logic:messagesPresent>
			</div>
		</td>
	</tr>
</table>


<table width="70%">
<%
	if(!flag.equals("d"))
	{
%>
	<tr>
		<td align="right">
			<html:select property="sAccnum"  >
				<%
				if(l!=0) { 
					for(int i=0;i<l;i++) {
				%>
					<html:option value="<%=acc_nums[i]%>"><%=acc_nums[i]%> </html:option>	
					  
				<%	}
				}	%>
			</html:select>
		</td>
		<td>
			<input type="button" Value="Mini-Statement" onclick=mini_statment() class="button">
		</td>
		<td >
			<input type="button" value="Back" onclick="backmini()" class="button"/>
		</td>
	</tr>
<%	}%>
</table>
<!--<table>
	<tr>
		<td >
			<input type="button" value="Back" onclick="backmini()" class="button"/>
		</td>
	</tr>
</table> -->
<table  width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td class="heading"></td>
		<td colspan="4" align="right"></td>
	</tr>
</table>

<table width="100%" border = "0" style="border-left-style:none;border-bottom-style:none;border-right-style:none;border-left-style:none" >
<tr>
	<td width = "150" ><font color="brown" ><b>
		<bean:message bundle='hindi' key='1027'/></font>
	</td>
	<td >
		<font color="brown" ><b>
			<html:text property="sAccnum" style="border:none;" readonly="true"/>
		</font>
	</td>
</tr>
<tr>
	<td ><font color="brown" ><b>
		Account Currency</b></font></td>
	<td ><font color="brown" ><b>
		<input type="text" id="acc_currency" style="border:none;" >
	</b></font></td><br>
<% 

if(request.getParameter("success").equalsIgnoreCase("mini"))
{
%>
<tr>
	<td colspan="5" align="left" class="heading"><U>
		10 <bean:message bundle='<%= lang%>' key='1049' />
	</td>
</tr>
<% } 
else { 
	String  strans=(String)mini_stmt.get("strans");
	System.out.print("num :::: of rows ::::"+strans);
%>
	<tr>
		<td colspan="5" align="left"><b>
			<font color="brown" > <%= strans%> <bean:message bundle='<%= lang%>' key='1049' /></font>
		</td>
	</tr>


<% } %>
</table>




<table border="1" align="center" width="80%" cellpadding="-1" cellspacing="-1" id="table">
	<thead>
		 <TR bgcolor="brown"> 
			<TH width="5%" ><font color="#FFFFFF"> <bean:message bundle="hindi" key= "1710"/></font></TH>
			<TH width="15%" ><font color="#FFFFFF"> <bean:message bundle="hindi" key= "43"/></font></TH>
		<!--	<TH width="15%"><font color="#FFFFFF"> 
				<script language="JavaScript">
					Arr=splitString('<bean:message bundle="<%= lang %>" key="167"/>','/');
					document.write(Arr[0] );
				</script></font>  
			</TH>
			<TH width="21%"><font color="#FFFFFF"> 
				<script language="JavaScript">
					Arr=splitString('<bean:message bundle="<%= lang %>" key="167"/>','/');
					document.write(Arr[1] );
				</script></font>  
			</TH>  
			<TH width="15%" ><font color="#FFFFFF"> <bean:message bundle="<%= lang %>" key="167"/></font></TH>-->
			<TH width="35%" ><font color="#FFFFFF"> <bean:message bundle="<%= lang %>" key="167"/></font></TH>
			<TH width="5%"><font color="#FFFFFF"><bean:message bundle="hindi" key= "1231"/></font></TH>
			<TH width="18%"><font color="#FFFFFF"> <bean:message bundle="hindi" key= "39"/></font></TH>
		</tr>
	</thead>

	<% 
	if(mini_stmt != null)
	{ 
		int j = mini_date.size();
		System.out.print("jjj"+j);
		if(j!=0)
		{
		%>
		<tbody  class="scrolling" style="max-height:20px;">
			<%
			for(int i=0;i<j;i++)
			{
			int k=0;
			%>
				<tr>
					<td  align="center" id="text<%=i%><%=k++%>"  
						onClick="setRow(<%=i%>,6,<%=  mini_date.size() %>)"><%=i+1%>
					</td>
					<td id="text<%=i%><%=k++%>"  
						onClick="setRow(<%=i%>,6,<%=  mini_date.size() %>)"><%= mini_date.get(i) %>
					</td>
					<td nowrap id="text<%=i%><%=k++%>" onClick="setRow(<%=i%>,6,<%= mini_Hdesc.size() %>)">
						<%=mini_Hdesc.get(i) %> / <%=mini_Edesc.get(i) %>
					</td>
				<!--	<td width="154" id="text<%=i%><%=k++%>"  onClick="setRow(<%=i%>,6,<%=  mini_Edesc.size() %>)" >
						<%=mini_Edesc.get(i) %>
					</td> -->
					<td id="text<%=i%><%=k++%>" align="center"   onClick="setRow(<%=i%>,6,
						<%= mini_crdr.size() %>)" >
						<%if(mini_crdr.get(i).equals("C")){out.print("CR");}
						else {out.print("DR");}%>
					</td>
					<td id="text<%=i%><%=k++%>"  align="right"  onClick="setRow(<%=i%>,6,
						<%= mini_amt.size() %>)"><%= mini_amt.get(i) %>
					</td>
				</tr>
		<% } %>
	</tbody>
	<%}
	}%>
</table>




<script language="JavaScript">
function mini_statment()
{

//document.getElementById("sAccnum").value=acc_num;
document.forms[0].action="/accsum/acc_sum.do?action=miniStmt";
document.forms[0].submit();
}

function getSaveMiniStatmentData()
{

	//document.getElementById("sAccnum").value=acc_num;
	document.forms[0].action="/accsum/acc_sum.do?action=miniStmtSaveData";
	document.forms[0].submit();
}
function onLoad1()
{
<logic:messagesPresent property="Empty">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

<logic:messagesPresent property="NoServer">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>
	
document.getElementById("accno").value=document.getElementById("sAccnum").value
}
function backmini()
{
	<% if(flag.equals("m"))
	{%>
	document.forms[0].action="/accsum/AccountsMain.jsp";
	document.forms[0].submit();
	<%}
	else
		{%>
	window.location.href="/accsum/detailStmt.jsp";
	//document.forms[0].submit();
	<%}%>
}

	var accCurr =new Array();
<%
for(int i=0;i<acc_curr.length;i++)
{
%>
accCurr['<%=i%>']='<%=acc_curr[i]%>';
<%}%>

var accValue=document.getElementById("sAccnum").value;
<%for(int i=0;i<acc_curr.length;i++)
{%>
if(accValue=='<%=acc_nums[i]%>')
	{
	document.getElementById("acc_currency").value=accCurr['<%=i%>'];
	}
<%}%>
</script>

</html:form>
 </body> 
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>