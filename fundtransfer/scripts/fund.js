function Back() {    
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performTransAction&&button=back";
	document.forms[0].submit();
}

function cancl(){    
	window.location.href="/fundtransfer/transfer.jsp";
}


function setUserId(e) { 
	//sMode = "CIBAuth";
	var data = e.parentNode.parentNode;
	var totaltdr=new Array();
	var tab=document.getElementById("table");
	var rowCount=tab.rows.length;
	for(var i=0;i<rowCount-1;i++){
		if(document.getElementById("checkbox"+i)!=null && document.getElementById("checkbox"+i).checked==true){
			var data = document.getElementById("checkbox"+i).parentNode.parentNode;
			tdr=new Array();
			tdr.push(data.children[1].innerHTML);  
			tdr.push(data.children[2].innerHTML);
			tdr.push(data.children[3].innerHTML);
			tdr.push(data.children[4].innerHTML);
			tdr.push(data.children[5].innerHTML);   
			tdr.push(data.children[6].innerHTML);
			tdr.push(data.children[7].innerHTML);
			tdr.push(data.children[8].innerHTML);
			tdr.push(data.children[9].innerHTML);
			tdr.push(data.children[10].innerHTML);
			var myJsonString = JSON.stringify(tdr);
			totaltdr.push(myJsonString);
			mytotalJsonString = JSON.stringify(totaltdr);
			//	alert(mytotalJsonString); 
			//	sMode = "CIBAuth";
			console.log(mytotalJsonString); 
		} 
	}
}

function editform(e,purpose){
	var data = e.parentNode.parentNode;

	document.getElementById("edtaccno").value  = data.children[4].innerHTML;
	document.getElementById("edtname").value  = data.children[2].innerHTML;
	document.getElementById("edtifcs").value  = data.children[5].innerHTML;
	document.getElementById("edtamnt").value  = data.children[6].innerHTML;
	document.getElementById("edtremark").value  = data.children[7].innerHTML;
	document.getElementById("edtblktrd").value  = data.children[9].innerHTML;

	document.getElementById("edittable").style.display = "block";
	document.getElementById("table").style.display = "none";
	document.getElementById("reject").style.display = "none";
	document.getElementById("back").style.display = "none";
	//	alert("edit"+jspOpenFor);
	if(jspOpenFor === 'A')  {
		document.getElementById("acctbl").style.display = "none"; //accDiv
		document.getElementById("send").style.display = "none";
	}
} 

function editInfo(purpose){
	if(document.getElementById("txnpass").value === '') {
		alert("Enter Transaction Password");
		return; 
	}
	else {
		var sPwd ;
		sPwd = calcMD5(document.getElementById("txnpass").value);
		// var sSessionId='<%=session.getId()%>';
		document.getElementById("txnpass").value=sPwd ;
		//	  alert(sPwd); 
		var obj={"edtaccno":document.getElementById("edtaccno").value,
				"edtname":document.getElementById("edtname").value,
				"edtifcs":document.getElementById("edtifcs").value,
				"edtamnt":document.getElementById("edtamnt").value,
				"edtremark":document.getElementById("edtremark").value, 
				"edtblktrd":document.getElementById("edtblktrd").value,
				"edtremiAccount":document.getElementById("accList").value 
				};
		var jsonStr = JSON.stringify(obj);
		var url = "/TransactionAction.do?action=editCorporateBankingFundTransferVoucher&purpose="+purpose+"&data="+jsonStr+"&txnpass="+sPwd;      
		http.open("POST",url,false);
		http.onreadystatechange= function (){processeditInfoRes(purpose)};
		http.send(null); 
	}
}

function processeditInfoRes(purpose) {
	if((http.readyState == 4) && (http.status == 200)){
		var res=http.responseText;
		if (res === '1') { 
			alert("Dear Customer,Your Voucher updated Successfully.");
			editinfoback(purpose) ;
		} else {
			//  alert("Dear Customer,Your Voucher updatation  failed due to error.");
			alert(res);
		}
	}
}

function editinfoback(purpose){  
	//alert("Purpose:::"+purpose);
	if(jspOpenFor === 'E') {
	//alert("MODE::"+jspOpenFor);
		if (purpose === 'SameBank'){
			window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&jspopenFor=E&purpose=SameBank&sMode=CIBEdit";
		} else if (purpose === 'OtherBank'){
			window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&jspopenFor=E&purpose=OtherBank&sMode=CIBEdit";
		}
	} else if(jspOpenFor === 'A') {
		if (purpose === 'SameBank'){
			window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&jspopenFor=A&purpose=SameBank&sMode=CIBAuth";
		} else if (purpose === 'OtherBank'){
			window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&jspopenFor=A&purpose=OtherBank&sMode=CIBAuth";
		} else if (purpose === 'P2A') {
			window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&mode=P2P&sMode=CIBEdit&purpose=P2A" ;  
		}
		else if (purpose === 'P2P'){
			window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&mode=P2P&sMode=CIBEdit&purpose=P2P";    
		} 
	} 
}

function bacck(){
	if(jspOpenFor==='A') {
		window.location.href = "/usrlimit/addnewUser.jsp" 
	} else { 
		window.location.href = "/fundtransfer/fund.jsp"
	}
}

