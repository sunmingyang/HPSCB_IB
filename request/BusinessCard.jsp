	<%@ include file="/common/Include.jsp" %>
	<%@ page import="java.util.*"%>
	<%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
	<%String usrName = (String)session.getAttribute("user");
	String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
	String accountNo=usrInfo[0][0];
	String custid = usrInfo[0][8] ; 
	String brncode = usrInfo[0][1] ; 


	System.out.println(accountNo);
	String appServer = BMConfig.getProperty("CBSWEBURL") ;
	long liviewNo = 101 ; 
	String iburl = BMConfig.getProperty("IBURL") ;
	String value = null ;
	String requestFrom = null ;
	String requestFor = "" ; 
%>

<html>
<head>
<title>Business Card</title>



<!--<script language="JavaScript" src="<%=request.getContextPath()%>/request/scripts/RetailValidFunction.js"></script>  --> 
<script language="JavaScript">
var chek=0;
function getfocus(){	
       
	    
		document.getElementById("eTtl").focus()
		document.getElementById("yearText").value = '';
		
	    
		var dd=new Date();
		document.getElementById("yearText").value=dd.getYear()-1+"-"+dd.getYear()
	
      var val='<bean:message bundle='<%=lang%>' key="9"/>'
	  var hindi = val.substring(0, val.indexOf("/"));
	  document.getElementById("hLab").value=hindi;
	  var val1='<bean:message bundle='<%=lang%>' key="1063"/>'
	  var hindi1 = val1.substring(0, val1.indexOf("/"));
	//  document.getElementById("hAdd").value=hindi1;
	 // displayerr();
}

function displayerr()
{

 if(document.f1.Account.value=="")
       diverrmessage.style.display="none";
 	
}
function changeValueEng()
{
var st=document.getElementById("hTtl").selectedIndex
document.getElementById("eTtl").selectedIndex=st


}


function accountDetails(){
    debugger ; 
    var url="/AccountInfoAction.do?action=fetchAccountBalance&accNo=<%=accountNo%>";
    //alert(url);
    var xhttp = new XMLHttpRequest();
   
    xhttp.onreadystatechange = function()
   {
      
   if(xhttp.readyState == 4 && xhttp.status == 200)

    {                                                                                                  
      var resArray=xhttp.responseText;
	  alert(resArray);
      var jsonData = JSON.parse(resArray);
		
        if(jsonData!=null){
			debugger;
         // alert(resArray);
          $('#eName').val( jsonData.customerName );
		  $('#eAddr').val( jsonData.houseNo + ' ' + jsonData.houseDetail );
		  $('#mobile').val( jsonData.mobileNo );
		  $('#nicNo').val( jsonData.nicno );
		  $('#pin').val( jsonData.pinCode );
		   $('#branchName').val( jsonData.branchName );
		   $('#source').val( jsonData.branchCode );
		     $('#cityName').val( jsonData.cityName );
			//alert(jsonData.accType);
		  if(jsonData.accType=='S'){
			$('#accType').val("Saving Account");
		  }
		  else if(jsonData.accType=='A'){
			$('#accType').val("Current Account");
		  }
		  else{
			$('#accType').val("Cash Credit Account");
		  }
		//  loaderhide();
        }  
        else{

          alert("No Balance");
          
        }
      }




    };

    xhttp.open("GET", url, true);
    xhttp.send("");    

    
  }

function filldata() { 
  debugger;
    
    var url="/rest/AccountService/helpMasterData";
    var str='{"Type":"LOANINTEMPTYPE"}';
    
    var xhttp = new XMLHttpRequest();
    
    xhttp.onreadystatechange = function()
    
    {
          
    if(xhttp.readyState == 4 && xhttp.status == 200)
    {                                                                                                  
        var resArray=xhttp.responseText;
        var jsonData = JSON.parse(resArray);
        var jsonData1= JSON.parse(jsonData.Data);
    
        if(jsonData!=null){
			for( var i = 0 ; i< jsonData1.length ; i++){
    
				$('#employer').append("<option value='" + jsonData1[i].emp_kid  + "' dataf2='" + jsonData1[i].emp_code  + "'>" + jsonData1[i].emp_ename + "</option>");
			}
		}  
        else{
			alert("Emplyer Type Not Available");
            }
    }
    
    };
    
    xhttp.open("POST", url, true);
    xhttp.send(str);    

}

