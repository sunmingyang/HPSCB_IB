<%@ include file="/common/Include.jsp" %>	
<link rel = "stylesheet" href="/scripts/table.css"  type = "text/css">
<%
	String accountList="",openFor="" ; 
	String [] AccListArr= null ; 
	String acslist[][]=null;
	if (session.getAttribute("allAccountlist") != null ) { 
		accountList=(String)session.getAttribute("allAccountlist");
		System.out.println("FundAccountList----------------"+accountList);
		AccListArr =accountList.split(",");
	}
	String mob=(String)session.getAttribute("customerMobile");
	String custRole=(String)session.getAttribute("custRole");
	System.out.println("custRole----------------"+custRole); 
	int errorcount=0;
	String usrName = "";
	
	if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");

	String login_id="";
	if(session.getAttribute("userid")!=null){
		login_id = (String)session.getAttribute("userid");//New changes on 16/07/2008;

	}
	String sessionId= session.getId() ;

	String res="";
	if(session.getAttribute("response") != null)
	{
		res= (String)session.getAttribute("response");
	}
	if(session.getAttribute("acslist") != null)
	{   
		acslist= (String[][])session.getAttribute("acslist");
	}

	if(request.getParameter("openFor")!=null){
		openFor=(String)request.getParameter("openFor");
		System.out.println("openFor----------------"+openFor);
	} 
	String aPendingListarr[][] =(String[][])session.getAttribute("aPendingListarr");
	session.removeAttribute("aPendingListarr"); 
	System.out.println("pendingTransaction----------------"+aPendingListarr);

	String message="Failure Transaction Reports";
	String reportFor=request.getParameter("reportFor");
	if(reportFor==null)
	{
		reportFor="N";
		message="Pending Transaction Reports";
	}
	String  date=DateTimeFunction.getIbDateTime();
	String time[]=date.split(" ")[1].split(":");
	date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);

%>

<script language="JavaScript" >	
	var userid = '<%=login_id%>';
	function bacck(){
		document.forms[0].action="/corporatebanking/AddNewUserAction.do?action=getParentCIBUsr"; 
		document.forms[0].submit();
	}
	function fetchData()
	{ 

		var tranType = document.getElementById("ftype").value;
		var suserid = 	document.getElementById("scibuser").value;
		var accNo = 	document.getElementById("accList").value;
		var sfromDate = document.getElementById("fdate").value;
		var sToDate = document.getElementById("tdate").value; 
		var fileType = document.getElementById("viewType").value;
		if(isValidDateFormat("fdate")==false)
		{
			alert("Enter valid From  date");
			document.getElementById("fdate").value="";
			document.getElementById("fdate").focus();
			return false;
		}
		else if(dateComparision("fdate","todayDate"))
		{
			alert("From date must be less than today's date");
			document.getElementById("fdate").value="";
			document.getElementById("fdate").focus();
			return false;
		}
		if(isValidDateFormat("tdate")==false)
		{
			alert("Enter valid To  date");
			document.getElementById("tdate").value="";
			document.getElementById("tdate").focus();
			return false;
		}
		else if(dateComparision("tdate","todayDate"))
		{
			alert("From date must be less than or equal to today's date");
			document.getElementById("tdate").value="";
			document.getElementById("tdate").focus();
			return false;
		}
		sfromDate=sfromDate.substring(3,5)+"-"+sfromDate.substring(0,2)+"-"+sfromDate.substring(6,10);
		sToDate=sToDate.substring(3,5)+"-"+sToDate.substring(0,2)+"-"+sToDate.substring(6,10);
		document.forms[0].action="/TransactionAction.do?action=getPendingstatementforUnauthorisedTransaction&sUserId="+suserid+"&saccNo="+accNo+"&fromDate="+sfromDate+"&toDate="+sToDate+"&fileType="+fileType+"&tranType="+tranType+"&reportFor=<%=reportFor%>";      
		document.forms[0].submit();

}


