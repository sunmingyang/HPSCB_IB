function continuFund()
{
	var obj="",sPwd='';
	var jsonStr="";
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
		   else if(document.getElementById("sPayeeAcc").value=="" || document.getElementById("sPayeeAcc").length <16)
		   {
		    alert("please enter account number in correct formet");
		    document.getElementById("sPayeeAcc").focus();
		    return false;
		   }
		   else if(document.getElementById("IFSCcode").value=="")
		   {
		    alert("please enter Branch IFSC Code");
		    document.getElementById("IFSCcode").focus();
		    return false;
		   }
		   else if(document.getElementById("IFSCcode").value.length<11)
		   {
		    alert("please enter 11 digit Branch IFSCCode");
		    document.getElementById("IFSCcode").focus();
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
		   if(document.getElementById("sPayeeAcc").value!="" && document.getElementById("sNickName").value!="")
		   {
		      var sPayeeAcc=document.getElementById("sPayeeAcc").value;
		    var sNickName=document.getElementById("sNickName").value;
		    var sPayeeName=document.getElementById("payeeName").value;
		    var sPayeeMob=document.getElementById("payeemob").value;
		    var mobNo=document.getElementById("mob").value;
		    var accType=document.getElementById("sAccountType").value;
		    var IFSCcode=document.getElementById("IFSCcode").value;
		    var mmid="";
   			if(document.getElementById("mmid")!=null){
   				mmid=document.getElementById("mmid").value;
   			}
			if(custrole ==='S' || custrole === 'E' || custrole === 'F') 
			   {
			 if(document.getElementById("txnpass").value === '') { 
					alert("Enter Password");
					return ;
				} else {
				sPwd = calcMD5(document.getElementById("txnpass").value);
						  var sSessionId='<%=session.getId()%>';
						  document.getElementById("txnpass").value=sPwd ;
				
				}
			}
			 obj={"sPayeeAcc":sPayeeAcc,"sNickName":sNickName,"sPayeeName":sPayeeName,"sPayeeMob":sPayeeMob,"mobNo":mobNo,"accType":accType,"IFSCcode":IFSCcode,"mmid":mmid};   
			  jsonStr = JSON.stringify(obj);
			 var url="/fundtransfer/fund.do?action=ownAccPayee&jsonStr="+jsonStr+"&sMode="+sMode+"&txnpass="+sPwd;
			http.open("POST",url,false);
			http.onreadystatechange= function (){processentryResp()};
			http.send(null);
		   
		   
		   } 
		  // }
			}
		  
	    var totaltdr=new Array();
	function setUserId(e)
		{ 
var data = e.parentNode.parentNode;
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
 // alert(mytotalJsonString);
// sMode = "CIBAuth";
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
    var  rejectkid = mytotalJsonString;
    var url="/TransactionAction.do?action=regectEntry&bulktrn_kid="+rejectkid+"&purpose=AddPayeeOB&txnpass="+sPwd;        
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
					//	window.location.href = "/usrlimit/addnewUser.jsp" 
						} else
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
		document.getElementById("back").style.display = "none";
	    document.getElementById("btntable").style.display = "none";
	    document.getElementById("reject").style.display = "none";
		document.getElementById("edtaccno").value  = data.children[4].innerHTML;
	document.getElementById("edtname").value  = data.children[2].innerHTML;
	document.getElementById("edtifcs").value  = data.children[5].innerHTML;
	document.getElementById("edtmob").value  = data.children[3].innerHTML;
	document.getElementById("edtaccType").value  = data.children[6].innerHTML;
	document.getElementById("edtibreqkid").value  = data.children[8].innerHTML; 

}  


	function editInfo(purpose)
{   var sPwd ;
if(document.getElementById("etxnpass").value === '') {
	alert("Enter transaction password");
	return;
} else if (document.getElementById("edtaccno").value == '')
{
	alert("Enter account no");
	return;
} else if (document.getElementById("edtname").value == '')
{
	alert("Enter Name");
	return;
} else if (document.getElementById("edtifcs").value == '')
{
	alert("Enter IFSC code");
	return;
} else if (document.getElementById("edtaccType").value == '')
{
	alert("Enter account type");
	return;
}
else { 
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
			  alert(res); 
		 }
		
	 }
}  