function fillcity(that)
{
var st=document.getElementById("hTtl").selectedIndex
document.getElementById("eTtl").selectedIndex=st


}

function changeValueHin()
{
var st=document.getElementById("eTtl").selectedIndex
document.getElementById("hTtl").selectedIndex=st
}

function submitForm()
{
	var textBoxLengthFlag=0
	var requirePhoneFalg=0
	var invalidPhoneFlag=0
	
	eName=document.getElementById("eName").value
	eAddr=document.getElementById("eAddr").value
	phoneRes=document.getElementById("phoneRes").value
	phoneOff=document.getElementById("phoneOff").value
	fax=document.getElementById("fax").value
	mobile=document.getElementById("mobile").value
	cityCode=document.getElementById("cityCode").value
	
	if(eName.length==0)
	{ 
      textBoxLengthFlag=1;
	  alert("<bean:message  key='2'/>");
	  document.getElementById("eName").focus();
	 
	 }
   else if(eAddr.length==0)
	{
	  textBoxLengthFlag=1;
	  alert("<bean:message  key='2519'/>");
	  document.getElementById("eAddr").focus();
	 
	}
	else if(cityCode.length==0)
	{
	 textBoxLengthFlag=1;
	 alert("<bean:message  key='1441'/>");
	 document.getElementById("cityCode").focus()

	}
	else if((phoneRes.length>0 && phoneRes.length<8) || (phoneOff.length>0 && phoneOff.length<8) || (fax.length>0 && fax.length<8))
	{
		invalidPhoneFlag=1;

	}
	
	else if(phoneRes.length==0 && phoneOff.length==0 && fax.length==0 && mobile.length==0)
	{
    	requirePhoneFalg=1;
	}
	//else if(phoneRes.length==0)
	//{
		//textBoxLengthFlag=1;
	//}


   if(textBoxLengthFlag==0 && requirePhoneFalg==0 && invalidPhoneFlag==0)
	{
	 document.BC.action="<%=request.getContextPath()%>/BusinessForm.do?action=executeSave";
	 document.BC.submit();
	}
	else
	   {
	     if(requirePhoneFalg==1)
		 { alert("<bean:message  key='2068'/>")
		 }
		 else if(invalidPhoneFlag==1)
		   {
               alert("<bean:message  key='2064'/>");
		   }
		 
	  }
     submitMe()
}

function submitMe() {
	if(document.getElementById("DivSubmit").style.display =="block")
		document.getElementById("DivSubmit").style.display = "none";
	else
		document.getElementById("DivSubmit").style.display ="block";
}
function checkPin(text)
{

pinTextValue=document.getElementById(text).value

	if(pinTextValue.length>=1)
		{
			if(pinTextValue.length<6)
				{
					alert("<bean:message  key='2065'/>")
					document.getElementById(text).focus()
				 }
				 
		 } 
}

function checkMail(text)
{
	var emailTextValue=document.getElementById(text).value;

	if(emailTextValue.length>0)
		{
			var emailFlag=isValidEMail(text)
			if(emailFlag==0)
				{
					alert("<bean:message  key='1448'/>");
					document.getElementById(text).focus()
				 }
		}
}
function checkPhone(text)
{
		var phoneTextValue=document.getElementById(text).value
		if(phoneTextValue.length>0)
		{
			 

		}

}



