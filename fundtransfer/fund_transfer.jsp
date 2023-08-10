		<%@ include file="/common/Include.jsp" %>	
		<%
		String accountList="" ; 
	String [] AccListArr= null ; 
	if (session.getAttribute("allAccountlist") != null ) { 
	   accountList=(String)session.getAttribute("allAccountlist");
	   System.out.println("FundAccountList----------------"+accountList);
	   AccListArr =accountList.split(",");
	}
          String mob=(String)session.getAttribute("customerMobile");
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
		
			
		%>

	<script language="JavaScript" >	
	var sAccBal;
	function isNumberKey(evt)
	{
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57))
	return false;

	return true;
	}

	function alphaOnly(event) {
	var key = event.keyCode;
	return ((key >= 65 && key <= 90) || key == 8 || key==32);
	};
	
	function getResponse(){
		acc_bal();
	}
	
	function acc_bal()
   	{
    		 		
  		var s = document.getElementsByName('sUsrList1')[0];
  		var acnumber = s.options[s.selectedIndex].value;
		var ran=parseInt(Math.random()*9999);
		var url ="/AccountInfoAction.do?action=fetchAccountBalance&accNo="+acnumber+"&ran="+ran; 
			http.open("POST",url,false);
			http.onreadystatechange= function (){processAccount()};
			http.send(null);	
   	}
	
		function processAccount()
   	{
    	if (http.readyState == 4)
  		{
  			if (http.status == 200)
  			{
  				var resArray=http.responseText;
  				var jsonData = JSON.parse(resArray);
  				var bal=parseFloat(jsonData.accBalance);
  				sAccBal=parseInt(bal);
  				var Afterbal= bal.toFixed(2);
  				document.getElementById('acbal').value=Afterbal;
  			}	
  		}
  	}
		
function otp_number()
{
	var userid='<%=login_id%>' ;
	var mobile=document.getElementById("UserMobile").value;
	var name=document.getElementById("payee_name").value;
	name=document.getElementById("payee_name").value;
	if(name=="")
	{
		alert("please enter sender number ");
		return false;
	}
	var beneficiaryAccNo=document.getElementById("payee_accno").value;
	beneficiaryAccNo=document.getElementById("payee_accno").value;
	if(beneficiaryAccNo=="")
	{
		alert("please enter sender account number ");
		return false;
	}
	var ifsc=document.getElementById("payee_ifsc").value;
	ifsc=document.getElementById("payee_ifsc").value;
	if(ifsc=="")
	{
		alert("please enter Branch IFSC Code ");
		return false;
	}
	var payeemobile=document.getElementById("payee_mob").value;
	payeemobile=document.getElementById("payee_mob").value;
	if(mobile=="")
	{
		alert("please enter 10 digit  the Payee Mobile Number ");
		return false;
	}
	var amount=document.getElementById("amount").value;
	amount=document.getElementById("amount").value;
	if(amount=="")
	{
		alert("please enter the Amount ");
		return false;
	}
	if(parseFloat(amount)>parseFloat(sAccBal))
	{
		alert("Amount Cannot be greater than Available Balance");
		return false;
	}
	if(parseFloat(amount)>10000 ){
		alert( "Amount Can not be transfer More then 10,000.00");
		return false;
	}
	
	var debitacc = document.getElementById("accList").value;					//26-09-2019
    var purpose='IMPS Transfer';
	var ran=parseInt(Math.random()*9999);
	var url="/TransactionAction.do?action=sendOTP&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&amount="+amount+"&DebitAccount="+debitacc+"&DrCr=D"+"&mobile="+mobile+"&sessionID=<%=session.getId()%>&purpose="+purpose+"&ran="+ran;
	http.open("POST",url,false);
	http.onreadystatechange= function (){processResOTP()};
	http.send(null);	

}
function processResOTP(){
	if (http.readyState == 4)
	{
		// Check that a successful server response was received
		if (http.status == 200)
		{
			var resArray=http.responseText;
			var jsonData = JSON.parse(resArray);
			var result = jsonData.authorise;
			if(result=="failure")
			{
				alert(jsonData.errorMsg);
				return false;
			}
			else if(result=="success")
			{
				//25-09-2019
				alert("Dear Customer your OTP has been sent on Mobile: "+jsonData.mobileNo);
			}
		}
	}
}
function bacck(){
		window.location.href = "/fundtransfer/fund.jsp"
		}

function transfer(){
   var userid='<%=login_id%>' ;
   var beneficiaryAccNo=document.getElementById("payee_accno").value;
   var otp=document.getElementById("otp").value;
   var acc=document.getElementById("accList").value;
   var amount=document.getElementById("amount").value;
   
   var sRemark=document.getElementById("payee_remark").value;
   var sIFSCCode=document.getElementById("payee_ifsc").value;
   var mobile=document.getElementById("UserMobile").value;
   var sCustName=document.getElementById("payee_name").value;
	var mode= "P2A";
	var ran=parseInt(Math.random()*9999);
   var url="/TransactionAction.do?action=fundTransferOtherBank&OTP="+otp+"&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&IFSCcode="+sIFSCCode+"&remiMobile="+mobile+"&custName="+sCustName+"&Remark="+sRemark+"&mode="+mode+"&transferAmt="+amount+"&sessionID=<%=session.getId()%>&ran="+ran;
  // alert("URL : "+url);
   http.open("POST",url,false);
	http.onreadystatechange= function (){processRes()};
	http.send(null);
}
function processRes(){
			 if (http.readyState == 4)
				{
					// Check that a successful server response was received
					if (http.status == 200)
					{
						var resArray=http.responseText;
						var jsonData = JSON.parse(resArray);
						alert(jsonData);   
						alert("Dear Customer your Transaction has been "+jsonData.result +" and Transaction Id: "+jsonData.transactionID);
						if(jsonData.result=="success"){
							document.getElementById("TrdKid").value = jsonData.transactionID;
						}
						//window.location.href = "/fundtransfer/fund.jsp"
					}
					else
					{
						alert("HTTP error: " + http.status);
					}
				}
		}


