<%@ include file="/common/Include.jsp" %>
<% 
	String Arr= null, usrName="";
	String  custID="";
	String userInfo[][] = null;
	int j; 
	usrName = (String)session.getAttribute("user");
	custID= (String)session.getAttribute("custid");
	userInfo = (String [][])session.getAttribute("userInfo");

	 String acc = request.getParameter("accountNO"); 
	 System.out.println("acc======"+acc);
	
	String brnCode=userInfo[0][1];
//out.writeln(""+request.setAttribute("brnCode",brnCode));
	
	//String loginTime = (String)request.getAttribute("lastLoginTime");
    //String totallogin = (String)request.getAttribute("totallogin");
%>
<script>


function fillData(){
	    var ran=parseInt(Math.random()*9999);
        var URL ="/accsum/acc_sum.do?action=fetchFddetail&custID="+<%=userInfo[0][8]%>+"&accountNO="+'<%=acc %>'+"&ran="+ran; 
	    http.open("POST",URL,false);
		http.onreadystatechange= function (){processAccount()};
		http.send(null);
}
function processAccount(){
	if((http.readyState == 4) && (http.status == 200)){
		var resArray=http.responseText;
		if(resArray !="null" &&resArray!=""){
		var jsonData = JSON.parse(resArray);
	var dtl ='<table align="center" width="90%"><tr><td style="height: 20px; padding-left: 5;font-size: 14; font-family: sans-serif;" width = "20%">'; 		
	dtl+=' Account NO </td> ';
	dtl+='<td id="fdAcc"  style="height: 20px; font-size: 14; font-family: sans-serif;" >';			
	dtl+= jsonData[0][1];
	dtl+='</td></tr>';
	dtl+='<tr><td style="height: 20px;  padding-left: 5;font-size: 14; font-family: sans-serif;" width = "20%";> Name </td>';
	dtl+='<td id="fdname" style="height: 20px;font-size: 14; font-family: sans-serif;">';
	dtl+=jsonData[0][2];
	dtl+='</td></tr></table>';
	document.getElementById("first").innerHTML = dtl;
	var dtlhd ='<table  border="2" bordercolor="#ffff00" align="center" id ="showdtl" style="width: 90%;height: 20px; table-layout: fixed;" cellpadding="0" cellspacing="0" ><tr><TD class="dataTableTH" width="15%" height="20px">Scheme</TD><TD class="dataTableTH" width = "10% "height="20px"> Amount</TD><td class="dataTableTH" width = "10%"height="20px">Maturaty Amount</td><td  class="dataTableTH" width = "10%" height="20px" >Maturaty Date</td><td  class="dataTableTH" width = "25%" height="20px" >Renewal Period</td><td  class="dataTableTH" width = "10%" height="20px"> Select</td></tr></table>';	
	document.getElementById("hed").innerHTML = dtlhd;
	var dtl1 ="" ;
for(var i=0;i<jsonData.length;i++ ){		
  	dtl1+='<table  border="2" bordercolor="#ffff00" align="center" id ="showdt2" style="width: 90%;height: 20px; table-layout: fixed;" cellpadding="0" cellspacing="0"><tr style=" background-color: whitesmoke"><TD  width="15%" style="font-family: Arial;">';
	dtl1+=jsonData[i][8];
    dtl1+='</td>';
 	
	dtl1+='<TD  width = "10%"  style="font-family: Arial;" align="right">';
	dtl1+=parseFloat(jsonData[i][4]).toFixed(2);
    dtl1+='</td>';

dtl1+='<TD  width = "10%"  style="font-family: Arial;"  align="right">';
	dtl1+=parseFloat(jsonData[i][5]).toFixed(2);
    dtl1+='</td>';

	dtl1+='<TD  width = "10%"  style="font-family: Arial;"  align="center">';
	dtl1+=jsonData[i][7];
    dtl1+='</td>';
	if(jsonData[i][9]=="M"){
	dtl1+='<TD  width = "25%" style="font-family: Arial;"> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Year :';
	dtl1+='<input type="text" style="width: 15%;" id="fdyear" onkeypress="isValidNumber()">  month  :';
	dtl1+='<input type="text"  style="width: 15%;" id="fdmonth" onkeypress="isValidNumber()">  Day  :';
	dtl1+='<input type="text"  style="width: 15%;" id="fdday" onkeypress="isValidNumber()"> ';
    dtl1+='</td>';

	dtl1+='<TD  width = "10%"  style="font-family: Arial;">';
	dtl1+='<input type="button" value="Renew" Style="width: 99%;" onclick="renewFD(this)" id="rnw">';
	dtl1+='<input type="hidden" value="'+jsonData[i][3]+'"  id="fdKid">';

	dtl1+='<input type="hidden" value="'+jsonData[i][10]+'"  id="fdi_schid">';
    dtl1+='</td></tr>';
	}else{
	dtl1+='<TD  width = "25%" style="font-family: Arial;"> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Year :';
	dtl1+=' &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; month  :';
	dtl1+=' &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Day  :';
	dtl1+='';
    dtl1+='</td>';
	dtl1+='<TD  width = "10%" style="font-family: Arial;">';
	dtl1+='<input type="button" value="Renew" Style="width: 99%;" id="rnw" disabled>';
    dtl1+='</td></tr>';
	
	
	}
	
}
dtl1+='</table>';  
}
else{
	var dtl1 ='<table align="center" width="90%"><tr><td style="height: 20px; padding-left: 5;font-size: 14; font-family: sans-serif;">'; 		
		dtl1+='<h4>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Record Not Avilable Accoreding to <%=acc %> Account Number</h4>';
	dtl1+='</td></tr></table>';
}
document.getElementById("sec").innerHTML = dtl1;

}
}