function checkMobile(text)
{
var mobileTextValue=document.getElementById(text).value
if(mobileTextValue.length>1)
 {
	if(mobileTextValue.length<10)
		{
			alert("<bean:message  key='269'/>");
			document.getElementById(text).focus();
		}
}

}
function checkNicNo()//Yogesh Garg
{
 nicNo = document.getElementById("nicNo").value; 
 if(nicNo.length < 10) 
 {
  alert("<bean:message key = '269'/>");
  document.getElementById("nicNo").focus();
 }
}
function callHelp(value)
{					

open("<%=request.getContextPath()%>/Help.do?control="+value+"&page=BusinessCard","","width=460, height=200,scrollbars=yes");		
}
function convertValueHindiName(text)
{
      document.getElementById("hName").value=".";
}
function convertValueHindiAddress(text)
{
     document.getElementById("hAddr").value= ".";
}


</script>

</head>
<jsp:include page="/dashBoard/dashboardNew.jsp" />
<body bgcolor="#89befa" onload="filldata() , accountDetails()">

<center>
                  <font color="#003333" size="+1">
						
						<bean:message bundle='<%=lang%>' key="52040"/>
						
				</font>
		<div id="tabdiv" style="border: thin ridge #E0E0E0;width:700px" >
    <table  width="100%" height="379" border="0"  cellpadding="0" cellspacing="0">
      <form  action="/jsp/login"> 
    
		<tr> 
				<td ><bean:message bundle='<%=lang%>' key="449"/></td>
				<td ><input type="text" readonly="true" disabled="true"  name="yearText" id="yearText" size="20" >
				<bean:message bundle='<%=lang%>' key="1001"/>
				<input type="text" name="snoText" id="snoText" readonly="true" value='<%=liviewNo%>' size="10"></td>
		 </tr>
		 <tr style="display:none;">
	  		
          <td ><input property="hLab"  type="text" id="hLab" style="height:14pt;background-color: #89befa;border: none #cccccc;font-size:11" size="3" readonly="true"></td>
			<td><select property="hTtl" onchange="changeValueEng();setGender()"   styleId="hTtl" style="width:60">
             
            </select>
			<input type="text"  readonly="true"  id="hName" name="hName" size="31"/></td>
	</tr>

	
	      <tr>
				<td><bean:message bundle='<%=lang%>' key="5010"/><font color="red">*</font></td><td>
				<!-- ,getData()  --> 
				<input type="text" tabindex="1" name="mobile" onkeypress="isValidNumber('mobile')" onblur="checkMobile('mobile')" id="mobile" maxlength="10"/>
				<input type="hidden" tabindex="-1"  name="fax" id="fax"/></td>
		 </tr>
		
	
      <tr>
	  		<td>Name<font color="red">*</font></td>
			<td><select name="eTtl" tabindex="3" id="eTtl" style="width:60">
		        <option value='MR.' >MR.</option>
			
				</select>
				<input type="text" name="eName" onblur="convertValueHindiName('eName')" tabindex="4" id="eName" size="31" maxlength="25" />
			</td>
	 </tr>
	 
		 <tr>
	  		<td>Gender</td>
			<td>
				<select name="gender" tabindex="5" id="gender" >
				
					<option value="M">Male		</option>
					<option value="F">Female	</option>
					<option value="O">other		</option>
				</select>
			</td>
		</tr>
	
	 <tr style="display:none" >
	 	 	<td><input type="text" readonly="true"  name="hAdd" id="hAdd" style="height:14pt;background-color: #89befa;border: none #cccccc;font-size:11" size="3"></td>
          	<td><input type="text" name="hAddr" readonly="true" id="hAddr" size="44"/></td>
	 </tr>
	 <tr>
	 	 	<td>Address <font color="red">*</font></td>
          	<td><input type="text" name="eAddr" onkeypress="isValidAddress('eAddr')" onblur="convertValueHindiAddress('eAddr')"  tabindex="5"  id="eAddr" size="45"/></td>
	 </tr>
		
	<tr>
	 		<td><bean:message bundle='<%=lang%>' key="137"/><font color="red">*</font></td><td>
			<input type = "text" name="cityName" tabindex="6" id="cityName" style="width:200px" >
			
			<input type="hidden" name="isFlag" value="N" size="5" id="siUpdate" >
			<input type="hidden" name="liview_kid" size="5" id="liview_kid" >
			<input type="hidden" name="cityId" size="5" id="cityId" >
			</td>
		
	 </tr>
	 <tr>	<td><bean:message bundle='<%=lang%>' key="1096"/></td>
	         <td><input type="text" name="pin" id="pin" maxlength="6" tabindex="7" onkeypress="isValidNumber('pin')" onblur="checkPin('pin')" style="width:80px;" />
			 
			
			 </td>
	 </tr>
 	 <tr> <td><bean:message bundle='<%=lang%>' key="10224"/></td>
          <td><input type="text" name="nicNo" id="nicNo" tabindex="8"  maxlength="12" size="15" onchange="checkNicNo()"/></td>
	  </tr>
	 
		  <tr>
				
			  <td><bean:message bundle='<%=lang%>' key="7832"/>  
				</td>
			  <td>
				  <input type="text" name="phoneRes" onkeypress="isValidPhone('phoneRes')" onblur="checkPhone('phoneRes')" tabindex="11" maxlength="10" id="phoneRes"/>(Off.)
				 <input type="text" tabindex="12" name="phoneOff" onkeypress="isValidPhone('phoneOff')" maxlength="11" onblur="checkPhone('phoneOff')" id="phoneOff"/></td>
		 </tr>
		
	
	 <tr>
	 		<td><bean:message bundle='<%=lang%>' key="1877"/></td><td>
			<input type="text" name="email" onchange="checkMail('email')" style="text-transform: lowercase;"  tabindex="13"  id="email"/></td>
	 </tr>
	
	<tr>
	 		<td><bean:message bundle='<%=lang%>' key="6423"/></td><td>
			<input type="text" name="orgnitation"  id="orgnitation" onkeypress="isValidAddress('orgnitation')" tabindex="9" size="44"/></td>
	 </tr>
	
	<tr>
	    	<td><bean:message bundle='<%=lang%>' key="5030"/></td><td>
			
			<select name="employer" tabindex="10" id="employer" style="width:170">
			<option value='0'>-- select Employee Type --</option>
			
			</select>

			</td>
	 </tr>
	 
		 <tr>
				<td>Branch Code<font color="red">*</font></td>
				<td>
				<input type="text" name="source" tabindex="14" id="source" style="width:150">
				<input type="text" name="branchName" tabindex="14" id="branchName" style="width:150">	
		</tr>
		 <tr>
		 <td><bean:message bundle='<%=lang%>' key="52041"/></td>
         <td>
		 <select name ="loantype" tabindex="15" id="loantype" style="width:150">
		 <option value="0">-- Select Loan --</option>
		 <option value='V'>Vehicle Loan</option>
		 <option value='H'>House Loan</option>
		 <option value='C'>Consumable Loan</option>
		 </select>
		 </td>
		 </tr>
		 
		 <tr><td align="right">
			 
		    </td>
			
		<td colspan="2" align="left">
		<input type="button"  tabindex="16" onClick="saveNewData()" value='<bean:message bundle="<%=lang%>" key="52039"/>' name="s11" id="s11" style="margin:1%; padding:1%;">
		<input type="button"  tabindex="17" value='<bean:message bundle="<%=lang%>" key="87"/>' id="b1" onclick="backAction('BC','13621')"  name="b1" style="margin:1%; padding:1%;">
			<input type="button" tabindex="18" value='<bean:message bundle="<%=lang%>" key="33"/>'  id="b2" name="b2" style="margin:1%; padding:1%;">
			</td>
		</tr>
	</form>
