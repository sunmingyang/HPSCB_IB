
function cancl()
{    
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performTransAction&&button=baak"
	document.forms[0].submit();
}