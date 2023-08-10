
function editform(e,purpose)
{ 
	
	// alert(jspOpenFor);
		var data = e.parentNode.parentNode;
		
	document.getElementById("edtaccno").value  = data.children[4].innerHTML;
	document.getElementById("edtname").value  = data.children[2].innerHTML;
	
	document.getElementById("edtifcs").value  = data.children[5].innerHTML;
	document.getElementById("edtamnt").value  = data.children[6].innerHTML;

	document.getElementById("edtremark").value  = data.children[7].innerHTML;
	document.getElementById("edtblktrd").value  = data.children[9].innerHTML;


document.getElementById("edittable").style.display = "block";
		document.getElementById("table").style.display = "none";
	//	document.getElementById("btntable").style.display = "none";
    document.getElementById("reject").style.display = "none";
     document.getElementById("back").style.display = "none";
	 if(jspOpenFor === 'A' || jspOpenFor === 'CIBAuth')  {  
	 document.getElementById("accDiv").style.display = "none";
	  document.getElementById("send").style.display = "block";  
	 }
} 

function editInfo(purpose)
{   if(document.getElementById("txnpass").value === '') 
	{
	alert("Enter Transaction Password");
	return;
	}
  else {
		debugger;
	var sPwd ;
	 sPwd = calcMD5(document.getElementById("txnpass").value);
		// var sSessionId='<%=session.getId()%>';
		 document.getElementById("txnpass").value=sPwd ;
				

	var obj={"edtaccno":document.getElementById("edtaccno").value,
		"edtname":document.getElementById("edtname").value,
		"edtifcs":document.getElementById("edtifcs").value,
		"edtamnt":document.getElementById("edtamnt").value,
		"edtremark":document.getElementById("edtremark").value, 
		"edtblktrd":document.getElementById("edtblktrd").value,
		"edtremiAccount":document.getElementById("accList").value,
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
 if((http.readyState == 4) && (http.status == 200)){
		 var res=http.responseText;
		 if (res === '1') 
		 { 
			  alert("Dear Customer,Your Voucher updated Successfully.");
			  	 editinfoback(purpose) ;
		 } else {
			//  alert("Dear Customer,Your Voucher updatation  failed due to error.");
			alert(res);
		 }
		
	 }
}

function editinfoback(purpose)
{  // alert(purpose);
	if(jspopenFor === 'E') {
	alert(jspopenFor);
	
if (purpose === 'NEFTREQ')
	{
		 window.location.href = "/jsp/main_page.jsp";
	}
	} else {
	if (purpose === 'NEFTREQ')
	{
		 window.location.href = "/jsp/main_page.jsp";
	} }
}

function bacck()
	{
	window.location.href = "/jsp/main_page.jsp";   
	}
    


function fillData()
{
		document.getElementById("neftrtgs1").checked=true;
		document.getElementById("location").checked=true;
	    document.getElementById('detailsT').style.display="none";
		document.getElementById('detailsF').style.display="none";
		
}
function change()
{
	if(document.getElementById("location").checked){
		document.getElementById("neftrtgs1").checked=true;
		document.getElementById("location").value="location1"
		document.getElementById("location").checked=true;
		document.getElementById('detailsT').style.display="none";
	}else{
		document.getElementById("neftrtgs1").checked=true;
		document.getElementById("locationN").value="location2"
		document.getElementById("locationN").checked=true;
		document.getElementById("rIFSC").value="";
		document.getElementById('detailsT').style.display="block";
		document.getElementById('detailsF').style.display="none";
	} 

}  
function ifscTable()
{
 document.getElementById('detailsT').style.display="none";
 document.getElementById('detailsF').style.display="block";
  var ifsc=document.getElementById("rIFSC").value;
   var url="/request/DDRequest.do?action=getDependentMasterNameFromCode&masterType=IFSCBranchFromCode&Code="+ifsc;
  // alert(url);
	  http.open("POST",url,false);
	  http.onreadystatechange= function (){processBranch()};
		http.send(null);
 
}
function processBranch()
{
		if (http.readyState == 4)
			{
				if (http.status == 200)
				{
				 var resArray=http.responseText;
				 var Data = JSON.parse(resArray);  
			    var branch=Data[1];
				//alert(branch);
				document.getElementById('BranchName').value=branch;
				}
			}
}

function cityName()
{
	   var ran=parseInt(Math.random()*9999);
	   var url="/request/DDRequest.do?action=getMaster&masterType=IFSCCITY";
		http.open("POST",url,false);
		http.onreadystatechange= function (){process()};
		http.send(null);
}
function process()
	{
		 if (http.readyState == 4)
        {
            if (http.status == 200)
            {
				   var resArray=http.responseText;
				   var jsonData = JSON.parse(resArray);
				var cityName=jsonData[2];
				for(var i=0;i<cityName.length;i++)
				{
                    select = document.getElementById('ishCityLocal');
                      var opt = document.createElement('option');
                      opt.value = cityName[i];
                      opt.innerHTML = cityName[i];
                      select.appendChild(opt);
				}
			}
		}
}
function bankName()
{
	     var ran=parseInt(Math.random()*9999);
		 var url="/request/DDRequest.do?action=getMaster&masterType=IFSCBANK";
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
				  var bankName=jsonData[2];
				for(var i=0;i<bankName.length;i++)
				{
                    select = document.getElementById('isbankLabel');
                      var opt = document.createElement('option');
                      opt.value = bankName[i];
                      opt.innerHTML = bankName[i];
                      select.appendChild(opt);
				}
			}
		}
}
function getIFSCode(){
	var bnkLbl=document.getElementById('isbankLabel').value;
	var ishCityLocal=document.getElementById('ishCityLocal').value;
	if(bnkLbl=="SELECT")
	{
		alert("please select the bank name first");
	}
	if(ishCityLocal=="SELECT")
	{
		alert("please select the State name first");
	}
	var ran=parseInt(Math.random()*9999);
	var url="/request/DDRequest.do?action=getDependentMaster2&masterType=IFSCBRANCH&Criteria1="+bnkLbl+"&Criteria2="+ishCityLocal;
	//alert(url);
	http.open("POST",url,false);
	http.onreadystatechange= function (){processBranchdata()};
	http.send(null);

}
var ifsCode;
var branchName;
function processBranchdata(){
  if (http.readyState == 4)
        {
            if (http.status == 200)
            {
					   var resArray=http.responseText;
					   var jsonData = JSON.parse(resArray);
					   ifsCode=jsonData[0];
					   //alert(ifsCode);
						branchName=jsonData[1];    
					   for(var i=0;i<branchName.length;i++)
				{
						select = document.getElementById('isBranchEName');
						  var opt = document.createElement('option');
						  opt.value = branchName[i];
						  opt.innerHTML = branchName[i];
						  select.appendChild(opt);
				}
				
			}
		}
}
function setIFSCode(){
		var data=document.getElementById('isBranchEName').value;
		for(var i=0;i<branchName.length;i++){
			 if(data==branchName[i]){
			 document.getElementById('rIFSC').value=ifsCode[i];
		 }
	}
}

  var jsonStr = '';