function ViewRecipt()
	{
		var TrdKid=document.getElementById("TrdKid").value;
		var sBenename=document.getElementById("payee_name").value;
		var sBeneAccNo=document.getElementById("payee_accno").value;
		var ran=parseInt(Math.random()*9999);
		
	    var url="/TransactionAction.do?action=IMPSTranDeatilReciept&TrdKid="+TrdKid+"&sBeneAccNo="+sBeneAccNo+"&sBenename="+sBenename+"&ran="+ran;
		http.open("POST",url,false);
		http.onreadystatechange= function (){Printprocessdata()};
		http.send(null);
	}
	
	function Printprocessdata(){
		if (http.readyState == 4)
			{
				if (http.status == 200)
				{
					     var resArray=http.responseText;
					     var jsonData = JSON.parse(resArray); 
						 
					
					   if (jsonData.transactionID == "-1" ) {
					     alert("Transaction failed :"+ jsonData.Error);
					   }else { 
					   
							}
							javascript:window.open("/fundtransfer/OtherBankPaymentReciept.jsp", 'Download File', 'width=800,height=550,left=200,top=50');
						}
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
		<tiles:put name="menu" value="/common/user_left.jsp?src=fundtr"/>
		<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
		<tiles:put name="content" type="String">
		<tiles:put name="page_header" type="String">
		&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
		</tiles:put>
		<html:form action="/TransactionAction.do">
		<body style="margin:0 0 0 0;" onload="getResponse()"><br>

		<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
			<tr>
				<td  class="wrapperDataTableTR" align="center" width=1000px ><H4><B>Fund Transfer Other Bank <B></H4></td>
			</tr>
			<tr>
			<td align="center">
			<table width=527>
			   <tr>
                 <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
				<B>Available Balance</B>
				
				 <input type="text" id="acbal" style="margin-left:89px;" maxlength="20" readonly />
				</td>
				</tr>
			<tr>
              <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
				<B>Account No.</B>
				
				 <select name="sUsrList1" list="AccountNoList" listkey="custId" listValue="accountNo" style="width: 198px;margin-left: 120px;" id="accList" style="margin-left:120px;" onChange="acc_bal()">
				<%
				if (AccListArr != null)
				for(int i=0;i<AccListArr.length;i++){%>
				<option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
				<%}%>
				</select> 
				</td>
				<tr>
				<td align="center">
				</td>
				</tr>
				</tr>
                 <tr>
                 <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
				<B>Beneficiary Name</B>
				
				 <input type=text id="payee_name" style="margin-left:86px;" maxlength="50" onkeydown="return alphaOnly(event)"  />
				</td>
				</tr>
				<tr>
			<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
				<B>Account No.</B>
				<input type=text id="payee_accno" style="margin-left:120px;" maxlength="20" onkeypress="return isNumberKey(event)" />
				</td>
				</tr>
				<tr>
			 <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
				<B>IFSC Code</B>
				 <input type=text id="payee_ifsc" style="margin-left:130px;" maxlength="11" onkeyup="this.value = this.value.toUpperCase();"/>
				</td>
				</tr>
				<tr>
				<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
				<B>Mobile Number</B>
			 <input type=text id="payee_mob" style="margin-left:103px;" onkeypress="return isNumberKey(event)" maxlength="10"/>
				</td>
				</tr>
		<tr>
		  <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		  <B>Amount</B>
			<input type=text id="amount" style="margin-left:151px;" maxlength="6" onkeypress="return isNumberKey(event)"//>
		 </td>
		</tr>
		<tr>
		    <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>Remarks</B>
			 <input type=text id="payee_remark" style="margin-left:145px;" maxlength="15" onkeydown="return alphaOnly(event)"  />
			</td>
		</tr>
			
		<tr>
			<td align="center">
				<table> 
						<tr> <td align="center"> <input type="button" onClick="otp_number()" style="width:100px" value="Send Otp"/> </td> </tr>
				<tr> 
					<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
					<B>OTP</B>	 <input type="text" name="otp" id="otp" style="margin-left:44px;" > 
				</td> 
				</tr>
				</table>
		    </td>
	</tr>
				<tr>
				<td align="center">
				<input type=button value="Proceed" onclick="transfer();"/>
				<input type=button value="Cancel" onclick="bacck();" />
				<input type="button" name="Print" tabindex="24" value="View Recipt" onclick="ViewRecipt()" class="Button" id="Print">
				</table>
				<input type="hidden" size="20" readonly="true" value="<%=mob%>" id="UserMobile"/>
				<input type="hidden" name="TrdKid" id="TrdKid"/>
			</td>
</tr>
					</table>
					
				
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


		<style>
		.dataTableTH{
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 8pt;
				padding-left:3;
				padding-right:3;
				
				font-weight: bold;
				color: #092771;
				text-decoration: none;
				background-color:#BFBFBF;
				text-align:center;

		}
		.dataTableTD{
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 8pt;
				padding-left:3;
				padding-right:3;
				text-decoration: none;
				background-color:#EFEFEF;
				text-align:center;


		}
		</style>

			 