function otp_number(date){
	var userid=document.getElementById("userid").value ;
	var sessionId= document.getElementById("sessID").value;
	var id=document.getElementById("fundkid").value;
	var trType="";
	var periodicity="";
	var mobile=document.getElementById("UserMobile").value;
	var scDate="";
	var scTime_hr="";
	var scTime_min="";
	var mode=document.getElementById("mode").value;

//	var scTime_sec=parseInt(document.getElementById("schTime_sec").value);//alert(mobile);
	var time=date.split(" ")[1].split(":");
	var amount=document.getElementById("amount").value;
	var purpose="Fund Transfer";
	var isSch="";
	if(id=="")
	{
	 alert("Please choose a Payee");
	 document.getElementById("sNickName").focus();
	 return false;
	}
	if(mode=='null' || mode=='OtherBank'  || mode=='SameBank'){
		trType=document.getElementById("paymentType").value;
		periodicity=document.getElementById("periodicity").value;
		scDate=document.getElementById("schDate").value;
		scTime_hr=parseInt(document.getElementById("schTime_hr").value);
		isSch=document.getElementById("isSchedule").value;
		scTime_min=parseInt(document.getElementById("schTime_min").value);	
		if(trType=="R" && periodicity=="-1"){
			alert("Select periodicity");
			document.getElementById("periodicity").focus();
			return false;
		}
		if(isSch=="Y"){
			if(isValidDateFormat("schDate")==false)
			{
				alert("Enter valid Schedule date");
				document.getElementById("schDate").value="";
				document.getElementById("schDate").focus();
				return false;
			}
			else if((!dateComparision("schDate","tDate") && (document.getElementById("tDate").value==scDate)))
				 {
				  alert("Schedule date must be greater than today's date");
				  document.getElementById("schDate").value="";
				  document.getElementById("schDate").focus();
				  return false;
			}else if(!dateComparision("schDate","tDate") && scTime_hr<parseInt(time[0])){
				  alert("Schedule time must be greater than current time");
				  return false;
			}
		}
	}
	var acc=document.getElementById("accList").value;
	getAccBal(acc);	
	if(parseFloat(amount)>parseFloat(available_balance))			//18-10-2019
	{
		alert("OTP not Processed. Your Transaction Amount is Greater than available balance. Your Available balance is = "+available_balance);
		return false;
	}
	var beneficiaryAccNo=document.getElementById("sPayeeAcc").value;
	var ran=parseInt(Math.random()*9999);
	url="/TransactionAction.do?action=sendOTP&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&mobile="+mobile+"&sessionID="+sessionId+"&purpose="+purpose+"&amount="+amount+"&ran="+ran;
	http.open("POST",url,false);
	http.onreadystatechange= function (){processResOTP()};
	http.send(null);	
	//alert(url);
}

function otp_confirm() {
	// alert("mode::"+mode); 
	var userid=document.getElementById("userid").value ;
	var acc=document.getElementById("accList").value;
	var sessionID=document.getElementById("sessID").value;
	// alert("userid::"+userid+"accNO::"+acc);   
	if(!(jspOpenFor === 'A'))  {  // check payee is selected or not  in retail fund transfer case
		var id=document.getElementById("fundkid").value;
		var id1=document.getElementById("fundkid").value;
		if(id1=="")
		{
			alert("Please choose a Payee");
			return false;
		} 
	}
	if((custrole === 'C') && !(jspOpenFor === 'A')) {  //  take otp value only for retail customer.
		var otp=document.getElementById("otp").value;
	} 

	if(!(jspOpenFor === 'A')) // Retail/Normal Fund Transfer 
	{
		var mode=document.getElementById("mode").value;
		var acc=document.getElementById("accList").value;
		var amount=document.getElementById("amount").value;
		var mobile=document.getElementById("UserMobile").value;
		var Benemobile=document.getElementById("payeeMob").value;
		var ifscCode=document.getElementById("IFSCcode").value;
		var beneficiaryAccNo=document.getElementById("sPayeeAcc").value;
		if(otp=="")
		{
			alert("Please enter OTP");
			return false;
		}
		else if(amount==".00")
		{ 
			alert("Amount cannot be zero");
			return false;
		}
	}

	var sPwd; 
	if(custrole === 'S' || (jspOpenFor === 'A')) { // entry user or authorization case ask for trn pass
		var pass =  document.getElementById("txnpass").value;
		if(pass === '') { // chk blank password and retuen
			alert("Please enter password");
			return false; 
		} else {
			sPwd = calcMD5(document.getElementById("txnpass").value);
			document.getElementById("txnpass").value=sPwd ;
		} 
	}
	if((custrole === 'S' || custrole === 'E') && !(jspOpenFor === 'A')) // CIB ENTRY USER Store in bulk_trn table
	{
		var bulktrd_kid = ''; 
		var nikname=document.getElementById("sNickName").value;
		var ifcs=document.getElementById("IFSCcode").value;
		var remark=document.getElementById("remark").value;
		var sPwd = calcMD5(document.getElementById("txnpass").value);
		document.getElementById("txnpass").value=sPwd ;

		var	url="/TransactionAction.do?action=fundTransferwithinBank&OTP="+otp+"&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&transferAmt="+amount+"&sessionID="+sessionID+"&nikname="+nikname+"&ifcs="+ifcs+"&Remark="+remark+"&bulktrd_kid="+bulktrd_kid+"&sMode="+sMode+"&purpose="+sTranMode+"&txnpass="+sPwd;   // sMode tells what mode we are using auth or operation
	}

	if((custrole === 'C' || custrole === 'S') && jspOpenFor === 'A') // authorizer check if row selected or not
	{
		if(mytotalJsonString === '')
		{
			alert("Select Row for Transaction!");
			return;
		}
		alert("sMode"+sMode);
		var  
		url="/TransactionAction.do?action=fundTransferwithinBank&OTP="+otp+"&userID="+userid+"&accNo="+acc+"&txnpass="+sPwd+"&sessionID="+sessionID+"&bulktrd_kid="+mytotalJsonString+"&sMode="+sMode+"&purpose="+sTranMode;  
	} else {
		//// Normal FT/Retail 
		var nikname=document.getElementById("sNickName").value;
		var ifcs=document.getElementById("IFSCcode").value;
		var remark=document.getElementById("remark").value;
		var  url="/TransactionAction.do?action=fundTransferwithinBank&OTP="+otp+"&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&transferAmt="+amount+"&sessionID="+sessionID+"&nikname="+nikname+"&ifcs="+ifcs+"&Remark="+remark+"&bulktrd_kid="+bulktrd_kid+"&sMode="+sMode+"&purpose="+sTranMode+"&txnpass="+sPwd;   // sMode tells what mode we are using auth or operation
	}


	if ((impsMode === 'P2A') || impsMode ==='P2P'){  
		// IMPS Case
		mode = impsMode;
		if((custrole === 'S' || custrole === 'E') && !(jspOpenFor === 'A')) // CIB ENTRY USER Store in bulk_trn table for IMPS Case
		{ 
			//alert("URL FOR custrole" +custrole);
			var bulktrd_kid = ''; 
			var nikname=document.getElementById("sNickName").value; 
			var ifcs=document.getElementById("IFSCcode").value; 
			var remark=document.getElementById("remark").value;

			var url="/TransactionAction.do?action=fundTransferOtherBank&OTP="+otp+"&userID="+userid+"&beneMobile="+Benemobile+"&remiMobile="+mobile+"&IFSCcode="+ifscCode+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&nikname="+nikname+"&ifcs="+ifcs+"&Remark="+remark+"&bulktrd_kid="+bulktrd_kid+"&mode="+mode+"&transferAmt="+amount+"&sessionID="+sessionID+"&sMode="+sMode+"&purpose="+impsMode+"&txnpass="+sPwd;   

		} else if((custrole === 'C' || custrole === 'S') && (jspOpenFor === 'A')) { 
			// For Auth of IMPS Fund Transfer
			var url="/TransactionAction.do?action=fundTransferOtherBank&OTP="+otp+"&userID="+userid+"&bulktrd_kid="+mytotalJsonString+"&mode="+mode+"&transferAmt="+amount+"&sessionID="+sessionID+"&sMode="+sMode+"&purpose="+impsMode+"&accNo="+acc+"&remiMobile="+mobile+"&txnpass="+sPwd; 

		} else  if((custrole === 'C') && (! jspOpenFor === 'A')) { 
			// For Retail IMPS Fund Transfer
			var  url="/TransactionAction.do?action=fundTransferOtherBank&OTP="+otp+"&userID="+userid+"&beneMobile="+Benemobile+"&remiMobile="+mobile+"&IFSCcode="+ifscCode+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&nikname="+nikname+"&ifcs="+ifcs+"&Remark="+remark+"&bulktrd_kid="+bulktrd_kid+"&mode="+mode+"&transferAmt="+amount+"&sessionID="+sessionID+"&sMode="+sMode+"&purpose="+impsMode;

		}
	}

	// Fund Trans Same/other
	// sMode in URL  tells what mode we are using auth or operation
	if((custrole === 'C') && (! jspOpenFor === 'A')) {  // REtail Fund Transfer
		if((mode=='null') || (mode === 'SameBank') || (mode ==='OtherBank') )
		{ 
			var 
		url="/TransactionAction.do?action=fundTransferwithinBank&OTP="+otp+"&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&transferAmt="+amount+"&sessionID="+sessionID+"&nikname="+nikname+"&ifcs="+ifcs+"&Remark="+remark+"&bulktrd_kid="+bulktrd_kid+"&sMode="+sMode+"&purpose="+sTranMode; 
		} 
	}

	http.open("POST",url,false);
	http.onreadystatechange= function (){processResponse()};
	http.send(null);
}