function editinfoback(purpose)
{
  window.location.href = "/jsp/main_page.jsp";
}

 function showresult(res) 
		 {
		 
		// if(jspOpenFor=='A' || openFor=='CIBAuth')
		//   {
		var jsonData = JSON.parse(res);
		if(jsonData =='-11') {  
			alert("Request Cancelled due to password mismatch");
		} else { 
			var arrjsonData =jsonData[0];  
	//		var arrjsonData1 = JSON.parse(arrjsonData);
			var fail = arrjsonData.fail;
			var success = arrjsonData.success;
			var retStr = '<table  border="1" bordercolor="#ffffff" align="center" id ="cbfundresponce" style="table-layout: fixed;" cellpadding="0" cellspacing="0"><tr><B>Corporate Banking Payee  Status</B></tr>';
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
		}
//				 }
		 
		 }
	 
function processentryResp ()
{

			var res=http.responseText;
			// var res = '[{\"fail\":[],\"success\":[{\"account\":\"005010001088\",\"remark\":\"Success\"},{\"account\":\"005010001088\",\"remark\":\"Success\"}]}]'
			   var json=JSON.parse(res);
 				
				if(json =='-11') {  
			alert("Request Cancelled due to password mismatch");
		} else {
			    if(json== "-S") {
			     alert("Requested Account Added Successfully");
				 resetValue();
				}
				else if(json== "same") {
				alert("Requested Account Already Added");
				}
				else if(json== "Authorization Failed") {
				alert("Authorization Failed");
				}
				else  {
			     alert("Requested Account Not Added");
				}
				
		}

}

 function resetValue()
 {
	document.getElementById("sPayeeAcc").value = '';
    document.getElementById("sNickName").value = '';
	document.getElementById("payeeName").value= '';
    document.getElementById("payeemob").value='';
    document.getElementById("mob").value = '';
    document.getElementById("sAccountType").value = '';
    document.getElementById("IFSCcode").value = '';
	document.getElementById("txnpass").value ='';
	document.getElementById("mmid").value='';	 
 }
 function authoriseentry()
 {
	
	 var sPwd="";
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
	 	sMode = "CIBAuth";
		var url="/fundtransfer/fund.do?action=ownAccPayee&authjsonStr="+mytotalJsonString+"&sMode="+sMode+"&txnpass="+sPwd;
  	    http.open("POST",url,false);
		http.onreadystatechange= function (){processauthResp()};
		http.send(null);
	
 }

function processauthResp()
 {
	  var res=http.responseText;	
	  showAuthresult(res); 
 }

function bacck()
 {
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performAddPayee&button=back" ;
	document.forms[0].submit();
  }
  
function showAuthresult(res)
{
		
		
var jsonData = JSON.parse(res);
if(jsonData =='-11') {  
			alert("Request Cancelled due to password mismatch");
} else { 
		var arrjsonData =JSON.parse(jsonData[0]);
	    var len = arrjsonData.length;
		var fail = arrjsonData.fail;
		var success = arrjsonData.success;
		var retStr = '<table  border="1" bordercolor="#ffffff" align="center" id ="cbfundresponce" style="table-layout: fixed;" cellpadding="0" cellspacing="0"><tr><B>Corporate Banking Payee Status</B></tr>';
		retStr +='<tr class="dataTableTH"><td><B>Beneficiary Acc. No</B></td><td><B>Status</B></td></tr>';

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
	//	document.getElementById("send").style.display = 'none';
		
	 }
		 
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

function checkWildcard(e)
{

var text = document.getElementById(e).value;
var filter = /^[a-zA-Z ]*$/;
if(!filter.test(text))
{	
alert('Special Characters not Allowed'  );
document.getElementById(e).value="";
document.getElementById(e).focus();
return false;
}
}

 function phonenumber(inputtxt,id)  
{     
  var phoneno = /^\d{10}$/;  
  if(inputtxt.length < 10)
	{
        alert("Mobile no. should be of 10 digits ");  
		 document.getElementById(id).value = "";
	        return false;  
  }
  if((inputtxt.match(phoneno)))  
   {  
      return true; 
	  document.getElementById(id).value = inputtxt;

      } 
      else  
        {  
        alert("Enter Mobile Number properly");  
		  document.getElementById(id).value = "";
        return false;  
        }  
} 

 