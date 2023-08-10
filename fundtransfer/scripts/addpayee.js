//---rohit---//
function continuetransfer()
  { 
	  
	if(document.getElementById("sPayeeAcc").value=="" || !(document.getElementById("sPayeeAcc").value.length>=5 &&document.getElementById("sPayeeAcc").value.length <= 14))
	  {
		alert("please enter account number in correct format");
		return false;
	  } 
	  else if(document.getElementById("sNickName").value.length > 5)
	  {
	  	alert("please enter nickname of account holder's name less than 5 charatcer");
		return false;
	  }
	  
	  
	  if(document.getElementById("sPayeeAcc").value!="" && document.getElementById("sNickName").value!="")
	  {
						//disabledControlsOnAction(document.forms[0]);
				document.forms[0].action="/fundtransfer/fund.do?action=ownAccPayee" ;
				document.forms[0].submit();
	  } 
  }
//-----end--------------------------------/
function continufund()
{ 

	if(document.getElementById("sPayeeAcc").value=="" || document.getElementById("sPayeeAcc").length < 6)
	{
		alert("please enter account number in correct formet");
		return false;
	}
	else if(document.getElementById("sNickName").value=="")
	{
	  	alert("please enter nickname of account holder's name");
		return false;
	}
	else if(document.getElementById("IFSCcode").value=="")
	  {
			alert("please enter Branch IFSC Code");
			return false;
	  }
	else if(document.getElementById("IFSCcode").value.length<11)
	  {
			alert("please enter 11 digit Branch IFSCCode");
			return false;
	  }
	if(document.getElementById("sPayeeAcc").value!="" && document.getElementById("sNickName").value!="")
	{
	  	disabledControlsOnAction(document.forms[0]);
		document.forms[0].action="../fundtransfer/fund.do?action=ownAccPayee" ;
		document.forms[0].submit();
	}
 }




function bacck()
  {
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performAddPayee&button=back" ;
	document.forms[0].submit();
  }
  
  
function attach()
  {	
   	 disabledControlsOnAction(document.forms[0]);
	 document.forms[0].action="../fundtransfer/fund.do?action=performAddPayee&&button=attach" ;
	 document.forms[0].submit();

  }
  function selectPayee()
 {   
		var str=document.getElementById("selectpayee").value;
		document.getElementById("addpayee").value=str;
		disabledControlsOnAction(document.forms[0]);
   		document.forms[0].action="/fundtransfer/fund.do?action=performAddPayee&&button=go" ;
   		document.forms[0].submit();
 }
 
 
function FindAccTypeold()
{
 	if(document.getElementById("sBranchCode").value=="")
	  {
	  	alert("please enter Branch Code");
		return false;
	  }
	else
	{
		disabledControlsOnAction(document.forms[0]);
	   document.forms[0].action="/fundtransfer/fund.do?action=performAddPayee&&button=acctype" ;
	   document.forms[0].submit();
	
	}

}


function setUserId(e)
{  
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
		 var myJsonString = JSON.stringify(tdr);
		 totaltdr.push(myJsonString);
		 mytotalJsonString = JSON.stringify(totaltdr);
	   	}
	} 
}
function rejectEntry()
 {
 	 if(mytotalJsonString === '') { 
			alert("Select Rows first");
			return ;
		 }
		 if(document.getElementById("txnpass").value === '') { 
					alert("Enter Password");
					return ;
		} else {
			  sPwd = calcMD5(document.getElementById("txnpass").value);
						  document.getElementById("txnpass").value=sPwd ;
	   }
	var rejectkid = mytotalJsonString; //JSON.stringify(mytotalJsonString);
	var url="/TransactionAction.do?action=regectEntry&bulktrn_kid="+rejectkid+"&purpose=AddPayeeSB&txnpass="+sPwd;            
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
						showresult(resArray); 
					   // window.location.href = "/usrlimit/addnewUser.jsp";
				   }else
					{
						alert("HTTP error: " + http.status); 
					}
				}
		}

