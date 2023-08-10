var http=createRequestObject();
function createRequestObject(){
	var req;
	if(window.XMLHttpRequest){
		req=new XMLHttpRequest();
	}
	else if(window.ActiveXObject){
		req=new ActiveXObject("Microsoft.XMLHTTP");
	}else{
		alert("Browser is not IE 5 or higher, or Firefox or Safari or Opera"); 
	}
	return req;
}

function disabledControlsOnAction(form,from){

		for(var i=0; i<form.elements.length; i++)
			{
			
			if(form.elements[i].type == "text" && form.elements[i].readOnly==false)
			{
				form.elements[i].readOnly = true;
			}
		
			else if(form.elements[i].type == "button")
			if(form.elements[i].name=="back")
				form.elements[i].disabled = false;
			else
				form.elements[i].disabled = true;
			else if(form.elements[i].type == "select")
				form.elements[i].disabled = true;
				
			
			else if(form.elements[i].type == "checkbox" && from=="ibreq")
				form.elements[i].disabled = true;
			else if(form.elements[i].type == "radio" && from=="ibreq")
				form.elements[i].disabled = true;
			else if(form.elements[i].type == "img")
				form.elements[i].disabled = true;
			else if(form.elements[i].type == "reset")
				form.elements[i].disabled = true;
				
		
			 else  if(form.elements[i].type == "select-one" && from=="ibreq")
					  
				form.elements[i].disabled = true;
			}
		
			
	}

function parorder()
{
disabledControlsOnAction(document.forms[0])
	document.forms[0].action="/payorder/demdraft.do" ;
	document.forms[0].method="post";
    document.forms[0].submit();
}

function TransPass_submit(prev)
{
		disabledControlsOnAction(document.forms[0])
		document.forms[0].action="/request/reqchk.do?action=executeTranPass";
		document.forms[0].method="post"
		document.forms[0].submit();
}

//Added by Prakash on 1 August 2006 on Browser X Button
function detectCloseWin(){

	var top=self.screenTop;
	if(top>9000){
		//document.forms[0].action="/jsp/login.do?action=ibUsrLogout";
		//document.forms[0].submit();	
		window.open("/jsp/login.do?action=ibUsrLogout&target=close","_blank","width=8,height=6,left=2110,top=2110,scrollbars=0");
	}
}




function city_help()
{
	
	var bar = "width=488,height= 480, left=150, top=20, scrollbars=yes";
	var send = "action=getCityHelp"
	var win = open("/accforib/user_info.do?"+send, "child", bar);
}


function user_logOut()
{
disabledControlsOnAction(document.forms[0])
document.forms[0].action="/jsp/login.do?action=ibUsrLogout";		
document.forms[0].method="post"
document.forms[0].submit();
}

function isValidAmount(evt, source)
{
	evt =(evt)?evt :window.event;
	var charCode =(evt.which)?evt.which :evt.keyCode;
	var amt = source.value;
	var len = parseInt(amt.length);
	var ind = parseInt(amt.indexOf('.'));
	if(isNaN(amt))
	{
		evt.keyCode = 0;
		source.value = ".00";
	}
	if(charCode == 46)
	{
		if(ind>-1)
			evt.keyCode = 0;
	}
	else if(charCode < 48 || charCode >57)
		evt.keyCode = 0;
	else
	{
		if((len - ind)>4 && ind > -1)
			evt.keyCode = 0;
	}
}




function setRow(row,l,length)
{
  for(i=0; i<length; i++)
   {
	  for(j=0; j<l; j++)
	   {
	
	   if( document.getElementById("text"+i+j).className=="SelectText")
	   {
	   document.getElementById("text"+i+j).className="";
	   }
	
	   }
	}
	
   cngAuthColor(row,l);	
}


function cngAuthColor(r,l)
{
  for(i=0; i<l; i++)
	{
			
		document.getElementById("text"+r+i).className="SelectText";
	}	
}





function splitString(targetStr, deLimit)
{
	var sResult = new Array(2);
	var iIndex= targetStr.indexOf("/");
	sResult[0] = targetStr.substring(0,iIndex);
	sResult[1] = targetStr.substring(iIndex+1,targetStr.length);
	return sResult;
}

function isValidPhone(text)
{
	var c= event.keyCode;
	event.keyCode=(!((c>=48 && c<=57)||(c==43) || (c==45)))?0:event.keyCode;
}


function isValidAlpha()
{
	var c= event.keyCode;
	event.keyCode=(!((c>=65 && c<=90) ||(c>=97 && c<=122)|| (c==32) ))?0:event.keyCode;
}

