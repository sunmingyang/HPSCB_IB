 function cancl()
{    
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performTranAny&&button=cancel"
	document.forms[0].submit();
}
function continu()
{    
	//var uid=document.getElementById("userid").value
    var pwd=document.getElementById("passwd").value
		
	
	 if(pwd=="")
	{
			//alert("<bean:message bundle='hindi' key='7065'/>");
	}

    if( pwd!="")
	{
		disabledControlsOnAction(document.forms[0]);
	//alert("go for bean action");
	document.forms[0].action="../fundtransfer/fund.do?action=performTranAny&&button=transfer"
	document.forms[0].submit();
	}
}