function processResponse(){  
	if (http.readyState == 4)  // 4
	{
		// Check that a successful server response was received
		if (http.status == 200) // 200
		{
			//	if(http.responseText!='') {}
			if(jspOpenFor==='A') {  //CB Fund TransAuthorization
				var resArray=http.responseText; 
				if(resArray ==='-E'){
					alert("Entry Not created !");
					return;
				} else if (resArray ==="-11"){
					alert("Request Cancled due to PassWord mismatch!");
				} else if (resArray ==="P"){ 
					alert("Request pending for authorization");
				} else if (JSON.parse(resArray).result=="failure"){ 
					alert("Dear Customer your Transaction has been "+JSON.parse(resArray).result + " due to " + JSON.parse(resArray).Error);
				}
				else {
					//var resArray = '[{"fail":[{\"amount\":\"10.00 \",\"remark\":\"Account No not valid\",\"BeniaccNo\":\"00501000488 \",\"RemiaccNo\":\" 000022000001 \"}],"success":[{\"amount\":\"50.00 \",\"remark\":\"702425\",\"BeniaccNo\":\"006010006667 \",\"RemiaccNo\":\" 000022000001 \"}]}]'; 
					var jsonData = JSON.parse(resArray); 
					var arrjsonData =jsonData[0];  
					//	var arrjsonData1 = JSON.parse(arrjsonData); 
					var fail = arrjsonData.fail;
					var success = arrjsonData.success;  
					var retStr = '<table  border="1" bordercolor="#ffffff" align="center" id ="cbfundresponce" style="table-layout: fixed;" cellpadding="0" cellspacing="0"><tr><B>Corporate Banking Fund Transfer Status</B></tr>';
					retStr +='<tr class="dataTableTH"><td><B>Beneficiary Acc. No</B></td><td><B>Remitance Acc. No</B></td><td><B>Amount</B></td><td><B>Remark</B></td></tr>';

					for (var i=0;i<fail.length;i++){
						retStr +='<tr class="dataTableTR"><td>'+fail[i].BeniaccNo+'</td><td>'+fail[i].RemiaccNo+'</td><td>'+fail[i].amount+'</td><td>'+fail[i].remark+'</td></tr>';
					}
					for (var j=0;j<success.length;j++){
						retStr +='<tr class="dataTableTR"><td>'+success[j].BeniaccNo+'</td><td>'+success[j].RemiaccNo+'</td><td>'+success[j].amount+'</td><td>'+success[j].remark+'</td></tr>'
					}
					retStr +='</table>';
					//window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&openFor=A&purpose=SameBank&sMode=CIBAuth";
					document.getElementById("cbrespdiv").innerHTML= retStr;
					document.getElementById("txnpass").value=''; 
				}
			} else { // normal fund transfer
				var resArray=http.responseText;
				var jsonData = JSON.parse(resArray);
				if (jsonData.result=="failure"){
					alert("Dear Customer your Transaction has been "+jsonData.result + " due to " + jsonData.Error);
				} else { 
					alert("Dear Customer your Transaction has been "+jsonData.result +" and Transaction Id: "+jsonData.transactionID);
				}
				window.location.href = "/fundtransfer/fund.jsp";
			}
		}  else   // http error 
		{
			alert("HTTP error: " + http.status);
		}
	}
} 

