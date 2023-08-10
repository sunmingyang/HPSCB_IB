		function setUserId(e)
		{ 
		var data = e.parentNode.parentNode;
		var totaltdr=new Array();
		var tab=document.getElementById("table");
		var rowCount=tab.rows.length;
		for(var i=0;i<rowCount-1;i++)
		{
		if(document.getElementById("checkbox"+i)!=null && document.getElementById("checkbox"+i).checked==true)
		{
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
		
     	 
		 }
		 }
		}

		function editform(e,purpose)
		{
		//alert(jspOpenFor);
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
		document.getElementById("trtxn").style.display = "none";
	//	alert("edit"+jspOpenFor);
		if(jspOpenFor === 'A')  {
		document.getElementById("acctbl").style.display = "none"; //accDiv
		document.getElementById("send").style.display = "none";
		}
		} 

		function editInfo(purpose)
		{   if(document.getElementById("etxnpass").value === '') 
		{
		alert("Enter Transaction Password!");
		return; 
		} else {
		var sPwd ;
		sPwd = calcMD5(document.getElementById("etxnpass").value);
		// var sSessionId='<%=session.getId()%>';
		document.getElementById("etxnpass").value=sPwd ;
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

		function processeditInfoRes(purpose)
		{
		if((http.readyState == 4) && (http.status == 200))
			{
		var res=http.responseText;
		if (res === '1') 
		{ 
		alert("Dear Customer,Your Voucher updated Successfully.");
		editinfoback(purpose) ;
		return;
		} else {
		alert(res);
		return;
		}
		}
		}

		function editinfoback(purpose)
		{  
			if (custrole ==='F')
			{
				window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&jspopenFor=A&purpose=SameBank&sMode=CIBAuth";
			} else {
				window.location.href = "jsp/main_page.jsp";
			} 
		}

		 
		function bacck(){
		window.location.href = "jsp/main_page.jsp";
		}
		
		function otp_confirm()
		{     // alert("mode::"+mode); 
		var userid=document.getElementById("userid").value ;
		var acc=document.getElementById("accList").value;
		var sessionID=document.getElementById("sessID").value;
		// alert("userid::"+userid+"accNO::"+acc);   
	   // check payee is selected or not  in retail fund transfer case
		var id=document.getElementById("fundkid").value;
		var id1=document.getElementById("fundkid").value;
		if(id1=="") 
		{
		alert("Please choose a Payee");
		return false;
		} 
		
		var mode=document.getElementById("mode").value;
		var acc=document.getElementById("accList").value;
		var amount=document.getElementById("amount").value;
		var mobile=document.getElementById("UserMobile").value;
		var Benemobile=document.getElementById("payeeMob").value;
		var ifscCode=document.getElementById("IFSCcode").value;
		var beneficiaryAccNo=document.getElementById("sPayeeAcc").value;
		
		if(amount==".00" || amount=="0.00"||amount=="0"|| amount < 0 )
		{ 
		alert("Amount cannot be zero");
		return false;
		}

		var bulktrd_kid = ''; 
		var nikname=document.getElementById("sNickName").value;
		var ifcs=document.getElementById("IFSCcode").value;
		var remark=document.getElementById("remark").value;
		var sPwd = calcMD5(document.getElementById("txnpass").value);
		document.getElementById("txnpass").value=sPwd ;
		if(custrole == 'E' || custrole == 'S') {
	  
		sMode = 'entry'; 
	 
		}else {
		sMode = 'directentry'; 
		}
		var	url="/TransactionAction.do?action=corpfundTransfer&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&transferAmt="+amount+"&sessionID="+sessionID+"&nikname="+nikname+"&ifcs="+ifcs+"&Remark="+remark+"&bulktrd_kid="+bulktrd_kid+"&sMode="+sMode+"&purpose="+sTranMode+"&txnpass="+sPwd;   // sMode tells what mode we are using auth or operation
		
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
			
		var resArray=http.responseText; 
		             
		             
						if (custrole ==='F')
						{
						  	var jsonData = JSON.parse(resArray);
							if (jsonData.result=="failure"){
								alert("Dear Customer your Transaction has been "+jsonData.result + " due to " + jsonData.Error);
								return;
							} else { 
									alert("Dear Customer your Transaction has been "+jsonData.result +" and Transaction Id: "+jsonData.transactionID);
									resetValue();
									return;
							}
						
						}  else {
						if (custrole ==='S' || custrole ==='E') {
						     if(resArray ==='-E')
						{
								alert("Entry Not created !");
								return;																																																																																
								} else if (resArray ==="-11")
								{
										alert("Request Cancled due to PassWord mismatch!");
											return;
								} else if (resArray ==="P")
								{ 
										alert("Request pending for authorization");
										resetValue();
										return;
								} else if (JSON.parse(resArray).result=="failure"){ 
							alert("Dear Customer your Transaction has been "+JSON.parse(resArray).result + " due to " + JSON.parse(resArray).Error);
								return;
						}
						}
		} 
		} else   // http error 
		{
		alert("HTTP error: " + http.status);
		}
		} 
		}
		function rejectEntry()
		{					
		var  bulk_kid =  mytotalJsonString; 
		var sPwd = calcMD5(document.getElementById("txnpass").value);
		document.getElementById("txnpass").value=sPwd ;
		var url="/TransactionAction.do?action=regectEntry&bulktrn_kid="+bulk_kid+"&txnpass="+sPwd+"&purpose=IFT";     
		http.open("POST",url,false);
		http.onreadystatechange= function (){processRegectRes()};
		http.send(null);
		}

		function processRegectRes(){   
		if (http.readyState == 4)
		{
		// Check that a successful server response was received
		if (http.status == 200) 
		{
		var resArray=http.responseText;
		var jsonData = JSON.parse(resArray);
		if(jsonData =='-11') {  
			alert("Request Cancelled due to password mismatch");
			return;
		} else { 
		var arrjsonData =jsonData[0];  
		var fail = arrjsonData.fail;
		var success = arrjsonData.success;
		var retStr = '<table  border="1" bordercolor="#ffffff" align="center" id ="cbfundresponce" style="table-layout: fixed;" cellpadding="0" cellspacing="0"><tr><B>Corporate Banking Fund Transfer Status</B></tr>';
		retStr +='<tr class="dataTableTH"><td><B>Beneficiary Acc. No</B></td><td><B>Remitance Acc. No</B></td><td><B>Amount</B></td><td><B>Remark</B></td></tr>';

		for (var i=0;i<fail.length;i++)
		{
		retStr +='<tr class="dataTableTR"><td>'+fail[i].BeniaccNo+'</td><td>'+fail[i].RemiaccNo+'</td><td>'+fail[i].amount+'</td><td>'+fail[i].remark+'</td></tr>';
		}
		for (var j=0;j<success.length;j++)
		{
		retStr +='<tr class="dataTableTR"><td>'+success[j].BeniaccNo+'</td><td>'+success[j].RemiaccNo+'</td><td>'+success[j].amount+'</td><td>'+success[j].remark+'</td></tr>'

		}
	    retStr +='</table><input type = "button" value = "BACK" class = "Button" onclick = "bacck();"/>';
		document.getElementById("cbrespdiv").innerHTML= retStr;
		document.getElementById("txnpass").value=''; 
		document.getElementById("table").style.display= 'none';
        document.getElementById("btntable").style.display= 'none';
		} }
		else    
		{
		alert("HTTP error: " + http.status); 
		}
		} else    
		{
		alert("HTTP error: " + http.status); 
		}
		}
	//	}

	function getAccNo(){
		var name=document.getElementById("sNickName1").value;
		if(name=="-1") {
			document.getElementById("sPayeeAcc").value="";
		} else{
			var acc=name.split("~");
			document.getElementById("sPayeeAcc").value=acc[0];
			document.getElementById("fundkid").value=acc[1];
			document.getElementById("payeeMob").value=acc[2];
			document.getElementById("IFSCcode").value=acc[3];
		}
	}

	function authorizeTran() 
	{
		var sPwd = calcMD5(document.getElementById("txnpass").value);
		document.getElementById("txnpass").value=sPwd ;
		var sessionID = document.getElementById("sessID").value ;
        var userid=document.getElementById("userid").value ;
		//alert(sessionID); 
		if(mytotalJsonString === '')
		{
		alert("Select Row for Transaction!");
		return;
		} else if (sPwd ==='')
		{
			alert("Enter Transaction password!");
			return;   
		}else {
		var	url="/TransactionAction.do?action=corpfundTransfer&userID="+userid+"&txnpass="+sPwd+"&sessionID="+sessionID+"&bulktrd_kid="+mytotalJsonString+"&sMode="+sMode+"&purpose="+sTranMode;  
		http.open("POST",url,false);
		http.onreadystatechange= function (){processAuthResponse()};
		http.send(null);  
				}
	}


