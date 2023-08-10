<%@ include file="/common/Include.jsp" %>
<% 
	String  usrName="";
	String  custID="";
	String userInfo[][] = null;
	String intData[]= null;
	if(session.getAttribute("user") != null)
	usrName = (String)session.getAttribute("user");
	//custID= (String)session.getAttribute("custid");
	userInfo = (String [][])session.getAttribute("userInfo");	
    custID=userInfo[0][8];
  // custID="9080";
    System.out.println("custID=================="+custID);
	String brnCode=userInfo[0][1];
	java.util.Date utilDate = new java.util.Date();
	int year = utilDate.getYear() + 1900;
	int month = utilDate.getMonth();
	int day = utilDate.getDay();
	  System.out.println("utilDate=================="+year);


String b_name= cprContextObj.getSbankename();

  System.out.println("bnkName=================="+b_name);

if(session.getAttribute("intdataNot") != null){
	intData = (String[])session.getAttribute("intdataNot");
	session.removeAttribute("intdataNot");
}

%>
<script>



function savingAjax(){
<%if(intData != null){
if(intData[0].equalsIgnoreCase("Not")){%>
alert("Record Not Available According To  " +'<%=intData[1]%> ' );
<%	}}%>
	
	    var ran=parseInt(Math.random()*9999);
        var URL ="/AccountInfoAction.do?action=fetchCustomerAccounts&custID="+<%=userInfo[0][8]%>+"&ran="+ran; 
	    http.open("POST",URL,true);
		http.onreadystatechange= function (){

	if((http.readyState == 4) && (http.status == 200)){
		var resArray=http.responseText;
	//alert(resArray);
		var counter;
		var sec = '<table  border="1" bordercolor="#ffff00" align="left" id ="showdtl" style="width: 33%;height: 20px; margin-top :2%;margin-left:160px;table-layout: fixed;" cellpadding="0" cellspacing="0" ><tr><TD class="dataTableTH" width="40%" height="20px">Select</TD><TD class="dataTableTH" width = "60% "height="20px"> Account Number</TD></tr></table>';
	   var jsonData = JSON.parse(resArray);
	   document.getElementById("sec").innerHTML = sec;
	//var category ='<table  border="1" bordercolor="#ffff00" align="left" id ="showdt2" style="width: 30%;height: 20px; margin-left :-30%; margin-top :4%; table-layout: fixed;">';
	var category ='<table  border="1" style="overflow:auto;height:150PX;table-layout: fixed;">';  
	   for (var i = 0; i<jsonData.accountInformation.length; i++) {
        counter = jsonData.accountInformation[i];
		if(counter.accountType=="T"){
		category+='<tr  style=" background-color:  whitesmoke">';
		category+='<TD  width = "40%"  style="font-family: Arial;" align="center">';
		category+='<input type="radio" id="select" onChange="selection(this)" >';
		category+='</td>';
		category+='<TD  width = "60%"  style="font-family: Arial;" align="center">';
		category+=counter.accountNo;
		category+='</td></tr>';	
		}}
	   category+='</table>';
		document.getElementById("category").innerHTML = category;
	   }
};
		
		
		http.send(null);
}
function processAccount1()
{
   }    
	function selection(ptaddr){
		var pttable=document.getElementById("category");
		var s=ptaddr.parentNode.parentNode;
		var t=s.rowIndex;
		var ptRowCount=pttable.rows.length;
		
		for(var i=0;i<ptRowCount;i++){
		pttable.rows[i].childNodes[0].childNodes[0].checked=false;
		}
		pttable.rows[t].childNodes[0].childNodes[0].checked=true;
		
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
<body style="margin:0 0 0 0;" onload="savingAjax()"><br>

<style>

.tdformenu1 {
    background: transparent !important;
}

 .tdformenu {
		background-color: transparent !important;
		    border: transparent !important;
	}

</style>
			<table  width="1000px"  Style="margin-top: 30;" >
			<tr>
			<td  class="wrapperDataTableTR" align="center" > Loan Inrterest Certificate</td>	
			</tr>
			</table>
	
 <div class="panel-body" id="sec"> </div>
<div style="overflow:auto;height:100PX; width: 33%; margin-left :-88%;margin-top :3.5%;">
<table  align="center"  Style="width: 100%; margin-left :0%;"id="category" border="1">
</table>
</div>

<table border="0" style="margin-left:35%;margin-top:-7%;width:40%">
		<tr><td style ="font-size:14;font-family: serif; height :75PX" >Select Period</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;<select style="margin-left:0px; "  id="docDate">
		<option value="O">--------select---------</option>
		<% for(int i = year-2;i<year+1;i++){%>						
					<!-- 	<option value='<%=i%>-<%=i+1%>'><%=i%>-<%=i+1%></option> -->
		<option value='<%=i%>-<%=i+1%>'><%=i%>-<%=i+1%></option> 
		<%}%> 
		</select>
		</td>	
		<td></td>
		<td  >&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="Show Inrterest " onclick="downLoadSTMT(this);"style="width: 138PX; COLOR :#171c76"/></td>
				<!-- <td><input type=button value="Cancel" onclick="bacck();" /></td> -->
			</tr>
	</table>
<div style="width:100%;width:100%;background-color: rgb(251, 241, 241); margin-top :50px" id="ww" >
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


function downLoadSTMT(ptaddr)
   	{
	    var ran=parseInt(Math.random()*9999);
		var pttable=document.getElementById("category");
		var ptRowCount=pttable.rows.length;
		var accNo="";
		for(var i=0;i<ptRowCount;i++){
			if(pttable.rows[i].childNodes[0].childNodes[0].checked==true){
				accNo=pttable.rows[i].childNodes[1].innerHTML;
			}
		}
		if(accNo==""){
			alert("please select any Account number");
			return false;
			}

		var selectDate = document.getElementById("docDate").value;
		  if(selectDate=="O"){
		  alert("Please Select Year");
		  return false;
		  }
		var ran=parseInt(Math.random()*9999);
        var URL ="/accsum/acc_sum.do?action=fetchdetailloanInt&accountNo="+accNo+"&seldate="+selectDate+"&ran="+ran; 
	    http.open("POST",URL,true);
		http.onreadystatechange= function (){
		if((http.readyState == 4) && (http.status == 200)){
		var resArray=http.responseText;
		var jsonData = JSON.parse(resArray);
if(jsonData !=""){ 
//filePathtemp = BMConfig.getProperty("sTemporaryFilePath");
var data ='<table style="width:85%; background: rgb(251, 241, 241);"><tr> <td>';
data+='<img src= "<%=request.getContextPath()%>/images/MWBLogo.JPG" style="width: 180px; height: 40px;" name = "logoImg" id = "logoImg"/></td><tr>';
if(jsonData[17]=="P"){
data+='<td style="text-align:center;"><b style=" font-size:18;font-family:times">PROVISIONAL STATEMENT FOR CLAIMING DEDUCTION UNDER SECTION:24</b></td></tr>';
}else if(jsonData[17]=="S"){
data+='<td style="text-align:center;"><b style=" font-size:18;font-family:times"> STATEMENT FOR CLAIMING DEDUCTION UNDER SECTION:24</b></td></tr>';
}
data+='<tr> <td style=" font-size:16;text-align:center;font-family:times"><b>(b)80C(2)(xviii)OF THE INCOME TAX ACT ,1961</b></td></tr>';
data+='<tr> <td style=" font-size:14;text-align:center;font-family:times"><b>To Whomsoever It May Concern,</b></td></tr>';
data+='<tr> <td colspan="3" style="height:3px;"><hr></hr> </td></tr>'		
data+='<tr> <td style=" font-size:14;text-align:left;font-family:times">This is to state that  ';
data+=jsonData[2];
data+='  has been granted Housing Loan for purchase /construction of house property  of Rs.';
data+=parseFloat(jsonData[12]).toFixed(2); 
data+='the detail of which are given below: </td></tr></table>';
data+='<table style="width:85%; background: rgb(251, 241, 241);">';		
data+='<tr> <td style=" font-size:16;font-family:times; width:50%;">Loan Account Number:</td>';
data+='<td style=" font-size:16;font-family:times ;width:50%;">';
data+=jsonData[1];
data+='</td></tr>';
data+='<tr> <td style=" font-size:16;font-family:times">Application Form Number	:</td>';
data+='<td style=" font-size:16;font-family:times">';
data+=jsonData[1];
data+='</td></tr>';
data+='<tr> <td style=" font-size:16;font-family:times">Address of the Property	:</td>';
data+='<td style=" font-size:16;font-family:times">ploat NO.';
data+=jsonData[8];
data+='</td></tr><tr> <td style=" font-size:16;font-family:times"></td>';
data+='<td style=" font-size:16;font-family:times">';
data+=jsonData[10];
data+='</td></tr>';
data+='<tr> <td style=" font-size:16;font-family:times"></td>';
data+='<td style=" font-size:16;font-family:times">';
data+=jsonData[10];
data+='-';
data+=jsonData[11];
data+='</td></tr></table>';
data+='<table style="width:85%; background: rgb(251, 241, 241);">';
data+='<tr><td style=" font-size:16;font-family:times">The above loan is repayble in Equated Monthly Installments (EMIs) comprising of principal interest. The break-up of the EMI amount for the above loan into Principal and interest is as follows:</td></tr><tr><td>';
if(jsonData[17]=="P"){
data+='<table border="2" borderColor="black" align="center">';	
data+='<tr><td></td> <td  style=" font-size:16;font-family:times">payable from  ';	
data+=selectDate;
data+='</td><tr><td style=" font-size:16;font-family:times">EmI Amount/Prepayment if any(Rs.)</td>';
data+='<td  style=" font-size:16;font-family:times"align="right">';
data+=parseFloat(jsonData[15]).toFixed(2); 
data+='</td></tr><tr> <td  style=" font-size:16;font-family:times">Principal Component(Rs)</td><td  style=" font-size:16;font-family:times"align="right">';
data+=parseFloat(jsonData[16]).toFixed(2); 
data+='</td></tr>';
data+='<tr> <td  style=" font-size:16;font-family:times">Interest Component	</td>';
data+='<td  style=" font-size:16;font-family:times " align="right">';
data+=parseFloat(jsonData[15]-jsonData[16]).toFixed(2); 
data+='</td></tr></table>';
}
data+='</td></tr><tr><td>';
 if(jsonData[17]=="S"){
data+='<table border="2" borderColor="black" align="center"><tr><td></td>';
data+='<td  style=" font-size:16;font-family:times">payable from  ';
data+=selectDate;
data+='</td><td  style=" font-size:16;font-family:times">';
data+='Paid from';
data+=selectDate;
data+='</td></tr>';
data+='<tr> <td style=" font-size:16;font-family:times">EmI Amount/Prepayment if any(Rs.)</td>';
data+='<td  style=" font-size:16;font-family:times"align="right">';
data+=parseFloat(jsonData[15]).toFixed(2); 
data+='</td><td  style=" font-size:16;font-family:times"align="right">';
data+=parseFloat(jsonData[13]).toFixed(2); 
data+='</td></tr> <tr> <td  style=" font-size:16;font-family:times">Principal Component(Rs)	</td>';
data+='<td  style=" font-size:16;font-family:times"align="right">';
data+=parseFloat(jsonData[16]).toFixed(2); 
data+='</td><td  style=" font-size:16;font-family:times"align="right">';
data+=parseFloat(jsonData[14]).toFixed(2); 
data+='</td></tr><tr> <td  style=" font-size:16;font-family:times">Interest Component  </td>';
data+='<td  style=" font-size:16;font-family:times " align="right">'
data+=parseFloat(jsonData[15]-jsonData[16]).toFixed(2); 
data+='</td><td  style=" font-size:16;font-family:times " align="right">';
data+=parseFloat(jsonData[13]-jsonData[14]).toFixed(2); 
data+='</td></tr></table>';
}

data+='</td></tr><tr><td  style=" font-size:16;font-family:times"><b>Please Note-</b></td></tr></br>';
data+=' <tr> <td  style=" font-size:16;font-family:times"><b>*</b>Deduction under Section 24(b) of the Income-tax Act, 1961 in respect of the interest on the brrowed principal amount & under section 80c of the Income -tax ,1961 in respect of repayment  of  the principal amount can be claimed subject to fullfillment of conditions as per the prevailing income-tax provision.</td></tr>';  
data+='<tr><td style="height:7px;"></td></tr>';
data+='<tr style="margin-top:25px"> <td  style=" font-size:16;font-family:times; "><b>*</b> The utillization/end use of the loan is asa per borrower"s discretion ,and is required to be in accordance with the details provided in the loan application and the undertakings given, if any in the  Loan agreement ,which ,where such detail has bean provided ,has solely relied upon.</td></tr><tr><td style="height:7px;"></td></tr>';
data+='<tr> <td  style=" font-size:16;font-family:times"><b>*</b> For purpose of calculation of intererest /further interest (additional interest) &  other charges the basis applied by the bank is 1/12 applied monthly.</td></tr>  <tr><td style="height:7px;"></td></tr>';

data+='<tr> <td  style=" font-size:16;font-family:times"> For HPSCB Bank Ltd.,</td></tr>';
data+='<tr> <td  style=" font-size:16;font-family:times">(Acting for itself and /or  as duly constituted  attorney on behalf of HPSCB Home Finance Co,Limited )</td></tr>';
data+='<tr> <td colspan="3" style="height:3px;"><hr></hr> </td></tr>';
data+='<table style="width:85%; background: rgb(251, 241, 241);">';
data+='<tr><td></td><td  style=" font-size:16;font-family:times"><b>Address of borrower-</b></td></tr>';
data+='<tr> <td  style=" font-size:16;font-family:times"> Authorised Signatory</td> <td style="width:22%;" class="fontCss">';
data+=jsonData[2];
data+='</td></tr>';
data+='<tr><td  style=" font-size:16;font-family:times"></td>';
data+='<td style="width:22%;" class="fontCss">';
data+=jsonData[5];
data+='</td></tr><tr><td  style=" font-size:16;font-family:times">';
data+='<%=utilDate%>';

data+='</td><td style="width:22%;" class="fontCss">';
data+=jsonData[6];
data+=',';
data+=jsonData[7];
data+='</td></tr></table></table><table align="center" style="margin-top:25px;"><tr><td></td>';
data+='<td  >&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="DownLoad Inrterest " onclick="downLoadPDF(this);"style="width: 138PX; COLOR :#171c76"/></td></tr></table>'; 
document.getElementById("ww").innerHTML = data;
     }else{
alert("Record not available ");
return false;
	 }    
}};
http.send(null);
}

function downLoadPDF(){
	    var ran=parseInt(Math.random()*9999);
		var pttable=document.getElementById("category");
		var ptRowCount=pttable.rows.length;
		var accNo="";
		for(var i=0;i<ptRowCount;i++){
			if(pttable.rows[i].childNodes[0].childNodes[0].checked==true){
				accNo=pttable.rows[i].childNodes[1].innerHTML;
			}
		}
		if(accNo==""){
			alert("please select any Account number");
			return false;
			}

		var selectDate = document.getElementById("docDate").value;
		  if(selectDate=="O"){

		  return false;
		  }
	document.forms[0].action="<%=request.getContextPath()%>/accsum/acc_sum.do?action=downLoadPdfLoanLmt&accountNo="+accNo+"&seldate="+selectDate;
	document.forms[0].method="post";
	document.forms[0].submit();

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
