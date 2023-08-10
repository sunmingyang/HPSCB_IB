<%@ include file='/common/Include.jsp' %>
<%@ page import="java.util.Date"%>
<%String usrName = (String)session.getAttribute("user");
String usrInfo[][]=(String[][])session.getAttribute("userInfo"); 
String accList=(String)session.getAttribute("allAccountlist");
String accNoList[]=accList.split(",");
Date d=new Date();
String  date="";
if(d.getDate()<=9)
	date="0"+d.getDate();
else
	date=d.getDate()+"";
if((d.getMonth()+1)<=9)
	date=date+"/0"+(d.getMonth()+1)+"/"+d.toString().substring(d.toString().length()-4);
else
	date=date+"/0"+(d.getMonth()+1)+"/"+d.toString().substring(d.toString().length()-4);

								
%>


<script type="text/javascript">
	
	function saveDetail(){
		var accno=document.getElementById("sAccList").value;
		var fromDate=document.getElementById("fromDate").value;
		var toDate=document.getElementById("toDate").value;
		var amt=document.getElementById("amount").value;
		var periodicity=document.getElementById("periodicity").value;
		var toAcc=document.getElementById("toAcc").value;
		var ifsc=document.getElementById("ifsc").value;
		var remarks=document.getElementById("remarks").value;
		var tDate=document.getElementById("tDate").value;
		var pName=document.getElementById("toAccName").value;
		if(accno=="-1"){
			alert("Select from account number");
			document.getElementById("sAccList").focus();
			return false;
		}
		else if(fromDate==""){
			alert("Enter from date");
			document.getElementById("fromDate").focus();
			return false;
		}
		else if(isValidDateFormat("fromDate")==false)
		{
			alert("Enter valid from date");
			document.getElementById("fromDate").focus();
			return false;
		}else if(dateComparision("fromDate","tDate"))
		{
			alert("From date must be more than todays date");
			document.getElementById("fromDate").focus();
			return false;
		}
		else if(toDate==""){
			alert("Enter to date");
			document.getElementById("toDate").focus();
			return false;
		}
		else if(isValidDateFormat("toDate")==false)
		{
			alert("Enter valid to date");
			document.getElementById("toDate").focus();
			return false;
		}
		else if(dateComparision("fromDate","toDate")|| toDate==fromDate)
		{
			alert("To date must be more than from date");
			document.getElementById("toDate").focus();
			return false;
		}
		else if(amt=="")
		{

			alert("Enter amount to be transfer");
			document.getElementById("amount").focus();
			return false;
		}
		else if(isValidNumber(amt)==false){
			alert("Enter valid amount to be transfer");
			document.getElementById("amount").focus();
			return false;
		}

		else if(periodicity=="-1")
		{
			alert("Select periodicity");
			document.getElementById("periodicity").focus();
			return false;
		}
		else if(toAcc=="")
		{
			alert("Enter To account ");
			document.getElementById("toAcc").focus();
			return false;
		}
		else if(pName=="")
		{
			alert("Enter Payee Name");
			return false;
		}
		else if(document.getElementById("ifscField").style.display=="block" && ifsc=="")
		{
			alert("Enter IFSC code");
			document.getElementById("ifsc").focus();
			return false;

		}
		else if(document.getElementById("ifscField").style.display=="block" && ifsc.length<11)
		{
			alert("Enter valid 11 digit IFSC code");
			document.getElementById("ifsc").focus();
			return false;
		}
		fromDate=fromDate.substring(6)+"-"+fromDate.substring(3,5)+"-"+fromDate.substring(0,2);
		toDate=toDate.substring(6)+"-"+toDate.substring(3,5)+"-"+toDate.substring(0,2);
		if(periodicity=="-1")
			periodicity="";

		var obj={"accno":accno,
		"fromDate":fromDate,
		"toDate":toDate,
		"amount":amt,
		
		"periodicity":periodicity,
		"toAcc":toAcc,
		"payeeName":pName,
		"ifsc":ifsc,
		"remarks":remarks};
		var jsonStr = JSON.stringify(obj);
		var encStr=window.btoa(jsonStr);
		var url="/AccountInfoAction.do?action=standingInsDetails;
		
		http.open("POST",url,false);
		http.onreadystatechange= function (){ showMessage();};
	   	http.send("jsonString="+encStr);
				
	}
	function showMessage(){
		if (http.readyState == 4)
			{
				if (http.status == 200)
				{
					var res=http.responseText;
					if(res=="success")
					{
						alert("Entry saved successfully");
					}
					else if(res=="failure")
					{
						alert("Entry not saved successfully");
					}
					else if(res=="noAccount")
					{
						alert("Account number not found");
						document.getElementById("toAcc").value="";
						document.getElementById("toAcc").focus();
						return;
					}
					//window.location.href="/fundtransfer/standingIns.jsp";
				}
			}
	}
	function checkAccount(){
		var accno=document.getElementById("toAcc").value;
		var url="/AccountInfoAction.do?action=fetchAccountBalance&accNo="+accno;
		http.open("POST",url,false);
		http.onreadystatechange= function (){payeeName()};
		http.send(null);
	}
	function isValidNumber(NumText){
		lenNum = NumText.length;
		for(i=0; i<lenNum; i++)
		{
			if(NumText.charAt(i)<'0' || NumText.charAt(i)>'9')
			{
				if(NumText.charAt(i)!='.')
				{	
					return false;
				}
				
			}
		}
		return true;
	}
	function payeeName(){
		if (http.readyState == 4 && http.status == 200)
		{
				var resArray=http.responseText;
				var jsonData = JSON.parse(resArray);
				if(jsonData.customerName=="")
				{
					document.getElementById("ifscLabel").style.display="block";
					document.getElementById("ifscField").style.display="block";
					document.getElementById("toAccName").value="";
					
				}
				else{
					document.getElementById("toAccName").value=jsonData.customerName;
					document.getElementById("ifsc").value="";
					document.getElementById("ifscLabel").style.display="none";
					document.getElementById("ifscField").style.display="none";
					
				}
		}
	}
				
				
