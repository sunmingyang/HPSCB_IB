	<%@ include file="/common/Include.jsp" %>	
	<link rel = "stylesheet" href="/scripts/table.css"  type = "text/css">
	<%
	 String aTranData[][] = null ;
	String accountList="",openFor="",purpose="" ; 
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
	String fundinfo[][] = (String[][])session.getAttribute("FUNDINFO");   
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
	String accNo="";
	if(session.getAttribute("beneaccountNo") != null)
	{
		accNo= (String)session.getAttribute("beneaccountNo");
	}
/*
	if(request.getParameter("openFor")!=null){
		openFor=(String)request.getParameter("openFor");
		System.out.println("openFor----------------"+openFor);
	} 
	*/
		if(request.getParameter("purpose")!=null){
		purpose=(String)request.getParameter("purpose");
		System.out.println("purpose----------------"+purpose);
	}

	  if(session.getAttribute("aTranData") != null) {
	 aTranData =(String[][])session.getAttribute("aTranData");
	session.removeAttribute("aTranData"); 
	System.out.println("aTranData----------------"+ aTranData);
		}

String  date=DateTimeFunction.getIbDateTime();
	%>

	<script language="JavaScript" >	
	var userid = '<%=login_id%>';
	var purp = '';
	var purp = '<%=purpose%>';
	
	function bacck(){
		
		document.forms[0].action="/TransactionAction.do?action=getACSList"; 
		document.forms[0].submit();
	}
function hideelement()
{ 
 if(purp === 'echkcancelreportdata')
	{
	   document.getElementById("trnreftable").style.display = "none"; 
	} else if (purp === '')
	{
		document.getElementById("cancelechk").style.display = "none"; 
	}else if (purp === 'echk')
	{
		document.getElementById("cancelechk").style.display = "none"; 
	}
}

	function fetchData(purp)
	{ 
		debugger;
		var refno = document.getElementById("refno").value; 
		if(purp === '' || purp === 'tran')
		{
	
	    document.forms[0].action="/TransactionAction.do?action=getQueryByRefNo&sUserId="+userid+"&tranNo="+refno;
		document.forms[0].submit(); 
		} else if(purp === 'echk') { 

			if(trim(refno) ==='')
		{
		alert("Enter reference number");
		return;
		}
		
		document.forms[0].action="/TransactionAction.do?action=getMultipleTransactionList&purpose=echk&sUserId="+userid+"&chkno="+refno;
		document.forms[0].submit(); 
		} else if(purp === 'echkcancelreportdata')  
		{
			
		var sfromDate = document.getElementById("fdate").value;
		var sToDate = document.getElementById("tdate").value; 
		if(trim(sfromDate) ==='' || trim(sToDate)==='')
		{
		alert("Select Date");
		return;
		}
		document.forms[0].action="/TransactionAction.do?action=getMultipleTransactionList&purpose="+purp+"&sUserId="+userid+"&fromdate="+sfromDate+"&todate="+sToDate; 
		document.forms[0].submit(); 
		}
	} 

	</script>
<script>
function showHeading(purp) 
{
debugger;
 if(purp === 'echkcancelreportdata') 
 {
document.getElementById("label").innerHTML = '<u style="color: blue;"><B>View Status</B>';  
document.getElementById("heding").innerHTML = '<B>Select a date range to view status of canceled e-check</B>';  

 } else if (purp === '')
 {
	 document.getElementById("label").innerHTML = '<u style="color: blue;"><B>Search By  Transaction Number</B></u>'; 
	 document.getElementById("heding").innerHTML = '<B>Link in the search by transactions number  enable you to watch trnsaction status  of  voucher of all form based as well as file based transactions.</B>';  

 } else if (purp === 'echk')
 {
	  document.getElementById("label").innerHTML = '<u style="color: blue;"><B>E-check report</B></u>';
	   document.getElementById("heding").innerHTML = '<b> Link in the View  check  enable you to watch details of transactions voucher  created for check  based transactions.  </b>';  
 }
}
</script> 
	<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
	<!-- <html:form action="/jsp/login.do"> -->
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="footer_jsp" value="/common/footer.jsp"/>

	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=fundtr"/>
				
		<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking"/>
			
	<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
	&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
	</tiles:put>
	<html:form action="/TransactionAction.do" >
	<body onload = "hideelement();showHeading(purp) ">
	<div border="10 px:solid" style="
    border: 1px solid black;
    border-radius: 20px;">
  
