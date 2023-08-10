<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.io.*" %>

<%
	ArrayList<String> myList=null;
	if(session.getAttribute("resStr")!=null)
	{
		myList = (ArrayList<String>)session.getAttribute("resStr");
	}

	int len = 0;
	String arr = null,curCode="",usrName="";
	Date todate = new Date(); 
	String strdate = todate.toString();
	System.out.println("date is----------------"+strdate);
	String nstrdate = strdate.substring(0,19);
	String nstrdate1 = strdate.substring(24,28);
	String data[] = (String[])session.getAttribute("accDetail");
	session.removeAttribute("accDetail");
	String usrInfo[][] = (String[][])session.getAttribute("userInfo");	//	0-accNo,1-brnCode,2-brnStatus,3-appserver
//	LoginForm userInfo = (LoginForm)session.getAttribute("userInfo");  
	String[] acc_nums = null;
	String[] acc_curr = null;
	if(session.getAttribute("currency") != null)
		curCode = (String)session.getAttribute("currency");
	if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
	if(usrInfo != null)
	{
		System.out.println("ACC NO is : "+usrInfo[0][0]);
		len = usrInfo.length;
	/*	acc_nums = userInfo.getsIbUsr_AccNums();
		l = acc_nums.length;
		System.out.print("array length"+l);
		acc_curr = userInfo.getsIbUsr_Currency();
		if(acc_curr != null){
		if(acc_curr.length >= 1)
			System.out.print("curr1 is"+acc_curr[0]);
		if(acc_curr.length >= 2)
		System.out.print("curr2 is     : "+acc_curr[1]);
		}	*/
	}
	else{
		System.out.println("ACC NO is null : ");
	}
%>  
<script>
function submitPage(){
	document.forms[0].action = "/accsum/acc_sum.do?action=AccDetail";
	document.forms[0].submit();
}
function backAccDet(){
	document.forms[0].action = "/accsum/AccountsMain.jsp"
	document.forms[0].submit();
}

</script>
<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<script language="JavaScript\" src="/scripts/common.js\"></script>
<script language=JavaScript src="/scripts/ScrollableTable.js\"></script>
<script>
function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=Ibaccsum","child", bar);
}
</script>
<jsp:include page="/dashBoard/dashboardNew.jsp" />
<body>
<table align="left" class="wrapperDataTable container"  style="width: 100%;">
	

	<div class="breadcrumb-container">
		<div class="row">
			<div class="col">
				<div class="breadcrumb">
					<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
					<div class="breadcrumb-item"><a>Accounts</a></div>
					
					<div class="breadcrumb-item"><a>Account Details</a></div>
				</div>
			</div>
		</div>
	</div>
	<tr>
		<td align="center">
			<div class="container text-center">
				<h2 class="wrapperDataTableTR  badge bg-primary p-2 fs-6  ">Account Details</h2>
			</div>
						
					<html:form action="/accsum/acc_sum.do">
						<div class="container">
							<div class="box-sec mt-5 p-4">
							  <div class="row align-items-center justify-content-center">
								<div class="col-md-4 mb-3">
								  <label class="normalHeadText d-flex">Select an Account</label>
								  <select class="form-select" onchange="fillaccno()">
									<% if (myList.size() != 0) {
									  String accNo = "";
									  for (int i = 0; i < myList.size(); i++) {
										accNo = usrInfo[0][1] + "-" + myList.get(i);
										%>
										<option value="<%=accNo%>"><%=myList.get(i)%></option>
									  <% }
									} %>
								  </select>
								</div>
								<div class="col-md-2">
								  <button type="button" class="btn btn-primary btn-sm" onclick="submitPage()">Account Detail</button>
								</div>
								<div class="col-md-2">
								  <button type="button" class="btn btn-primary btn-sm" onclick="helpopen()">Help</button>
								</div>
							  </div>
							</div>
						  </div>

					<table border="1" bordercolor="#ffffff" align="center"  width="90%" cellspacing=0 cellpadding=0 style="margin-top:10px;">
					<%	if(data != null) 
						{ boolean flag=true;	%>
						<tr>		
							<td class="dataTableInfoTH" colspan="2" align="center">	
								<font size="2px">Account Information of  <%=data[11]%></font>
							</th>
						</tr>
						<tr  >
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'");%>>
							Account No.
							</td>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'"); flag=!flag;%>>
								<%=data[0]%>
							</td>
						</tr>

						
						<tr >
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'");%>>
							Account type
							</td>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'"); flag=!flag;%>>
								<%=data[5]%>/<%=data[4]%>
							</td>
						</tr>
						
						<tr >
							<td  nowrap <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'");%>>
							Currency
							</td>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'"); flag=!flag;%>>
								<%=data[13]%>
							</td>
						</tr>
						
						<tr >
							<td  nowrap <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'");%>>
							Account Name
							</td>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'"); flag=!flag;%>>
								<%=data[12]%>/<%=data[11]%>
							</td>
						</tr>
						
						<tr >
							<td  nowrap <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'");%>>
							Account Status
							</td>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'"); flag=!flag;%>>
								<%=data[10]%>
							</td>
						</tr>
						
						<tr >
							<td  nowrap <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'");%>>
							Account Open Date
							</td>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'"); flag=!flag;%>>
								<%=data[1]%>
							</td>
						</tr>
						
						<tr >
							<td nowrap <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'");%>>
							Account Balance
							</td>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'"); flag=!flag;%>>
								<%=data[2]%>
							</td>
						</tr>
						
						<tr >
							<td nowrap <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'");%>>
							Available Balance
							</td>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'"); flag=!flag;%>>
								<%=data[7]%>
							</td>
						</tr>
						
						<tr >
							<td nowrap <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'");%>>
							Unclear Balance
							</td>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'"); flag=!flag;%>>
								<%=data[8]%>
							</td>
						</tr>
						
					<%	if(!data[14].equals("0.0")){%>
						<tr >
							<td nowrap <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'");%>>
							Sanction Limit
							</td>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'"); flag=!flag;%>>
								<%=data[14]%>
							</td>
						</tr>
						
						<%}%>
					<%	if(!data[15].equals("0.0")){%>
						<tr>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'");%>>
								Drawing Power
							</td>
							<td <%out.println((flag==true)?"class='dataTableInfoTD'":"class='dataTableInfoTDAlt'"); flag=!flag;%>>
								<%=data[15]%>
							</td>
						</tr>

						<%}%>
						<tr>
							<td class="dataTableInfoTH" colspan="2" align="center">
								<font size="2px"><b>Information till <%=nstrdate%>&nbsp;<%=nstrdate1%>
							</td>
						</tr>
						<%}%>
					</table>
			</td>
		</tr>
	</table>
</html:form>
</body>



<style>
.dataInfoText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 7pt;
        font-weight: bold;
        color: brown;
        text-decoration: none;

}
.tableHeader{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: #92610E;
        text-decoration: none;

}
.normalHeadText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		font-weight: bold;
}
.normalText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;

}

.dataTableInfoTH{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:5;
		padding-right:3;
		font-weight: bold;
     /*   color: #092771; */
		color:white;
        text-decoration: none;
		background-color:#3892FE;
		text-align:center;

}
.dataTableInfoTD{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:5;
		padding-right:3;
        text-decoration: none;
		background-color:#DDEFFD;
		text-align:left;


}
.dataTableInfoTDAlt{
	font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:5;
		padding-right:3;
        text-decoration: none;
		background-color:white;
		text-align:left;
}
</style>