function isValidNumAlpha()
{
	var c= event.keyCode;
	event.keyCode=(!((c>=65 && c<=90) ||(c>=97 && c<=122)|| (c==32)|| (c>=48 && c<=57) ))?0:event.keyCode;
}

function isValidNumber()
{
	var c=	event.keyCode;
	event.keyCode=(!(c>=48 && c<=57))?0:event.keyCode;
}



function checkForNumber(NumText)
{
	lenNum = NumText.length;
	for(i=0; i<lenNum; i++)
	{
		if(NumText.charAt(i)<'0' || NumText.charAt(i)>'9')
		{
			return false;
			break;
		}
	}
	return true;
}




function isValidDatechar(text)
{
	alert("main hoon na----");
	var c= event.keyCode;
	event.keyCode=(!((c>=48 && c<=57)||(c==47)))?0:event.keyCode;
}




function  isValidDateFormat(date)  
{   
  	var date = document.getElementById(date).value; 
         
		 var m = date.substring(3,5);
		 var d = date.substring(0,2);
		 var y = date.substring(6,10);

		if(parseInt(d) < 10)
			d="0"+d;
		if(parseInt(m) < 10)
			m="0"+m;

	if((date.length > 10) ||((date.charAt(2)!="-") &&(date.charAt(2)!="/"))||((date.charAt(5)!="-")&&(date.charAt(5)!="/"))||(d>31) ||(m>12) ||(y<1900))
	{ 
	 	  return false;
	}
	else{
   
		 var m = date.substring(3,5);
		 var d = date.substring(0,2);
		 var y = date.substring(6,10);
	
		if (d==0 ||m==0 ||y==0 )
		{
		 return false;
		 
		}
		
		if(m==01||m==03||m==05||m==07||m==08||m==10||m==12)
		{
			var dmax = 31;
	        
		}
		else 
			if (m==04||m==06||m==09||m==11)
		{
		  var dmax = 30;
		  
		}
		else
		{
			if((y%400==0) || (y%400==0 && y%100!=0)) {
			dmax = 29;
			}
		    else dmax = 28;
		}
		 
        if (d>dmax){
	    return false;
		}
				
 }
	
	return true;
}



function isValidDatechar(text)
{
	var c= event.keyCode;
	event.keyCode=(!((c>=48 && c<=57)||(c==47)))?0:event.keyCode;
}


function isValidPhone(text)
{
	var c= event.keyCode;
	event.keyCode=(!((c>=48 && c<=57)||(c==43) || (c==45)))?0:event.keyCode;
}
function disableRightClick(e)
{

  var message = " For Security reasons, right clicking on site is disabled";
  if(!document.rightClickDisabled) // initialize
  {
    if(document.layers) 
    {
      document.captureEvents(Event.MOUSEDOWN);
      document.onmousedown = disableRightClick;
    }
    else document.oncontextmenu = disableRightClick;
    return document.rightClickDisabled = true;
  }
  if(document.layers || (document.getElementById && !document.all))
  {
    if (e.which==2||e.which==3)
    {
//      alert(message);
      return false;
    }
  }
  else
  {
//    alert(message);
    return false;
  }
}

//Check for Valid EMail
function isValidEMail(text)
{	
	var strMail=document.getElementById(text);
	var lenMail=strMail.value.length;
	var pos1=strMail.value.indexOf('@');
	var pos2=strMail.value.indexOf('.',pos1);
	var pos3=strMail.value.lastIndexOf('.');
	var pos4= strMail.value.lastIndexOf('@');
	var pos5= strMail.value.indexOf('.');
	var startChar=strMail.value.charAt(0);
	if((pos1>0)&&(pos1==pos4)&&(pos2>pos1+1)&&(pos3<lenMail-2)&&!(pos1==pos5+1)&&!(pos3==pos2+1)&&!(parseInt(startChar)))
		return true;
	else{
		strMail.value="";
		return false;
	}
}

//Validity of Amount
//Trims a string 
function trim(str){
	while(str.indexOf(' ')==0){
		str = str.replace(' ', '');
	}
	len = str.length;
	while(str.lastIndexOf(' ') == len-1 && len > 0){
		str = str.substring(0, len - 1);
		len = str.length;
	}
	return str;
}

function alphaNumChat(text)
{
	var c= event.keyCode;
	event.keyCode=(!((c>=65 && c<=90) ||(c>=97 && c<=122)|| (c==32)|| (c>=48 && c<=57)  ||(c==45) ||(c==47) ||(c==46)))?0:event.keyCode;
}

