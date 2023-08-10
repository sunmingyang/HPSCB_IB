// JavaScript Document
function onSubmitMail(msg,contextPath){
alert('Enters')
if(isNull('document.forms[0]','fromemail') || isNull('document.forms[0]','toemail') || isNull('document.forms[0]','subject')||isNull('document.forms[0]','msg'))
	alert(msg);
else{
	document.forms[0].action=contextPath +"/mail/mailComposeAction.do?action=executeOnSubmit";
	document.forms[0].method="post";
	document.forms[0].submit();
}
}

function onCancelCompose(contextPath){
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
	from=document.getElementById('fromemail').value;
	to=document.getElementById('toemail').value;
	sub=sub + document.getElementById('subject').value;
	msg='\n\n-----------------------------------------\n'+from +'  wrote::\n\n' + document.getElementById('msg').value;
	document.getElementById('subject').value=sub;
	document.getElementById('fromemail').value=to;
	document.getElementById('toemail').value=from;
	document.getElementById('ccemail').value='';
	document.getElementById('msg').value=msg;
	document.getElementById('msg').focus();
}
function enabledComposePage(userType){
	document.getElementById('subject').readOnly=false;
	document.getElementById('fromemail').readOnly=false;
	document.getElementById('toemail').readOnly=false;
	document.getElementById('ccemail').readOnly=false;
	document.getElementById('msg').readOnly=false;
	document.getElementById('reply').disabled=true;
	document.getElementById('send').disabled=false;
	document.getElementById('reset').disabled=false;
	document.getElementById("attachedFiles").value ="";
	document.getElementById("recv_Att_div").style.display ="none";
	alert("userType ::: "+userType);
	if(userType=="B")
		document.getElementById("send_Att_div").style.display ="block";
}