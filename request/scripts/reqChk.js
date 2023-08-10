function Reset()
{
disabledControlsOnAction(document.forms[0]);
document.forms[0].action="/request/reqchk.do?action=executePayOrder&&function=reset" ;
document.forms[0].method="post";
document.forms[0].submit();
}

function back_req(row,prev_page)
{
if(prev_page!='HELP')
	disabledControlsOnAction(document.forms[0]);
	if(row!=null)
	{
		window.location.href="/IBReqProcess/IbreqProcess.jsp?prev_page="+prev_page;	
//	history.back();
	}
	else
	{
		window.location.href="/request/reqChk.jsp";
	}
}

function stop_chk()
{
	disabledControlsOnAction(document.forms[0]);
	window.location.href="/request/reqChk.jsp";
}


function help_req()
{
	disabledControlsOnAction(document.forms[0]);
window.location.href="/request/reqHelp.jsp";
}



function submit_newreq()
{
debugger;
 var AccNO =  document.getElementById("AccNO").value       
 var sessionID =  document.getElementById("sessionId").value      
 var usrid =  document.getElementById("usrid").value 
 var mobNo =  document.getElementById("mobNo").value       
 var purpose="for cheque book request ";
  
if(document.getElementById("s_leaf").value=="")
	{
		alert("Please Enter Leaf Number")
		document.getElementById("s_leaf").value="";
		document.getElementById("s_leaf").focus();
	}
else{
	if (document.getElementById("s_leaf").value%5!=0)
		{
		alert("Please Enter Amount in multiple of 5")
		document.getElementById("s_leaf").value="";
		document.getElementById("s_leaf").focus();
		}
		else
		{
		if (parseInt(document.getElementById("s_leaf").value)>100)
			{
			alert("Please Enter Leaf No less Than equals to 100");
			document.getElementById("s_leaf").value="";
			document.getElementById("s_leaf").focus();
			return false;
			}
		
		var ran=parseInt(Math.random()*9999);

   		var URL ="/TransactionAction.do?action=sendOTP&userID="+usrid+"&sessionID="+sessionID+"&beneficiaryAccNo="+AccNO+"&mobile="+mobNo+"&purpose="+purpose+"&ran="+ran;
    		http.open("POST",URL,false);
		http.send(null);
   	
		disabledControlsOnAction(document.forms[0]);
		document.forms[0].action="/request/reqchk.do?action=executeSetSession";
		document.forms[0].method="post"
		document.forms[0].submit();
		}
}
}



//**** chk_status function*****//

function chk_status()
{
if(document.getElementById("schk_no").value=="")
	{
	alert("Please Enter Cheque Number")
	document.getElementById("schk_no").value="";
	document.getElementById("schk_no").focus();
	}
else
	{
	document.forms[0].action="/request/reqchk.do?action=executeSetSession";
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].method="post"
	document.forms[0].submit();
	}
}


//***** stop_chk() function ****//

function stop_chk_1()
{
if(document.getElementById("schk_no").value=="")
	{
		alert("Please Enter Cheque Number")
		document.getElementById("schk_no").value="";
		document.getElementById("schk_no").focus();
	}
else
	{
	if	(document.getElementById("s_remark").value=="")
		{
		alert("Please Enter Remark")
		document.getElementById("s_remark").value="";
		document.getElementById("s_remark").focus();
		}
		else
		{
		
		
			disabledControlsOnAction(document.forms[0]);
		//window.location.href="../jsp/tran_pass.jsp?prev=stopChk"
			//window.location.href="/request/reqchk.do?action=executeSetSession"
		document.forms[0].action="/request/reqchk.do?action=executeSetSession";

		document.forms[0].method="post"
		document.forms[0].submit();
		}
	}
}
// end of stop_chk function//