function processResOTP(){
	if (http.readyState == 4){
		// Check that a successful server response was received
		if (http.status == 200){
			var resArray=http.responseText;
			var jsonData = JSON.parse(resArray);
			alert("Dear Customer your OTP has been sent on Mobile: "+jsonData.mobileNo);
		}
	} 
}
function rejectEntry(){
	var  bulk_kid =  mytotalJsonString; 
	var sPwd = calcMD5(document.getElementById("txnpass").value);
	document.getElementById("txnpass").value=sPwd ;
	var url="/TransactionAction.do?action=regectEntry&bulktrn_kid="+bulk_kid+"&txnpass="+sPwd+"&purpose=IFT";     
	http.open("POST",url,false);
	http.onreadystatechange= function (){processRegectRes()};
	http.send(null);
}

function processRegectRes(){   
	if (http.readyState == 4){
		// Check that a successful server response was received
		if (http.status == 200){
			var resArray=http.responseText;
			//var resArray = '[{"fail":[{\"amount\":\"10.00 \",\"remark\":\"Account No not valid\",\"BeniaccNo\":\"00501000488 \",\"RemiaccNo\":\" 000022000001 \"}],"success":[{\"amount\":\"50.00 \",\"remark\":\"702425\",\"BeniaccNo\":\"006010006667 \",\"RemiaccNo\":\" 000022000001 \"}]}]'; 
			var jsonData = JSON.parse(resArray); 
			var arrjsonData =jsonData[0];  
			var fail = arrjsonData.fail;
			var success = arrjsonData.success;
			var retStr = '<table  border="1" bordercolor="#ffffff" align="center" id ="cbfundresponce" style="table-layout: fixed;" cellpadding="0" cellspacing="0"><tr><B>Corporate Banking Fund Transfer Status</B></tr>';
			retStr +='<tr class="dataTableTH"><td><B>Beneficiary Acc. No</B></td><td><B>Remitance Acc. No</B></td><td><B>Amount</B></td><td><B>Remark</B></td></tr>';

			for (var i=0;i<fail.length;i++){
				retStr +='<tr class="dataTableTR"><td>'+fail[i].BeniaccNo+'</td><td>'+fail[i].RemiaccNo+'</td><td>'+fail[i].amount+'</td><td>'+fail[i].remark+'</td></tr>';
			}
			for (var j=0;j<success.length;j++){
				retStr +='<tr class="dataTableTR"><td>'+success[j].BeniaccNo+'</td><td>'+success[j].RemiaccNo+'</td><td>'+success[j].amount+'</td><td>'+success[j].remark+'</td></tr>'
			}
			retStr +='</table>';
			//window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&openFor=A&purpose=SameBank&sMode=CIBAuth";
			document.getElementById("cbrespdiv").innerHTML= retStr;

			if(jspOpenFor==='A') {
				window.location.href = "/usrlimit/addnewUser.jsp" 
			} else { 
				window.location.href = "/fundtransfer/fund.jsp"
			} 
		} 
		else    
		{
			alert("HTTP error: " + http.status); 
		}
	}
}