function alphaNumWithoutSpace(text)
{
	var c= event.keyCode;
	event.keyCode=(!((c>=65 && c<=90) ||(c>=97 && c<=122)|| (c>=48 && c<=57) ))?0:event.keyCode;
}

//Allow only alphabets
function isValidAlpha()
{
	var c=	event.keyCode;
	event.keyCode=(!( (c>=65 && c<=90) ||(c>=97 && c<=122)|| (c==32)))?0:event.keyCode;
}

//Allow only Alphanumeric keys
function isValidNumAlpha()
{
	var c= event.keyCode;
	event.keyCode=(!((c>=65 && c<=90) ||(c>=97 && c<=122)|| (c==32)|| (c>=48 && c<=57) ))?0:event.keyCode;
}

//Check for Valid URL
function isValidUrl(text)
{
	var strUrl=document.getElementById(text);
	var lenUrl=strUrl.value.length;
	var pos1=strUrl.value.indexOf('.');
	var pos2=strUrl.value.indexOf('@');
	if((pos1>0)&&(pos1<lenUrl-3)&&(pos2==-1))
		return true;
	else
		return false;
}

//Only numeric keys
function isValidNumber()
{
	var c=	event.keyCode;
	event.keyCode=(!(c>=48 && c<=57))?0:event.keyCode;
}


//Validity of Amount
function isValidAmount(evt, source){
	evt =(evt)?evt :window.event;
	var charCode =(evt.which)?evt.which :evt.keyCode;
	var amt = source.value;
	var len = parseInt(amt.length);
	var ind = parseInt(amt.indexOf('.'));
	if(isNaN(amt)){
		evt.keyCode = 0;
		source.value = ".00";
	}
	if(charCode == 46){
		if(ind>-1)
			evt.keyCode = 0;
	}
	else if(charCode < 48 || charCode >57)
		evt.keyCode = 0;
	else{
		if((len - ind)>4 && ind > -1)
			evt.keyCode = 0;
	}
}

/*
Splits a String at first BackSlash
*/
function splitString(targetStr, deLimit)
{
	var sResult = new Array(2);
	var iIndex= targetStr.indexOf("/");
	sResult[0] = targetStr.substring(0,iIndex);
	sResult[1] = targetStr.substring(iIndex+1,targetStr.length);
	return sResult;
}

/*
	Check if inputted string is a number
*/
function checkForNumber(NumText)
{
	lenNum = NumText.length;
	for(i=0; i<lenNum; i++)
	{
		if(NumText.charAt(i)<'0' || NumText.charAt(i)>'9')
		{
			return false;
			break;
		}
	}
	return true;
}

/*
Open Help Panel acc to specified Conditions
*/
function openHelpPanel(code, id, name, type, search1, search2,search3)
{
	if(document.getElementById(code).readOnly==false)
	{

	var bar = "width = 580, height= 250, left=50, top=100, scrollbars=no";
	var send = "Code="+code+"&Kid="+id+"&Name="+name+"&Type="+type
		+"&Criteria1="+search1+"&Criteria2="+search2+"&Criteria3="+search3;
	var win = open("/BancMate/common/HelpPanel.do?"+send, "child", bar);
	}
}

function openHelpPanelIntroducer(code, id, name,name2, type, search1, search2,search3)
{
	if(document.getElementById(code).readOnly==false)
	{

	var bar = "width = 650, height= 250, left=50, top=100, scrollbars=no";
	var send = "Code="+code+"&Kid="+id+"&Name="+name+"&Name2="+name2+"&Type="+type
		+"&Criteria1="+search1+"&Criteria2="+search2+"&Criteria3="+search3;
	var win = open("/BancMate/common/HelpPanel.do?"+send, "child", bar);
	}
}

function openHelpPanelHardCode(code,id,name,type,search1,search2)
{
	//alert("inside Fun");
	if(document.getElementById(code).readOnly==false)
	{

	var bar = "width = 580, height= 250, left=50, top=100, scrollbars=no";
	var send = "Code="+code+"&Kid="+id+"&Name="+name+"&Type="+type
		+"&Criteria1="+search1+"&Criteria2="+search2;
	var win = open("/BancMate/common/HelpPanelHardCoded.do?"+send, "child", bar);
	}
}
function openHelpPanelBranch(code, id, name,name2, type, search1, search2)
{
	if(document.getElementById(code).readOnly==false)
	{

	var bar = "width = 650, height= 250, left=50, top=100, scrollbars=no";
	var send = "Code="+code+"&Kid="+id+"&Name="+name+"&Name2="+name2+"&Type="+type
		+"&Criteria1="+search1+"&Criteria2="+search2;
	var win = open("/BancMate/common/HelpPanel.do?"+send, "child", bar);
	}
}

