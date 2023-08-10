<%@ include file="/common/Include.jsp" %>
	<%
		String accountList="" ; 
		String [] AccListArr= null ; 
		if (session.getAttribute("allAccountlist") != null ) { 
		   accountList=(String)session.getAttribute("allAccountlist");
		   AccListArr =accountList.split(",");
		}
		// agent Mobile , it is being  set in session at the time of login , no need to remove it 
		String mob=(String)session.getAttribute("customerMobile");

	    int errorcount=0;
		String usrName = "";
		 String AccINFO[][] = (String[][])session.getAttribute("AccINFO"); 
		 System.out.println(AccINFO);
		if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
		String login_id="";
		if(session.getAttribute("userid")!=null){
			login_id = (String)session.getAttribute("userid");
			System.out.println("snxw--------------------------"+login_id);
		}
		
	%>
	<script>
	
	function Accept_Amt(ctrlName, Desvalue, e) {
    var keycode = getKeyCode(e);
    if (keycode != 0) {
        var KeyTyped = String.fromCharCode(keycode);
        var lCode = KeyTyped.charCodeAt(0);

        if ((lCode >= 46 && lCode <= 57) && (lCode != 47)) {

            var nstr = document.getElementById(ctrlName).value.slice();

            var p = 0;
            var intd = 0;
            for (var y = 0; y <= (nstr.length) - 1; y++) {
                if ((nstr.charCodeAt(y) == 46)) {
                    p = p + 1;
                    intd = y;
                }
            }
            if (p == 1) {
                if (lCode == 46) {
                    e.returnValue = false;
                    return false;
                }
                else {
                    if (document.getElementById(ctrlName).value.length - intd == Desvalue + 1) {
                        var selectedText = document.getElementById(ctrlName);

                        if (selectedText != "") {
                            var newRange = SelectText(ctrlName);
                            if (newRange == "") {
                                e.returnValue = false;
                                return false;
                            }
                        }
                    }
                }
            }
        }
        else {
            e.returnValue = false;
            return false;
        }
    }
}
	
	
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
	
	
	var sbtnname ="Send OTP";
	function fillData()
	{
			document.getElementById('detailsT').style.display="none";
			document.getElementById('detailsF').style.display="none";
			document.getElementById('otptable').style.display="none";
					
	}
	function change()
	{
		    Tr_mobno.style.display="none";
			Tr_rifsc.style.display="none";
		if(document.getElementById("location").checked){
			document.getElementById('detailsT').style.display="none";
	        document.getElementById('detailsF').style.display="block";
			document.getElementById("location").value="location1"
			document.getElementById("location").checked=true;
			document.getElementById('detailsT').style.display="none";
			
			document.getElementById("amount").value="";					
			document.getElementById("commission").value="";
			document.getElementById("remark").value="";					
			document.getElementById("bank_to_a/cno").value="";				
			document.getElementById("bank_to_name").value="";				
			document.getElementById("confirm").disabled=false; 				
			document.getElementById('otptable').style.display="none";
			
		}else{
			document.getElementById("locationN").value="location2"
			document.getElementById("locationN").checked=true;
			document.getElementById('detailsT').style.display="block";
			document.getElementById('detailsF').style.display="none";
			
			document.getElementById("amount").value="";						
			document.getElementById("commission").value="";					
			document.getElementById("remark").value="";						
			document.getElementById("bank_from_a/cno").value="";
			document.getElementById("bank_from_name").value="";	
			document.getElementById("bank_from_mobno").value="";			
			document.getElementById("bank_from_bal").value="";				
			document.getElementById("confirm").disabled=false; 				
			document.getElementById('otptable').style.display="none";
			
		}

	}
function ViewRecipt()
	{
		var TrdKid=document.getElementById("TrdKid").value;
		var ran=parseInt(Math.random()*9999);
		
	    var url="/TransactionAction.do?action=TransactionDeatilReciept&TrdKid="+TrdKid+"&ran="+ran;
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
							if(document.getElementById("location").checked){
							javascript:window.open("/fundtransfer/CashDepsite.jsp", 'Download File', 'width=800,height=550,left=200,top=50');
							}else {
								javascript:window.open("/fundtransfer/WithDrawRecipt.jsp", 'Download File', 'width=800,height=550,left=200,top=50');
							}
							
				}
			}

	}
	
