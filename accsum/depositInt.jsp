<%@ include file="/common/Include.jsp" %>
<% 
	String  usrName="";
	String  custID="";
	String userInfo[][] = null;
	String intData ="";
	if(session.getAttribute("user") != null)
	usrName = (String)session.getAttribute("user");
	userInfo = (String [][])session.getAttribute("userInfo");	
    custID=userInfo[0][8];
    System.out.println("custID=================="+custID);
	String brnCode=userInfo[0][1];
	
	java.util.Date utilDate1 = new java.util.Date();
	java.sql.Date curDate =DateTimeFunction.utilDateToSqlDate(utilDate1);
	String utilDate =	DateTimeFunction.sqlDateStrToStr(curDate);


  String b_name= cprContextObj.getSbankename();
  System.out.println("bnkName=================="+b_name);

if(session.getAttribute("intdataNot") != null){
	intData = (String)session.getAttribute("intdataNot");
	session.removeAttribute("intdataNot");
}
%>

<style>

.tdformenu1 {
    background: transparent !important;
}

 .tdformenu {
		background-color: transparent !important;
		    border: transparent !important;
	}

</style>

<script>
function fillData(){
<%if(intData != ""){
if(intData.equalsIgnoreCase("Not")){%>
alert("Record Not Available ");
<%	}}%>
} 
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>

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
<!-- <html:form action="/accsum/acc_sum.do" > -->
<script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
<body>


<table  width="1000px"  Style="margin-top: 30;" >
	<tr>
	<td  class="wrapperDataTableTR" align="center" > Deposit Inrterest Certificate</td>	
	</tr>
</table>

<table  width="900px"  Style="margin-top: 30;">
	<tr>
		<td align="left" class="normalHeadText" ><bean:message bundle='<%=lang%>' key='7096'/> </td>
		<td align="center" width="6%" class="normalHeadText"><b>:</b></td>
		<td class="normalHeadText">
		<!-- 	<html:bmdate styleId="frdate" property="frdate" size="15" onkeypress="isValidDatechar()" maxlength="10"/>	 -->
		<input type ="date" property="frdate" id="frdate" size="15"  maxlength="10">
			<b>&nbsp;&nbsp;To&nbsp;:&nbsp; </b>
		<!-- 	<html:bmdate styleId="todate" property="todate" size="15" onkeypress="isValidDatechar()" maxlength="10"/>	 -->
			<input type ="date" property="todate" id="todate" size="15" maxlength="10">
			<font color="black" size="-2">(dd/mm/yyyy)</font>
		</td>
		<td><input type=button value="Show Inrterest" onclick="showInt();"style="width: 138PX; COLOR :#171c76"/></td>
	</tr>
</table>


<div style="width:75%;background-color: rgb(251, 241, 241); margin-top :50px" id="ww" >
</div>
</body>

</html:form>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp"/>
</tiles:insert>
<script>