/*
function processRes(){
	if (http.readyState == 4)
	{
		// Check that a successful server response was received
		if (http.status == 200)
		{  debugger;
		eval('var resArray='+http.responseText);
		var table = document.getElementById("stmttable");
		var row0 = table.insertRow(0); 
		var lname = row0.insertCell(0);
		var mob = row0.insertCell(1);
		var accno = row0.insertCell(2);
		var ifc = row0.insertCell(3);
		var remark = row0.insertCell(4);
		lname.innerHTML = 'Name';
		mob.innerHTML =  'Mobile';
		accno.innerHTML = 'Accounts'; 
		ifc.innerHTML =  'IFCS';
		remark.innerHTML =  'Remark';

		for(var i=0;i<resArray.length;i++)
		{

			var respArrdata = resArray[i];
			var row = table.insertRow(i+1); 
			var lname = row.insertCell(0);
			var mob = row.insertCell(1);
			var accno = row.insertCell(2);
			var ifc = row.insertCell(3);
			var remark = row.insertCell(4);
			lname.innerHTML = respArrdata[1];
			mob.innerHTML =  respArrdata[3];
			accno.innerHTML =  respArrdata[4]; 
			ifc.innerHTML =  respArrdata[10];
			remark.innerHTML =  respArrdata[10];

		}}
		document.getElementById("Proceed").display = 'none';	
	} 
	else
	{
		alert("HTTP error: " + http.status); 
	}
} 

*/
function fill(){
	<% if(session.getAttribute("Result")!=null){%>
		alert("No data found");
	<%session.removeAttribute("Result");
	}%>
	<% if(!reportFor.equals("N")){%>
		document.getElementById("scibuser").value=userid;
		document.getElementById("scibuser").readOnly=true;
		document.getElementById("ftype").value="fundtran";
		document.getElementById("ftype").readOnly=true;
	<%}%>
	<% if(request.getParameter("saccNo")!=null){%>
		document.getElementById("accList").value='<%=request.getParameter("saccNo")%>';
	<%}if(request.getParameter("fromDate")!=null){%>
		var date='<%=request.getParameter("fromDate")%>'
		date=date.substring(3,5)+"/"+date.substring(0,2)+"/"+date.substring(6,10);
		document.getElementById("fdate").value=date;
	<%}if(request.getParameter("toDate")!=null){%>
		var date='<%=request.getParameter("toDate")%>'
		date=date.substring(3,5)+"/"+date.substring(0,2)+"/"+date.substring(6,10);
		document.getElementById("tdate").value=date;
	<%}if(request.getParameter("fileType")!=null){%>
		document.getElementById("viewType").value='<%=request.getParameter("fileType")%>';
	<%}if(request.getParameter("tranType")!=null){%>
		document.getElementById("ftype").value='<%=request.getParameter("tranType")%>';
	<%}%>
	<%if (aPendingListarr != null) {	%> 
		document.getElementById("detailRow").style.display="none";
	<%}%>
}
	function report(){
		window.location.href="/TransactionAction.do?action=getACSList&reportFor=<%=reportFor%>";
	
	}
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Coorporate Banking Fund Transfer"/>
<%if(request.getParameter("row")==null){ %>
	<tiles:put name="menu" value="/common/user_left.jsp?mode=apforDbtCrd&src=request"/>
<%}%>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=corporatebanking&mode=failReport"/>
<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking" />
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>
</tiles:put>
<tiles:put name="content" type="String">
<script language=JavaScript src="/fundtransfer/scripts/cbFundTransfer.js"> </script>


<script type="text/javascript">
	
	
</script>
<body onload="fill()">
<div border="10 px:solid" style="border: 1px solid black;border-radius: 20px;">

<html:form action="/request/reqchk.do" ><br>
<table width = "100%">
	<tr>
		<td align = "left">
			<p  id = "label" ><u style="color: blue;"> <B>Search By  Transaction Number</B></u>

		</td>
		<td align = "right"> <p><u style="color: blue;"> <B><%=date%></B></td>
	</tr>
<tr>				
	<td colspan="2">
		<p align = "left" id = "heding" bgcolor="blue" style="background-color: #cccccc;"><b>Link in the search by transactions number  enable you to watch trnsaction status  of  voucher of all form based or file based transactions  </b></p>
	</td>
