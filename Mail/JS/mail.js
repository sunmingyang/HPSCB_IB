// JavaScript Document

var disableYN="N"
var sessionMailNo="N"
var AdminFlag="";
function onSubmitMail(msg,contextPath)
	{
			
			
	if(disableYN=="Y")
	{
		if(isNull('document.forms[0]','subject')||isNull('document.forms[0]','msg'))
			alert(msg);
		else
		{
			document.forms[0].action=contextPath +"/mail/mailComposeAction.do?action=executeOnSubmit";
			document.forms[0].method="post";
			document.forms[0].submit();
		}
	}
	else
	{
		if(AdminFlag=="Y")
		{	
			if(isNull('document.forms[0]','toemail') || isNull('document.forms[0]','subject')||isNull('document.forms[0]','msg'))
			alert(msg);
			else{
				
				document.forms[0].action=contextPath +"/mail/mailComposeAction.do?action=executeOnSubmit";
				document.forms[0].method="post";
				document.forms[0].submit();
			}
		}
		else
		{
			if(isNull('document.forms[0]','subject')||isNull('document.forms[0]','msg'))
			alert(msg);
			else{
				
				document.forms[0].action=contextPath +"/mail/mailComposeAction.do?action=executeOnSubmit";
				document.forms[0].method="post";
				document.forms[0].submit();
			}

		}
	}
}

function onCancelCompose(contextPath){
	document.forms[0].action=contextPath +"/mail/mailInBoxAction.do?action=executeonLoad";
	document.forms[0].method="post";
	document.forms[0].submit();
}

function onCancelOutBox(contextPath){

	document.forms[0].action=contextPath +"/mail/mailInBoxAction.do?action=executeonLoad";
	document.forms[0].method="post";
	document.forms[0].submit();
}


function replyFromCompose(userType){
	
	enabledComposePage(userType);
	var from='';
	var to='';
	var sub='Re: ';
	var msg='';
	if(readingMail=="Y" && AdminFlag=="Y")
	{
		from=document.getElementById('fromemail').value;
	}
	
	if(AdminFlag=="Y")
	{
		to=document.getElementById('toemail').value;
	}
	
	sub=sub + document.getElementById('subject').value;
	msg='\n\n-----------------------------------------\n'+from +'  wrote::\n\n' + document.getElementById('msg').value;
	document.getElementById('subject').value=sub;
	//document.getElementById('fromemail').value=to;
	
	if(AdminFlag=="Y")
	{
		document.getElementById('toemail').value=from;
		document.getElementById('ccemail').value='';
		document.getElementById('fromemail').value=to;
    }
	document.getElementById('msg').value=msg;
	document.getElementById('msg').focus();
	document.getElementById("divReadMail").style.display="none";
	document.getElementById("divReply").style.display="block";
}
function enabledComposePage(userType){
	
	document.getElementById('subject').readOnly=false;
	//document.getElementById('fromemail').readOnly=false;
	
	if(AdminFlag=="Y")
	{
		document.getElementById('toemail').readOnly=false;
		document.getElementById('ccemail').readOnly=false;
	}
	document.getElementById('msg').readOnly=false;
	document.getElementById('reply').disabled=true;
	if(readingMail!="Y")
	{
		document.getElementById('send').disabled=false;
	}
	document.getElementById('reset').disabled=false;
	document.getElementById("attachedFiles").value ="";
	document.getElementById("recv_Att_div").style.display ="none";
	
	if(userType=="B")
		document.getElementById("send_Att_div").style.display ="block";

}