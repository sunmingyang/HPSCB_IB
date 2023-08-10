// JavaScript Document
 
 
function diff_screen(acc_num){
	window.open("e:/weblogic_bancmate/temp/"+acc_num+".text")
}

function detail_statment(acc_num,currency){	
	
	if(validate_detail()==true)	{		
		document.getElementById("sCurrency").value = currency;
		document.forms[0].action="/accsum/acc_sum.do?action=detailStmt";
		document.forms[0].submit();
		//document.getElementById("group_87").style.display = 'block';
		
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



function back2(){
	window.location.href="/accsum/AccountsMain.jsp";
}
function back1(mini_detail,acc_num) {
	if(mini_detail=="mini" || mini_detail==null){
		window.location.href="/accsum/AccountsMain.jsp";
	}
	else{
		window.location.href="/accsum/detailStmt.jsp?acc_no="+acc_num;
	}
}
function validate_detail(){   

   var frdate =document.getElementById("frdate").value;
   var todate =document.getElementById("todate").value;
   if(frdate==""){
   		alert("please enter from Date");
  		document.getElementById("frdate").focus();
   		return false;
   }

 	if(todate==""){
   		alert("please enter  to Date");
  		document.getElementById("todate").focus();
   		return false;
   }

 	

 	if(!(document.forms[0].sOut_req[0].checked)&&
    	!(document.forms[0].sOut_req[1].checked)&&
    	!(document.forms[0].sOut_req[2].checked)&&
    	!(document.forms[0].sOut_req[3].checked)) {
  			alert("please select one format for statement ");
  			return false;
 	}
 	return true;
}
