function check_Fund()
{

	if(document.forms[0].select[0].checked||document.forms[0].select[1].checked)
	{
		disabledControlsOnAction(document.forms[0]);								 
		document.forms[0].action="/fundtransfer/fund.do?action=performFundAction";
		document.forms[0].submit();
	}
	else
		{
		disabledControlsOnAction(document.forms[0]);
		document.forms[0].action="/fundtransfer/fund.do?action=performFundAction";
		
		document.forms[0].submit();
		}
}

function check_transfer()
{
	if(document.getElementById("amount").value=="")
	    {
	alert("Plase enter The Amount ");
		}
	

	
	if(document.getElementById("amount").value!="" )
	   {
	   	disabledControlsOnAction(document.forms[0]);
	    document.forms[0].action="../fundtransfer/fund.do?action=performTransAction&&button=pay" ;
	    document.forms[0].submit();
	    }
 
}

function Back()
{    
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performTransAction&&button=back";
	document.forms[0].submit();
}


 function cancl()
{    

window.location.href="/fundtransfer/transfer.jsp";
}
function continu()
{    
	
   
		
	
	if(document.getElementById("passwd").value=="")
	{
			alert("Please Enter the password");
	}

    if(document.getElementById("passwd").value!="")
	{
			disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performTransAction&&button=ok"
	document.forms[0].submit();
	}
}