</script>
<jsp:include page="/dashBoard/dashboardNew.jsp" />
<body>
	<div class="breadcrumb-container">
		<div class="row">
			<div class="col">
				<div class="breadcrumb">
					<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
					<div class="breadcrumb-item"><a>Fund Transfer</a></div>
					<div class="breadcrumb-item">Standing Instructions</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrapperDataTableTR  container text-center" >
		<h2 class=" label-style badge bg-primary p-2 fs-6 mt-2 ">Standing Instructions Reminder</h2>
	</div>
	<div class="container border shadow">
		<form action="/request/reqchk.do">
			<div class="row mb-3">
				<div class="col-md-4">
					<label class="form-label">From Account Number:</label>
					<select class="form-select" name="sAccList" id="sAccList">
						<option value="-1">--SELECT--</option>
						<% 
						  String accNo = "";
						  for (int i = 0; i < accNoList.length; i++) {
							accNo = accNoList[i];
						%>
						<option value='<%= accNo %>'><%= accNo %></option>
						<% } %>
					</select>
				</div>
				<div class="col-md-4">
					<label class="form-label">From Date:</label>
					<input class="form-control" type="text" id="fromDate" value="<%=date%>" onkeypress="isValidDatechar('')" maxlength="10">
					<b>(dd/mm/yyyy)</b>
				</div>
				<div class="col-md-4">
					<label class="form-label">To Date:</label>
					<input class="form-control" value="<%=date%>" id="toDate"  onkeypress="isValidDatechar('')" maxlength="10">
					<b>(dd/mm/yyyy)</b>

				</div>
			</div>
			<div class="row mb-3">
				<div class="col-md-4">
					<label class="form-label">Amount:</label>
					<input class="form-control" type="text" id="amount"  maxlength="20" onkeypress='alphaAmount(document.getElementById("amount"));'>
				</div>
				<div class="col-md-4">
					<label class="form-label">Periodicity:</label>
					<select class="form-select" id="periodicity">
						<option value="-1">--Select Periodicity--</option>
						<option value="D">Daily</option>
						<option value="W">Weekly</option>
						<option value="F">FortNight</option>
						<option value="M">Monthly</option>
						<option value="B">Bi-Monthly</option>
						<option value="Q">Quarterly</option>
						<option value="H">Half-Yearly</option>
						<option value="Y">Yearly</option>
					</select>
				</div>
				<div class="col-md-4">
					<label class="form-label">To Account:</label>
					<input class="form-control" type="text" id="toAcc"  maxlength="16" onchange="checkAccount()">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-md-4" id="pNameField">
					<label class="form-label " id="pNameLabel">Payee Name:</label>
					<input class="form-control" type="text" id="toAccName" maxlength="50">
				</div>
				<div class="col-md-4">
					<label class="form-label" id="ifscLabel" style="display:none;">IFSC:</label>
					<div id="ifscField" style="display:none;">
						<input class="form-control" type="text" id="ifsc" maxlength="11">
					</div>
					
				</div>
				<div class="col-md-4">
					<label class="form-label">Remarks:</label>
					<input class="form-control" type="text" id="remarks">
				</div>
			</div>
			<input type="hidden" value="<%=date%>" id="tDate"/>
			<div class="row justify-content-center">
				<div class="col-md-4 text-center">
					<input type="button" onClick="return saveDetail()" class="btn btn-primary btn-block" value="<bean:message bundle='<%=lang%>' key='7119'/>">
				</div>
			</div>
		</form>
	</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	
</body>
