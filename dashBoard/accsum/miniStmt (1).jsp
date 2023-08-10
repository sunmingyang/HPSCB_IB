<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.io.*" %>
<%	
	String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
	ArrayList<String> myList=null;
	if(session.getAttribute("resStr")!=null)
	{
		myList = (ArrayList<String>)session.getAttribute("resStr");
	}


	String arr = null,curCode="",curBal="",usrName="",source="";
	int l = 0;
	HashMap mini_stmt = null;
	ArrayList mini_date = null;
	ArrayList mini_Edesc= null;
	ArrayList mini_Hdesc= null;
	ArrayList mini_crdr = null;
	ArrayList mini_amt = null;
	ArrayList mini_cumbal = null;
	String flag = "m";
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
		session.removeAttribute("nCurBal");
	}
	if(session.getAttribute("user") != null){
		usrName = (String)session.getAttribute("user");
         //session.removeAttribute("user");
    }
	if(request.getParameter("success") != null){
		source = (String)request.getParameter("success");
       // session.removeAttribute("success");
    }
	
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
			mini_cumbal=(ArrayList)mini_stmt.get("mini_cumbal");
		}
	}
%>


<script language="JavaScript" src="/accsum/scripts/accSum.js">
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Accounts"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=acc"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=miniStmt&src=acc"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
 &nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp; 

</tiles:put>

<style>
td.normalHeadText select {
    padding: 5px 5px;
    font-size: 12px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

table.miniStmtBackBorder {
    width: 50%;
    border: 1px solid #ddd;
    background: transparent;
    box-shadow: 0 0 10px 0px #ddd;
    border-radius: 5px;
    overflow: hidden;
}

table.miniStmtBackBorder tr.miniStmtBack table {
    width: 100%;
    margin: 10px 0 10px;
}

table.miniStmtBackBorder tr.miniStmtBack table td.tableHeader {
    padding: 0 0 10px;
}

table.miniStmtBackBorder tr.miniStmtBack table td.normalText {
    padding: 0 0 5px;
}

table.miniStmtBackBorder tr.miniStmtBack table td.normalText input#sOut_req {
    margin: 2px 0 0px;
    position: relative;
    top: 3px;
    margin-right: 5px;
}

table.miniStmtBackBorder  input[type="button"] {}

table.wrapperDataTable input[type="button"] {
    background: #3056b5;
    border: 0;
    padding: 10px 20px;
    color: #fff;
    font-size: 12px;
    width: auto !important;
    margin: 10px 5px 0;
    transition: 0.3s;
    border-radius: 3px;
}

table.wrapperDataTable input[type="button"]:hover {
    background: #3056b5c4;
}	

</style>
<body onLoad="onLoad1()"> 
	<html:form action="/accsum/acc_sum.do"><br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr >
		<td  class="wrapperDataTableTR" align="center" >
			<%if(source.equals("detail")){%>
				Accounts >> Detail Statement
			<%}else{%>
				Accounts >> Mini Statement 
			<%}%></td>
	</tr>
	<tr><td><% if ( request.getParameterMap().containsKey("mini") && request.getParameter("mini").trim().equals("failed") )  { %>
			No Data Available for Mini - Statement 
					<%}%>
</td> 
</tr>
	<tr>
	<td align="center">
<center><table>	<tr>
					<td align="center">
						<div id="diverrmessage" ><font face="verdana">
							<logic:messagesPresent property="Empty">
							<html:errors property="Empty"/>
							</logic:messagesPresent>

							<logic:messagesPresent property="NoServer">
							<html:errors property="NoServer"/>
							</logic:messagesPresent></font>
						</div>
					</td>
				</tr>
			</table>