function showPeriodicityDiv(){
	var a=document.getElementById("paymentType").value;
	if(a=="O"){
		document.getElementById("periodicityDiv").style.display="none";
		document.getElementById("periodicity").value="-1";
	}
	else{
		document.getElementById("periodicityDiv").style.display="table-row";
		//document.getElementById("periodicity").value="-1";
	}
}
function showScheduleDiv(){
	if(document.getElementById("isSchedule").value=="N"){
		document.getElementById("schTable").style.display="none";
	}
	else{
		document.getElementById("schTable").style.display="inline";
	}
}
function getAccNo(){
	var name=document.getElementById("sNickName").value;
	if(name=="-1")
		document.getElementById("sPayeeAcc").value="";
	else{
		var acc=name.split("~");
		document.getElementById("sPayeeAcc").value=acc[0];
		document.getElementById("fundkid").value=acc[1];
		document.getElementById("payeeMob").value=acc[2];
		document.getElementById("IFSCcode").value=acc[3];
		if(document.getElementById("benMob")!=null){
  			document.getElementById("benMob").value=acc[2];
		}  
		if(document.getElementById("mmid")!=null){
		  document.getElementById("mmid").value=acc[4];
		}
	}
}
function fundTrRetail(date){
	var userid=document.getElementById("userid").value ;
	var id=document.getElementById("fundkid").value;
	var otp=document.getElementById("otp").value;
	var id1=document.getElementById("fundkid").value;
	var trType="";
	var periodicity="";
	var mobile=document.getElementById("UserMobile").value;
	var scDate="";
	var scTime_hr="";
	var scTime_min="";
	var isSch="";
	var mode=document.getElementById("mode").value;
	//var scTime_sec=parseInt(document.getElementById("schTime_sec").value);//alert(mobile);
	var time=date.split(" ")[1].split(":");
	var purpose="Fund Transfer";
	if(id1=="")	{
		alert("Please choose a Payee");
		return false;
	}
	if(mode=='null' || mode=='OtherBank'  || mode=='SameBank'){
		trType=document.getElementById("paymentType").value;
		periodicity=document.getElementById("periodicity").value;
		scDate=document.getElementById("schDate").value;
		scTime_hr=parseInt(document.getElementById("schTime_hr").value);
		isSch=document.getElementById("isSchedule").value;
		scTime_min=parseInt(document.getElementById("schTime_min").value);
		 
		if(trType=="R" && periodicity=="-1"){
			alert("Select periodicity");
			document.getElementById("periodicity").focus();
			return false;
		}
		else if(trType=="O"){
			periodicity="";
		}
	}
	var acc=document.getElementById("accList").value;
	var amount=document.getElementById("amount").value;
	
	var mobile=document.getElementById("UserMobile").value;
	var Benemobile=document.getElementById("payeeMob").value;
	var ifscCode=document.getElementById("IFSCcode").value;
	var beneficiaryAccNo=document.getElementById("sPayeeAcc").value;
	var sessionID=document.getElementById("sessID").value;
	var remark=document.getElementById("remark").value;
	if(mode=='null' || mode=='OtherBank'  || mode=='SameBank'){
		if(isSch=="Y"){
			if(isValidDateFormat("schDate")==false){
				alert("Enter valid Schedule date");
				document.getElementById("schDate").value="";
				document.getElementById("schDate").focus();
				return false;
			}
			else if(dateComparision("tDate","schDate")){
				alert("Schedule date must be greater than today's date");
				document.getElementById("schDate").value="";
				document.getElementById("schDate").focus();
				return false;
			}else if(dateComparision("tDate","schDate") || (scTime_hr<=parseInt(time[0]) )){
				alert("Schedule time must be greater than current time");
				return false;
			}
		}
	}
	if(otp==""){
		 alert("Please enter OTP");
		 return false;
	}
	else if(amount==".00"){
		alert("Amount cannot be zero");
		return false;
	}
	if(isSch=="Y"){
		scDate=scDate.substring(3,5)+"/"+scDate.substring(0,2)+"/"+scDate.substring(6,10);
		//scDate=scDate+" "+scTime_hr+":"+scTime_min+":"+scTime_sec;
		scDate=scDate+" "+scTime_hr+":"+scTime_min;
	}
	else{
		scDate=date;
		scDate=scDate.substring(5,7)+"/"+scDate.substring(8,10)+"/"+scDate.substring(0,4);
		scDate+=" "+time[0]+":"+time[1]+":"+time[2];
	}
	if(mode=='null' || mode=='OtherBank'  || mode=='SameBank'){
		var url="/TransactionAction.do?action=fundTransferwithinBank&OTP="+otp+"&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&transferAmt="+amount+"&sessionID="+sessionID+"&sMode=SingleTran&isSch="+isSch+"&schDate="+scDate+"&trnType="+trType+"&periodicity="+periodicity;
	}
	else{
		
		var url="";
		if(mode=="P2P"){
			var mmid=document.getElementById("mmid").value;
			var benMob=document.getElementById("benMob").value;
		
			if(benMob==""){
			 alert("please enter Mobile No.");
			 document.getElementById("benMob").focus();
			  return false;
			}
			
			if(mmid==""){
			 	alert("please enter MMID");
			 	document.getElementById("mmid").focus();
			  	return false;
			}
			url="/TransactionAction.do?action=fundTransferOtherBank&OTP="+otp+"&userID="+userid+"&beneMobile="+benMob+"&remiMobile="+mobile+"&IFSCcode="+ifscCode+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&mode="+mode+"&transferAmt="+amount+"&sessionID="+sessionID+"&custName="+'<%=usrName%>'+"&mmid="+mmid+"&Remark="+remark;
		}else{
			url="/TransactionAction.do?action=fundTransferOtherBank&OTP="+otp+"&userID="+userid+"&beneMobile="+Benemobile+"&remiMobile="+mobile+"&IFSCcode="+ifscCode+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&mode="+mode+"&transferAmt="+amount+"&sessionID="+sessionID+"&custName="+'<%=usrName%>';
 		}
 	}
 	
	http.open("POST",url,false);
	http.onreadystatechange= function (){showMessage(isSch)};
	http.send(null);
}

function showMessage(isSch){
	if (http.readyState == 4){
		// Check that a successful server response was received
		if (http.status == 200){
			var resArray=http.responseText;
			var data=resArray.split("~");
			var jsonData = JSON.parse(data[0]);
			if ((jsonData.result=="failure")&&(jsonData.Error=="OTP Mismatch")){
				alert("Dear Customer your Transaction has been "+jsonData.result + " due to " + jsonData.Error);
				document.getElementById("otp").value="";
				document.getElementById("otp").focus();
				return false;
			}
			else if(isSch=="Y" && jsonData.result=="success") {
				alert("Transaction scheduled successfully");
			}
			else{
				alert("Dear Customer your Transaction has been "+jsonData.result +" and Transaction Id: "+jsonData.transactionID);
			}
			window.location.href = "/fundtransfer/fund.jsp" 
		}
		else{
			alert("HTTP error: " + http.status);
		}
	}
}

