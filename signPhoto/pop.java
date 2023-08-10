







function openHelpPanel(code, id, name, type, search1, search2,search3)
{
	
	var bar = "width = 580, height= 250, left=50, top=100, scrollbars=no";
	var send = "Code="+code+"&Kid="+id+"&Name="+name+"&Type="+type
		+"&Criteria1="+search1+"&Criteria2="+search2+"&Criteria3="+search3;
	var win = open("/BancMate/common/HelpPanel.do?"+send, "child", bar);
	
}

//	document.forms[0].action="/bancmateib/signPhoto/SignPhoto.do";
//	document.forms[0].method="post";
//	document.forms[0].submit();