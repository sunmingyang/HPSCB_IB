function continu()
  { 
	
	if(document.getElementById("sPayeeAcc").value=="" ||document.getElementById("sPayeeAcc").length<16)
	  {
		alert("please enter account number in correct formet");
		return false;
	  }
	  else if(document.getElementById("sNickName").value=="")
	  {
	  	alert("please enter nickname of account holder's name");
		return false;
	  }
	  
	  else if(document.getElementById("sBranchCode").value=="")
	  {
	  	alert("please enter Branch Code");
		return false;
	  }
	  if(document.getElementById("sPayeeAcc").value!="" && document.getElementById("sNickName").value!="")
	  {
  	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performAddPayee&&button=continue" ;
	document.forms[0].submit();
	  }
  }

function bacck()
  {
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performAddPayee&&button=back" ;
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
		//alert("sdsdsds");
	var str=document.getElementById("selectpayee").value;
		alert(str);
		document.getElementById("addpayee").value=str;
		
		disabledControlsOnAction(document.forms[0]);
   document.forms[0].action="/fundtransfer/fund.do?action=performAddPayee&&button=go" ;
   document.forms[0].submit();
 }
 
 
function FindAccType()
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