function findInfo(){
	document.getElementById("hideBefTable").style.visibility = "hidden";
	var type = document.getElementById("search").value;
	var getdata = document.getElementById("searchVal").value;
	if(getdata==""){
		return false;
	}
	var ran=parseInt(Math.random()*9999);
	var URL ="/TransactionAction.do?action=fetchDataForFtr&data="+getdata+"&type="+type+"&ran="+ran;;
	http.open("POST",URL,false);
	http.onreadystatechange= function (){processAccount()};
	http.send(null);
}
function processAccount() {
	if (http.readyState == 4) {
		if (http.status == 200) {
			var resArray=http.responseText;
			var jsonData = JSON.parse(resArray);
			document.getElementById("mkFav").checked= false;
			if(jsonData != null){
				if(document.getElementById("search").value=="AccountNumber") {
					if(jsonData.accountNo==""){
						alert("Record not found on the base of "+searchval);
						document.getElementById("searchVal").focus();
						return false;
					}
					document.getElementById("hideBefTable").style.visibility = "visible";
					document.getElementById("accnoTd").innerHTML= jsonData.accountNo;
					document.getElementById("nameTd").innerHTML=jsonData.customerName;
					document.getElementById("mobileTd").innerHTML=jsonData.mobileNo;
					document.getElementById("custId").value=jsonData.customerId;
				}
				else{
					document.getElementById("hideBefTable").style.visibility = "visible";
					document.getElementById("accnoTd").innerHTML= jsonData[0][0];
					document.getElementById("nameTd").innerHTML=jsonData[0][1];
					document.getElementById("mobileTd").innerHTML=jsonData[0][2];
					document.getElementById("custId").value=jsonData[0][3];
				}
			}
			else{
				alert("Record not found on the base of "+searchval);
				document.getElementById("searchVal").focus();
				return false;
			}
		}
	}
}

// trans

function fundTrRetailWithInBank(date){
	var  search = document.getElementById("search").value;
	if(search=='0'){
		alert("Select From search");
		document.getElementById("search").focus;
		return false;
	}
	var  searchVal = document.getElementById("searchVal").value;
	if(searchVal==""){
		alert("Plaese enter value of  "+search);
		document.getElementById("searchVal").focus();
		return false;
	}
	var remark =document.getElementById("remark").value;
	var  benName = document.getElementById("nameTd").innerHTML;
	var payeemob = document.getElementById("mobileTd").innerHTML;
	var chkFav = document.getElementById("mkFav").checked;
	var  custId = document.getElementById("custId").value;
	var beneficiaryAccNo= document.getElementById("accnoTd").innerHTML;
	//old
	var userid=document.getElementById("userid").value ;  
	var otp=document.getElementById("otp").value;

	//geetika
	var trType=document.getElementById("paymentType").value;
	var periodicity=document.getElementById("periodicity").value;
	var scDate=document.getElementById("schDate").value;
	var scTime_hr=parseInt(document.getElementById("schTime_hr").value);
	var scTime_min=parseInt(document.getElementById("schTime_min").value);
	var time=date.split(" ")[1].split(":");
	var purpose="Fund Transfer";
	var isSch=document.getElementById("isSchedule").value;

	var acc=document.getElementById("accList").value;
	var amount=document.getElementById("amount").value;
	var mode=document.getElementById("mode").value;


	if(beneficiaryAccNo==""){
		alert("enter any Account Number");
		document.getElementById("accnoTd").focus();
		return false;
	}
	if(trType=="R" && periodicity=="-1"){
		alert("Select periodicity");
		document.getElementById("periodicity").focus();
		return false;
	}
	else if(trType=="O"){
		periodicity="";
	}
	var ifscCode="";
	if(document.getElementById("IFSCcode")!=null){
		ifscCode= document.getElementById("IFSCcode").value;
	}

	var sessionID=document.getElementById("sessID").value;
	if(isSch=="Y"){
		if(isValidDateFormat("schDate")==false) {
			alert("Enter valid Schedule date");
			document.getElementById("schDate").value="";
			document.getElementById("schDate").focus();
			return false;
		}
		else if(dateComparision("tDate","schDate")) {
			alert("Schedule date must be greater than today's date");
			document.getElementById("schDate").value="";
			document.getElementById("schDate").focus();
			return false;
		}else if(dateComparision("tDate","schDate") || (scTime_hr<=parseInt(time[0]) )){
			alert("Schedule time must be greater than current time");
			return false;
		}
	}
	if(otp=="") {
		alert("Please enter OTP");
		document.getElementById("otp").focus;
		return false;
	}
	else if(amount==".00") {
		alert("Amount cannot be zero");
		document.getElementById("amount").focus;
		return false;
	}
	if(isSch=="Y") {
		scDate=scDate.substring(3,5)+"/"+scDate.substring(0,2)+"/"+scDate.substring(6,10);
		scDate=scDate+" "+scTime_hr+":"+scTime_min;
	}
	else {
		scDate=date;
		scDate=scDate.substring(5,7)+"/"+scDate.substring(8,10)+"/"+scDate.substring(0,4);
		scDate+=" "+time[0]+":"+time[1]+":"+time[2];
	}

	var url="/TransactionAction.do?action=fundTransferwithinBank&OTP="+otp+"&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&transferAmt="+amount+"&sessionID="+sessionID+"&sMode=SingleTran&isSch="+isSch+"&schDate="+scDate+"&trnType="+trType+"&periodicity="+periodicity+"&Remark="+remark+"&benName="+benName+"&custID="+custId+"&payeemob="+payeemob+"&chkFav="+chkFav+"&ftrnwith="+'makeben' ;
	http.open("POST",url,false);
	http.onreadystatechange= function (){showMessage(isSch)};
	http.send(null);  
}