function saveData()
{
	console.log("save data is calling");
	var fromAcNo =  document.getElementById("accNo").innerText;
	var ifscodee =  document.getElementById("rIFSC1").innerText;
	var ben_name =  document.getElementById("beneficiaryHName").innerText;
	var mobile_n =  document.getElementById("beneMobile").innerText;
	var acccNo =  document.getElementById("racNo").innerText;
	var acc_type =  document.getElementById("sAccountType").innerText;
	var amt =  document.getElementById("amount").value;
	var message =  document.getElementById("remark").value;
	var modeTrens = document.forms[0].trnType.value;
    var otp = document.getElementById("otp").value;

	console.log("fromAcNO :: " + fromAcNo + ' ifsc code ::' + ifscodee + " ben_name :: " +ben_name + " mobile no :: " +  mobile_n
	+ " accNo :: " + acccNo + " acc_type :: " + acc_type + " amt :: " + amt + " message :: " + message + " mode of transction ::" + modeTrens );

//debugger;
   var sPwd=''; 
	if(custrole === 'S' || custrole === 'E' || (jspopenFor === 'A') || (jspOpenFor === 'CIBAuth') ) {
		var pass =  document.getElementById("txnpass").value;
    if(pass === '') { // chk blank password and retuen
		alert("Please enter password");
		return false; 
    	} else {
		
		 sPwd = calcMD5(document.getElementById("txnpass").value);
		 document.getElementById("txnpass").value=sPwd ;
		} 
	}

var url= '';

 if(!(jspopenFor === 'A')) 
	 {  // not for authorization . Only for S ,C E
		var mode=document.forms[0].trnType.value;
        var purpose='NEFTREQ';
		var userid= document.getElementById("userid").value;
		var amount=parseFloat(document.getElementById("amount").value);
		amount=amount.toString();
		var beneficiaryName=document.getElementById("beneficiaryHName").innerText;
		
		var remiAccount=document.getElementById("accList").value;
		var beneAccount=document.getElementById("racNo").innerText;
		var address= "test1";
		var address2= "test2";
		var address3= "test3";
		var remark=document.getElementById("remark").value;
		var ifsc=document.getElementById("rIFSC1").innerText;
		var accType=document.getElementById("sAccountType").value;
		var BranchName = "test"
		var charge = document.getElementById("charge").value;  
		var mobileNo=document.getElementById("mobileNo").value;  
		var beneMobileNo=document.getElementById("beneMobile").innerText;  
		var sessionId=document.getElementById("sessionId").value; 
		var custName=document.getElementById("usrName").value; 
		var authStatus=document.getElementById("authStatus").value; 
		
		
		var brncode = brnchcode; 
		var obj=  {"sCallFor" :mode ,"Amount" : amount,"sBeneFicaryName" :beneficiaryName,"accountNo" :remiAccount,"beneAccNo" :beneAccount,"beneMobileNo":beneMobileNo,"address" : address,"address2":address2,"address3":address2,"remark" :remark,"IFSCcode" :ifsc,"accType" :accType,"brncode" :brncode,"userID" :userid,"charge" :charge,"BranchName" :BranchName,"custName" :custName,"originRemittor" :'IB',"RemimobileNo":mobileNo ,"sessionID":sessionId,"authStatus":authStatus};
	     jsonStr = JSON.stringify(obj);
	alert(jsonStr+"***************");
		 
		var scDate=document.getElementById("schDate").value;
		if(isValidDateFormat("schDate")==false){
			alert("Enter valid Schedule date");
			document.getElementById("schDate").value="";
			document.getElementById("schDate").focus();
			return false;
		}       
	//alert("before DDR request")
	//alert("before DDR request")
      var url="/request/DDRequest.do?action=SaveNeftRtgsData&userId="+userid+"&accountNo="+remiAccount+"&purpose="+purpose+"&sMode="+jspOpenFor+"&openFor="+jspopenFor+"&JSONString="+jsonStr+"&txnpass="+sPwd+"&schDate="+scDate+"&otp="+otp+"&txnType=Neft"+"&authStatus=" +authStatus+"&beneAccount="+beneAccount; 

			
} else if (jspopenFor === 'A')  { // authorization 
if(mytotalJsonString === '')
{
	alert("select rows for transaction ");
	return false;
} 
else {
	alert("wihtin second else")
		var userid= document.getElementById("userid").value;
		 var url="/request/DDRequest.do?action=SaveNeftRtgsData&bulktrd_kid="+mytotalJsonString+"&userId="+userid+"&accountNo="+remiAccount+"&purpose="+purpose+"&sMode="+jspOpenFor+"&openFor="+jspopenFor+"&txnpass="+sPwd+"&otp="+otp+"&authStatus=" +authStatus
} 
}	     
				console.log("url :"+ url ); 
				http.open("POST",url,false);
				http.onreadystatechange= function (){processAlldata()};
				http.send(null); 	
	}    
 
