function check()
{   if(document.getElementById("amont").value=="")
	{	}
	
    var ruppes=document.getElementById("amont").value;
	
	if(ruppes!="" )
	{
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performTranAny&&button=pay" ;
	document.forms[0].submit();
	}
    
}

function Back()
{    
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performTranAny&&button=back";
	document.forms[0].submit();
}

function selectPayee()
{   
	disabledControlsOnAction(document.forms[0]);
if(document.getElementById("addpayee").value=="AddPayee")
   window.location.href="../fundtransfer/Addpayee.jsp";
if(document.getElementById("addpayee").value=="ViewPayee")
   window.location.href="../fundtransfer/Viewpayee.jsp";

if(document.getElementById("addpayee").value=="DeletePayee")
   window.location.href="../fundtransfer/Deletepayee.jsp";
  
 }
 	
	function schdetail()
 {	

	 
	 val=document.getElementById("select1").checked;
	 
	 if(val==true)
	 {
		  
		 document.getElementById("show").style.display="none";
	 }
	  if(val==false)
	 {	
         
		 document.getElementById("show").style.display="block";
	 }
	 
 }
 //For confirmEntry.jsp page//
 function cancl()
{    
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performTranAny&&button=cancel";
	document.forms[0].submit();
}
