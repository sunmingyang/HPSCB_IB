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

	function fillData()
	{
			document.getElementById('detailsT').style.display="none";
			document.getElementById('detailsF').style.display="none";
			document.getElementById('otptable').style.display="none";
			
	}
	function change()
	{

		if(document.getElementById("location").checked){
			document.getElementById('detailsT').style.display="none";
	        document.getElementById('detailsF').style.display="block";
			document.getElementById("location").value="location1"
			document.getElementById("location").checked=true;
			document.getElementById('detailsT').style.display="none";
		}else{
		
			document.getElementById("locationN").value="location2"
			document.getElementById("locationN").checked=true;
			document.getElementById('detailsT').style.display="block";
			document.getElementById('detailsF').style.display="none";
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
	//	alert("hiii");
		
	  
	 var Tname;
		   var Taccno;
		  var Faccno;
		  if(document.getElementById("location").checked==true){
						 Faccno=document.getElementById("accList").value;
						 Taccno=document.getElementById("bank_to_a/cno").value;
	//					alert(Faccno);
	   }
	    if(document.getElementById("locationN").checked==true){
		//				alert("Withdrawal");
						Faccno=document.getElementById("bank_from_a/cno").value;
						Taccno=document.getElementById("accList").value;
	   }
	var remarks = document.getElementById("remark").value;
	var OTP=document.getElementById("otp").value
    var amount=document.getElementById("amount").value;
     if(amount=="")
	{
	  	alert("please enter the Amount");
		return false;
	}
	var userId = document.getElementById("userid").value;
	var ran=parseInt(Math.random()*9999);
	var url="/TransactionAction.do?action=fundTransferwithinBank&OTP="+OTP+"&userID="+userId+"&beneficiaryAccNo="+Taccno+"&accNo="+Faccno+"&transferAmt="+amount+"&sessionID=<%=session.getId()%>&Remark="+remarks;
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
					     alert("Transaction failed :"+ jsonData.Error);
					   }else { 
					   		alert("Transaction Reference Number:" + jsonData.transactionID);
					  	}
					window.location.href = "/mobile/cashDeposit.jsp";
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
     if(amount=="")
	{
	  	alert("please enter the Amount");
		return false;
	}
		
		  if(document.getElementById("location").checked==true){
						 Faccno=document.getElementById("accList").value;
						 Taccno=document.getElementById("bank_to_a/cno").value;
		//				alert(Faccno);
	   }
	    if(document.getElementById("locationN").checked==true){
		//				alert("Withdrawal");
						Faccno=document.getElementById("bank_from_a/cno").value;
						Taccno=document.getElementById("accList").value;
						Tname=document.getElementById("accList").value;
						var availamount=document.getElementById("bank_from_bal").value;
		  if ( parseFloat(amount) > parseFloat(availamount) )
		  {
			  alert("Transaction Amount Should be less than Available Balance");
			  return false;
		  }
	   }
		 
		
		
	 if(Taccno=="")
{
	alert("please enter reciever account number");
	return false;
}
   				document.getElementById('otptable').style.display="block";
				    var purpose='Fund Transfer';
					var ran=parseInt(Math.random()*9999);
					var url="/TransactionAction.do?action=sendOTP&userID="+userId +"&DebitAccount="+Faccno+"&beneficiaryAccNo="+Taccno+"&mobile=<%=mob%>&sessionID=<%=session.getId()%>&purpose="+purpose+"&ran="+ran;
//					alert(url);
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
							alert("Dear Customer your OTP has been sent on Mobile: "+jsonData.mobileNo);
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
		window.location.href = "/mobile/Agent_fund_transfer.html"
	}

	</script>
	
	<body style="margin:0 0 0 0;" onload="fillData()"><br>

	<table align="center" class="wrapperDataTable" cellpadding="0" cellspacing="0"  >
		<tr>
			<td  class="wrapperDataTableTR" align="center" width=1000px > Agent Fund Transfer </td>
		</tr>
		<tr>
		<td>
		<table border="" align="center">
		
		<tr>
		<td align="center">
		 Acc No. From

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
		<td align="center">
		  <p> Option <input type="radio" name="group1" id="location" value="C" onclick="change()" >Deposit &nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="radio"  name="group1" id="locationN" value="B" onclick="change()">Withdrawal</p>
		</td>
		</tr>
		<tr>
		<td align="left">
		<br/>
		   <table id="detailsT" align="center" >
		   <tr>
		   <td>
		   <table>
		   <tr><td>
			A/c number
					<input type=text  id="bank_from_a/cno" style="margin-left:90px;" onblur="getName(this.id)" />
		   </td></tr>
		   <tr><td>
			Name
					<input type=text  id="bank_from_name" style="margin-left:120px;" readonly/>
		   
		   </td></tr>
		   <tr><td>
		   Mobile Number
					<input type=text  id="bank_from_mobno" style="margin-left:72px;" readonly/>
		   
		   </td></tr>
		    <tr><td>
		   Available balance
					<input type=text  id="bank_from_bal" style="margin-left:65px;" readonly/>
		   
		   </td></tr>
		  
		   </table>
					</td>
				 </tr>

		<table id="detailsF" align="left" >
		 <tr>
		 <td>
		 <table>
		   <tr><td>
			A/c number
					<input type=text  id="bank_to_a/cno" style="margin-left:90px;" onblur="getName(this.id)" />
		   </td></tr>
		   <tr><td>
			Name
					<input type=text  id="bank_to_name" style="margin-left:120px;"/>
		   
		   </td></tr>
		   <tr><td>
		   Mobile Number
					<input type=text  id="bank_to_mobno" style="margin-left:72px;" maxlength=10/>
		   
		   </td></tr>
		   <tr>
		<td>
		<label><bean:message bundle="hindi" key= "45054"/></label>
	<input type="text" name="rifsc" style="margin-left:124px;"  maxlength=11  value=""  id="bank_to_ifsc" >
		</td>
		   </table>
		 </td>
		</tr>
		</table>	
		 </td>
		 
		</tr>
		<tr>
		 <td align="left">
		Amount
				<input type="text" style="margin-left:115px;"  Id="amount"  size="20"  maxlength="15" onblur="chargesData()" />
				 
		</td>
		</tr>
		<tr>
		 <td align="left">
		Charges
				<input type="text" style="margin-left:112px;"  Id="commission"  size="20"  maxlength="15"  readonly/>
				 
		</td>
		</tr>
		<tr>
		 <td align="left">
		Remarks
				<input type="text" style="margin-left:112px;"  Id="remark"  size="20"  maxlength="15"  />
				 
		</td>
		</tr>

		
		  <tr>
		  </br>
		<td align="center">
			<input type="button" name="ok" tabindex="22" value="Send OTP" onclick="otp_number()" class="Button" id="ok">
			<input type="button" name="cancel" tabindex="23" value="Cancel" onclick="bacck()" class="Button" id="cancel"></td>
			<input type="hidden" name="mob" id="mob" value="<%=mob%>" />

		</td>
		 </tr>

		<tr>
		<td>
		<table id="otptable">
		<tr>
		<td>
		 Enter OTP: &nbsp;&nbsp;&nbsp;<input type="text" name="otp" id="otp"> <input type="button" onClick="saveData()" style="width:100px" value="confirm"/>
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
    <input type="hidden" name="webData" id="webData"/>
	<input type="hidden" name="kid" id="kid"/>
	</form>
			
	</body>
	
		 
