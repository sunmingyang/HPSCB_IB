
function reset_chgPass_form()
{
document.getElementById("sOld_Pass").value="";
document.getElementById("sNew_Pass").value="";
document.getElementById("sCon_Pass").value="";
//document.getElementById("sTra_Old_Pass").value="";
//document.getElementById("sTra_New_Pass").value="";
//document.getElementById("sTra_Con_Pass").value="";
}


function to_login()
{

window.location.href="loginform.jsp"

}




function pass_submit_form()
{
	if(document.getElementById("sOld_Pass").value=="")
	{
		alert("please enter old password");
		document.getElementById("sOld_Pass").focus();
		return false;
	}

	if(document.getElementById("sNew_Pass").value=="")
	{
		alert("please enter new password");
		document.getElementById("sNew_Pass").focus();
		return false;
	}
	if(document.getElementById("sCon_Pass").value=="")
	{
		alert("please enter confirm password");
		document.getElementById("sCon_Pass").focus();
		return false;
	}
	
	if(document.getElementById("sCon_Pass").value!=document.getElementById("sNew_Pass").value)
	{
		alert("Login new and Confirmed password does not match");
		document.getElementById("sCon_Pass").value="";
		document.getElementById("sNew_Pass").value=""
		document.getElementById("sNew_Pass").focus();
		return false;
	}
	/*
	if(document.getElementById("sTra_Old_Pass").value=="")
	{
		alert("please enter transaction old password");
		document.getElementById("sTra_Old_Pass").focus();
		return false;
	}
	if(document.getElementById("sTra_New_Pass").value=="")
	{
		alert("please enter  transaction new password");
		document.getElementById("sTra_New_Pass").focus();
		return false;
	}
	if(document.getElementById("sTra_Con_Pass").value=="")
	{
		alert("please enter transaction  confirm password");
		document.getElementById("sTra_Con_Pass").focus();
		return false;
	}
	
	if(document.getElementById("sTra_Con_Pass").value!=document.getElementById("sTra_New_Pass").value)
	{
		alert("Transaction new and confirmed password does not match");
		document.getElementById("sTra_Con_Pass").value="";
		document.getElementById("sTra_New_Pass").value=""
		document.getElementById("sTra_New_Pass").focus();
		return false;
	}*/
	else
	{
		document.forms[0].action="/jsp/login.do?action=ibUsrNewPass";		
		document.forms[0].method="post"
		document.forms[0].submit();
	}
}//______FUNCTION ENDS HERE_________



function login_submit()
{
	debugger ; 
	if(document.getElementById("sIbUsr_LogId").value=="")
	{
		alert("Please enter your login ID");
		document.getElementById("sIbUsr_LogId").focus();
		return false;
	}
	if(document.getElementById("sIbUsr_LogPass").value=="")
	{
		alert("Please enter your Password");
		document.getElementById("sIbUsr_LogPass").focus();
		return false;
	}
	Ecodepwd();
	//disabledControlsOnAction(document.forms[0])
	document.forms[0].action="/jsp/login.do?action=ibUsrLogin";
	document.forms[0].method="post"
	document.forms[0].submit();
}




function submit_forpass()
{

if(document.getElementById("sIbUsr_AccNum").value=="")
{
alert("please enter the account number");

document.getElementById("sIbUsr_AccNum").focus();
return false;
}

if(document.getElementById("sIbUsr_Dob").value!="")
{

if( isValidDateFormat("sIbUsr_Dob")==false)
{
alert("please enter valid date dormate");
document.getElementById("sIbUsr_Dob").value=="";
document.getElementById("sIbUsr_Dob").focus();
return false;

}
}

if(document.getElementById("sIbUsr_EAddr1").value=="" &&document.getElementById("sIbUsr_EAddr2").value=="")
{
alert("please enter the Address");
document.getElementById("sIbUsr_EAddr1").focus();
return false;
}

if(document.getElementById("sCity_Code").value=="0")
{
alert("please enter City Code");
document.getElementById("sCity_Code").focus();
return false;
}
if(document.getElementById("sIbUsr_PinCode").value=="")
{
	alert("Please Enetr pincode") 
	document.getElementById("sIbUsr_PinCode").value=""
	document.getElementById("sIbUsr_PinCode").focus();
	return false;
}

if(document.getElementById("sIbUsr_PinCode").value.length<6)
	{
	alert("Please Enetr pincode in correct format") 
	document.getElementById("sIbUsr_PinCode").value=""
	document.getElementById("sIbUsr_PinCode").focus();
	return false;
	}


else
{
		document.forms[0].action="/jsp/forpass.do?action=ibUsrForgetPass";
		document.forms[0].method="post"
		document.forms[0].submit();
}

}

//Function for get MAC Address on 25/07/2008 
function btnGo_onClick() {  
 // Connect to WMI
  // alert("Inside the  MAC address funtion----->");
  var locator = new ActiveXObject("WbemScripting.SWbemLocator"); 
  var service = locator.ConnectServer("."); 
// Get the info  
  var properties = service.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration");
  var e = new Enumerator (properties);
// Output info 
  var p = e.item ();
  var hid = p.MACAddress; 
//  alert("the value of MAC address is this----->"+hid);
 document.getElementById("sMacAdd").value=hid;
			 
 } 
 
 
function corplogin_submit()
{
	if(document.getElementById("sIbUsr_corpId").value=="")
	{
		alert("Please enter your Corporate ID");
		document.getElementById("sIbUsr_LogPass").focus();
		return false;
	}
	if(document.getElementById("sIbUsr_LogId").value=="")
	{
		alert("Please enter your login ID");
		document.getElementById("sIbUsr_LogId").focus();
		return false;
	}
	if(document.getElementById("sIbUsr_LogPass").value=="")
	{
		alert("Please enter your Password");
		document.getElementById("sIbUsr_LogPass").focus();
		return false;
	}
	Ecodepwd();
	disabledControlsOnAction(document.forms[0])
	document.forms[0].action="/jsp/login.do?action=ibUsrLogin&sMode=CIB";
	document.forms[0].method="post"
	document.forms[0].submit();
}
 