</tr>
</table>
</br>
<table id="mainTab" style="width:100%;" cellpadding="0" cellspacing="15" >
				<tr>
					<td class = "tableHeader" align="center"><u> 
						<%=message%> </u> 
					</td>
				</tr>
				<tr id="detailRow">
					<td>
						<table align="center" style="width:50%;" >
							<tr>
								<td  class="normalHeadText" style="width:15%" >
									<bean:message bundle="hindi" key= "2189"/>
								</td>
								<td style="width:5%;text-align:center;font-weight:bolder;">
									:
								</td>
								<td style="width:15%">
									<select name="accList"  style="width:150" id="accList" >
									<%if (AccListArr != null)
										for(int i=0;i<AccListArr.length;i++){%>
										<option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
										<%}%>
									</select> 

								</td>
							</tr>
							<tr>
								<td class="normalHeadText"  style="width:15%" >
									 Select User ID
								</td>
								<td style="width:5%;text-align:center;font-weight:bolder;">
									:
								</td>
								<td style="width:15%">
									<select  name="scibuser" id ="scibuser"  tabindex='1' style="width:150px">
									<% 
									if(acslist!=null)
									for(int l=0;l<acslist.length;l++)
									{ 
										String	acsName =acslist[l][1];%>
										<option value='<%=acsName%>'><%=acsName%></option> 
										<%
									}%>
									</select>	
								</td>
							</tr>
							<tr>
								<td class="normalHeadText" >
									<bean:message bundle="hindi" key= "115"/> :
								</td>
								<td style="width:5%;text-align:center;font-weight:bolder;">
									:
								</td>
								<td>
									<input type ="text" id = "fdate" maxlength="10" placeholder="dd/mm/yyyy" style="width:150px" value="<%=date%>"/>
									<input type ="hidden" id = "todayDate" value="<%=date%>"/>
									<b>(dd/mm/yyyy)</b>
								</td>
							</tr>
							<tr>
								<td class="normalHeadText">
									<bean:message bundle="hindi" key= "116"/> :
								</td>
								<td style="width:5%;text-align:center;font-weight:bolder;">
									:
								</td>
								<td>
									<input type ="text" id = "tdate" maxlength="10" placeholder="dd/mm/yyyy" style="width:150px" value="<%=date%>"/>
									<b>(dd/mm/yyyy)</b>
								</td>
							<tr>
							<tr>
								<td class="normalHeadText" >
									Select File type
								</td>
								<td style="width:5%;text-align:center;font-weight:bolder;">
									:
								</td>
								<td>
									<select id="ftype" name = "ftype" style="width:150px">
										<option value="excel">Bulk Transaction</option>
										<option value="fundtran">Fund Transfer</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="normalHeadText" >
									Display as 
								</td>
								<td style="width:5%;text-align:center;font-weight:bolder;">
									:
								</td>
								<td>
									<select id="viewType" name = "viewType" style="width:150px">
										<option value="screen">View</option>
										<option value="pdf">Download as PDF</option>
										<option value="xls">Download as MS Excel</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="3" align="center" >
									<br /><br />
									<input type=button id="Proceed"  value="Proceed" class="button" onclick="fetchData();"/>
									&emsp;&emsp;
									<input type=button value="Back" onclick="bacck();" class="button" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			<tr>
				<td align="center">
				<%if (aPendingListarr != null) {	%> 
				<div style="height:100px;overflow:auto">
					<table width="100%" id = "stmttable">
						<tr>
						<!-- 	Sr.No Name AccountNo IFSC Code Amount Statu -->
							<td class="dataTableTH"><B><bean:message bundle="hindi" key= "7153"/></B></td>
							<td class="dataTableTH"><B><bean:message bundle="hindi" key= "9"/></B></td>
							<td class="dataTableTH"><B>Beneficiary <bean:message bundle="hindi" key= "1027"/></B></td>
							<td class="dataTableTH"><B><bean:message bundle="hindi" key= "45054"/></B></td>
							<td class="dataTableTH"><B><bean:message bundle="hindi" key= "39"/></B></td>
							<td class="dataTableTH"><B><bean:message bundle="hindi" key= "177"/></B></td>
							<td class="dataTableTH"><B><bean:message bundle="hindi" key= "345"/></B></td>
							<% if(reportFor.equals("N")){%>
								<td class="dataTableTH"><B>Authorizer 1 remark </B></td>
							<td class="dataTableTH"><B>Authorizer 2 remark </B></td>
							<%}%>
						</tr>
						<tr>
						<%	for(int i=0;i<aPendingListarr.length;i++) {
			%>  
							<tr>
								<td class="dataTableTD"><%=i+1%></td> 
								<td class="dataTableTD"> <%=aPendingListarr[i][1]%></td> <!--name -->
								<td class = "dataTableTD"> <%=aPendingListarr[i][0]%> </td> <!-- acno -->
								<td class = "dataTableTD"> <%=aPendingListarr[i][2]%></td> <!-- ifsc -->
	    						<td class="dataTableTD"> <%=aPendingListarr[i][3]%></td> <!-- amt -->
								<td class="dataTableTD"> <%=aPendingListarr[i][5]%></td> <!-- status -->
								<td class="dataTableTD"> <%=aPendingListarr[i][4]%></td> <!-- remark  -->
								<td style = "display : none" class="dataTableTD"> <%=aPendingListarr[i][8]%> </td> <!-- kid --> 
								<% if(reportFor.equals("N")){%>
									<td   class="dataTableTD">Pending by A1 </td> <!-- A1 --> 
									<td  class="dataTableTD">Pending by A2 </td> <!-- A1 --> 
								<%}%>
								<!-- Addauth1 1 and auth2 remark -->
									
							</tr>
						<%} %> 
						
					</table>
				</div>
			<% }%>
			
			</td>
			</tr>
				<%if (aPendingListarr != null) {	%> 
					<tr>
						<td align="center"  colspan="10">
							<br /><br /><input type=button value="Back" onclick="report();" class="button" />
						</td>
					</tr>
			<% }%>
			
		</table>
		
		

</div>
</html:form>
</body>
</tiles:put>

</tiles:insert >

