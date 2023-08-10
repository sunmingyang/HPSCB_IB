// JavaScript Document


function fetch()
{
	if(isValidDateFormat("sDate1")==false)
	{
		alert("Please Enter first date in valid dd/mm/yyy format")
		document.getElementById("sDate1").value="";
		document.getElementById("sDate1").focus();
		return false;
	}
	if(isValidDateFormat("sDate2")==false)
	{
		alert("Please Enter second date in valid dd/mm/yyy format")
		document.getElementById("sDate2").value="";
		document.getElementById("sDate2").focus();
		return false;
	}

	document.forms[0].action="/IBReqProcess/ibreqProcess.do?action=fetchRequests&flag=second";
}


function save_data()
{

//window.location.href="";
//document.forms[0].submit();
alert("action is "+document.forms[0].action);
document.forms[0].action="/IBReqProcess/ibreqProcess.do?action=saveRequests";
//document.forms[0].method="post";
alert("action is "+document.forms[0].action);
document.forms[0].submit();
}