/*
	checks Validity of Date on KeyDown event
*/
function isValidDatechar(text)
{
	var c= event.keyCode;
	event.keyCode=(!((c>=48 && c<=57)||(c==47)))?0:event.keyCode;
}

/*
	Checks empty fields returns true if empty
*/
function isNull(form_path, field_name)
{
	field = eval(form_path + "." + field_name);
	if(field.value == "" || field.value == null)
	{
		field.focus();
		field.select();
		return true;
	}
	else
	{
		length_of_value = field.value.length;
		check_value = field.value;
		space_count =0;
		for(var i=0; i<length_of_value; i++)
		{
			if(check_value.charAt(i) == " ")
				space_count++;
		}
		if(space_count == length_of_value)
		{
			field.focus();
			field.select();
			return true;
		}
	}
	return false;
}

var errorArrayValue = new Array();
var errorArrayText = new Array();
var errorArrayType = new Array();
/*
 bAllChecked checks whether all error messages are checked by user or not
*/
var bAllChecked = false;
/*
 Show Error Division
*/
function showErrorTab() {
	if(errorArrayText.length > 0) {
		var styleClass = "ErrorTab";
		if(errorArrayType[0] == "true")
			styleClass = "WarningTab";
		document.write("<TABLE id = \"ErrorTab\" >");
		document.write("<TR>");
		document.write("<TD style=\"WIDTH:650px;\" rowspan = 2 align = top id = \"ErrorTD\" class = " + styleClass + ">");
		document.write("<A id = 'ErrorId' class = \"ErrorLink\" "
			+ " onClick = \"javascript:goToErrorControl()\">1. "
			+ errorArrayText[0] + "</A>");
		document.write("<input type = 'hidden' name = 'hiddenIndex' value = 0>");
		document.write("</TD>");
		document.write("<TD style=\"WIDTH:10px\" nowrap>");
		document.write("<img class = 'Image' src='/BancMate/images/down.gif'"
			+ " onclick = 'goToPrevious()'>");
		document.write("</TD>");
		document.write("<TD rowspan = 2>");
		document.write("<input type = text name = sCount readonly size = 7"
			+ " value = \"1 OF " + errorArrayText.length + "\">");
		document.write("</TD>");
		document.write("</TR>");
		document.write("<TR>");
		document.write("<TD>");
		document.write("<img class = 'Image' src='/BancMate/images/up.gif'"
			+ " onclick = 'goToNext()'>");
		document.write("</TD>");
		document.write("</TR>");
		document.write("</TABLE>");
		if(errorArrayText.length == 1)
			bAllChecked = true;
	} else 
		bAllChecked = true;
}

/*
	Go To Previous Error on the page
*/
function goToPrevious(){
	var ind = document.getElementById("hiddenIndex").value;
	ind = parseInt(ind) - 1;
	if(ind < 0)
		return;
	document.getElementById("hiddenIndex").value = ind;
	document.getElementById("ErrorId").innerHTML = ind + 1 + ". " + errorArrayText[ind];
	try {
		if(errorArrayType[ind] == "true") {
			document.getElementById("ErrorTD").className = "WarningTab";
		} else {
			document.getElementById("ErrorTD").className = "ErrorTab";
		}
	} catch (Error) {
		//alert(Error);
	}
	ind = parseInt(ind) + 1;
	document.getElementById("sCount").value = ind + " OF " + errorArrayText.length;
	if(ind == errorArrayText.length)
		bAllChecked = true;
}

/*
	Go To Next Error on the page
*/
function goToNext(){
	var ind = document.getElementById("hiddenIndex").value;
	ind = parseInt(ind) + 1;
	if(ind >= errorArrayText.length)
		return;
	document.getElementById("hiddenIndex").value = ind;
	document.getElementById("ErrorId").innerHTML = ind + 1 + ". " + errorArrayText[ind];
	try {
		if(errorArrayType[ind] == "true") {
			document.getElementById("ErrorTD").className = "WarningTab";
		} else {
			document.getElementById("ErrorTD").className = "ErrorTab";
		}
	} catch (Error) {
		//alert(Error);
	}
	ind = parseInt(ind) + 1;
	document.getElementById("sCount").value = ind + " OF " + errorArrayText.length;
	if(ind == errorArrayText.length)
		bAllChecked = true;
}

