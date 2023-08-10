<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.io.*" %>
<%	
	String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
																	  // 4-curKid,5-curCode,6-port
	String arr = null,curCode="",curBal="",usrName="",source="";
	int l = 0;
	HashMap mini_stmt = null;
	ArrayList mini_date = null;
	ArrayList mini_Edesc= null;
	ArrayList mini_Hdesc= null;
	ArrayList mini_crdr = null;
	ArrayList mini_amt = null;
	String flag = "m";
	mini_stmt = (HashMap)session.getAttribute("mini_stmt"); 
	if(request.getAttribute("flag") != null)
		 flag = (String)request.getAttribute("flag");
	if(session.getAttribute("currency") != null)
	{
		curCode = (String)session.getAttribute("currency");
		session.removeAttribute("currency");
	}
	if(session.getAttribute("nCurBal") != null)
	{
		curBal = (String)session.getAttribute("nCurBal");
		//session.removeAttribute("nCurBal");
	}
	if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
	if(request.getParameter("success") != null)
		source = (String)request.getParameter("success");
	
	if(session.getAttribute("mini_stmt") != null)	{
		mini_stmt = (HashMap)session.getAttribute("mini_stmt"); 
		session.removeAttribute("mini_stmt");
		if(mini_stmt != null) { 
			mini_date =(ArrayList)mini_stmt.get("mini_date");
			mini_Edesc=(ArrayList)mini_stmt.get("mini_Edesc");
			mini_Hdesc=(ArrayList)mini_stmt.get("mini_Hdesc");
			mini_crdr=(ArrayList)mini_stmt.get("mini_crdr");
			mini_amt=(ArrayList)mini_stmt.get("mini_amt");
			String acc_no=(String)mini_stmt.get("acc_no");
		}
		/*int j = mini_Hdesc.size();
		for(int i=0;i<j;i++)
		{
					try{
							mini_Hdesc.add(i,new String(((String) mini_Hdesc.get(i)).getBytes("iso-8859-1"), "UTF-8"));
							System.out.println(new String(((String) mini_Hdesc.get(i)).getBytes("iso-8859-1"), "UTF-8"));
						}catch(Exception e){
										mini_Hdesc.add(i,"spdf");
										}
		}*/
	}
	
%>


<script language="JavaScript" src="/accsum/scripts/accSum.js">
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Accounts"/>

<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp; 
 Mini Statement

</tiles:put>
<body onLoad="onLoad1()"> 
	<html:form action="/accsum/acc_sum.do">

<table>
	<tr>
		<td>
			<div id="diverrmessage" >
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


<table width="100%" border="0">
	<tr>
		<%if(source.equals("mini")){%>
		<td align="right">
			<html:select property="sAccnum" onchange="fillaccno()">
		<%	if(usrInfo.length != 0) 
			{ 
				String accNo = "";
				for(int i=0; i<usrInfo.length; i++)
				{	
					accNo = usrInfo[i][1]+"-"+usrInfo[i][0];
					%>
			<html:option value="<%=accNo%>"><%=usrInfo[i][1]%><%=usrInfo[i][0]%></html:option>	
			<%	}
			}	%>
			</html:select>
		</td>
		<td>
			<input type="button" Value="Mini-Statement" onclick=mini_statment() class="button">

			
		<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " class="Button" type="button" style="width:100px"
	onclick="helpopen()"/>
	
		</td>
		<%}%>
	</tr>
	<tr>
	<td colspan="3" align="center">
<!--<table>
	<tr>
		<td >
			<input type="button" value="Back" onclick="backmini()" class="button"/>
		</td>
	</tr>
</table> -->