function editform(e)
{
	var data = e.parentNode.parentNode;
		document.getElementById("edittable").style.display = "block";
		document.getElementById("table").style.display = "none";
		document.getElementById("btntable").style.display = "none";
		document.getElementById("edtaccno").value  = data.children[4].innerHTML;
		document.getElementById("edtname").value  = data.children[2].innerHTML;
		document.getElementById("edtifcs").value  = data.children[5].innerHTML;
		document.getElementById("edtmob").value  = data.children[3].innerHTML;
		document.getElementById("edtaccType").value  = data.children[6].innerHTML;
		document.getElementById("edtibreqkid").value  = data.children[8].innerHTML; 

		document.getElementById("bck").style.display = "none";
	    document.getElementById("send").style.display = "none";
	    document.getElementById("reject").style.display = "none";

}  

function editInfo(purpose)
{   var sPwd ;
if(document.getElementById("etxnpass").value === '') {
	alert("Enter transaction password");
	return;
} else { 
 sPwd = calcMD5(document.getElementById("etxnpass").value);
		document.getElementById("etxnpass").value=sPwd ;

	var obj={"edtaccno":document.getElementById("edtaccno").value,
		"edtname":document.getElementById("edtname").value,
		"edtifcs":document.getElementById("edtifcs").value,
		"edtmob":document.getElementById("edtmob").value,
		"edtaccType":document.getElementById("edtaccType").value, 
		"edtibreqkid":document.getElementById("edtibreqkid").value
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
			  alert("Dear Customer,Your Payee details updated Successfully.");
			  	 editinfoback('editsb')
		 } else {
			  alert("Dear Customer,Payee details updatation  failed due to error.");
		 }
		
	 }
}  

