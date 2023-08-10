function retrive()
  { 
	//alert("retrive");
	var str=document.getElementById("sUsrList").value;
		//alert(str);
		document.getElementById("viewpayee").value=str;
			disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performViewPayee&&button=retrive" ;
	document.forms[0].submit();
  }

function bacck()
  {
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performViewPayee&&button=back" ;
	document.forms[0].submit();
  }
 function dolete()
  {
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performViewPayee&&button=delete" ;
	document.forms[0].submit();
  }
 function retrive1()
  { 
	//alert("retrive1");
	var str=document.getElementById("sUsrList").value;
	//alert(str);
		document.getElementById("viewpayee").value=str;
			disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performViewPayee&&button=retrive1" ;
	document.forms[0].submit();
  }