function processAlldata(){
	//debugger;
		if (http.readyState == 4) 
        {
            if (http.status == 200)
            {
			 var resArray=http.responseText;
			 console.log(resArray);
			if( resArray.includes( "Transaction fail") || resArray.includes( "001") ){
				 document.getElementById("succesful-msg").style.backgroundColor = 'red';
				 //document.getElementById("htr").style.backgroundColor = 'red';
				document.getElementById("htr").innerText= "Transaction Failed"; 
				 document.getElementById("tID") .innerHTML="Failed";
				 // Error Code == 000 , 001-999 for Transaction  Fail
			 // Message 
			 //001~Transaction Fail~0
		  //   var usrkid = JSON.parse(resArray); 
			// alert("transaction sucessfully done"+usrkid);
			 
			 //document.getElementById("popup").style.display='block';
			 }
			 else{
				 document.getElementById("succesful-msg").style.backgroundColor = 'green';
				// document.getElementById("htr").style.backgroundColor = 'green';
				document.getElementById("htr").innerText= "Transaction Sucessfull"; 
				 
			 document.getElementById("tID") .innerHTML=resArray;
			  document.getElementById("fromAccNo") .innerHTML=document.getElementById("accList").value;
			    document.getElementById("toAccNo") .innerHTML=document.getElementById("racNo").innerText;
			     document.getElementById("famount") .innerHTML=parseFloat(document.getElementById("amount").value);
			 if (jspopenFor === 'A')  { // authorization 
			 window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&neftopenFor=A&sMode=CIBAuth&purpose=NEFTREQ";
			 } else { resetValue();}
		
			} 
			}
		}
		

}
function bacck(){
		window.location.href = "/../../fundTransferNeftNew/fund_Transfer.jsp"
		}
			
	function setUserId(e)
	{ 
						debugger;
						jspOpenFor = "CIBAuth";
						var data = e.parentNode.parentNode;
					var totaltdr=new Array();
			var tab=document.getElementById("table");
			var rowCount=tab.rows.length;
			for(var i=0;i<rowCount-1;i++)
			{
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
						//alert(mytotalJsonString+"my total JSON string");
						jspOpenFor = "CIBAuth";
						console.log(mytotalJsonString); 
					} } }
					
					function rejectEntry()
					{
						
						if(document.getElementById("txnpass").value === '') {
						alert("Enter Transaction Password");
						return ; 
						} else {
						var  bulk_kid =  mytotalJsonString; 
						var sPwd = calcMD5(document.getElementById("txnpass").value);
						document.getElementById("txnpass").value=sPwd ;
						var url="/TransactionAction.do?action=regectEntry&bulktrn_kid="+bulk_kid+"&txnpass="+sPwd+"&purpose=IFT";     
						http.open("POST",url,false);
						http.onreadystatechange= function (){processReject()};
						http.send(null);
					}
					}

	function processReject(){
	if (http.readyState == 4)
        {
            if (http.status == 200)
            {
			 var resArray=http.responseText;
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
		retStr +='</table>';
		//window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&openFor=A&purpose=SameBank&sMode=CIBAuth";
		document.getElementById("cbrespdiv").innerHTML= retStr;

		}

		}
		}