function quant_req()
{
if(document.getElementById("s_minamt").value=="")
	{
		alert("Please Enter Minimum Amount")
		document.getElementById("s_minamt").value="";
		document.getElementById("s_minamt").focus();
	}
else
	{
	if (document.getElementById("s_minamt").value%5000!=0)
		{
		alert("Please Enter Amount in multiple of 5000")
		document.getElementById("s_minamt").value="";
		document.getElementById("s_minamt").focus();
		}
		else
		{
			if(document.getElementById("s_minbal").value=="")
			{
			alert("Please Enter Minimum Balance")
			document.getElementById("s_minbal").value="";
			document.getElementById("s_minbal").focus();
	
			}
			else
			{
				if((document.getElementById("s_minbal").value < "10000")&& (document.getElementById("s_minbal").value%1000!=0))
				{
				alert("Please Enter Amount greater than 10000.00 in multiples of 1000")
				document.getElementById("s_minbal").value="";
				document.getElementById("s_minbal").focus();
				}
				else
				{
					disabledControlsOnAction(document.forms[0]);
				//window.location.href="../jsp/tran_pass.jsp?prev=flexFd"
			//	window.location.href="/request/reqchk.do?action=executeSetSession"
			document.forms[0].action="/request/reqchk.do?action=executeSetSession";

		document.forms[0].method="post"
		document.forms[0].submit();
				}
			}
		}
	}
}


//*********submit_ldeb*********//


function submit_ldeb()
{
	if(document.getElementById("scard_no").value=="")
	{
		alert("Please Enter Card Number")
		document.getElementById("scard_no").value="";
		document.getElementById("scard_no").focus();
	}
	else
	{
			if (document.getElementById("sname").value=="")
			{
			alert("Please Enter Name")
			document.getElementById("sname").value="";
			document.getElementById("sname").focus();
			}
			else
			{
				disabledControlsOnAction(document.forms[0]);
			//window.location.href="../jsp/tran_pass.jsp?prev=Idebcard"
			//	window.location.href="/request/reqchk.do?action=executeSetSession"
			//document.forms[0].action="reqchk.do?action=execute_lossdeb";
			//document.forms[0].method="post"
			//document.forms[0].submit();
		document.forms[0].action="/request/reqchk.do?action=executeSetSession";

		document.forms[0].method="post"
		document.forms[0].submit();
			}
	
	}
}



//*********mob_comm() function**********//


function mob_comm()
{
	if(document.getElementById("sname").value=="")
	{
		alert("Please Enter Name")
		document.getElementById("sname").value="";
		document.getElementById("sname").focus();
	}
	else
		{
			if (document.getElementById("scellno").value=="")
			{
			alert("Please Enter Cellular Number")
			document.getElementById("scellno").value="";
			document.getElementById("scellno").focus();
			}
			else
			{
				if (document.getElementById("srelno").value=="")
				{
				alert("Please Enter Relationship Number")
				document.getElementById("srelno").value="";
				document.getElementById("srelno").focus();
				}
				else
				{
				
				disabledControlsOnAction(document.forms[0]);
				//window.location.href="../jsp/tran_pass.jsp?prev=mobcomm"
//					window.location.href="/request/reqchk.do?action=executeSetSession"document.forms[0].action="//request/reqchk.do?action=executeSetSession";
document.forms[0].action="/request/reqchk.do?action=executeSetSession";
		document.forms[0].method="post"
		document.forms[0].submit();
				
				}
			}
		}
}