function editinfoback(purpose)
{
    window.location.href = "/jsp/main_page.jsp";
}
		 
		 function fetchAccType()
		 {     
				$(this).attr('type','password');
			 if(document.getElementById("selectList").value== "O")
			 {
				 alert("Getting ACC TYPE for "+document.getElementById("selectList").value )
				return; 
			 }
			 
			 else{
			   if(document.getElementById("sPayeeAcc").value=="" || !( document.getElementById("sPayeeAcc").value.length >=5 && document.getElementById("sPayeeAcc").value.length <=14  ))
			   {
			  alert("please enter account number in correct format");
			  return false;
			   }
			   else
			   {
			    var accno=document.getElementById("sPayeeAcc").value;
			    var url="/fundtransfer/fund.do?action=ownAccPayee&fetchAccType=true&accountno="+accno;
			    http.open("post",url,false);
			    http.onreadystatechange= function (){
			     var res=http.responseText;
			     var json=JSON.parse(res);
				 alert(json); //TO BE DELETED 
				 console.log( json);
			     if(json=="")
			     { 
			      alert("No type found for Account number:"+accno);
			      document.getElementBy("sPayeeAcc").focus();
			     }
			     else if(json=="--")
				 {
					  	alert("Account is closed Cannot Be add as a payee");
						
						document.getElementById("ErrorMessage").value="Account is closed Cannot Be add as a payee!!";
						document.getElementById("sPayeeAcc").value="";
						document.getElementById("sPayeeAcc").focus();
						return false ;
				 }
			     else
				 {
					 //document.getElementById("sAccountType").innerHTML=json;// This needs tto select the appropiate Account Type 
					 document.getElementById('sAccountType').innerHTML="<option>"+ json +"</option><option>" + json +"</option>";
				 }
			
			    };
			    http.send(null);
			   }
		 }
		 
		 }

		 function showresult(res)
		 {
		
		// if(jspOpenFor=='A' || openFor=='CIBAuth')
		//		   {
		var jsonData = JSON.parse(res);
		if(jsonData =='-11') {  
			alert("Request Cancelled due to password mismatch");
		} else { 
		var arrjsonData =jsonData[0];  
		//var arrjsonData1 = JSON.parse(arrjsonData);
		var fail = arrjsonData.fail;
		var success = arrjsonData.success;
		var retStr = '<table  border="1" bordercolor="#ffffff" align="center" id ="cbfundresponce" style="table-layout: fixed;" cellpadding="0" cellspacing="0"><tr><B>Corporate Banking Payee Status</B></tr>';
		retStr +='<tr class="dataTableTH"><td><B>Beneficiary Acc. No</B></td><td><B>Remark</B></td></tr>';

		for (var i=0;i<fail.length;i++)
		{
		retStr +='<tr class="dataTableTR"><td>'+fail[i].BeniaccNo+'</td><td>'+fail[i].remark+'</td></tr>';
		}
		for (var j=0;j<success.length;j++)
		{
		retStr +='<tr class="dataTableTR"><td>'+success[j].BeniaccNo+'</td><td>'+success[j].remark+'</td></tr>'

		}
		retStr +='</table><input type = "button" value = "BACK" class = "Button" onclick = "bacck();"/>';
		document.getElementById("cbrespdiv").innerHTML= retStr;
		document.getElementById("table").style.display = 'none';
		document.getElementById("btntable").style.display = 'none';
		document.getElementById("send").style.display = 'none';
		//		}
				 }
		 
		 }
		 function validatePhoneNumber(input_str) {
  var re = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;

  return re.test(input_str);
}
function validAccNo(bank_account_number) {
    // Regex to check valid
    // BANK ACCOUNT NUMBER CODE
    let regex = new RegExp(/^[0-9]{9,18}$/);
 
    // bank_account_number CODE
    // is empty return false
    if (bank_account_number == null) {
        return "false";
    }
 
    // Return true if the bank_account_number
    // matched the ReGex
    if (regex.test(bank_account_number) == true) {
        return "true";
    }
    else {
        return "false";
    }
}

		 
		 function continueTransfer()
		{    var obj
		var IFSCcode="";
	
		   	 // Retail Data 
			  
			if( document.getElementById("selectList").value=="O" && c =="")
			 {
			    alert("please enter IFSC Code ");
			    document.getElementById("payeeName").focus();
			    return false;
			 }
	  
			if( document.getElementById("selectList").value=="O" && document.getElementById("IFSCcode").value !="")
			 {
			  IFSCcode=document.getElementById("IFSCcode").value;
			  alert(IFSCcode)
			 }				 
			 if(document.getElementById("payeeName").value=="")
			 {
			    alert("please enter Payee Name");
			    document.getElementById("payeeName").focus();
			    return false;
			 }
			 else if(document.getElementById("sNickName").value=="")
			 {
			      	alert("please enter nickname of account holder's");
			    	document.getElementById("sNickName").focus();
			    	return false;
			 }
			 else if( document.getElementById("sNickName").value!="" && document.getElementById("sNickName").value.length>5)
			 {
			    alert("please enter nickname of account holder's name less than 5 charatcer");
			    document.getElementById("sNickName").focus();
			    return false;
			 }
			 else if(document.getElementById("sPayeeAcc").value=="" || document.getElementById("sPayeeAcc").value.length>16)
			 {
			 	 alert("please enter account number in correct format");
 			 //  	document.getElementById("sPayeeAcc").focus();
			  	return false;
			  }
			 
			  else if(document.getElementById("sAccountType").value=="")
			  {
			    alert("please select Account type");
			  	document.getElementById("sAccountType").focus();
			  	return false;
			  }
			  else if(document.getElementById("payeemob").value=="")
			  {
			    alert("please enter payee mobile number");
		  	document.getElementById("payeemob").focus();
			  	return false;
			   }
			    else if(!validatePhoneNumber(document.getElementById("payeemob").value))
			  {
			    alert("please enter mobile number in  correct format");
		  	document.getElementById("payeemob").focus();
			  	return false;
			   }
			     else if(!validAccNo(document.getElementById("sPayeeAcc").value))
			  {
			    alert("please enter account number in  correct format");
		  	document.getElementById("sPayeeAcc").focus();
			  	return false;
			   }
			   
			   
			   
			   if(document.getElementById("sPayeeAcc").value!="" && document.getElementById("sNickName").value!="")
			   {
			   var sPayeeAcc=document.getElementById("sPayeeAcc").value;
			   var sNickName=document.getElementById("sNickName").value;
			   var sPayeeName=document.getElementById("payeeName").value; 
			   var sPayeeMob=document.getElementById("payeemob").value;
			   var mobNo=document.getElementById("mob").value;
			   var accType=document.getElementById("sAccountType").value;
			   var selectList=document.getElementById("selectList").value;
			   } 
			   obj={"sPayeeAcc":sPayeeAcc,"sNickName":sNickName,"sPayeeName":sPayeeName,"sPayeeMob":sPayeeMob,"mobNo":mobNo,"accType":accType,"IFSCcode":IFSCcode};
			     jsonStr = JSON.stringify(obj);
				// alert(jsonStr)
  
			 if(custrole ==='E' || custrole ==='S')
			{
				 if(document.getElementById("txnpass").value === '') { 
					alert("Enter Password");
					return ;
				} else {
				  sPwd = calcMD5(document.getElementById("txnpass").value);
						  document.getElementById("txnpass").value=sPwd ;
			   }
			}
  
	 var url="/fundtransfer/fund.do?action=ownAccPayee&jsonStr="+jsonStr+"&sMode="+sMode+"&txnpass="+sPwd+"&selectOption="+selectList;
	 //alert(url+"url is")
  		 http.open("POST",url,false);
		http.onreadystatechange= function (){processentryResp()};
		http.send(null);
			   }
		 