function otp_numberWithInBank(date){
	var userid=document.getElementById("userid").value ;
	var sessionId= document.getElementById("sessID").value;
	var accno= document.getElementById("accnoTd").innerHTML;
	var  search = document.getElementById("search").value;
	if(search=='0'){
		alert("Select From search");
		document.getElementById("search").focus;
		return false; 
	}
	var  searchVal = document.getElementById("searchVal").value;
	if(searchVal==""){
		alert("Plaese enter value of  "+search);
		document.getElementById("searchVal").focus();
		return false;
	}
	var mobile=document.getElementById("UserMobile").value;
	var trType=document.getElementById("paymentType").value;
	var periodicity=document.getElementById("periodicity").value;
	var scDate=document.getElementById("schDate").value;
	var scTime_hr=parseInt(document.getElementById("schTime_hr").value);
	var scTime_min=parseInt(document.getElementById("schTime_min").value);
	var time=date.split(" ")[1].split(":");
	var amount=document.getElementById("amount").value;
	var purpose="Fund Transfer";
	var isSch=document.getElementById("isSchedule").value;
	if(trType=="R" && periodicity=="-1"){
		alert("Select periodicity");
		document.getElementById("periodicity").focus();
		return false;
	}
	if(isSch=="Y"){
		if(isValidDateFormat("schDate")==false){
			alert("Enter valid Schedule date");
			document.getElementById("schDate").value="";
			document.getElementById("schDate").focus();
			return false;
		}
		else if((!dateComparision("schDate","tDate") && (document.getElementById("tDate").value==scDate))){
			alert("Schedule date must be greater than today's date");
			document.getElementById("schDate").value="";
			document.getElementById("schDate").focus();
			return false;
		}else if(!dateComparision("schDate","tDate") && scTime_hr<parseInt(time[0])){
			alert("Schedule time must be greater than current time");
			return false;
		}
	}
	var ran=parseInt(Math.random()*9999);
	url="/TransactionAction.do?action=sendOTP&userID="+userid+"&beneficiaryAccNo="+accno+"&mobile="+mobile+"&sessionID="+sessionId+"&purpose="+purpose+"&amount="+amount+"&ran="+ran;
	http.open("POST",url,false);
	http.onreadystatechange= function (){processResOTP()};
	http.send(null); 
}

function rmfrmList(list){
	var pttable=document.getElementById("favTab");
	var s=list.parentNode.parentNode;
	var t=s.rowIndex;
	var userid=document.getElementById("userid").value ;
	var accNo = pttable.rows[t].children[1].innerHTML;
	var mobile = pttable.rows[t].children[2].innerHTML;
	var accType = pttable.rows[t].children[3].innerHTML;
	var mode="rmfrmList";
	var ran=parseInt(Math.random()*9999);
	var URL ="/TransactionAction.do?action=forBenFtrn&userid="+userid+"&accNo="+accNo+"&mode="+mode+"&ran="+ran;;
	http.onreadystatechange= function (){
		if (http.readyState == 4 && http.status == 200) {
			var resArray=http.responseText;
			var jsonData = JSON.parse(resArray);
			if(jsonData=="Success"){
				pttable.deleteRow(t);
			}
		}
	};
	http.open("GET",URL,true);
	http.send();
}

function rmfrmFav(list){
	var pttable=document.getElementById("favTab");
	var s=list.parentNode.parentNode;
	var t=s.rowIndex;
	var accNo = pttable.rows[t].children[1].innerHTML;
	var mobile = pttable.rows[t].children[2].innerHTML;
	var accType = pttable.rows[t].children[3].innerHTML;
	var favName = pttable.rows[t].children[5].children[1].value;
	var userid=document.getElementById("userid").value ;

	var mode="rmFav";
	var ran=parseInt(Math.random()*9999);
	var URL ="/TransactionAction.do?action=forBenFtrn&userid="+userid+"&accNo="+accNo+"&mode="+mode+"&ran="+ran;;
	http.onreadystatechange= function (){
		if (http.readyState == 4 && http.status == 200) {
			var resArray=http.responseText;
			var jsonData = JSON.parse(resArray);
			if(jsonData=="Success"){
				pttable.deleteRow(t);
				var pttable1=document.getElementById("BenTable");
				var len=pttable1.rows.length;
				var ptNewRow=pttable1.insertRow(len);
				ptNewRow.innerHTML=SWTableRowBen;
				pttable1.rows[len].children[1].innerHTML=accNo;
				pttable1.rows[len].children[2].innerHTML=mobile;
				pttable1.rows[len].children[3].innerHTML=accType;
				pttable1.rows[len].children[5].children[1].value=favName;
			}
		}
	};
	http.open("GET",URL,true);
	http.send();
}

function selectFromFav(list){
	var pttable=document.getElementById("favTab");
	var pttableben=document.getElementById("BenTable");
	var s=list.parentNode.parentNode;
	var t=s.rowIndex;
	var accNo = pttable.rows[t].children[1].innerHTML;
	var mobile = pttable.rows[t].children[2].innerHTML;
	var accType = pttable.rows[t].children[3].innerHTML;
	var favName= pttable.rows[t].children[5].children[1].value;
	document.getElementById("mkFav").checked= true;
	document.getElementById('beneLabel').innerText  ="Benificiary Account Number";
	document.getElementById("searchVal").value=accNo;
	document.getElementById("search").value= "AccountNumber";
	document.getElementById("hideBefTable").style.visibility = "visible";
	document.getElementById("accnoTd").innerHTML= accNo ;
	document.getElementById("nameTd").innerHTML= favName ;
	document.getElementById("mobileTd").innerHTML= mobile;
	var len=pttable.rows.length;
	var len2=pttableben.rows.length;
	for(var i=0;i<len2;i++){
		pttableben.rows[i].children[0].children[0].checked=false;
	}
	for(var i=0;i<len;i++){
		pttable.rows[i].children[0].children[0].checked=false;
	}
	pttable.rows[t].children[0].children[0].checked=true;
}

