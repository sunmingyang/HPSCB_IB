/*
Change the BackGround color on LoseFocus in HelpPanels
*/
function revertColor(r,l) {
	for(i=0; i<l;i++) {
		document.getElementById("text"+r+i).className="TableText";
	}
}

/*
Change the BackGround color on onFocus in HelpPanels
*/
function changeColor(r,l) {
	for(i=0; i<l;i++) {
		document.getElementById("text"+r+i).className="SelectText";
	}
	try{
		document.getElementById("SelectedRow").value = r;
	}catch(Error){
		//alert("SelectedRow not found");
	}
}

/*
	Selects next or previous row acc. to Arrow Keys
	If enter is pressed then data is transferred to another
	If escape is pressed then window is closed
*/
function selectNextRow(j, evt){
	evt =(evt)?evt :window.event;
	var charCode =(evt.which)?evt.which :evt.keyCode;
	//ENTER Key
	if(charCode==13) {
		var n = parseInt(j);
		document.getElementById("text"+n+"0").ondblclick();
	}
	//ESCAPE Key
	else if(charCode == 27){
		window.close();
	}
	else if(charCode==38)
	{
		var n = parseInt(j)-1;
		if(n>-1)
			document.getElementById("text"+n+"0").focus();
	}
	else if(charCode==40)
	{
		var n = parseInt(j)+1;
		try{
			document.getElementById("text"+n+"0").focus();
		}catch(Error){}
	}
}

/*
set focus on first text box
*/
function getFocus() {
	try{
		document.getElementById("text"+0+0).focus();
	}catch(Error){}
}

/**
Set the selected values on Parent
*/
function setOnPage(j, code, name, kid, name2){
	//alert(kid + code + name +"jhjh"+ name2);
	window.opener.document.getElementById(kid).value = 
		document.getElementById("text"+j+3).value;
	if(name2!=null && name2!='' && name2!='null')
	{
		//alert("for Branch::"+name2+"::");
		window.opener.document.getElementById(name).value = 
		document.getElementById("text"+j+1).value;
		window.opener.document.getElementById(name2).value = 
		document.getElementById("text"+j+2).value;
	}
	else 
	{
		//alert("for others ");		
		window.opener.document.getElementById(name).value = 
		document.getElementById("text"+j+1).value + "/" 
		+ document.getElementById("text"+j+2).value;
	}
	window.opener.document.getElementById(code).value = 
		document.getElementById("text"+j+0).value;
	window.opener.document.getElementById(code).focus();
	window.close();
}