function processentryResp ()
{

			var res=http.responseText;
			// var res = '[{\"fail\":[],\"success\":[{\"account\":\"005010001088\",\"remark\":\"Success\"},{\"account\":\"005010001088\",\"remark\":\"Success\"}]}]'
			alert(res)
			    var json=JSON.parse(res);
				//alert("-----json is"+json)
 				
				if(json =='-11') {  
					alert("Request Cancelled due to password mismatch");
		} else {
			    if(json== "-S") {
			     alert("Requested Account Added Successfully");
				 resetValue();
				} else  {
			     alert("Requested Account Not Added");
				}
		}

}

 function authoriseentry()
 {
			
			    if(mytotalJsonString ==='')
				 {
				 alert("select rows for authorization");
				 return;
				 } else if(document.getElementById("txnpass").value === '') { 
					alert("Enter Password");
					return ;
				} else {
				  sPwd = calcMD5(document.getElementById("txnpass").value);
						  document.getElementById("txnpass").value=sPwd ;
			   }
			 
		var url="/fundtransfer/fund.do?action=ownAccPayee&authjsonStr="+mytotalJsonString+"&sMode="+sMode+"&txnpass="+sPwd;
  	    http.open("POST",url,false);
		http.onreadystatechange= function (){processauthResp()};
		http.send(null);
	
			 }

			 function processauthResp()
			 {

			  var res=http.responseText;
			// var res = '[{\"fail\":[],\"success\":[{\"account\":\"005010001088\",\"remark\":\"Success\"},{\"account\":\"005010001088\",\"remark\":\"Success\"}]}]'
			  //alert("Result:"+res);
			 showAuthresult(res);
			 }
			 
function resetValue()
 {
			document.getElementById("sPayeeAcc").value = '';
		    document.getElementById("sNickName").value = '';
			document.getElementById("payeeName").value= '';
		    document.getElementById("payeemob").value='';
		    document.getElementById("mob").value = '';
		    document.getElementById("sAccountType").value = '';
		  	document.getElementById("txnpass").value ='';
			document.getElementById("confirmPayeeAccNo").value ='';
			 
 }

function showAuthresult(res)
{
		
		
		var jsonData = JSON.parse(res);
		if(jsonData =='-11') {  
			alert("Request Cancelled due to password mismatch");
		} else { 
		var arrjsonData =JSON.parse(jsonData[0]);
		//alert(arrjsonData);
	    var len = arrjsonData.length;
		var fail = arrjsonData.fail;
		var success = arrjsonData.success;
		var retStr = '<table  border="1" bordercolor="#ffffff" align="center" id ="cbfundresponce" style="table-layout: fixed;" cellpadding="0" cellspacing="0"><tr><B>Corporate Banking Payee Status</B></tr>';
		retStr +='<tr class="dataTableTH"><td><B>Beneficiary Acc. No</B></td><td><B>Remark</B></td></tr>';

		for (var i=0;i<fail.length;i++)
		{
		retStr +='<tr class="dataTableTR"><td>'+fail[i].account+'</td><td>'+fail[i].remark+'</td></tr>';
		}
		for (var j=0;j<success.length;j++)
		{
		retStr +='<tr class="dataTableTR"><td>'+success[j].account+'</td><td>'+success[j].remark+'</td></tr>'

		}
		retStr +='</table><input type = "button" value = "BACK" class = "Button" onclick = "bacck();"/>';
		document.getElementById("cbrespdiv").innerHTML= retStr;
		document.getElementById("table").style.display = 'none';
		document.getElementById("btntable").style.display = 'none';
		document.getElementById("send").style.display = 'none';
		//		}
				 }
		 
}			 