function chargesData()
{
  //alert("INcharges");
  var amount=document.getElementById("amount").value;
  if(amount=="")
{
	  	alert("please enter the Amount");
		return false;
}
	   var doc='FNT';
	   var activity="CTB";
	   var sTranFor=document.getElementById("locationN").value;
	//   alert(activity);
	   var ran=parseInt(Math.random()*9999);
	   var url="/TransactionAction.do?action=getActivityCharges&activity="+activity+"&document="+doc+"&sessionID=<%=session.getId()%>&amount="+amount+"&ran="+ran;
		http.open("POST",url,false);
		http.onreadystatechange= function (){processdata()};
		http.send(null);
	}

function processdata()
	{
		 if (http.readyState == 4)
		{
			if (http.status == 200)
			{
				var resArray=http.responseText;
				var jsonData = JSON.parse(resArray);
				//alert(jsonData);
				document.getElementById("commission").value=jsonData;
				
			}
		}
}

	</script>



	<script>
	function saveData()
	{
		
		var Tname;
		var Taccno;
		var Faccno;
		var sTranFor= "";
			

		if(document.getElementById("location").checked==true){
			Faccno=document.getElementById("bank_to_a/cno").value;
			Taccno=document.getElementById("accList").value;
			sTranFor=  document.getElementById("location").value ;
			//					alert(Faccno);
		}
		if(document.getElementById("locationN").checked==true){
			//				alert("Withdrawal");
			Taccno=document.getElementById("bank_from_a/cno").value;
			Faccno=document.getElementById("accList").value;
			sTranFor=  document.getElementById("locationN").value ;
		}
		var remarks = document.getElementById("remark").value;
		var OTP=document.getElementById("otp").value
		var amount=document.getElementById("amount").value;
		if(amount=="")
		{
			alert("please enter the Amount");
			return false;
		}
		document.getElementById("confirm").disabled=true;
		var userId = document.getElementById("userid").value;
		var ran=parseInt(Math.random()*9999);
		var url="/TransactionAction.do?action=fundTransferwithinBank&OTP="+OTP+"&userID="+userId+"&beneficiaryAccNo="+Taccno+"&accNo="+Faccno+"&transferAmt="+amount+"&sTranFor="+sTranFor+"&sessionID=<%=session.getId()%>&Remark="+remarks;
		//alert(url);
		http.open("POST",url,false);
		http.onreadystatechange= function (){process()};
		http.send(null);


	}
		function process(){
		if (http.readyState == 4)
			{
				if (http.status == 200)
				{
					     var resArray=http.responseText;
					  // alert(http.responseText);
					     var jsonData = JSON.parse(resArray); 
					   if (jsonData.transactionID == "-1" ) {
						   document.getElementById("confirm").disabled=false;
					     alert("Transaction failed :"+ jsonData.Error);
					   }else { 
							document.getElementById("TrdKid").value = jsonData.transactionID;
					   		alert("Transaction Reference Number:" + jsonData.transactionID);
							}
					//window.location.href = "/fundtransfer/cashDeposit.jsp";
				}
			}

	}