/*
	sets focus on control for which error is clicked 
*/
function goToErrorControl()
{	
	ind = parseInt(document.getElementById("hiddenIndex").value);
	oelement = errorArrayValue[ind];
	try{
		document.getElementById(oelement).focus();
		document.getElementById(oelement).select();
	}catch(Error){
		//alert(oelement + " is not a form element");
	}
}
function goToErrorControlByRemit(selectBox)
{	
	if(document.getElementById(selectBox).options.length!=0)
	{
		var str=document.getElementById(selectBox).selectedIndex;
		var str1=document.getElementById(selectBox).options[str].value;
		if(document.getElementById(str1).readOnly==true)
			return;
		oelement= document.getElementById(str1);
		oelement.focus();
		oelement.select();
	}
}
/* - Cust id related Function   */
//******************** Required In Custid**************
function currentDateCompare(cDate,uDate)  
 {
		 var uDate = document.getElementById(uDate).value; 
	     var Day1 =   cDate.substring(0,2);
		 var Month1 = cDate.substring(3,5);
		 var Year1 =  cDate.substring(6,10);
		

		 var Month2 = uDate.substring(3,5);
		 var Day2 =   uDate.substring(0,2);
		 var Year2 =  uDate.substring(6,10);

		    

		

if((Day2<=Day1&&Month2<=Month1&&Year2<=Year1)||(Day2>=Day1&&Month2<Month1&&Year2<=Year1)||(Day2>=Day1&&Month2>=Month1&&Year2<Year1)||(Day2<=Day1&&Month2>=Month1&&Year2<Year1))
	   return true;
	 
else
	        return false;	

}

function ageCalculation(cDate,dOB) 
{				var Year = 0;
			  	var dOB = document.getElementById(dOB).value;
				var CYear		=cDate.substring(6,10);
				var dOBYear		= dOB.substring(6,10);
				Year = (CYear - dOBYear);
		return Year;							
}


function  isValidDateFormat(date)  
{   
  	var date = document.getElementById(date).value; 
         
		 var m = date.substring(3,5);
		 var d = date.substring(0,2);
		 var y = date.substring(6,10);

	if((date.length > 10) ||((date.charAt(2)!="-") &&(date.charAt(2)!="/"))||((date.charAt(5)!="-")&&(date.charAt(5)!="/"))||(d>31) ||(m>12) ||(y<1900))
	{ 
	 	  return false;
	}
	else{
   
		 var m = date.substring(3,5);
		 var d = date.substring(0,2);
		 var y = date.substring(6,10);
	
		if (d==0 ||m==0 ||y==0 )
		{
		 return false;
		 
		}
		
		if(m==01||m==03||m==05||m==07||m==08||m==10||m==12)
		{
			var dmax = 31;
	        
		}
		else 
			if (m==04||m==06||m==09||m==11)
		{
		  var dmax = 30;
		  
		}
		else
		{
			if((y%400==0) || (y%400==0 && y%100!=0)) {
			dmax = 29;
			}
		    else dmax = 28;
		}
		 
        if (d>dmax)
	    return false;
				
 }
	
	return true;
}


 function dateCompare(dmax,dmin)  
 {

		 var fDate = document.getElementById(dmax).value; 

		 var sDate = dmin;

		if(fDate.indexOf("/")==1)
		fDate = "0" + fDate;
		if(fDate.indexOf("/",3)==4)
			fDate = fDate.substring(0,3) + "0" + fDate.substring(3) ;
		//alert("frdate "+fDate);

		if(sDate.indexOf("/")==1)
			sDate = "0" + sDate;
		if(sDate.indexOf("/",3)==4)
			sDate = sDate.substring(0,3) + "0" + sDate.substring(3) ;
		//alert("todate "+sDate);


	     var Month1 = fDate.substring(3,5);
		 var Day1 =   fDate.substring(0,2);
		 var Year1 =  fDate.substring(6,10);

		
		 var Month2 = sDate.substring(3,5);

		 var Day2 =   sDate.substring(0,2);

		 var Year2 =  sDate.substring(6,10);
	//	 alert("Year1:" + Year1 + ", Year2: " + Year2 + ", Month1: " + Month1 + ", Month2: " +
	//		 Month2 + ", Day1: " + Day1 + ", Day2: " + Day2);
		


	 if((Year1>Year2)||
		 ((Year1==Year2) && (Month1 > Month2)) || 
		 ((Year1==Year2) && (Month1 == Month2) && (Day1 >  Day2)))            
				return true;
	 else
				return false;	

}