function processAuthResponse()
	{  
		if (http.readyState == 4) 
	    	{
		// Check that a successful server response was received
		if (http.status == 200) 
		{
			
		var resArray=http.responseText;
		var jsonData = JSON.parse(resArray); 
		//alert(jsonData);
		if (jsonData == '404')
		{
			alert("Internal Error occur");
			return;
		} else if (jsonData.result=="Password Mismatch"){
						alert("Dear Customer your Transaction has been rejected due to password mismatch"); 
							return;
		}
		else {
		var jsonData = JSON.parse(resArray); 
		var arrjsonData =jsonData[0];  
		var fail = arrjsonData.fail;
		var success = arrjsonData.success;  
		var retStr = '<table  border="1" bordercolor="#ffffff" align="center" id ="cbfundresponce" style="table-layout: fixed;" cellpadding="0" cellspacing="0"><tr><B>Corporate Banking Fund Transfer Status</B></tr>';
		retStr +='<tr class="dataTableTH"><td><B>Beneficiary Acc. No</B></td><td><B>Remitance Acc. No</B></td><td><B>Amount</B></td><td><B>Remark</B></td></tr>';
		for (var i=0;i<fail.length;i++)
		{
		retStr +='<tr class="dataTableTR"><td>'+fail[i].BeniaccNo+'</td><td>'+fail[i].RemiaccNo+'</td><td>'+fail[i].amount+'</td><td>'+fail[i].remark+'</td></tr>';
		}
		for (var j=0;j<success.length;j++)
		{
		retStr +='<tr class="dataTableTR"><td>'+success[j].BeniaccNo+'</td><td>'+success[j].RemiaccNo+'</td><td>'+success[j].amount+'</td><td>'+success[j].remark+'</td></tr>'
		}
		retStr +='</table><input type = "button" value = "BACK" class = "Button" onclick = "bacck();"/>';
		document.getElementById("cbrespdiv").innerHTML= retStr;
		document.getElementById("txnpass").value=''; 
		document.getElementById("table").style.display= 'none';
        document.getElementById("btntable").style.display= 'none';
		}
		
		} 
		} else   // http error 
		{
		alert("HTTP error: " + http.status);
		}
	}
	