<%if(mini_stmt == null) { %>
			<table width="90%" border="0" bordercolor="red" align="center" cellspacing="5" cellpadding="0">
				
					<%if(source.equals("mini")){%>
				   <tr>
  						<td colspan="3" align="center" class="normalHeadText">
						<bean:message bundle='hindi' key='1027'/>&nbsp;&nbsp;:&nbsp;&nbsp;
						<html:select property="sAccnum"  >
					 
					<%	if(myList != null && myList.size() != 0) 
						{ String accNo = "";
							for(int i=0; i<myList.size(); i++)
							{ 
								accNo = usrInfo[0][1]+"-"+myList.get(i);
								%>
						<html:option value="<%=accNo%>" >
							<%=myList.get(i)%></html:option>	
						<%	}
						}	%>
						</html:select>
						</td>
					</tr>

			   <!--  New added on 08/08/2008 by ajay -->

					<tr>
						<td class="tableHeader" align="center" colspan="3"><br>
				<table class="miniStmtBackBorder" >
					<tr class="miniStmtBack">
						<td>
							<table cellspacing="0" cellpadding=0  border=0>
								<tr style="padding-left:30;padding-right:30;">
								<td class="tableHeader" align="center" colspan="3" >
									<br>

						<u>Choose format and click on "Mini-Statement"</u></td>
					</tr>
					<tr>
						<td width="40%">&nbsp;</td>
						<td align="left" class="normalText">
							<input type="radio" id="sOut_req" name="sOut_req" value="screen" checked="true"><bean:message bundle='<%=lang %>' key='7102'/>
						</td>
					</tr>  
					<tr>
						<td width="40%">&nbsp;</td>
						<td align="left" class="normalText">
							<input type="radio" name="sOut_req" id="sOut_req" value="text">Display as a plain Text
						</td>
					</tr>  
				 	<tr>
						<td width="40%">&nbsp;</td>
						<td align="left" class="normalText">
							<input type="radio" name="sOut_req" id="sOut_req" value="pdf">Export Pdf File
						</td>
					</tr>  
					<tr>
						<td width="40%">&nbsp;</td>
						<td align="left" class="normalText">
							<input type="radio" name="sOut_req" id="sOut_req" value="xls">Export Excel File
						</td>

					</tr>
							</table>
						</td>
					</tr>
				</table><br>
				</td>
			</tr>
			<tr>
								
						<td align="center" colspan="3">
							<input type="button" Value="Mini-Statement" onclick="mini_statment()" align="Center" style="width:100px">
							<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    "  type="button" style="width:100px" onclick="helpopen()" align="Center"/>
						</td>

					</tr>
					<%}%>
			<%}%>
					<tr>
						<td colspan="3" align="center"><br>
						<% 
						if(mini_stmt != null)
						{
							int j = mini_date.size();						
							if(j!=0)
							{%>
							<table border = "0" bordercolor="green" style="border-left-style:none;border-bottom-style:none;border-right-style:none;border-left-style:none" cellspacing=0 cellpadding=0 width="90%">
							<tr class="miniStmtResultback">
								<td align="left" nowrap class="dataInfoText"><bean:message bundle='hindi' key='1027'/>:</td>
								<td align="left"><html:text property="sAccnum" styleId="sAccnum1" readonly="true" size="24" style="border:0;text-align:center;width:120px"/>				
								</td>
								<td align="right" nowrap class="dataInfoText">
									Current Balance :<input type="text" id="acc_currency" value="<%=curCode%>"  class="miniStmtResultback" readonly="true" style="border:0;text-align:center;width:40px">  
								</td >
								<td >
									<input type="text" id="acc_curbal" value="<%=mini_cumbal.get(0)%>" class="miniStmtResultback" readonly="true" style="border:0;text-align:right;width:120px"> 
								</td>
							</tr>

							<%if(source.equals("detail")){
								String frdate=(String)request.getAttribute("frdate");
								String todate=(String)request.getAttribute("todate");
								%>

							<tr>
								<td> <font color="brown" ><bean:message bundle='<%=lang %>' key='115'/>
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
								
							</table><br>
			<table border="2" bordercolor="#ffffff" align="center" width="90%" cellpadding="0" cellspacing="0" id="table">
				<TR> 
					<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "1710"/></TD>
					<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "43"/></TD>
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
					<TD class="dataTableTH" >
						<bean:message bundle="<%= lang %>" key="167"/></TD>
					<TD class="dataTableTH">
						Credit</TD>
					<TD class="dataTableTH">
						Debit</TD>
					<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "652"/></TD>
				</TR>
				<tbody  class="scrolling" style="max-height:20px;">
						<%
						for(int i=0;i<j;i++)
						{
						int k=0;
						%>
							<tr <%out.println(i%2==0?"class=trforReportRow1":"class=trforReportRow2");%>>
								<td  class="dataTableTD" id="text<%=i%><%=k++%>"  
									><%=i+1%>
								</td>
								<td class="dataTableTD" id="text<%=i%><%=k++%>"  
									><%= mini_date.get(i) %>
								</td>
								<td id="text<%=i%><%=k++%>" class="dataTableTD" style="text-align:left">
									<%=mini_Edesc.get(i) %>
								</td>
							<!--	<td width="154" id="text<%=i%><%=k++%>"  onClick="setRow(<%=i%>,6,<%=  mini_Edesc.size() %>)" >
									<%=mini_Edesc.get(i) %>
								</td> -->
								<td id="text<%=i%><%=k++%>" class="dataTableTD" style="text-align:right">
									<%if(mini_crdr.get(i).equals("C")) {%> <%= mini_amt.get(i)%><%}else{%>&nbsp;<%}%>
								</td>
								<td id="text<%=i%><%=k++%>" class="dataTableTD" style="text-align:right">
									<%if(mini_crdr.get(i).equals("D")){%> <%= mini_amt.get(i)%><%}else{%>&nbsp;<%}%>
								</td>
								 <td id="text<%=i%><%=k++%>"  class="dataTableTD" style="text-align:right"><%= mini_cumbal.get(i) %>
								</td>
							</tr>
					<%  session.removeAttribute("mini_stmt");
						} %>
				</tbody>
				</table>
				<hr>
				<%}
				}%>
				</tr>
			<tr>
			</tr>
			<tr>
			</tr>

			<tr>
				<td align="center" colspan="3">
					<!-- <input type="button" value="Back" onclick="backmini()" style="width:100px"/> -->
				</td>
			</tr>

			</table><br>
</center>
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
	if((document.forms[0].sOut_req[0].checked)||
	   (document.forms[0].sOut_req[1].checked)||
	   (document.forms[0].sOut_req[2].checked)||
	   (document.forms[0].sOut_req[3].checked))	{
    document.forms[0].action="/accsum/acc_sum.do?action=miniStmt";
    document.forms[0].submit();
	}
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
<script>
//	if(mini_stmt != null)
 //   {	document.getElementById("sAccnum1").className="miniStmtResultback";}
</script>