</table>
</div>
</div>
	
</center>
</body>
</html>
<script>
	
function saveNewData(){
	 debugger;
	 var mobile = document.getElementById("mobile").value;
	 var name = document.getElementById("eName").value;
	 var adr = document.getElementById("eAddr").value;
	 var cityid = document.getElementById("cityId").value;
	 var liview_kid = document.getElementById("liview_kid").value;
	 var source = document.getElementById("source").value;
	 
	 var loanType = $('#loantype').val() ; 
	 var orgnitation = $('#orgnitation').val() ; 
	 var employer = $('#employer').val() ; 
	 
	 if(mobile == "" || name == "" || adr == "" || cityid == "0" || source == "0"){
          alert("Please Fill Mandatory Field ||");
		  return false;
	 }
	 
	 var obj={"custid":"<%=custid%>",
			"loanType":loanType ,
			"orignation":orgnitation,
			"employer":employer
			}  ;
	var inut = JSON.stringify(obj) ; 
	alert(inut) ; 
	var url = 	"/rest/AccountService/LoanApplyExistCustomer" ; 
	var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function()
	{
		if(xhttp.readyState == 4 && xhttp.status == 200) {

			alert(xhttp.responseText) ; 
		}
	} ; 
			
	xhttp.open("POST", url, true);
	xhttp.send(inut);

		/*
	 document.forms[0].action="/rest/AccountService/saveLoanRequet="+liview_kid;
     document.forms[0].method="post";
	 document.forms[0].submit();
	 
	 */
}

	function saveData(){
		var hTtl=document.getElementById("hTtl").value;
		var eTtl=document.getElementById("eTtl").value;
		var gender=document.getElementById("gender").value;
		var hName=document.getElementById("hName").value;
		var eName=document.getElementById("eName").value;
		var hAdd=document.getElementById("hAdd").value;
		var eAddr=document.getElementById("eAddr").value;
		var cityCode=document.getElementById("cityCode").value;
		var pin=document.getElementById("pin").value;
		var nicNo=document.getElementById("nicNo").value;
		var orgnitation=document.getElementById("orgnitation").value;
		var employer="0";
		var mobile=document.getElementById("mobile").value;
		var email=document.getElementById("email").value;
		var otp="";
		var flag=false;
		if(document.getElementById("otp")!=null)
		{
			flag=true;
			otp=document.getElementById("otp").value;
		}
		var reqFrom='<%=requestFrom%>';
		var reqFor='<%=requestFor%>';
		if(eName.length==0)
		{ 
		   alert("<bean:message  key='2'/>");
		   document.getElementById("eName").focus();
			return false;
		}
		else if(gender==""){
			alert("Select gender");
			document.getElementById("gender").focus()
			return false;
		}
		else if(eAddr.length==0)
		{
			alert("<bean:message  key='2519'/>");
			document.getElementById("eAddr").focus();
			return false;
		}
		else if(cityCode.length==0)
		{
			alert("<bean:message  key='1441'/>");
			document.getElementById("cityCode").focus()
			return false;
		}
		else if(pin.length==0){
			alert("Enter pincode");
			document.getElementById("pin").focus();
			return false;
		}
		else if(pin.length<6){
			alert("Enter a valid 6 digit pincode");
			document.getElementById("pin").value="";
			return false;
		}/*else if(nicNo.length==0)
		{
			alert("Enter Aadhar  Number");
			document.getElementById("nicNo").focus();
			return false;
		}
		else if(nicNo.length<10)
		{
			alert("Invalid aadhar Number");
			document.getElementById("nicNo").value="";
			return false;
		}*/
		else if(orgnitation.length==0)
		{
			alert("Enter orgnitation ");
			document.getElementById("orgnitation").focus();
			return false;
		}/*else if(employer.length==0)
		{
			alert("Enter employer type");
			document.getElementById("employer").focus();
			return false;
		}*/
		else if(mobile.length==0)
		{
			alert("Enter  Mobile Number");
			document.getElementById("mobile").focus();
			return false;
		}
		else if(mobile.length<10)
		{
			alert("Invalid Mobile Number");
			document.getElementById("mobile").value="";
			return false;
		}
		else if(email.length==0){
			alert("Enter  e-mail Id");
			document.getElementById("email").focus();
			return false;
		}else if(isValidEMail('email')==0){
			alert("Invalid Email");
			document.getElementById("email").focus();
			document.getElementById("email").value="";
			return false;
		}else if(flag==true && otp=="")
		{
			alert("Enter OTP recieved on yout mobile");
			document.getElementById("otp").focus();
			return false;
		}
		var obj="";
		var obj1="";
		obj={"hTtl":hTtl,
				"eTtl":eTtl,
				"gender":gender,
				"hName":hName,
				"eName":eName,
				"hAddr":hAdd,
				"eAddr":eAddr,
				"cityCode":cityCode,
				"pin":pin,
				"nicNo":nicNo,
				"orgnitation":orgnitation,
				"employer":"0",
				"mobile":mobile,
				"email":email,
				"requestFrom":reqFrom,
				"requestFor":reqFor,
				"purpose":reqFor,
				"source":"IB"};
		if(flag==true){
			obj1={"otp":otp,"accountNo":pin,"mobileNo":mobile};
			otp=JSON.stringify(obj1);
			//alert(otp);
		}
		var jsonStr = JSON.stringify(obj);
		//alert(jsonStr);
		var url="";
		if(flag==false)
			url="<%=request.getContextPath()%>/BusinessForm.do?action=saveBasicDetailsForNewUer&userDetails="+jsonStr+"&flag=Send OTP";
		else
			url="<%=request.getContextPath()%>/BusinessForm.do?action=saveBasicDetailsForNewUer&userDetails="+jsonStr+"&flag=Verify and Save&otp="+otp;
		
		var xhttp = new XMLHttpRequest();
		submitMe();
		xhttp.onreadystatechange = function() { showOtpDiv(xhttp)};
		xhttp.open("GET", url, true);
		xhttp.send();
		//var hname=document.get
	}
	function setGender(){
		var hTtl=document.getElementById("hTtl").value;
		var eTtl=document.getElementById("eTtl").value;
		if(eTtl=="MRS." || eTtl=="MISS." || eTtl=="SMT."){
			document.getElementById("gender").value="F";
			document.getElementById("gender").disabled=true;
		}
		else if(eTtl=="MR." || eTtl=="MASTR" || eTtl=="SIR"){
			document.getElementById("gender").value="M";
			document.getElementById("gender").disabled=true;
		}
		else{
			document.getElementById("gender").value="";
			document.getElementById("gender").disabled=false;
		}
	}
	function showOtpDiv(xhttp){
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			var resArray=xhttp.responseText;
			if(resArray=="OTP NOT MATCH"){
				alert(resArray);
				//document.getElementById('resend').style.display="block";
				window.parent.location.href="<%=iburl%>/new_ui/products/account/index.jsp?src=toptitle";
			}
			else if(resArray=="OTP EXPIRED"){
				alert(resArray);
				window.parent.location.href="<%=iburl%>/new_ui/products/account/index.jsp?src=toptitle";
			}
			else if(resArray=="nextPage"){
				window.location.href="<%=request.getContextPath()%>/retail/RetailInterviewDetailMain.jsp?requestFrom=<%=requestFrom%>&requestFor=<%=requestFor%>";
			}
			else if(resArray!=""){
				alert("OTP send to "+resArray);
				submitMe();
				//disabledControlsOnAction(document.forms[0]);
				document.getElementById("otplabel").innerHTML="Enter OTP:";
				document.getElementById("otpfield").innerHTML="<input type'text' id='otp' name='otp' onkeypress='isValidNumber(otp)' />&nbsp;&nbsp;&nbsp;&nbsp;<span id='resend' style='display:none;'><span style='color:blue;cursor:pointer;' onclick='resendOtp();'>Click Here</span>  to resend OTP.</span> ";
				document.getElementById("otp").focus();
				/*document.getElementById("next").disabled="false";
				document.getElementById("cancel").disabled="false";*/
			}
			else{
				alert("Request failed");
			}
		}
	}
	function resendOtp(){
		document.getElementById("otp").value="";
		var pin=document.getElementById("pin").value;
		var mobile=document.getElementById("mobile").value;
		var eName=document.getElementById("eName").value;
		if(eName.length==0)
		{ 
		   alert("<bean:message  key='2'/>");
		   document.getElementById("eName").focus();
			return false;
		}
		else if(pin.length==0){
			alert("Enter pincode");
			document.getElementById("pin").focus();
			return false;
		}
		else if(pin.length<6){
			alert("Enter a valid 6 digit pincode");
			document.getElementById("pin").value="";
			return false;
		}else if(mobile.length==0)
		{
			alert("Enter  Mobile Number");
			document.getElementById("mobile").focus();
			return false;
		}
		else if(mobile.length<10)
		{
			alert("Invalid Mobile Number");
			document.getElementById("mobile").value="";
			return false;
		}
		var obj={"mobile":mobile,"pin":pin,"eName":eName,"purpose":"Savings Account"};
		var jsonStr = JSON.stringify(obj);
		var url="<%=request.getContextPath()%>/BusinessForm.do?action=saveBasicDetailsForNewUer&userDetails="+jsonStr+"&flag=Send OTP";
		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			showMessage(xhttp)
		};
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	function showMessage(xhttp){
		if (xhttp.readyState == 4 && xhttp.status == 200) {
				var resArray=xhttp.responseText;
				alert("OTP send to :"+resArray);
				document.getElementById("otp").focus();
			}
	}
	function back1(){
		var a=confirm("Do you want to cancel");
		if(a)
			window.parent.location.href='<%=iburl%>/new_ui/products/account/index.jsp?src=toptitle';
	}