function processAlldata1(){
	if (http.readyState == 4)
        {
            if (http.status == 200)
            {if(jspOpenFor==='A') {  //CB Fund TransAuthorization
		var resArray=http.responseText; 
		if(resArray ==='-E')
						{
		alert("Entry Not created !");
		return;
		} else if (resArray ==="-11")
		{
				alert("Request Cancled due to PassWord mismatch!");
		} else if (resArray ==="P")
		{
				alert("Request pending for authorization");
		} else {
		//var resArray = '[{"fail":[{\"amount\":\"10.00 \",\"remark\":\"Account No not valid\",\"BeniaccNo\":\"00501000488 \",\"RemiaccNo\":\" 000022000001 \"}],"success":[{\"amount\":\"50.00 \",\"remark\":\"702425\",\"BeniaccNo\":\"006010006667 \",\"RemiaccNo\":\" 000022000001 \"}]}]'; 
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
		retStr +='</table>';
		//window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&openFor=A&purpose=SameBank&sMode=CIBAuth";
		document.getElementById("cbrespdiv").innerHTML= retStr;
		}} else { // normal fund transfer
			 var resArray=http.responseText;
			 var jsonData = JSON.parse(resArray);
			//	if(jsonData.equalsIgnoreCase("succ")){
			if(jsonData=="succ"){
			alert("transaction successfully saved");
			document.getElementById("amount").value="";
			document.getElementById("beneficiaryHName").value="";
			document.getElementById("BranchName").value="";
			document.getElementById("accList").value="";
			document.getElementById("racNo").value="";
			document.getElementById("address1").value="";
			document.getElementById("address2").value= "";
			document.getElementById("address3").value="";
			document.getElementById("remark").value="";
			}
			else{
			alert(jsonData);
			return false;
			}
			}
		}
} 
}
function resetValue()
{
/*reset All Values*/
 $(' #remark, #amount,#sAccountType, #racNo, #beneficiaryHName, #rIFSC, #BranchName, #schDate, ').val(''); 
}