function isValidPhone(text)
{
	var c= event.keyCode;
	event.keyCode=(!((c>=48 && c<=57)||(c==43) || (c==45)))?0:event.keyCode;
}

 function dateComparision(dmax,dmin)  
 {
		 var fDate = document.getElementById(dmax).value; 
		 var sDate =  document.getElementById(dmin).value;
		
	     var Month1 = fDate.substring(3,5);
		 var Day1 =   fDate.substring(0,2);
		 var Year1 =  fDate.substring(6,10);
		

		 var Month2 = sDate.substring(3,5);
		 var Day2 =   sDate.substring(0,2);
		 var Year2 =  sDate.substring(6,10);
		


 if((Year1>Year2)||((Year1==Year2)&&(Month1 > Month2)) || (((Year1==Year2) && (Month1 == Month2) && Day1 >  Day2)))            
			return true;
else
	        return false;	

}

function daysDifference(st_date,end_date)
	{

	var str_st_date  = document.getElementById(st_date).value; 
	var str_end_date = document.getElementById(end_date).value;		
	
		var str_day1   = str_st_date.substring(0,2);
		var str_month1 = str_st_date.substring(3,5);
		var str_year1  = str_st_date.substring(6,10);
		
		var str_day2   = str_end_date.substring(0,2);
		var str_month2 = str_end_date.substring(3,5);
		var str_year2  = str_end_date.substring(6,10);


		var   day1   = parseInt(str_day1);
		var   month1 = parseInt(str_month1);
		var   year1  = parseInt(str_year1);
	
		var   day2   = parseInt(str_day2);
		var   month2 = parseInt(str_month2);
		var   year2  = parseInt(str_year2);
		
		var   yeardiff  = year2 - year1;
		var   monthdiff = month2 - month1;
		var   daydiff   = day2  - day1;
		var   count = 0;
		if(daydiff<0||year2<year1||month2<month1)
		{
			//alert("diff");
			return 0;
		}
		if(yeardiff==0&&monthdiff==0)
		{   
			return daydiff;
		}

		if(yeardiff>1)
		{
			count = (yeardiff-1)*12;
			yeardiff = 1;
			
		}
		if(yeardiff == 1)
		{				
			 count = count + 12 - month1 ;
			 count = count + month2;
			 
		}
		if(yeardiff ==0)
		{
			if(monthdiff>1)
			{
				count = count + (monthdiff - 1);
				monthdiff = 1;
			}
			if(monthdiff==1)
			{
				count = count + 1;
				
			}
		}
var   year = year1;

var   mend = 0;
var   start_month = month1;
var   daycount = 0;
	daycount = daycount - day1;
	
while(count > 0)
{
		switch(start_month)
		{
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10:
				case 12: 	mend = 31;
							break;
				case 4:
				case 6:
				case 9:
				case 11:    mend = 30;
							break;
				case 2:  	if(year%4==0)
								mend = 29;
							else
								mend = 28;
							break;
		
				default : alert("Invalid Month...");
			   			    break;
				}			
		
				if(start_month == 12)
				{
					start_month = 1;
					year = year + 1;
					daycount = daycount + mend;
					count = count - 1;
				}
				else
				{
				daycount = daycount + mend;
				count = count - 1;
				start_month = start_month + 1;
				}
	}				

    daycount = daycount + day2;

//	alert("daycount::"+daycount);
return daycount;

}



/*function daysDifference(st_date,end_date)
{

		var str_st_date  = document.getElementById(st_date).value; 
		var str_end_date = document.getElementById(end_date).value;		
	
		var str_day1   = str_st_date.substring(0,2);
		var str_month1 = str_st_date.substring(3,5);
		var str_year1  = str_st_date.substring(6,10);
		alert("str month "+str_month1);
		
		var str_day2   = str_end_date.substring(0,2);
		var str_month2 = str_end_date.substring(3,5);
		var str_year2  = str_end_date.substring(6,10);
		alert("str month "+str_month2);	


		var   day1   = parseInt(str_day1);
		var   month1 = parseInt(str_month1);
		var   year1  = parseInt(str_year1);
	
		var   day2   = parseInt(str_day2);
		var   month2 = parseInt(str_month2);
		var   year2  = parseInt(str_year2);
		alert("year1---> "+year1);
		alert("year2--> "+year2);

		var   yeardiff  = year2 - year1;
		var   monthdiff = str_month2 - str_month1;
		alert("year diff"+yeardiff);
		
		var   daydiff   = day2  - day1;
		var   count = 0;
		if(daydiff<0||year2<year1||str_month2<str_month1)
		{
			return 0;
		}
		if(yeardiff==0&&monthdiff==0)
		{   
			
			return daydiff;
		}

		if(yeardiff>1)
		{
			count = (yeardiff-1)*12;
			yeardiff = 1;
			
		}
		if(yeardiff == 1)
		{				
			 count = count + 12 - str_month1 ;
			 count = count + str_month2;
			 
		}
		if(yeardiff ==0)
		{
			if(monthdiff>1)
			{
				count = count + (monthdiff - 1);
				monthdiff = 1;
			}
			if(monthdiff==1)
			{
				count = count + 1;
				
			}
		}
var   year = year1;

var   mend = 0;
var  start_month = str_month1;
var  daycount = 0;
	daycount = daycount - day1;
	
while(count > 0)
{
		switch(start_month)
		{
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10:
				case 12: 	mend = 31;
							break;
				case 4:
				case 6:
				case 9:
				case 11:    mend = 30;
							break;
				case 2:  	if(year%4==0)
								mend = 29;
							else
								mend = 28;
							break;
		
				default : alert("Invalid Month...");
			   			    break;
				}			
		
				if(start_month == 12)
				{
					start_month = 1;
					year = year + 1;
					daycount = daycount + mend;
					count = count - 1;
				}
				else
				{
				daycount = daycount + mend;
				count = count - 1;
				start_month = start_month + 1;
				}
	}				

    daycount = daycount + day2;

//	alert("daycount::"+daycount);
return daycount;

}
*/
function isValidNumalpha(text)
{
	var c= event.keyCode;
	event.keyCode=(!((c>=65 && c<=90) ||(c>=97 && c<=122)|| (c==32)|| (c>=48 && c<=57) ))?0:event.keyCode;
}