function getData(){
	
    var number=document.getElementById("mobile").value;
	if(number == ""){
                document.getElementById("fax").value = "";
				document.getElementById("eName").value = "";
				document.getElementById("eAddr").value = "";		 
				document.getElementById("pin").value = "";
				document.getElementById("nicNo").value = "";
				document.getElementById("orgnitation").value = "";                
				document.getElementById("phoneRes").value = "";
				document.getElementById("phoneOff").value = "";
				document.getElementById("email").value = "";				 
				document.getElementById("siUpdate").value = "N"
				document.getElementById("source").value = '0'
				document.getElementById("employer").value = '0'
				document.getElementById("snoText").value ='<%=liviewNo%>'
				document.getElementById("liview_kid").value ='';
                document.getElementById('loantype').value='0';
					return false;

	}
	var url="/CobaSys/BusinessForm.do?action=getLiviewInformationFromNumber&mobileNumber="+number;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
		var resArray=xhttp.responseText;
		
		if(resArray == "null"){ 
				document.getElementById("fax").value = "";
				document.getElementById("eName").value = "";
				document.getElementById("eAddr").value = "";		 
				document.getElementById("pin").value = "";
				document.getElementById("nicNo").value = "";
				document.getElementById("orgnitation").value = "";                
				document.getElementById("phoneRes").value = "";
				document.getElementById("phoneOff").value = "";
				document.getElementById("email").value = "";				 
				document.getElementById("siUpdate").value = "N"
				document.getElementById("snoText").value ='<%=liviewNo%>' 
				document.getElementById("liview_kid").value ='';
			}else{
				
		       var jsonData = JSON.parse(resArray);
			    document.getElementById("fax").value = jsonData[14][0]
				document.getElementById("eTtl").value = jsonData[17][0]
				document.getElementById("eName").value = jsonData[2][0]
				document.getElementById("eAddr").value = jsonData[4][0]
  			    document.getElementById("cityId").value = jsonData[6][0]
				document.getElementById("pin").value = jsonData[7][0]
				document.getElementById("nicNo").value = jsonData[22][0]
				document.getElementById("orgnitation").value = jsonData[15][0]
                document.getElementById("employer").value = jsonData[10][0]
				document.getElementById("phoneRes").value = jsonData[9][0]
				document.getElementById("phoneOff").value = jsonData[19][0]
				document.getElementById("email").value = jsonData[8][0]
				document.getElementById("source").value = jsonData[21][0]
				document.getElementById("siUpdate").value = "Y"  
				document.getElementById("snoText").value =jsonData[1][0]; 
				document.getElementById("liview_kid").value =jsonData[23][0]; 
				document.getElementById("loantype").value = jsonData[24][0]
				
				 	 
	  }}
     };
	 xhttp.open("GET", url, true);
	 xhttp.send();    
}
</script>
