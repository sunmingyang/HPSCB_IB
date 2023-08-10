function revertColor(r,l)
 {
	for(i=0; i<l;i++) 
	{
		document.getElementById("text"+r+i).className="TableText";
	}
}



function changeColor_new(r,l,k)
 {
	for(i=0; i<l;i++) 
	{
	   for(h=0;h<k;h++)
	   {
	   
			if(document.getElementById("text"+h+i).className=="SelectText")
			{
			document.getElementById("text"+h+i).className="TableText"
			}
		
	}// end of h loop
	
	}
		
		
	
	
	for(i=0; i<l;i++) 
	{
		
	 
		
		document.getElementById("text"+r+i).className="SelectText"
		
		
	
	}// end of i loop



	try
	{
		document.getElementById("SelectedRow").value = r;
	}
	catch(Error)
	{
		//alert("SelectedRow not found");
	}
}


/*
Change the BackGround color on onFocus in HelpPanels
*/
function changeColor(r,l)
 {
	for(i=0; i<l;i++) 
	{
		document.getElementById("text"+r+i).className="SelectText";
	}
	try
	{
		document.getElementById("SelectedRow").value = r;
	}
	catch(Error)
	{
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


function getFocus() {
	try{
		document.getElementById("text"+0+0).focus();
	}catch(Error){}
}



function setOnPage(j)
{
	//alert("ghj")
	//alert(document.getElementById("text"+j+1).value);
	window.opener.document.getElementById("sCity_Code").value = 
	document.getElementById("text"+j+0).value;
	window.close();
}




