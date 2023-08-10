// JavaScript Document
 
 
function diff_screen(acc_num)
{

window.open("e:/weblogic_bancmate/temp/"+acc_num+".text")
}

function detail_statment(acc_num,currency)
{
if(validate_detail()==true)
{
//document.getElementById("sAccnum").value=acc_num;
document.getElementById("sCurrency").value=currency;

document.forms[0].action="/accsum/acc_sum.do?action=detailStmt";
document.forms[0].submit();

if(document.forms[0].sOut_req[1].checked)
{
//diff_screen(acc_num);
}
}
else
return false;
}// end of 


//function detail_stmt(acc_num,currency)
//{

//document.getElementById("sAccnum").value=acc_num;
//document.getElementById("sCurrency").value=currency;
//document.forms[1].action="/accsum/acc_sum.do?action=setDetail";
//document.forms[1].submit();
//}



function back2()
{
	window.location.href="/accsum/AccountsMain.jsp";
}


function back1(mini_detail,acc_num)

{


if(mini_detail=="mini" || mini_detail==null)
{
window.location.href="/accsum/AccountsMain.jsp";
}
else
{
window.location.href="/accsum/detailStmt.jsp?acc_no="+acc_num;
}

}





function validate_detail()
{




if(document.getElementById("sDate1").value=="")
{
alert("Please Enter first date")
document.getElementById("sDate1").value="";
document.getElementById("sDate1").value="";
document.getElementById("sDate1").focus();
return false;
}

else
{

if(isValidDateFormat("sDate1")==false)
{
alert("Please Enter first date in valid dd/mm/yyy format")
document.getElementById("sDate1").value="";
document.getElementById("sDate1").focus();

return false;
}




}


if(document.getElementById("sDate2").value=="")
{

alert("Please Second  date")
document.getElementById("sDate2").value="";
document.getElementById("sDate2").focus();

return false;
}


else
{

if(isValidDateFormat("sDate2") ==false)
{
alert("Please Second  date in valid dd/mm/yyyy format")
document.getElementById("sDate2").value="";
document.getElementById("sDate2").focus();
return false;
}

}

if(document.getElementById("sTrans").value=="" )
{
alert("please enter Last Number of Transaction");
return false;
} 

if( checkForNumber( checkForNumber( document.getElementById("sTrans" ).value ))==false )
{

alert("please enter days in correct format");
return false;
} 

if(document.getElementById("sTrans").value>500 )
{
alert("please enter number of Transaction less than 500");
document.getElementById("sTrans").value=""
document.getElementById("sTrans").focus();
return false;
} 

if(!(document.forms[0].sOut_req[0].checked)&&!(document.forms[0].sOut_req[1].checked)&&!(document.forms[0].sOut_req[2].checked))
{
alert("please select one format for statement ")
return false;
}



return true;



}// end of fumn