function submit_fd()
{
	if ( !(document.forms[0].sScheme[0].checked)&&!(document.forms[0].sScheme[1].checked))
	{
		alert("Please select any one among Traditional & Cumulative Scheme")
	}
		else
		{
			if (document.forms[0].sScheme[0].checked)
				{
					if((document.getElementById("sYear").value=="Year")||(document.getElementById("sMonth").value=="Month")||(document.getElementById("sDay").value=="Day"))
					{
						alert("Please Select Year, Month & Day")
					}
					else
						{
							if(document.getElementById("sAmt").value<=0)
							{
								alert("Please Enter Amount greater than 0")
							}
							else
							{
								if ( !(document.forms[0].sDur[0].checked)&&!(document.forms[0].sDur[1].checked))
								{
									alert("Please select any one among Monthly & Quaterly duration")
								}
								else
								{
									disabledControlsOnAction(document.forms[0]);
							//	window.location.href="../jsp/tran_pass.jsp?prev=fdReq"
								//window.location.href="/request/reqchk.do?action=executeSetSession"
document.forms[0].action="/request/reqchk.do?action=executeSetSession";
								document.forms[0].method="post"
								document.forms[0].submit();
									//document.forms[0].action="reqchk.do?action=execute_fixdep";
									//document.forms[0].method="post"
									//document.forms[0].submit();
								}
							}
						}
					}

			else
				{
				if (document.forms[0].sScheme[1].checked)
						{
						if((document.getElementById("sYear").value=="Year")||(document.getElementById("sMonth").value=="Month")||(document.getElementById("sDay").value=="Day"))
							{
								alert("Please Select Year, Month & Day")
							}
						else
							{
								if(document.getElementById("sAmt").value<=0)
								{
									alert("Please Enter Amount greater than 0")
								}	
								else
								{
									if((document.forms[0].sDur[0].checked)||(document.forms[0].sDur[1].checked))
									{
										alert("Please leave these entries.These entries are for traditional scheme only")
											return false;

									}
									else
									{
										disabledControlsOnAction(document.forms[0]);
									//	window.location.href="../jsp/tran_pass.jsp?prev=fdReq"
										//window.location.href="/request/reqchk.do?action=executeSetSession"
										
document.forms[0].action="/request/reqchk.do?action=executeSetSession";
										document.forms[0].method="post"
										document.forms[0].submit();
										//document.forms[0].action="reqchk.do?action=execute_fixdep";
										//document.forms[0].method="post"
									}//	document.forms[0].submit();
								}
							}
						}
				}
		}
}

		
function reset_fd()
{
	disabledControlsOnAction(document.forms[0]);
window.location.href="/request/fdreq.jsp";
}


function rd_submit()

{


if(document.getElementById("sAmt").value=="")
{

alert("please Enter the Amount");
document.getElementById("sAmt").focus();
return false;
}

if(document.getElementById("sAmt").value.length>24)
{
alert("please Enter the Amount in Correct Digit limit");
document.getElementById("sAmt").focus();
return false;
}


if(document.getElementById("sYear").value=="")
{
alert("please select the year");
document.getElementById("sYear").focus();
return false;
}

if(document.getElementById("sMonth").value=="")
{

alert("please select the month");
document.getElementById("sMonth").focus();
return false;
}


else
{
	disabledControlsOnAction(document.forms[0]);
//window.location.href="../jsp/tran_pass.jsp?prev=rdReq"
	//window.location.href="/request/reqchk.do?action=executeSetSession"
			document.forms[0].action="/request/reqchk.do?action=executeSetSession";
		document.forms[0].method="post"
		document.forms[0].submit();
	//document.forms[0].action="/request/reqchk.do?action=execute_rdreq";		
	//document.forms[0].method="post";
	//document.forms[0].submit();
}	
	}
	
	
	////////////Pay Order By paresh /////
	
	function selectState()
{   
var ind=document.getElementById("sState").selectedIndex;
var val=document.getElementById("sState").options[ind].value;
document.getElementById("sState").value=val;

var doc=document.getElementById("sDoc").selectedIndex;
var val_doc=document.getElementById("sDoc").options[doc].value;
document.getElementById("sDoc").value=val_doc;

	disabledControlsOnAction(document.forms[0]);
document.forms[0].action="/request/reqchk.do?action=executePayOrder" ;
document.forms[0].method="post";
document.forms[0].submit();
 }
 
 
 
 function Continue()
{

	var amount=document.getElementById("sAmount").value;
	var pname=document.getElementById("sEPayName").value;
	var adress=document.getElementById("sEPayAdd1").value;
	var pstate=document.getElementById("sState").value;
	var spannum=document.getElementById("sPanNum").value;
	if(amount=="")
    {
			showMessage(7064,"hindi");
	}else if(pname=="")
	{
			showMessage(7065,"hindi");
	}else if(adress=="")
	{
		    showMessage(7066,"hindi");
	}else if(pstate=="Select State")
	{
     		showMessage(7067,"hindi");
	}else if(spannum=="")
	{
		    showMessage(7068,"hindi");
	}
	if(amount!="" && pname!="" && adress!="" && pstate!="Select State" && spannum!="" )	
	{
	
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="/request/reqchk.do?action=executePayOrder&&function=submit";
	document.forms[0].submit();
	}

}