function setData(name,acc,value,ifsc,id)
{
	  if($('#'+id).is(':checked'))
	{
		document.getElementById("sNickName").value = name;
		document.getElementById("sPayeeAcc").value = acc;
		document.getElementById("sNickName1").value = value; 
		document.getElementById("IFSCcode").style.display = 'block'; 
		document.getElementById("IFSCcode").value = ifsc; 
		getAccNo();
	}
	else
	{
		document.getElementById("sNickName").value = "";
		document.getElementById("sPayeeAcc").value = "";
		document.getElementById("sNickName1").value = ""; 
		document.getElementById("IFSCcode").style.display = 'none'; 
		document.getElementById("IFSCcode").value = ""; 
	}

}
function resetValue()
{

 $('#txnpass, #remark, #sNickName, #sPayeeAcc, #sNickName1, #amount,#IFSCcode').val(''); 
}	
		
function checkAccFormat(value,id)
{

 if(value=="" || value.length >16 || (isNaN(value)))
			   {
			  alert("please enter account number in number values ");
			  document.getElementById(id).value = "";
			  return false;
			   }
}
function checkamt(amount,id)
{

	if(!isNaN(amount)) {
	if(amount==".00" || amount < 0 )
		{ 
		alert("Amount cannot be zero");
		  document.getElementById(id).value = "";
		return false;
		} 
	} else {
		alert("Only numbers are allowed");
		  document.getElementById(id).value = "";
		return false;
	
	}
}

function checkWildcard(e)
{

	var text = document.getElementById(e).value;
	if(text.includes('/') || text.includes('?') || text.includes('*') || text.includes('-') || text.includes('+') || text.includes('(') || text.includes(')') || text.includes('{') || text.includes('}') || text.includes('[') || text.includes(']') ||  text.includes('!') || text.includes('@') || text.includes('#') ||  text.includes('$') ||  text.includes('%') ||  text.includes('^') || text.includes('&') || text.includes('<') || text.includes('>') || text.includes(':') || text.includes(';') || text.includes('"'))
	{	
		alert('Special Characters not Allowed'  );
		document.getElementById(e).value="";
		document.getElementById(e).focus();
		return false;
	}
}

function deletEntry()
{
debugger;
var name =document.getElementById("sNickName").value;
var acc =document.getElementById("sPayeeAcc").value;
//alert(name+"--"+acc+"--"+userId);
if(name != "" && acc != "") {
var url = "/TransactionAction.do?action=deletePayee&accNo="+acc+"&accName="+name+"&userId="+userId;      
		http.open("POST",url,false);
		http.onreadystatechange= function (){processDelRequest()};
		http.send(null);  
	} else {
		alert("Please select any one Row!!");
		return;
	}
}

function processDelRequest()
	{  
		if (http.readyState == 4) 
	    	{
		// Check that a successful server response was received
		if (http.status == 200) 
		{
			
		var res=http.responseText;
	//	alert(resArray);
        if(res == "success") {
        alert("Payee has bean deleted Succesfully");
		window.location.href = "jsp/main_page.jsp";
		}
		}
	}
}
