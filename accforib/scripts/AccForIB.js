
function acclist()
{
	if(document.getElementById("userid").value!="" || document.getElementById("brncode").value!="")
	{
		document.forms[0].action="/accforib/activate.do?action=getUserInfo";
		document.forms[0].submit();
	}
	else if(document.getElementById("brncode").value=="")
	{
		alert("Enter Branch Code");
		document.getElementById("brncode").focus();
	}
	else
	{
		alert("Enter User ID");
		document.getElementById("userid").focus();
	}
}

function backHome()
{
document.forms[0].action="/accforib/user_info.do?action=adminLogout";
document.forms[0].submit();
}



 function check_existUser()
{

if(document.getElementById("sBrnCde").value=="")
{
alert("Please Enter the Branch Code");
document.getElementById("sBrnCde").focus();
return false;
}
if(document.getElementById("sAcc_Num").value=="")
	{
	alert("Please Enter the Account No");
	document.getElementById("sAcc_Num").focus();
	return false;
	}
if(document.getElementById("sAcc_Num").value=="0")
	{
	alert("Please Enter the Account No");
	document.getElementById("sAcc_Num").focus();
	return false;
	}

/*if( checkForNumber(document.getElementById("sAcc_Num").value)==false)
	{
	alert("Please enter customer id  in correct format");
	disabledControlsOnAction(document.forms[0])
	document.getElementById("sAcc_Num").value="";
	document.getElementById("sAcc_Num").focus();
	return false;
	}
*/	
	else
	{
	disabledControlsOnAction(document.forms[0])
	document.forms[0].action="/accforib/user_info.do?action=getUserInfo";		
	document.forms[0].method="post"
	document.forms[0].submit();
	}
}



//for UserCreateExt.jsp
 function check_existUser1()
{

if(document.getElementById("sBrnCde").value=="")
{
alert("Please Enter the Branch Code");
document.getElementById("sBrnCde").focus();
return false;
}
if(document.getElementById("sAcc_Num").value=="")
	{
	alert("Please Enter the Account No");
	document.getElementById("sAcc_Num").focus();
	return false;
	}
if(document.getElementById("sAcc_Num").value=="0")
	{
	alert("Please Enter the Account No");
	document.getElementById("sAcc_Num").focus();
	return false;
	}

/*if( checkForNumber(document.getElementById("sAcc_Num").value)==false)
	{
	alert("Please enter customer id  in correct format");
	//disabledControlsOnAction(document.forms[0])
	document.getElementById("sAcc_Num").value="";
	document.getElementById("sAcc_Num").focus();
	return false;
	}
*/	
	else
	{
	disabledControlsOnAction(document.forms[0])
	document.forms[0].action="/accforib/user_info.do?action=getUserInfoDiffBrn";		
	document.forms[0].method="post"
	document.forms[0].submit();
	}
}


function saveUser_Info()
{
flag="false"
 tot=document.forms[0].acc_num.length;
  if(tot > 1 ) // if multiple row of accounty are present
  {
  
	for(i=0;i<tot;i++)
	{
		if(document.forms[0].check[i].checked==true)
		{
		flag="true"
		if(i==0)
		{
		document.getElementById("sAll_chk_acc_num").value=document.forms[0].acc_num[0].value;
		}
		else
		{
		document.getElementById("sAll_chk_acc_num").value=document.getElementById("sAll_chk_acc_num").value+","+document.forms[0].acc_num[i].value;
		//alert(document.getElementById("sAll_chk_acc_num").value);
		}
		}// if ends 
 }// for loop end 
 }//  if ends here 
 
  else // single row of account 
  {
  if(document.forms[0].check.checked)
		{
		flag="true" ; 
		document.getElementById("all_chk_acc_num").value=document.forms[0].acc_num.value;
	
		}
   
   
  }
  
  if(flag=="false")
  {
	  alert("please slecet a account number of internet banking ");
	  return false;
  }
	
	document.forms[0].action="/accforib/user_info.do?action=saveUserInfo";
		
		document.forms[0].method="post"
			disabledControlsOnAction(document.forms[0])
		document.forms[0].submit();
		
		
//check_existUser();

} // function ends here

// THIS FUNCTION IS FOR SWITHCH B/T THE DIVISIONS //



function saveUser_Info1()
{
flag="false"
 tot=document.forms[0].acc_num.length;
  if(tot) // if multiple row of accounty are present
  {
  
	for(i=0;i<tot;i++)
	{
		if(document.forms[0].check[i].checked==true)
		{
			flag="true"
			if(i==0)
			{
				document.getElementById("sAll_chk_acc_num").value=document.forms[0].acc_num[0].value;
			}
			else
			{
				document.getElementById("sAll_chk_acc_num").value=document.getElementById("sAll_chk_acc_num").value+","+document.forms[0].acc_num[i].value;
			//alert(document.getElementById("sAll_chk_acc_num").value);
			}
		}// if ends 
 }// for loop end 
 }//  if ends here 
 
  else // single row of account 
  {
 // alert("Single Row")
  if(document.forms[0].check.checked==true)
		{
		flag="true"
		document.getElementById("sAll_chk_acc_num").value=document.forms[0].acc_num.value;
	//	alert(document.getElementById("sAll_chk_acc_num").value)
		}
   
   
  }
  
  if(flag=="false")
  {
	  alert("please slecet a account number of internet banking ");
	  return false;
  }
  
	document.forms[0].action="/accforib/user_info.do?action=saveUserInfoByUsrId";
		
		document.forms[0].method="post"
			disabledControlsOnAction(document.forms[0])
		document.forms[0].submit();
		
		
//check_existUser();

} // fun








function check_of_detailform()
{

if(document.getElementById("sEName").value=="")
{
alert("please enter the name of user");
document.getElementById("sEName").focus();
return false;
}


if(document.getElementById("sEAddress1").value=="" && document.getElementById("sEAddress2").value=="")
{

alert("please enter the address of user");
return false;
}




if(document.getElementById("sPin_Code").value!="" && document.getElementById("sPin_Code").value.length<6)
	{
	alert("Please Enetr pincode in correct format") 
	document.getElementById("sPin_Code").value=""
	document.getElementById("sPin_Code").focus();
	return false;
	}


if(document.getElementById("sEmail").value!="")
	{
	
	if(isValidEMail("sEmail")==false )
		{
	
	alert("Email Id is in Valid!!!") 
	document.getElementById("sEmail").value=""
	document.getElementById("sEmail").focus();
	return false;
   		}
	
	}





 return true;
}// end of func





function user_detail2()
{

if(document.getElementById("second_user").style.display!="none")
{
	
	gg=check_of_detailform();
	if(gg==false)
	{
	//alert(gg)
	return gg;
 	}
 
}
 
 
 if(document.getElementById("first_admin").style.display=="block")
	{
	document.getElementById("first_admin").style.display="none";
	document.getElementById("second_user").style.display="block";
	document.getElementById("sEName").focus();
	}

else
	{
	document.getElementById("first_admin").style.display="block";
	document.getElementById("second_user").style.display="none";

}



}
// fun ends 