function StopKeyHandler(){

if(window.event.keyCode==116){
//alert(window.event.keyCode);
	window.event.cancelBubble=true;
	window.event.keyCode=0;
	window.event.returnValue=false;
return false;
}
else if(window.event && (window.event.keyCode==8 || window.event.keyCode==116 ) && window.event.srcElement.tagName!='INPUT' && window.event.srcElement.tagName!='SELECT' && window.event.srcElement.tagName!='TEXTAREA' ){
	window.event.cancelBubble=true;
	window.event.returnValue=false;
	window.event.keyCode=0;
return false;
}
}


/*
	Select the Row in case of Authorization
	and deselect also on click
*/
function selectColor(row){
	label = document.getElementById("text"+row);
	//alert(label.className);
	var selectedRow = document.getElementById("SelectedRow").value;
	//alert(selectedRow);
	try{
		label1 = document.getElementById("text"+selectedRow);
		label1.className = "TableLabel";
	}catch(Error){
		//alert(selectedRow);
	}
	label.className = "SelectLabel";
	document.getElementById("SelectedRow").value = row;
}

function alphaNumDot(text)
{
	var c= event.keyCode;
	event.keyCode=(!((c>=48 && c<=57) ||(c==46)))?0:event.keyCode;
}
function checkMe(id)
{
	value=id.value;
	alert("vvvvvv::"+value);
	var posb=0;
	var posf=1;
	var  len=value.length;
	alert("len::"+len);
	var j=1;
	for(i=0;i<len&&j<len;i++)
	{
	   		if(value.charAt(i)==value.charAt(j))
		{
			alert("repeated i=="+i+"j=="+j);
			break;
		}
	   j++;
 
   }
}
// function for the mame allow only / - and dot(.) with numbers and charactors
function alphaNumChat(text)
{
	var len = text.value;
	len = len.length;
	var c=event.keyCode;
	if(len == '0')
	{
		if ((c>=32 && c<=47)||(c>=58 && c<=64)||(c>=91 && c<=96)||(c>=123 && c<=255))
		{
			event.keyCode =0;
			return true;
		}
	}
	else
	{
		event.keyCode=(!((c>=65 && c<=90)||(c>=97 && c<=122)||(c==32)||(c>=48 && c<=57)||(c==45)||(c==47)||(c==46)))?0:event.keyCode;
	}
}
function validatetext(id)
{
	var value=id.value;
	var len=value.length;
	var j=1; 
	if(len==0)
		return;
	for(var i=j+1;i<len && j<len-1;i++,j++)
	{
		if((value.charAt(i)=='.')||(value.charAt(i)=='/')||(value.charAt(i)=='-')||(value.charAt(i)==',')||(value.charAt(i)=='@')||(value.charAt(i)=='#')||(value.charAt(i)=='$')||(value.charAt(i)=='(') ||(value.charAt(i)==')'))
		{
			if((j!=i) && (value.charAt(j)==value.charAt(i)))
			{
				//alert("The special character should not be repeted");
				showMessage(2417,'error');
				//confirm(message);
				id.focus();
				break;
			}
		}
		//j=i+1;
	}
}
function isValidAlphaBrackets(text)
{
	var len = text.value;
	len =len.length;
	var c=event.keyCode;
	if(len == '0')
	{
		if (!((c>=65 && c<=90)||(c>=97 && c<=122)||(c>=48 && c<=57)))
		{
			event.keyCode =0;
			return true;
		}
	}
	else
	{
		event.keyCode=(!((c>=65 && c<=90)||(c>=97 && c<=122)||(c==32)||(c==40)||(c==41)||(c>=44 && c<=57)||(c==64)||(c==35)||(c==36)))?0:event.keyCode;
	}
}
//Function for the amount
function alphaAmount(text)
{
	var c= event.keyCode;
	var value=text.value;
	var start = value.indexOf(".");
	var end = value.lastIndexOf(".");
	if ((value.charAt(0)=='0')||(value.charAt(0)=='.'))
	{
		event.keyCode =0;
		//alert("The Amount should not started with 0 or Dot");
		//alert("<bean:message bundle="<%=errorLang%>"key='2415'/>");
		showMessage(2415,'error');
		text.focus();
		text.value="";
	}
	else if((start!=-1) && (end !=-1)&& (start!=end))	
	{													
		//alert("The dot is not more then one time in amount");
		//alert("<bean:message bundle="<%=errorLang%>" key='2416'/>");
		showMessage(2416,'error');
		text.focus();									
		text.value="";									
	}
	else
	{
		event.keyCode=(!((c>=48 && c<=57) ||(c==46)))?0:event.keyCode;
	}
}
function alfhaDot(text)
{
	var Dot=text.value;
	var start = Dot.indexOf(".");
	var end = Dot.lastIndexOf(".");
	if((start!=-1) && (end !=-1)&& (start!=end))
	{
		//alert("The dot is not more then one time in amount");
		showMessage(2416,'error');
		text.focus();
		text.value="";
	}
}
function isValidNumalpha(text)
{
	var c= event.keyCode;
	event.keyCode=(!((c>=65 && c<=90) ||(c>=97 && c<=122)|| (c==32)|| (c>=48 && c<=57) ))?0:event.keyCode;
}
//This function is use for chacking the validation of the pan card number
function isValidPanNo(text)
{
	var c= event.keyCode;
	var len = text.value;
	len =len.length;
	if(((len >= '0')&&(len <= '4')) || (len == '9'))
	{
		event.keyCode=(!((c>=65 && c<=90) ||(c>=97 && c<=122) ))?0:event.keyCode;
	}
	else if((len >= '5')&&(len <= '8'))
	{
		event.keyCode=(!((c>=48 && c<=57) ))?0:event.keyCode;
	}
	else
	{
		alert("The format of the PAN number is AAAAA1234A ");
	}
}
//This function is use for chacking the length of the PAN number
function isValidPanLength(text)
{
	var c= event.keyCode;
	var len = text.value;
	len =len.length;
	if((len=='10')||(len=='0'))
	{
	}
	else
	{
		alert("The PAN number is of 10 characters and the format is AAAAANNNNA i.e 'ABRPD7634D' ");
		text.focus();
	}
}



