function authenticationvalid()
{
			if(document.getElementById("userId").value!='' && document.getElementById("password").value!='')
			{
				document.getElementById("banker").action = "/jsp/TransactionAction.do?action=executeAuthentication";
				document.getElementById("banker").method="POST";
				document.getElementById("banker").submit();	 
			}
			else
			{
					   alert("Imcomplete Entries");
					   return;
			}
}
function fill()
{
			document.getElementById("userId").focus();
          	if(document.getElementById("banker").errormessage.length==0)
			{

					document.getElementById("errorhead").style.display = "none";	
					document.getElementById("diverrmessage").style.display = "none";	
			}
}
function submitTransaction()
{
			if(document.getElementById("acno").value !='' && document.getElementById("acno").value !='0' && document.getElementById("amount").value !='' && document.getElementById("amount").value !='' )
				{
						document.getElementById("transaction").action = "/jsp/TransactionAction.do?action=saveTransaction";
						document.getElementById("transaction").method="POST";
						document.getElementById("transaction").submit();	 
				}
				else
				{
						alert("Imcomplete Entries");
						return;
				}
}	
function getAcDetail()
{
	if(trim(document.getElementById("acno").value) =="" || trim(document.getElementById("acno").value) =="0" )
		{
			alert("A/C No. Can't Blank");
			document.getElementById("acno").value ="";
			document.getElementById("acno").focus();
			return;
		}
	else
		{
		 		document.getElementById("transaction").action = "/jsp/TransactionAction.do?action=fetchAcDetails";
     			document.getElementById("transaction").method="POST";
			    document.getElementById("transaction").submit();	
		}
}	
function filltransaction()
{
	
	        showHide(document.getElementById("tranType").value);
			if(document.getElementById("transaction").errormessage.length==0)
			{
					document.getElementById("errorhead").style.display = "none";	
					document.getElementById("diverrmessage").style.display = "none";	
			}
}
function showHide(tranType)
{
		  tranType=trim(tranType);
		  if(tranType=='D')
			{
              		   td_balance1.style.display = "none";
					   td_balance2.style.display = "none";
					   td_balance3.style.display = "none";
			}
			else
			{
			     	   td_balance1.style.display = "block";
					   td_balance2.style.display = "block";
					   td_balance3.style.display = "block";
			}
}
function closeWindow(message)
   { 
		   var val = confirm(message);
		   if(val){
					document.getElementById("transaction").action = "/jsp/TransactionAction.do?action=executeLogout";
					document.getElementById("transaction").method="POST";
					document.getElementById("transaction").submit();	 
				  } 
}
function isValidNumberNew()
{
	 var c=	event.keyCode;
     if(!(c>=48 && c<=57))
	  {
        event.preventDefault();
      }
}