function selectFromBen(list){
	var pttablefav=document.getElementById("favTab");
	var pttable=document.getElementById("BenTable");
	var s=list.parentNode.parentNode;
	var t=s.rowIndex;
	var accNo = pttable.rows[t].children[1].innerHTML;
	var mobile = pttable.rows[t].children[2].innerHTML;
	var accType = pttable.rows[t].children[3].innerHTML;
	var benName=pttable.rows[t].children[5].children[1].value;
	document.getElementById("mkFav").checked= false;
	document.getElementById('beneLabel').innerText  ="Benificiary Account Number";
	document.getElementById("hideBefTable").style.visibility = "visible";
	document.getElementById("accnoTd").innerHTML= accNo ;
	document.getElementById("nameTd").innerHTML= benName ; ///
	document.getElementById("mobileTd").innerHTML= mobile;
	document.getElementById("searchVal").value=accNo;
	document.getElementById("search").value= "AccountNumber";
	document.getElementById("searchVal").value=accNo;
	var len=pttablefav.rows.length;
	for(var i=0;i<len;i++){
		pttablefav.rows[i].children[0].children[0].checked=false;
	}

	var len2=pttable.rows.length;
	for(var i=0;i<len2;i++){
		pttable.rows[i].children[0].children[0].checked=false;
	}
	pttable.rows[t].children[0].children[0].checked=true;
}

function rmFromBen(list){
	var pttable=document.getElementById("BenTable");
	var s=list.parentNode.parentNode;
	var t=s.rowIndex;
	var accNo = pttable.rows[t].children[1].innerHTML;
	var mobile = pttable.rows[t].children[2].innerHTML;
	var accType = pttable.rows[t].children[3].innerHTML;
	var userid=document.getElementById("userid").value ;
	var mode="rmBean";
	var ran=parseInt(Math.random()*9999);
	var URL ="/TransactionAction.do?action=forBenFtrn&userid="+userid+"&accNo="+accNo+"&mode="+mode+"&ran="+ran;;
	http.onreadystatechange= function (){
		if (http.readyState == 4 && http.status == 200) {
			var resArray=http.responseText;
			var jsonData = JSON.parse(resArray);
			if(jsonData=="Success"){
			pttable.deleteRow(t);
		}else  
			alert("Not Remove");
			return false;
		}
	};
	http.open("GET",URL,true);
	http.send();
}

function mkFavAcc(list){
	var pttable=document.getElementById("BenTable");
	var s=list.parentNode.parentNode;
	var t=s.rowIndex;
	var userid=document.getElementById("userid").value ;
	var accNo = pttable.rows[t].children[1].innerHTML;
	var mobile = pttable.rows[t].children[2].innerHTML;
	var accType = pttable.rows[t].children[3].innerHTML;
	var benName = pttable.rows[t].children[5].children[1].value;
	var mode="mkFavAcc";

	var ran=parseInt(Math.random()*9999);
	var URL ="/TransactionAction.do?action=forBenFtrn&userid="+userid+"&accNo="+accNo+"&mode="+mode+"&ran="+ran;;

	http.onreadystatechange= function (){
		if (http.readyState == 4 && http.status == 200) {
			var resArray=http.responseText;
			var jsonData = JSON.parse(resArray);
			if(jsonData=="Success"){
				pttable.deleteRow(t);
				//for insert
				var pttableFav=document.getElementById("favTab");
				var len=pttableFav.rows.length;
				var ptNewRow=pttableFav.insertRow(len);
				ptNewRow.innerHTML=SWTableRow;
				pttableFav.rows[len].children[1].innerHTML=accNo;
				pttableFav.rows[len].children[2].innerHTML=mobile;
				pttableFav.rows[len].children[3].innerHTML=accType;
				pttableFav.rows[len].children[5].children[1].value=benName;
			}
		}
	};
	http.open("GET",URL,true);
	http.send();
}

var SWTableRow='<tr><td width="50px"><input type="checkbox" name="selectFav" id="selectFav" onchange="selectFromFav(this)"></td><td width="50px" style="font-family:Arial;"></td><td  width="95px" style="font-family: Arial;"></td><td width="50px" style="font-family: Arial;"></td><td width="50px"><input type="checkbox" name="rmList" id="rmList" onchange="rmfrmList(this)"></td><td width="50px"><input type="checkbox" name="rmFav" id="rmFav" onchange="rmfrmFav(this)"> <input type="hidden" name="favName" id="favName" ></td></tr>';

var SWTableRowBen='<tr><td  width = "50px "><input type="checkbox" name="selectBen" id="selectBen" onchange="selectFromBen(this)"></td><TD width="50px" style="font-family: Arial; "></tD><td  width = "95px " style="font-family: Arial;"></td><td width="50px" style="font-family:Arial;"></td><td width="50px"><input type="checkbox" name="rmBen" id="rmBen" onchange="rmFromBen(this)"></td><td width="50px"><input type="checkbox" name="mkBen" id="mkBen" onchange="mkFavAcc(this)"><input type="hidden" name="benName" id="benName" > </td></tr>';

function showDivSchedule(){
	if(document.getElementById("isSchedule").value=="N"){
		document.getElementById("hideScheduleRows").style.display="none";
		document.getElementById("hideScheduleRows2").style.display="none";
		document.getElementById("hideScheduleRows3").style.display="none";
		document.getElementById("hideScheduleRows4").style.display="none";
	}
	else{
		document.getElementById("hideScheduleRows").style.display="";
		document.getElementById("hideScheduleRows2").style.display="";
		document.getElementById("hideScheduleRows3").style.display="";
		document.getElementById("hideScheduleRows4").style.display="";
	}
}
function getAccBal(accno)														//18-10-2019
{
	var type = "AccountNumber";
	var getdata = accno;
	if(getdata==""){
		return false;
	}
	var ran=parseInt(Math.random()*9999);
	var URL ="/TransactionAction.do?action=fetchDataForFtr&data="+getdata+"&type="+type+"&ran="+ran;;
	http.open("POST",URL,false);
	http.onreadystatechange= function (){getBal()};
	http.send(null);
}	
var available_balance;						//18-10-2019
function getBal_Check(){
var available_balance ="0" ;	 
if (http.readyState == 4) {
		if (http.status == 200) {
			var resArray=http.responseText;
			var jsonData = JSON.parse(resArray);	
			if(jsonData != null){
					available_balance =	jsonData.accBalance;
			}													
		}
	}
}