function isAlphaNumeric(evt)
{
	evt=(evt)?evt:window.event;
	var charCode=(evt.which)?evt.which:evt.keyCode;
	if(((charCode>47 && charCode<58 )|| ( charCode>64 && charCode<91))|| ( charCode>96 && charCode<123)){
		return false;
	} 
	else{
		evt.keyCode=0;
		return true;
	}		
}

function showdown()
{
	if(!document.condition)
	{
	if(document.layers) 
	  {
		document.captureEvents(Event.KEYPRESS);
		document.onkeypress=showdownevt;
	  }
	  else
	  document.onkeydown=showdownevt;
	  return document.condition = true;
	}

}

function showdownevt(evt)
{
	evt = (evt) ? evt : (window.event) ? window.event : ""
	if(evt)
	{		
		if((evt.keyCode==8)&&(evt.srcElement.type!="text")&&(evt.srcElement.type!="textarea")&&(evt.srcElement.type!="password"))
			{
			//alert("inside backspace detection event");
			cancelkey(evt);
			}
			else if(evt.ctrlKey&&((evt.keyCode==78)||(evt.keyCode==82)))
			{
			alert("inside new window, reload detection event");
			cancelkey(evt);
			}
			else if((evt.altkey)&&(evt.keyCode==37))
			{
			//alert("Stop left cursor (back window)");
			cancelkey(evt);
			}
	}

}

function thirdPartyUrl(url)
{
		alert("You are re-directing to a third party url");
		window.open(url) ; 
}