function otp_number()
{
	var Tname;
	var Taccno;
	var Faccno;
	var amount=document.getElementById("amount").value;
	var userId = document.getElementById("userid").value;
	var OtpMobileNo ='<%=mob%>';
	var DrCr="C";

	if(amount=="")
	{
		alert("please enter the Amount");
		return false;
	}

	if(document.getElementById("location").checked==true){
		Faccno=document.getElementById("bank_to_a/cno").value;
		Taccno=document.getElementById("accList").value;
		Tname=document.getElementById("bank_to_name").value;	//07-11-2019
		DrCr="C";
		//				alert(Faccno);
		if(Taccno=="")		//07-11-2019
		{
			alert("Account No cannot be blank");
			return false;
		}
		if(Tname=="")		//07-11-2019
		{
			alert("Name Cannot be blank");
			return false;
		}
	}
	if(document.getElementById("locationN").checked==true){
		//				alert("Withdrawal");
		Faccno=document.getElementById("bank_from_a/cno").value;
		Taccno=document.getElementById("accList").value;
		Tname=document.getElementById("accList").value;
		var availamount=document.getElementById("bank_from_bal").value;
		OtpMobileNo= document.getElementById("bank_from_mobno").value ;
		var Fname = document.getElementById("bank_from_name").value;
		DrCr="D";

		if ( parseFloat(amount) > parseFloat(availamount) )
		{
			alert("Transaction Amount Should be less than Available Balance");
			return false;
		}
		if(Faccno=="")
		{
			alert("Account No. Cannot be blank");
			return false;
		}
		if(Fname="")
		{
			alert("Name Cannot be blank");
			return false;
		}

	}
	 if(OtpMobileNo=="")
	{
		alert("please enter mobile number");
		return false;
	}
	
	if(Taccno=="")
	{
		alert("please enter reciever account number");
		return false;
	}
	document.getElementById('otptable').style.display="nine";
	var purpose='Fund Transfer';
	var ran=parseInt(Math.random()*9999);
	var url="/TransactionAction.do?action=sendOTP&userID="+userId+"&DebitAccount="+Faccno+"&beneficiaryAccNo="+Taccno+"&mobile="+OtpMobileNo+"&sessionID=<%=session.getId()%>&purpose="+purpose+"&DrCr="+DrCr+"+&amount="+amount+"&ran="+ran;
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
			if(jsonData.authorise=="success")
			{
				document.getElementById('otptable').style.display="block";		//26-09-2019
				alert("Dear Customer your OTP has been sent on Mobile: "+jsonData.mobileNo);
			}
			else
			{
				alert(jsonData.errorMsg);
				return false;
			}
		}
	}
}
function getName(id)
{
	var acnumber=document.getElementById(id).value;
	var ran=parseInt(Math.random()*9999);

	var url ="/AccountInfoAction.do?action=fetchAccountBalance&accNo="+acnumber+"&ran="+ran; 
	//alert(url);
	http.open("POST",url,false);
	http.onreadystatechange= function (){processdata2(id)};
	http.send(null);	

}
				
		function processdata2(id1){
							if (http.readyState == 4)
			   {
						// Check that a successful server response was received
						if (http.status == 200)
			   {
							var resArray=http.responseText;
					//		alert("rohit"+resArray);
							var jsonData = JSON.parse(resArray);
							if (jsonData.accFlag=="C") {
							 	alert("Account has been closed");
							 	return false ;
							}
							if(jsonData.customerName=="")
							{
								alert("Account No does Not Exist");
								document.getElementById("bank_to_name").value="";
								document.getElementById("amount").value="";
								document.getElementById("commission").value="";
								document.getElementById("remark").value="";
								document.getElementById("bank_from_name").value="";
								document.getElementById("bank_from_mobno").value="";
								document.getElementById("bank_from_bal").value="";
								return false;
							}
						//	alert(id1);
							if(id1=="bank_from_a/cno")

				   {
					  
					  // alert();
							document.getElementById('bank_from_name').value=jsonData.customerName;
					        document.getElementById('bank_from_mobno').value=jsonData.mobileNo;
							
						  document.getElementById('bank_from_bal').value=jsonData.accBalance;
				   }else{
					    
						 	document.getElementById('bank_to_name').value=jsonData.customerName;
							document.getElementById('bank_to_mobno').value=jsonData.mobileNo;
						 }	
	
						  
						}
					}

			}

	function bacck(){
			window.location.href = "/fundtransfer/agentTrn.jsp"
			}
    function Myfunction(){

		otp_number();
		Accountreadonly();

	}

	function Accountreadonly(){

		debugger;
		document.getElementById("bank_from_a/cno").readOnly = true;
		document.getElementById("bank_to_a/cno").readOnly = true;
	}

	</script>
	<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
	<!-- <html:form action="/jsp/login.do"> -->
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<!--<tiles:put name="footer_jsp" value="/common/footer.jsp"/> -->
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=agentfund"/>
	<tiles:put name="menu" value="/common/user_left.jsp?src=agentfund"/>
	<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
	&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
	</tiles:put>
	<html:form action="/request/DDRequest">
	<body style="margin:0 0 0 0;" onload="fillData()"><br>

	<table align="center"  cellpadding="0" cellspacing="0"  >
		<tr>
			<td  class="wrapperDataTableTR" align="center" width=1000px ><H4><B>Cash Deposit / Withdrawal <B></H4></td>
		</tr>
		<tr>
		<td>
		<table border="1" align="center">
		
		<tr>
		<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		<B>Acc No. From:</B>

					<select name="sUsrList1" list="AccountNoList" listkey="custId" listValue="accountNo" style="width:200" id="accList" onChange="mobileNo()">
					<%
					if (AccListArr != null)
					for(int i=0;i<AccListArr.length;i++){%>
					<option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
					<%}%>
					</select> 
		</td>
		</tr>
		<tr>
		<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		  <p><B> Option <input type="radio" name="group1" id="location" value="C" onclick="change()" >Deposit &nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="radio"  name="group1" id="locationN" value="B" onclick="change()">Withdrawal </B></p>
		</td>
		</tr>
		<tr>
		<td align="left">
		<br/>
		   <table id="detailsT" align="center" >
		   <tr>
		   <td>
		   <table>
		   <tr><td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>A/c Number</B>
					<input type=text  id="bank_from_a/cno" style="margin-left:78px;" onblur="getName(this.id)" maxlength="20" onkeypress="return isNumberKey(event)" />
		   </td></tr>
		   <tr><td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>Name</B>
					<input type=text  id="bank_from_name" style="margin-left:120px;" readonly="true" tabindex="-1" />
		   
		   </td></tr>
		   <tr>
		   <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>Mobile Number</B>
		   
					<input type=text  id="bank_from_mobno" style="margin-left:60px;" readonly="true" tabindex="-1"/>
		   
		   </td></tr>
		    <tr>
			<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>Available Balance</B>
		   
		   
					<input type=text  id="bank_from_bal" style="margin-left:46px;" readonly="true" tabindex="-1"/>
		   
		   </td></tr>
		  
		   </table>
					</td>
				 </tr>

		<table id="detailsF" align="left" >
		 <tr>
		 <td>
		 <table>
		   <tr>
		   <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>A/c Number</B>
			
					<input type=text  id="bank_to_a/cno" style="margin-left:78px;" onblur="getName(this.id)" maxlength="20" onkeypress="return isNumberKey(event)"/>
		   </td></tr>
		   <tr>
		   <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>Name</B>
			
					<input type=text  id="bank_to_name" style="margin-left:120px;" maxlength="50" readonly="true" tabindex="-1" />
		   
		   </td></tr>
	 <tr id="Tr_mobno" >
	 <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>Mobile Number</B>
	 	   		<input type=text  id="bank_to_mobno" style="margin-left:71px;" maxlength=10 onkeypress="return isNumberKey(event)" />
		   
		   </td>
	  </tr>
	  <tr id="Tr_rifsc" >
			<td>
			<label><bean:message bundle="hindi" key= "45054"/></label>
			<input type="text" name="rifsc" style="margin-left:124px;"  maxlength="11"  value=""  id="bank_to_ifsc" onkeyup="this.value = this.value.toUpperCase();" >
			</td>
			</table>
			</td>
	  </tr>
		</table>	
		 </td>
		 
		</tr>
		<tr>
		 <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>Amount</B>
		
				<input type="text" style="margin-left:109px;"  name ="amount" Id="amount"  size="20"  onkeypress="return Accept_Amt(this.name,2,event)"  maxlength="15" onchange="chargesData()" />
				 
		</td>
		</tr>
		<tr>
		 <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>Charges</B>
				<input type="text" style="margin-left:106px;"  Id="commission"  size="20"  maxlength="15"  readonly="true" tabindex="-1"/>
				 
		</td>
		</tr>
		<tr>
		<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>Remarks</B>
		
				<input type="text" style="margin-left:103px;"  Id="remark"  size="20"  maxlength="15" onkeydown="return alphaOnly(event)" />
				 
		</td>
		</tr>
		
  <tr>
		</br>
		<td align="center">
			 <input type="button" name="ok" tabindex="22" value="Send OTP" onclick="Myfunction()" class="Button" id="ok">
			 <input type="button" name="cancel" tabindex="23" value="Cancel" onclick="bacck()" class="Button" id="cancel">
			
			 
			 </td>
		</td>
 </tr>
 	<tr>
		<td>
		<table id="otptable">
			<tr>
					<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>Enter OTP:</B>
					  &nbsp;&nbsp;&nbsp;<input type="text" name="otp" id="otp" style="margin-left: 116px;width: 158px;" > 
					 <input type="button" onClick="saveData()" style="width:100px" value="confirm" id="confirm" /> &nbsp;&nbsp;&nbsp;
					  <input type="button" name="Print" tabindex="24" value="View Recipt" onclick="ViewRecipt()" class="Button" id="Print">
					 </td>
				</tr>
			</table>
		 </td>
			</tr>
			

					   </td>
					  </tr>
					   <tr>
				<td>
					<input type="hidden"  style="margin-left: px;" maxlength="35"  value="<%=login_id%>" size="40" id="userid">
				</td>
				</tr>
	</table>
	<input type="hidden" name="mob" id="mob" value="<%=mob%>" />
    <input type="hidden" name="webData" id="webData"/>
	<input type="hidden" name="kid" id="kid"/>
	<input type="hidden" name="TrdKid" id="TrdKid"/>
			
	</body>
	</html:form>

	</tiles:put>
	</html:form>


	</tiles:insert>



		 