<% 
	if(mini_stmt != null)
	{
		System.out.println("ministatement not null");
		int j = mini_date.size();
		System.out.print("jjj"+j);
		if(j!=0)
		{
		%>

<table width="50%" border = "0" align='center' style="border-left-style:none;border-bottom-style:none;border-right-style:none;border-left-style:none" >
<tr>
	<td align="right" width = "130" nowrap><font color="brown" ><b>
		<bean:message bundle='hindi' key='1027'/></font>
	</td>
	<td >
		<font color="brown" ><b>
			<html:text property="sAccnum" style="border:none;" size="20" readonly="true"/>
		</font>
	</td>

	<td nowrap><font color="brown" ><b>
		Current Balance</b></font></td>
	<td ><font color="brown" ><b>
		<input type="text" id="acc_curbal" value="<%=curBal%>" style="border:none;" > 
	</b></font>
	</td>

	 <td nowrap><font color="brown" ><b>
		Account Currency</b></font></td>
	<td ><font color="brown" ><b>
		<input type="text" id="acc_currency" value="<%=curCode%>" size="20" style="border:none;" > 
	</b></font>
	</td>

	
</tr>
<br>
<%if(source.equals("detail")){
	String frdate=(String)request.getAttribute("frdate");
	String todate=(String)request.getAttribute("todate");
	%>

<tr>
	<td> <font color="brown" ><b>
		 <bean:message bundle='<%=lang %>' key='115'/></b>
		 </font>
	</td>
	<td ><font color="brown" ><b>
		<input type="text" id="fromdate" value="<%=frdate%>" style="border:none;" > 
	</b></font>
	</td>

	<td><font color="brown" ><b>
		 <bean:message bundle='<%=lang %>' key='116'/></b>
		 </font>
	</td>
	<td ><font color="brown" ><b>
		<input type="text" id="todate" value="<%=todate%>" style="border:none;" > 
	</b></font>
	</td>
</tr>

<%}%>
	
</table>




<table border="1" align="center" width="90%" cellpadding="-1" cellspacing="-1" id="table">
	<thead>
		 <TR bgcolor="brown" > 
			<TH width="10%"><font color="#FFFFFF"> <bean:message bundle="hindi" key= "1710"/></font></TH>
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

		<tbody  class="scrolling" style="max-height:20px;">
			<%
			for(int i=0;i<j;i++)
			{
			int k=0;
			%>
				<tr <%out.println(i%2==0?"class=trforReportRow1":"class=trforReportRow2");%>>
					<td  align="center" id="text<%=i%><%=k++%>"  
						><%=i+1%>
					</td>
					<td id="text<%=i%><%=k++%>"  
						><%= mini_date.get(i) %>
					</td>
					<td nowrap id="text<%=i%><%=k++%>">
					<font style ="font-family:AKHindi;font-size:12pt;">
					<%=mini_Hdesc.get(i) %> </font>/ <%=mini_Edesc.get(i) %>
					</td>
					
				<!--	<td width="154" id="text<%=i%><%=k++%>"  onClick="setRow(<%=i%>,6,<%=  mini_Edesc.size() %>)" >
						<%=mini_Edesc.get(i) %>
					</td> -->
					<td id="text<%=i%><%=k++%>" align="center"   >
						<%if(mini_crdr.get(i).equals("C")){out.print("CR");}
						else {out.print("DR");}%>
					</td>
					<td id="text<%=i%><%=k++%>"  align="right" ><%= mini_amt.get(i) %>
					</td>
				</tr>
		<% } %>
	</tbody>
	</table>
	<%}
	}%>
	</tr>
	
	<tr>
		<td align="center" colspan="5">
			<input type="button" value=" Back " onclick="backmini()" class="button"/>
		</td>
	</tr>
</table>
<script language="JavaScript">
	
function helpopen()
{
	<%if(source.equals("detail")){%>

var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=detailst","child", bar);
<%}else{%>
var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=minist","child", bar);
<%}%>
	
}

	function mini_statment(){
		//document.getElementById("sAccnum").value=acc_num;
	//	alert("dfdskvkfdgvkfjndk");
		document.forms[0].action="/accsum/acc_sum.do?action=miniStmt";
		document.forms[0].submit();
	}

	function getSaveMiniStatmentData() {
		//document.getElementById("sAccnum").value=acc_num;
		document.forms[0].action="/accsum/acc_sum.do?action=miniStmtSaveData";
		document.forms[0].submit();
	}
	function onLoad1() {
		<logic:messagesPresent property="Empty">
		document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>

		<logic:messagesPresent property="NoServer">
		document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>
	//	alert(document.getElementById("sAccnum").options[document.getElementById("sAccnum").options.selectedIndex].text);
//		document.getElementById("Accnum").value=document.getElementById("sAccnum").options[document.getElementById("sAccnum").options.selectedIndex].text;
	}
	
	function backmini()
	{
 document.forms[0].action="/openaction.do?src=AbbminiStBack"
 document.forms[0].method="post";
 document.forms[0].submit();			
		
		
		//document.forms[0].action="/abb/AbbEnquiry.jsp";
		//document.forms[0].submit();
		
		
	}
	function fillaccno()
	{
//	document.getElementById("Accnum").value=document.getElementById("sAccnum").options[document.getElementById("sAccnum").options.selectedIndex].text;
	}
</script>

</html:form>
 </body> 
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>