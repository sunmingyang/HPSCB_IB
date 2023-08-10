function editform(e)
{
	  // document.getElementById("authorize").style.display = 'none';
		var data = e.parentNode.parentNode;
		document.getElementById("edittable").style.display = "block";
		document.getElementById("table").style.display = "none";
       //document.getElementById("reject").style.display = "none";
    //   document.getElementById("back").style.display = "none";
	if(jspOpenFor === 'A') {
	document.getElementById("accDiv").style.display = "none";
	}
	document.getElementById("edtaccno").value  = data.children[2].innerHTML;
	document.getElementById("edtname").value  = data.children[3].innerHTML;
	document.getElementById("edtifcs").value  = data.children[4].innerHTML;
	document.getElementById("edtamnt").value  = data.children[5].innerHTML;
	document.getElementById("edtremark").value  = data.children[6].innerHTML;
	document.getElementById("edtblktrd").value  = data.children[8].innerHTML;
	 document.getElementById("reject").style.display = "none";
	    document.getElementById("back").style.display = "none";
		  document.getElementById("authorize").style.display = 'none';

} 

function editInfo(purpose)
{   
	if(document.getElementById("txnpass").value === '') 
	{
	alert("Enter Transaction Password");
	return;
	}
    
	else {
		debugger;
	var sPwd ;
	 sPwd = calcMD5(document.getElementById("txnpass").value);
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
var url = "/BulkAccountFundTransferAction.do?action=bulkAccountFundTransfer&purpose="+purpose+"&data="+jsonStr+"&txnpass="+sPwd;      
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
			  editinfoback(purpose)
		 } else {
			     alert(res);
		 }
		
	 }
}

function editinfoback(purpose)     
{
	if (purpose === 'CIBEdit')
	{
		    window.location.href = "/BulkAccountFundTransferAction.do?action=autheriseBulkAmountTransfer&openFor=E&sMode=CIBEdit&purpose=SHOW" ;
	} else if (purpose === 'CIBAuth')
	{
		    window.location.href = "/BulkAccountFundTransferAction.do?action=autheriseBulkAmountTransfer&openFor=A&sMode=CIBAuth&purpose=SHOW" ;
	} 
}
function goPlaceOrder(e)
{
debugger;
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
tdr.push(data.children[8].innerHTML);
tdr.push(data.children[7].innerHTML); 
tdr.push(data.children[9].innerHTML);  

 
 myJsonString = JSON.stringify(tdr);
 //alert(myJsonString);
totaltdr.push(myJsonString);
 mytotalJsonString = JSON.stringify(totaltdr);
 // alert(mytotalJsonString); 
var idno=e.parentNode.nextElementSibling.childNodes[0].value;
}
}}

 function bacck(){
		window.location.href = "/usrlimit/corporatemenu.jsp?menu=home"; 
			
		}

function saveinfo()
{ 
	var val = "";
	var acc ='' ;//= document.getElementById("account").selectedIndex;
	var draccno ='';//= document.getElementsByTagName("option")[acc].value;
	var sPwd = calcMD5(document.getElementById("txnpass").value);
    document.getElementById("txnpass").value=sPwd ;
				
	var url = "/BulkAccountFundTransferAction.do?action=autheriseBulkAmountTransfer&purpose=authorize&data="+mytotalJsonString+"&entryuser="+val+"&DraccountNo="+draccno+"&txnpass="+sPwd;    
	http.open("POST",url,false);
	http.onreadystatechange= function (){processBulkTrnRes()};
	http.send(null); 
} 

 
function processBulkTrnRes()
{
	debugger;
 if((http.readyState == 4) && (http.status == 200)){
		var resArray=http.responseText;
	if(resArray ==='Request Canceled Due to password mismatch!!')
	 {
	 alert(resArray);
	} else {
		//var resArray = '[{"fail":[{"amount":"1.00","remark":"NEFT REQUEST FAIL","BeniaccNo":"15520110025421","RemiaccNo":"000022000001"}],"success":[{}]}]';
		var resArray = http.responseText;
		var jsonData = JSON.parse(resArray); 
		var arrjsonData =jsonData[0];  
		//var arrjsonData1 = JSON.parse(arrjsonData); 
		var fail = arrjsonData.fail;
		var success = arrjsonData.success;   
		var retStr = '<table  border="1" bordercolor="#ffffff" align="center" id ="cbfundresponce" style="table-layout: fixed;" cellpadding="0" cellspacing="0"><tr><B>Corporate Banking Fund Transfer Status</B></tr>';
		retStr +='<tr class="dataTableTH"><td><B>Beneficiary Acc. No</B></td><td><B>Remitance Acc. No</B></td><td><B>Amount</B></td><td><B>Remark</B></td></tr>';
 
		for (var i=0;i<fail.length;i++)
		{
		retStr +='<tr class="dataTableTR"><td>'+fail[i].BeniaccNo+'</td><td>'+fail[i].RemiaccNo+'</td><td>'+fail[i].amount+'</td><td>'+fail[i].remark+'</td></tr>';
		}
		if(success.length >1) {
		for (var j=0;j<success.length;j++)
		{
		retStr +='<tr class="dataTableTR"><td>'+success[j].BeniaccNo+'</td><td>'+success[j].RemiaccNo+'</td><td>'+success[j].amount+'</td><td>'+success[j].remark+'</td></tr>'

		}
		}
		retStr +='</table>';
	     document.getElementById("table").display = 'none';
	     document.getElementById("btntable").display = 'none';	  
		document.getElementById("cbrespdiv").innerHTML= retStr;
		document.getElementById("txnpass").value=''; 
		

	 }  } }
function rejectEntry()
				{
					if(document.getElementById("txnpass").value === '') {
						alert("Enter Transaction Password");
					} else {
				var 	 sPwd = calcMD5(document.getElementById("txnpass").value);
				document.getElementById("txnpass").value=sPwd ;
					var  bulk_kid = mytotalJsonString; // send multiple data for reject
					var url="/TransactionAction.do?action=regectEntry&bulktrn_kid="+bulk_kid+"&purpose=EXCELFILE&txnpass="+sPwd;    
					http.open("POST",url,false);
					http.onreadystatechange= function (){processRegectRes()};
					http.send(null);
				}
				}

				function processRegectRes(){
					debugger;
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
								//var arrjsonData1 =JSON.parse(arrjsonData);  
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
								document.getElementById("cbrespdiv").innerHTML= retStr;
							  }
							}
							if(jspOpenFor==='A') {
								window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&jspopenFor=A&purpose=SameBank&sMode=CIBAuth";
							//	window.location.href = "/usrlimit/corporatemenu.jsp?menu=home"; 
							} else { 
								window.location.href = "/fundtransfer/fund.jsp"
							}
						}
						else
						{
							alert("HTTP error: " + http.status); 
						}
					}
				
				function gotohome()
				{
					window.location.href = "/TransactionAction.do?action=getPendingListforIFTAuthorization&jspopenFor=A&purpose=SameBank&sMode=CIBAuth";  
				}