function renewFD(ptaddr){
	    var ran=parseInt(Math.random()*9999);
		var pttable=document.getElementById("sec");
		var s=ptaddr.parentNode.parentNode;
		var t=s.rowIndex;
		var ptRowCount=pttable.rows.length;

		var	fdid = pttable.rows[t].childNodes[5].childNodes[1].value;
		var	fdi_schid = pttable.rows[t].childNodes[5].childNodes[2].value;

		var	fdyear = pttable.rows[t].childNodes[4].childNodes[1].value;
		var	fdMonth = pttable.rows[t].childNodes[4].childNodes[3].value;
		var	fdDay = pttable.rows[t].childNodes[4].childNodes[5].value;
		if((fdyear=="")&&(fdMonth=="")&&(fdDay=="")){
		alert("Please Enter Renewal Period")
			document.getElementById("fdyear").focus();
			return false;
		}
        var URL ="/accsum/acc_sum.do?action=renewFD&fdid="+fdid+"&fdDay="+fdDay+"&fdMonth="+fdMonth+"&fdyear="+fdyear+"&fdi_schid="+fdi_schid+"&ran="+ran; 
	    http.open("POST",URL,false);
		http.onreadystatechange= function (){	
		if((http.readyState == 4) && (http.status == 200)){
		var resArray=http.responseText;
		var jsonData = JSON.parse(resArray);
	    pttable.rows[t].childNodes[4].childNodes[1].value="";
		pttable.rows[t].childNodes[4].childNodes[3].value="";
		pttable.rows[t].childNodes[4].childNodes[5].value="";
		if(jsonData=="succ"){
		alert("entry saved success fully for FD renew");
		}else if(jsonData=="invalid"){
		alert("Invalid FD Period");
		}else if(jsonData=="allready"){
		alert("entry allReady saved for FD renew");
		}else{
		alert("entry save unsuccess full for FD renew");
		}
	}};
		http.send(null);

}


function back(){
window.open("accSum.jsp","_self");

}

	
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<!-- <html:form action="/jsp/login.do"> -->
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=acc"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=accSummary&src=acc"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
</tiles:put>
<script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
<body  onload="fillData()">

<table  width="900px"  Style="margin-top: 30;" >
			<tr>
			<td  class="wrapperDataTableTR" align="center" >  FD Renew</td>	
			</tr>
</table>

<table align="center" Style="margin-top: 10;" width="900px" id="first">
</table>
<table align="center" Style="margin-top: 5;"  width="900px" id="hed">
</table>
 <div  style="overflow:auto;height:150PX;width:935px">
<table align="center" Style="margin-left: 20;" width="900px" id="sec">
</table>
</div>



<div align="left" style="margin-left: 476;   margin-top: 50" >
<input type=button value="cancel" id="cancel" onclick="back()">
</div>
</body>

</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp"/>
</tiles:insert>

<script>
function isValidNumber()
{
	
 evt =window.event || arguments.callee.caller.arguments[0];if(evt.altKey||evt.ctrlKey){return;} 
 var c=(evt.which)?evt.which:evt.keyCode;if(navigator.vendor==""){if(evt.key=="ArrowLeft"||evt.key=="ArrowRight"||evt.key=="ArrowUp"||evt.key=="ArrowDown"||evt.key=="Backspace"||evt.key=="Delete"||evt.key=="Tab"||evt.key=="Enter") {return;}}

  if(navigator.appName=="Netscape"){
         if ((c>=48 && c<=57))
   {
   }else evt.preventDefault();
 }else
  {
   evt.keyCode=(!(c>=48 && c<=57))?0:evt.keyCode;
  }
}
</script>

<style>
.dataTableTH{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
		
        font-weight: bold;
        color: #092771;
        text-decoration: none;
		background-color:#BFBFBF;
		text-align:center;

}
.dataTableTD{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
        text-decoration: none;
		background-color:#EFEFEF;
		text-align:center;


}
.dataTableTD1{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
        text-decoration: none;
		background-color:#EFEFEF;
		text-align:right;


}




</style>