<table width = "100%"><tr><td align = "left">
<p  id = "label" ><u style="
    color: blue;
"> 

</td><td align = "right"> <p><u style="
    color: blue;
"> <B><%=date%></B></td></tr>
</br>
<table width ="98%" border = "10 px:solid">
<tr>				
<td>
<p align = "left" id = "heding" bgcolor="blue" style="
    background-color: #cccccc;"><!-- <b> Link in the View  Transactions enable you to watch retports of transactions voucher of all form based as well as file based transactions.  </b> --></p>

	<table id = "trnreftable"> 
	<tr>
	<td colspan = "3">
	
	<B>Enter Tran .Ref Number/E-cheque Number : </B> 
	<input type "text" id = "refno" maxlength = "7" />
	</td>
		</tr>
		</table>
		<%

		if (aTranData != null) {	%> 
			<div style="height:100px;overflow:auto">
		<table id = "stmttable" class = "dataTableTH">
		<tr>

		 <td class="dataTableTH"><B>Sr.No.</B></td>
		 <td class="dataTableTH"><B>From Account</B></td>
		 <td class="dataTableTH"><B>Remitance Account</B></td>
		 <td class="dataTableTH"><B>IFCS Code</B></td>
		 <td class="dataTableTH"><B>Amount</B></td>
		
		<%	for(int i=0;i<aTranData.length;i++) {
				%>  
				<tr>
				 <td class="dataTableTD"><%=i+1%></td> 
				<td class="dataTableTD"> <%=aTranData[i][0]%></td> <!--name -->
				<td class = "dataTableTD"> <%=aTranData[i][1]%> </td> <!-- acno -->
				<td class = "dataTableTD"> <%=aTranData[i][2]%></td> <!-- ifsc -->
				<td class="dataTableTD"> <%=aTranData[i][3]%></td> <!-- amt -->
		
				<!-- Addauth1 1 and auth2 remark -->
										
				</tr>
				<%} %>  
				</table> 
				<% } else { %><div id="table_message" style="display:none;color:red;font-weight:bold;font-size:15px;">
			No Transactions Pending for authorization
		</div>
<%} %> 
				 

 <table id = "cancelechk">
 <tr>
<td colspan = "3" style="margin-left: 29px;"> 
<B><bean:message bundle="hindi" key= "115"/></B>
<input type ="Date" id = "fdate"/>
<B><bean:message bundle="hindi" key= "116"/></B>
<input type ="Date" id = "tdate"/>
</td>
</tr>
</table>
				<input type ="hidden" name="sessionID" id="sessionID" value="" >
				<input type ="hidden" name="sessionID" id="sessID" value="'<%=sessionId%>'" >
		        </div>
			
				<div align="center">
				<input type=button id="Proceed" class = "Button" value="Proceed" onclick="fetchData(purp);"/>
				<input type=button value="Back"  class = "Button" onclick="bacck();" />
			    </div>	
</table>
</table>
</div>
				</body>
				</html:form>
				</tiles:put>
				</html:form>
				</tiles:insert>


				<script type="text/javascript">

				<%if(session.getAttribute("error")!=null) {
					String result=(String)session.getAttribute("error");
					session.removeAttribute("error");
					if(result.equalsIgnoreCase("success")){%>
					alert('<bean:message bundle ="<%=lang%>" key="7455"/>');
					<%}
					else 
					{%>
					alert('<bean:message bundle ="<%=lang%>" key="7456"/>');
					<%}}%>


					</script>