function showInt()
   	{
		var ran=parseInt(Math.random()*9999);
		var frdate=document.getElementById("frdate").value;
		var todate=document.getElementById("todate").value;
		//	var selectDate = document.getElementById("docDate").value;
		if(frdate==""){
			alert("Please enter From Date");
			document.getElementById("frdate").focus();
			return false;
			}
		  if(todate==""){
		  alert("Please enter to  Date");
		  			document.getElementById("frdate").focus();
		  return false;
		  }

		var ran=parseInt(Math.random()*9999);
    var URL ="/accsum/acc_sum.do?action=fetchdeposetInt&custId="+'<%=custID%>'+"&fdate="+frdate+"&tdate="+todate+"&ran="+ran; 
     //   var URL ="/accsum/acc_sum.do?action=fetchdeposetInt&custId=50774&fdate="+frdate+"&mode=Ib&tdate="+todate+"&ran="+ran; 
	    http.open("POST",URL,true);
		http.onreadystatechange= function (){
		if((http.readyState == 4) && (http.status == 200)){
		var resArray=http.responseText;
		var jsonData = JSON.parse(resArray);
		
		
if(jsonData !=""){ 
var s = jsonData;
var first=s["AcountNo"];
var sec =s[first[0][0]];

var data ='<table  style="width:90%; background: rgb(251, 241, 241);"><tr> <td>';
data+='<img src= "<%=request.getContextPath()%>/images/MWBLogo.JPG" style="width: 180px; height: 40px;" name = "logoImg" id = "logoImg"/></td><tr>';
data+='<tr><td></td><td align="left" style=" font-size:16;font-family:times  ">Date :';
data+='<%=utilDate%>';
data+='<tr><td  style=" font-size:16;font-family:times"> To';
data+='</td></tr><tr><td  style=" font-size:16;font-family:times"> ';
data+=sec[0][4];
data+='</td></tr><tr><td  style=" font-size:16;font-family:times"> ';
data+=sec[0][5];
data+=',';
data+=sec[0][6];
data+='</td></tr><tr><td  style=" font-size:16;font-family:times"> ';
data+=sec[0][7];
data+='</td></tr><tr><td  style=" font-size:16;font-family:times"> ';
data+=sec[0][8];
data+='</td></tr><tr><td  style=" font-size:16;font-family:times">Dear Sir / Madam,</td></tr> ';
data+='<tr><td  style=" font-size:18;font-family:times"><b>This is to certify that the following interest has been applied to your account during the  ';
data+=frdate;
data+=' To ';
data+=todate;
data+='.';
data+='</b>';
for(var i=0;i<first[0].length;i++){

 var inter =s[first[0][i]];
var tot = 0;
var cnt = 1;
data+='</td></tr></table><table  style="width:90%; background: rgb(251, 241, 241);" border ="0" ><tr style="margin-top=20px;"><td  style=" font-size:16;font-family:times;align :left;"><b>Subject : Deposit Interest For Account No. ';
data+=first[0][i];
data+='</b>';
data+='</td></tr><tr><td colspan="5" style="height:3px;"><hr></hr> </td></tr>';
data+='</table><table  style="width:90%; background: rgb(251, 241, 241);"><tr> <td>';
data+='<tr><td  width="25%" style="font-size:14;font-family:times">S.No </td>';
data+='<td  width="25%" style=" font-size:14;font-family:times">Date </td>';
data+='<td  width="25%" style=" font-size:14;font-family:times">Dr/Cr </td>';
data+='<td  width="25%" style=" font-size:14;font-family:times">Interest Amount </td>';
data+='</tr><tr> <td colspan="5" style="height:3px;"><hr></hr> </td></tr>';
for(var j=0;j<inter.length;j++){
if((inter[j][14]!=null)){
data+='<tr><td  style="font-size:14;font-family:times">';
cnt = parseInt(cnt+=parseInt(j));
data+= cnt;
data+='</td><td  style="font-size:14;font-family:times">';
data+=inter[j][12];
data+='</td><td  style="font-size:14;font-family:times">';
data+=inter[j][14];
data+='</td><td  style="font-size:14;font-family:times align:right;">';
data+=parseFloat(inter[j][13]).toFixed(2); 
tot = parseInt(tot+=parseFloat(inter[j][13]));
}
}
data+='</td></tr><tr> <td colspan="5" style="height:3px;"><hr></hr> </td></tr>';
data+='<tr><td  style=" font-size:14;font-family:times">TOTAL</td><td></td><td></td>';
data+='<td  style=" font-size:14;font-family:times">';
data+=parseFloat(tot).toFixed(2);
data+='</td></tr>';
data+='</tr><tr> <td colspan="5" style="height:3px;"><hr></hr> </td></tr>';
}
data+='<tr><td  style="font-size:16;font-family:times">  Thanking You </td></tr>';
data+='<tr><td  style="font-size:16;font-family:times">  Yours Faithfully ';
data+='<table align="center" style="margin-top:25px;"><tr><td></td>';
data+='<td  >&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="DownLoad Inrterest " onclick="downLoadPDF();"style="width: 138PX; COLOR :#171c76"/></td></tr></table>'; 
data+='</td></tr></table>'
document.getElementById("ww").style.display="block";
document.getElementById("ww").innerHTML = data;


}else{
alert("Record not available ");
document.getElementById("frdate").value="";
document.getElementById("todate").value="";
document.getElementById("frdate").focus();
document.getElementById("ww").style.display="none";

return false;
	 }    
}};
http.send(null);
}

function downLoadPDF(){
	
	    var ran=parseInt(Math.random()*9999);
		var frdate=document.getElementById("frdate").value;
		var todate=document.getElementById("todate").value;
				var todate=document.getElementById("todate").value;
		if(frdate==""){
			alert("Please enter From Date");
			document.getElementById("frdate").focus();
			return false;
			}
		  if(todate==""){
		  alert("Please enter From Date");
		  document.getElementById("todate").focus();
		  return false;
		  }
		var ran=parseInt(Math.random()*9999);    

document.forms[0].action="<%=request.getContextPath()%>/accsum/acc_sum.do?action=downLoadPdfDepoInt&fdate="+frdate+"&custId="+'<%=custID%>'+"&tdate="+todate+"&mode=Ib&ran="+ran; 
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
