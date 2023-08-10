<%@ include file="/common/Include.jsp" %>
<%@ page import="org.apache.struts.action.ActionErrors,org.apache.struts.action.ActionError, org.apache.struts.Globals, org.apache.struts.util.RequestUtils, java.util.Iterator, java.util.AbstractList" %>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<script language="JavaScript" src="/scripts/MD5.js"></script>  
<script language="JavaScript" src = "/usrlimit/addnewusr.js"></script>  
<script language="JavaScript" src = "/usrlimit/CmmAddressJS.js"></script>    
<script>
var accountinfo;
var accountType; 
var jsoncbusrdata = ''; 
<%String userInfo1=(String)session.getAttribute("validToken");  
String usrName = (String)session.getAttribute("user");
String acsuserId[][] =null;
String parentCIBUserData[][] =null;
String login_id="",mobNO="",accountInfo="";
String userInfofromlogin[][]=null; 
if(session.getAttribute("userid")!=null){  
	login_id = (String)session.getAttribute("userid");
	System.out.println("snxw--------------------------"+login_id);
}

String  custRole=(String)session.getAttribute("custRole");
if(session.getAttribute("userInfo")!=null){
	userInfofromlogin = (String[][])session.getAttribute("userInfo");
	System.out.println("User Info Customer Id of Corporate Banking------>"+userInfofromlogin[0][8]);  
}  
if(session.getAttribute("parentCIB")!=null)
{
	parentCIBUserData= (String[][])session.getAttribute("parentCIB");
	System.out.println("Corporate banking User Info------>"+parentCIBUserData[0][2]);  
}  else {
		String url = "/favorite/error.jsp";
	    String furl = request.getContextPath()+url+"?pname=main user" ;
		out.println("urll::"+furl);
	    response.sendRedirect(furl);       
		System.out.println("GO TO ERROR.JSP");
	}


String  date=DateTimeFunction.getIbDateTime();
		date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);

%>
</script>
<script>


var AmtinGrp = '3';
var todayDate=new Date();
var calShortWeekNames="";
var calLongMntNames="";
	var personalFlag=false;
	var Dob="25/05/1978";
	var sDate="";
	var paramlang,total='9';
	var flag="";
	var  femaleMinor= "18"; 
	var  maleMinor="21"   
	var  AddressCertificationL=new Array();
	var	tCountL=-1;
	var  rCountL=-1;
	var checkFlagL=true;
	var blankcheckL=false;
	var  AddressCertificationP=new Array();
	var	tCountP=-1;
	var  rCountP=-1;
	var checkFlagP=true;
	var blankcheckP=false;
	var rL=0;
	var cL=0;
	var rP=0;
	var cP=0;
	var fromAcc="";
	var sAdrCerFirm = 'N';
	var sizeL=0;var sizeP=0;var cMode="";
	var sOpen='null';
			sDate='05/04/2016';
			paramlang='english';
			var flag="L";

var flag=false;
var checkAuthorization=false;

var AddressKnown=sessionStorage.getItem("AdressKnown");
checkAuthorization=true;

var sisNotNull = ""; 

var appcontext ='<%=request.getContextPath()%>' ;

</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Request"/>
<%if(request.getParameter("row")==null){ %>
<tiles:put name="menu" value="/common/user_left.jsp?mode=&src=corporatebanking"/>
<%}%>
<tiles:put name="menu" value="/common/user_left.jsp?mode=&src=corporatebanking"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/> 
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=corporatebanking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>
</tiles:put> 
<tiles:put name="content" type="String">

<body onload="hideelement1(); getval();" > 
<html:form action="/corporatebanking/AddNewUserAction"><br>
<%if(custRole.equals("F") || custRole.equals("S"))  // cib auTH MENU
	{%>
<div border="10 px:solid" style="
    border: 1px solid black;
    border-radius: 20px;
">
<table width = "100%"><tr><td align = "left">
<p  id = "label" ><u style="
    color: blue;
"> <B>Corporate Banking:Add New User</B>  </td> 
</u>

</td >
<td align = "right"> <p><u style="
    color: blue;
"> <B><%=date%></B></td></tr>
</br>
<tr>
<td colspan = "2">
<p align = "left" bgcolor="blue" style="
    background-color: #cccccc;"> <b> Below form enable you to add entry user or  authorised signatories that are able to create voucher entry for  all form based as well as file based transactions.  </b></p>
	</td>
	</tr>
	<tr>
<td align="center"> 
<div  style = "overflow:auto; height : 200px; ">
<table class="miniStmtBackBorder" width=527 cellspacing="0" cellpadding="0" >

<tr class="miniStmtBack">
<td align="center">
<table  border="0" bordercolor="green" id="addTable" style="border-left:none;border-right:none;border-top:none;border-bottom:none;" >
<tr>
 
<%  
String userInfo[][]=(String[][])session.getAttribute("userInfo");   
if(userInfo!=null)
{  
	%>
	<tr style = "display:none">
	<td  width="105px">Corporate Banking Cust ID</td>
	<td  width="105px"><input type="text"  id="sCBUser_CustID" name="sCBUser_CustID" value = '<%=userInfofromlogin[0][8]%>'readonly></td>
	</tr>
	<tr>
	<td  width="105px"> <bean:message bundle="hindi" key= "1027"/></td>
	<td  width="105px"><input type="text"  id="sAccno" name="sAccno" readonly></td>
	</tr>
	
	<tr>
	<td width="105px"> <bean:message bundle="hindi" key= "20000"/></td>
	<td  width="105px"><input type="text"  id="sPrefCorpid" name="sPrefCorpid"  readonly ></td>
	</tr>

	<tr>
	<td width="105px"> <bean:message bundle="hindi" key= "20001"/></td>  
	<td  width="105px"><input type="text"  id="sPrefloginusrid" name="sPrefloginusrid"  readonly ></td>
	</tr>

	<tr>
	<td width="105px"> <bean:message bundle="hindi" key= "20002"/></td>
	<td  width="105px"><input type="text" maxlength = "15"  id="suserid" name="suserid" value='' onChange = "checkUserID(this)" ></td>
	</tr> 

	<!--<div id = "adddiv"> -->
	<tr id = "nametr">
	<td width="105px"> <bean:message bundle="hindi" key= "20003"/></td>
	<td  width="105px"><input type="text"  id="sUserName" name="sUserName" maxlength = "30"  value='' ></td>
	</tr>

 	<tr id = "passtr" style = "display: none">
   <td width="105px"> <bean:message bundle="hindi" key= "20004"/></td>	
   <td  width="105px">
   <input type="password"  id="spassword" name="spassword" value='' maxlength = "15"   >
   <!--onChange = "CheckPassword(this);"-->
   </td> 
	</tr>

	 <tr id = "txnpasstr" style = "display:none">
    <td width = "105px"> <bean:message bundle="hindi" key= "7235"/></td>
	<td  width="105px"> <input type="password"  id="sTxnpassword" name="sTxnpassword" value='' maxlength = "16"  ></td> 
	</tr>

	<tr id = "usrmode">
	 <td width="105px"> <bean:message bundle="hindi" key= "726"/></td>	
	 <td  width="105px">
	<select name="UserMode" Id="UserMode" onchange = "change();" >
	<option selected value = "E">--Please Select--</option>
	<option value = "E">ENTRY USER</option>
	<option value = "S"> AUTHORISED SIGNATORY</option>
	</select>
	</td>
</tr>
<!--	</div> Add Form Div Close-->
<tr id = "custidtr">
	 <td width="105px"><bean:message bundle="hindi" key= "6380"/>(if Existing customer of bank)</td>	
	<td  width="105px"> <input type="text" maxlength = "30" id="scustID" name="scustID" onchange = "checkAndFetchCustID(this);" value=''> </td>
</tr>
 <input type= "hidden" name ="custaccid" id = "custaccid" value = "" />
<tr>
	 <td width="105px"> <bean:message bundle="hindi" key= "20005"/></td>	
	<td  width="105px"> <input type="text" maxlength = "12" id="sMobileNo" name="sMobileNo" value='' onchange = "phonenumber(document.getElementById(this.id).value);"> </td>
	</tr>

<tr id = "Desigtr">
	 <td width="105px"> <bean:message bundle="hindi" key= "225"/></td>	
	<td  width="105px">  <select name="DesignationMaster" Id="DesignationMaster" ></select> 

	   <script>

function processDesignationMaster(f)
{
if((http.readyState == 4) && (http.status == 200)){ 
		var resArray1=http.responseText;

	var jsonData = JSON.parse(resArray1);
	   
	   var select= document.getElementById(f);
	  
		var opt = document.createElement('option');         
			opt.value =0;
			opt.innerHTML = " -- please Select --";
			select.appendChild(opt);
		
if (jsonData != null) {
	    for (var i = 0; i < jsonData[2].length; i++){
		
			var opt = document.createElement('option');
			opt.value = jsonData[0][i];
			opt.innerHTML = jsonData[2][i];
			select.appendChild(opt);
		}
       
	   }
	}
	
     }
		</script>
	
	
	</td>
</tr>

<tr id = "Occuptr">
	 <td width="105px"> <bean:message bundle="hindi" key= "201"/></td>	
	<td  width="105px">  <select name="OccupationMaster" Id="OccupationMaster" ></select> 
	</td> 
</tr>

	<tr id = "radiobtn" >
      <td> 
		<input type="radio" name="rb" id="pdf" value="pdf"> Core Banking Services including IB
	</td>
	<td>
	<input type="radio" id="ibrbtn" name="ibrbtn" value="IBUse" checked="true">Only for Internet Banking Services
	</td>
	</tr>   
	  

	<script>
	document.getElementById("sAccno").value='<%=userInfo[0][0]%>';
	document.getElementById("sPrefloginusrid").value='<%=login_id%>';		
	document.getElementById("sPrefCorpid").value='<%=parentCIBUserData[0][2]%>';	
    function change()
	{
		
	  if (document.getElementById("UserMode").value =='E')
		{
		  
	document.getElementById("custidtr").style.display = 'none';
	document.getElementById("Occuptr").style.display = 'none';
	document.getElementById("Desigtr").style.display = 'none';
	document.getElementById("radiobtn").style.display = 'none';
	document.getElementById("address").style.display = 'none';
	document.getElementById("Addressdiv").style.display = 'none'
	document.getElementById("addressbtn").style.display = 'none'	
		} 

	 if (document.getElementById("UserMode").value =='S')
		{ 
	//window.location.href = "/corporatebanking/AddNewUserAction.do?action=getParentCIBUsr";
	document.getElementById("custidtr").style.display = 'table-row';
	document.getElementById("Occuptr").style.display = 'table-row';
	document.getElementById("Desigtr").style.display = 'table-row';
	document.getElementById("radiobtn").style.display = 'table-row';
	document.getElementById("address").style.display = 'block';
	document.getElementById("Addressdiv").style.display = 'block'
	document.getElementById("addressbtn").style.display = 'block'
		} 
	}	
	</script>


	</table>
</div>

<div id="address">
<table width="90%" id = "addresstable"  border="0" cellpadding="1"  cellspacing="0" bordercolor="red" style = "display:none">
<br>
<tr>
    <td >
        <label>House Number-Name.
            <font size="2" color="red">*</font></label> </td>
    <td nowrap >
        <b>:&nbsp;</b>

        <input type="text" name="isEHouseNoLocal" maxlength="50" size="33" tabindex="1" value="" onchange="checkWildcard(this.id)" id="isEHouseNoLocal">
</tr>
<tr>
    <td>
        <label>Street No</label> &nbsp;</td>
    <td nowrap>
        <b>:&nbsp;</b>

        <input type="text" name="isEStreetNoLocal" maxlength="50" size="33" tabindex="2" value=""  id="isEStreetNoLocal" onchange="checkWildcard(this.id)"  >
</tr>
<tr>
    <td>
        <label>Locality/Locallity</label> &nbsp;</td>
    <td nowrap>
        <b>:&nbsp;</b>

        <input type="text" name="isELocalityLocal" maxlength="50" size="33" tabindex="3" value=""  id="isELocalityLocal" onchange="checkWildcard(this.id)">
</tr>
<tr>
    <td>
        <label>
            Country
        </label>&nbsp;</td>
    <td nowrap>
        <b>:&nbsp;</b>
        <select name="Country" Id="CountryMaster"></select>
        <script>

function processAccountcountry(f)
{
if((http.readyState == 4) && (http.status == 200)){
		var resArray1=http.responseText;

	var jsonData = JSON.parse(resArray1);
	   
	   var select= document.getElementById(f);
	  
		var opt = document.createElement('option');
			opt.value =0;
			opt.innerHTML = " -- please Select --";
			select.appendChild(opt);
		
if (jsonData != null) {
	    for (var i = 0; i < jsonData[2].length; i++){
		
			var opt = document.createElement('option');
			opt.value = jsonData[0][i];
			opt.innerHTML = jsonData[2][i];
			select.appendChild(opt);
		}
       
	   }
	}
	
     }
		</script></td>
    <td>

    </td>

</tr>

<tr>
    <td>
        <label>State</label>&nbsp;</td>
    <td nowrap>
        <b>:&nbsp;</b>
        <select name="state" onchange='processAccount10()' Id="StateMaster"> </select>
        <script>
function processAccountstate(f)
{
	if((http.readyState == 4) && (http.status == 200)){
		var resArray1=http.responseText;
	
var jsonData = JSON.parse(resArray1);

	   var select= document.getElementById(f);
	  
		var opt = document.createElement('option');
			opt.value =0;
			opt.innerHTML = " -- please Select --";
			select.appendChild(opt);
	if (jsonData != null) {
	    for (var i = 0; i < jsonData[2].length; i++){
		
			var opt = document.createElement('option');
			opt.value = jsonData[0][i];
			opt.innerHTML = jsonData[2][i];
			select.appendChild(opt);
		}
       
	   }
	
	}
     }
		</script>
</tr>
<tr>
    <td>
        <label>
            District
        </label>&nbsp;</td>
    <td nowrap>
        <b>:&nbsp;</b>
        <select name="district" Id="districtcode" ></select></td>
    <script>
	function processAccount10(){	
	var stateId = document.getElementById('StateMaster').value;
	var URL1 = "/request/DDRequest.do?action=getDependentMaster1&masterType=districtcode&Criteria1="+stateId; 
	 	http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccount5("districtcode")};
		http.send(null);
	}

	function processAccount5(f)
	{	
	if((http.readyState == 4) && (http.status == 200)){
		var resArray1=http.responseText;

	var jsonData = JSON.parse(resArray1);	   
		
	   var select= document.getElementById(f); 
		var opt = document.createElement('option');
			opt.value =0;
			opt.innerHTML = " -- please Select --";
			select.appendChild(opt);

			if (jsonData != null) {
		for (var i = 0; i < jsonData[2].length; i++){
		
			var opt = document.createElement('option');
			opt.value = jsonData[0][i];
			opt.innerHTML = jsonData[2][i];
			select.appendChild(opt);
		}
       }
	   }
     }
		</script>
    </td>
</tr>

<tr>
    <td>
        <label>
            City
            <font size="2" color="red">*</font></label> &nbsp;</td>
        <td nowrap>
        <b>:&nbsp;</b>
       


        <input type="text" name="isECityLocal" maxlength="50" size="20" tabindex="7" value="" onkeypress="isValidNumAlpha()"  id="isECityLocal">


</tr>

<tr>
    <td>
        <lable>Post </lable></td>
    <td>
        <b>:&nbsp;</b>

        <select name="post" id="postMaster"> <option value="1"></option></select>

        <script>

		function processAccountpost(f)
		{
			if((http.readyState == 4) && (http.status == 200)){
			var resArray1=http.responseText;
			var jsonData = JSON.parse(resArray1);
		    var select= document.getElementById(f);
			var opt = document.createElement('option');
			opt.value =0;
			opt.innerHTML = " -- please Select --";
			select.appendChild(opt);
			if (jsonData != null) {
				 for (var i = 0; i < jsonData[2].length; i++){
					var opt = document.createElement('option');
					opt.value = jsonData[0][i];
					opt.innerHTML = jsonData[2][i];
					select.appendChild(opt);
				}
			}
		 }
	    }
		</script></td>
    </td>
</tr>

<tr>
    <td>
        <label>Pin Code<font size="2" color="red">*</font></label> </td>
    <td>
        <b>:&nbsp;</b>
        <input type="text" name="isPinCodeLocal" maxlength="6" size="17" tabindex="9" value="" onblur="onblurPIN(this.id)" id="isPinCodeLocal">
</tr>

<tr>
    <td>
        <label>Phone</label></td>
    <td>
        <b>:&nbsp;</b>
        <input type="text" name="isPhoneLocal" id= "isPhoneLocal" maxlength="10" size="17" tabindex="10" value="" onchange = "phonenumber(document.getElementById(this.id).value);">
</tr>
 
<tr>
    <td>
        <label>Mobile<font size="2" color="red">*</font></label></td>
    <td>
        <b>:&nbsp;</b>
        <input type="text" name="isMobileLocal" id = "isMobileLocal" maxlength="10" size="17" tabindex="11" value="" onchange = "phonenumber(document.getElementById(this.id).value);" id="isMobileLocal"></td>
</tr>

<tr>
    <td>
        <label>Off. Phone</label> &nbsp;</td>
    <td>
        <b>:&nbsp;</b>
        <input type="text" name="isOfficePhoneLocal" id = "isOfficePhoneLocal" maxlength="10" size="17" tabindex="12" value="" onchange = "phonenumber(document.getElementById(this.id).value);"></td>
</tr>
<tr>
    <td>
        <label >Taluka</label></td>
    <td>
        <b>:&nbsp;</b>

        <select name="istalukakid" Id="CustTalukaMaster"> <option value="1">country</option></select>


        <script>
		function processAccountTaluka(f)
		{
			if((http.readyState == 4) && (http.status == 200)){
				var resArray1=http.responseText;
				var jsonData = JSON.parse(resArray1);
				var select= document.getElementById(f);
				var opt = document.createElement('option');
				opt.value =0;
				opt.innerHTML = " -- please Select --";
				select.appendChild(opt);
				if (jsonData != null) {
				for (var i = 0; i < jsonData[2].length; i++){
				var opt = document.createElement('option');
				opt.value = jsonData[0][i];
				opt.innerHTML = jsonData[2][i];
				select.appendChild(opt);
				}
				}
			}
		}
		</script>

      
</tr>
<tr>
    <td>
        <label >Village</label></td>
    <td>
        <b>:&nbsp;</b>

        <select name="Custvillagemaster" Id="Custvillagemaster"> <option value="1">country</option></select>
        <script>
		function processAccountvillage(f)
		{if((http.readyState == 4) && (http.status == 200)){
			var resArray1=http.responseText;
			var jsonData = JSON.parse(resArray1);
			var select= document.getElementById(f);
			var opt = document.createElement('option');
			opt.value =0;
			opt.innerHTML = " -- please Select --";
			select.appendChild(opt);
			if (jsonData != null) {
				for (var i = 0; i < jsonData[2].length; i++){
				var opt = document.createElement('option');
				opt.value = jsonData[0][i];
				opt.innerHTML = jsonData[2][i];
				select.appendChild(opt);
				}
			}
	     }
	   }
		</script>
      
</tr>
<tr>
    <td>
        <label >Amsom</label></td>
    <td>
        <b>:&nbsp;</b>

        <select name="amsom" Id="CustAmsomDesomMaster"> <option value="1">amson</option></select>
        <script>

		function processAccountAmsom(f)
		{


	if((http.readyState == 4) && (http.status == 200)){
		var resArray1=http.responseText;
var jsonData = JSON.parse(resArray1);
	   
	   var select= document.getElementById(f);
	  
		var opt = document.createElement('option');
			opt.value =0;
			opt.innerHTML = " -- please Select --";
			select.appendChild(opt);
		
if (jsonData != null) {
	    for (var i = 0; i < jsonData[2].length; i++){
		
			var opt = document.createElement('option');
			opt.value = jsonData[0][i];
			opt.innerHTML = jsonData[2][i];
			select.appendChild(opt);
		}
       }
	   }
     }
		</script>
     
</tr>
<tr>
    <td>
        <label >Desom</label></td>
    <td>
        <b>:&nbsp;</b>
        <input type="text" name="desomCode" maxlength="7" size="17" tabindex="16" value="" onkeypress="alphaNumWithoutSpace()" id="desomCode"></td>
</tr>

<tr>
    <td>
        <label >Ward No</label></td>
    <td>
        <b>:&nbsp;</b>
        <input type="text" name="wardno" maxlength="10" size="17" tabindex="17" value="" onkeypress="alphaNumWithoutSpace()" id="wardno"></td>
</tr>
<tr>
    <td>
        <label >./Block</label></td>
    <td>
        <b>:&nbsp;</b>


        <select name="Block" Id="CustBlockMaster"> <option value="1">Block</option></select>
        <script>
		function processAccountBlock(f)
		{
		if((http.readyState == 4) && (http.status == 200)){
				var resArray1=http.responseText;
				var jsonData = JSON.parse(resArray1);
				var select= document.getElementById(f);
				var opt = document.createElement('option');
				opt.value =0;
				opt.innerHTML = " -- please Select --";
				select.appendChild(opt);
		if (jsonData != null) {
	    for (var i = 0; i < jsonData[2].length; i++){		
			var opt = document.createElement('option');
			opt.value = jsonData[0][i];
			opt.innerHTML = jsonData[2][i];
			select.appendChild(opt);
		}
		}
	    }
		}
		</script>

       
</tr>

<tr>
    <td>
        <label >Panchayat</label></td>
    <td>
        <b>:&nbsp;</b>

        <select name="Panchayat" Id="CustPanchyatMaster"> <option value="1">Panchayat</option></select>
        <script>

function processAccountPanchyat(f)
{
	if((http.readyState == 4) && (http.status == 200)){
		var resArray1=http.responseText;

	
var jsonData = JSON.parse(resArray1);
		   var select= document.getElementById(f);
	  
		var opt = document.createElement('option');
			opt.value =0;
			opt.innerHTML = " -- please Select --";
			select.appendChild(opt);
		
if (jsonData != null) {
	    for (var i = 0; i < jsonData[2].length; i++){
		
			var opt = document.createElement('option');
			opt.value = jsonData[0][i];
			opt.innerHTML = jsonData[2][i];
			select.appendChild(opt);
		}
       }
	   }
	     }
		</script>
</tr>
<tr>
    <td>
        <label>E-mail</label> &nbsp;</td>
    <td>
        <b>:&nbsp;</b>
        <input type="text" name="isMailLocal" maxlength="50" size="53" tabindex="20" value="" onblur="validEMail(this.id)" style="text-transform:none;" class="Lowerinput" id="isMailLocal"></td>
</tr>
<tr>
    <td>
        URL Name</label>&nbsp;</td>
    <td>
        <b>:&nbsp;</b>
        <input type="text" name="isURLLocal" maxlength="50" size="53" tabindex="21" value="" onblur="validUrl(this.id)" style="text-transform:none;" class="Lowerinput" id="isURLLocal">
</tr>
<tr>
    <td>
        <label>Year At Cur. Resi.</label> &nbsp;</td>
    <td>
        <b>:&nbsp;</b>
        <input type="text" name="isYrsAtResLocal" maxlength="3" size="17" tabindex="22" value="" onblur="isValidNumber(this.id)" id="isYrsAtResLocal"></td>
</tr>
<tr> 
    <td>
        <label>Resi.OwnerShip
        </label>&nbsp;</td>
    <td>
        <b>:&nbsp;</b>
        <select name="Resi.OwnerShip" Id="ResidentOwnership"> <option value="1">Resi.OwnerShip</option></select>

        <script>

		function processAccountResident(f)
		{
		if((http.readyState == 4) && (http.status == 200)){
				var resArray1=http.responseText;
				var jsonData = JSON.parse(resArray1);
				var select= document.getElementById(f);
				var opt = document.createElement('option');
				opt.value =0;
				opt.innerHTML = " -- please Select --";
				select.appendChild(opt);
			if (jsonData != null) {
				for (var i = 0; i < jsonData[2].length; i++){
				var opt = document.createElement('option');
				opt.value = jsonData[0][i];
				opt.innerHTML = jsonData[2][i];
				select.appendChild(opt);
				}
			   }
			   }
		}
		</script></td>
    &nbsp;
  
</tr>
</table> 
</div>
<br>

<div id="Addressdiv" style="border:Solid 0 red; width:90% ;" >
    <table width="100%" id = "Addresstable1" border="0" cellpadding="1"  cellspacing="0" bordercolor="red" style = "display:none;">
        <tr>
            <td colspan="2" height="40">
                <table cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td>
                            <hr  style="color:#3366FF"></td>
                        <td align="center" style="color:#3366FF" width="370px">
                            <b>Address Proof</b></td>
                        <td>
                            <hr  style="color:#3366FF"></td>
                    </tr>
                </table></td>
        </tr>
        <tr>
            <td nowrap>
                <label>Address Proof</label>
                &nbsp;</td>
            <td nowrap>
                <b>:&nbsp;</b>
                <select name="Address Proof" Id="AddressCertificationMaster" onchange="setAdrKid()"></select>
                <script>
		function processAccountCertification(f)
		{
		if((http.readyState == 4) && (http.status == 200)){
		var resArray1=http.responseText;
		var jsonData = JSON.parse(resArray1);
	    var select= document.getElementById(f);
	    var opt = document.createElement('option');
		opt.value =0;
		opt.innerHTML = " -- please Select --";
		select.appendChild(opt);
		if (jsonData != null) {
	    for (var i = 0; i < jsonData[2].length; i++){
		var opt = document.createElement('option');
			opt.value = jsonData[0][i];
			opt.innerHTML = jsonData[2][i];
			select.appendChild(opt);
		}
        }
	    }
	   }
		</script>
           
				 
                &nbsp; <input type="hidden" name="isAddressProofLocalKid" value="" id="isAddressProofLocalKid" maxlength="5"   ><td>
				 <script>
		//	alert(document.getElementById("AddressCertificationMaster").value);
			 document.getElementById("isAddressProofLocalKid").value = document.getElementById("AddressCertificationMaster").value;
			</script>
        </tr>
        <tr>
            <td nowrap>
                <label>Document No.</label></td>
            <td nowrap>
                <b>:&nbsp;</b>
                <input Type="text"  name="isDocNoLocal" tabindex='25' Id="isDocNoLocal"   size="18" maxlength="25" ></td>
        </tr>
        <tr>
            <td nowrap>
                <label size="30">Doc.Issuing Auth.</label>&nbsp;</td>
            <td nowrap>
                <b>:&nbsp;</b>

                <input type="text" name="isEAuthorityLocal" maxlength="50" size="29" tabindex="26" value=""  id="isEAuthorityLocal">
        </tr>
        <tr>
            <td nowrap>
                <label>Doc.Issue Place</label> &nbsp;</td>
            <td nowrap>
                <b>:&nbsp;</b>

                <input type="text" name="isEPlaceLocal" maxlength="50" size="29" tabindex="27" value=""  id="isEPlaceLocal">
        </tr>
        <tr>
            <td nowrap>
                <label>Issuing Date</label> &nbsp;</td>
            <td nowrap>
                <b>:&nbsp;</b>

		<input type="text" id="usrtxtDate" name="usrisIssueDateLocal" maxlength="10" size="12" tabindex="-1" value="" onchange = "isValidIssue(this.value,this.id);" > [DD-MM-YYYY]
		<input type="hidden" id="txtDate" name="isIssueDateLocal" maxlength="10" size="12" tabindex="-1" >


<tr>
    <td>
        <label>Expiry Date</label></td>
    <td>
        <b>:&nbsp;</b>
 	<input type="text" id="usrtxtDate1" name="usrisExpiryDateLocal" maxlength="10" size="12" tabindex="-1" value="" onchange = "isValidIssue(this.value,this.id);"> [DD-MM-YYYY]
	<input type="hidden" id="txtDate1" name="isExpiryDateLocal" maxlength="10" size="12" tabindex="-1" value="">

</td>
</tr>
<!-- <tr>
<td align="center" colspan="1"></td>
<td colspan = "2">
    <input type="button" class = "Button" onclick="showBasicform();"  name = "submit1"
           id="submit1"tabindex="33"  value="OK"> 
	 <input   value="<bean:message bundle='<%=lang%>' key='87'/> " class = "Button" type="button" onclick="showBasicform();"/>
    </td>
</tr>
-->
</table><br>
</div>

<!--AddressCER END-->

</table>
<!--ADRESS END-->

</div>
<table align="center" width=360 cellpadding="0" cellspacing="7" 
	id="tabela" border="0" bordercolor="red">
	<tr>
	<td align="center" colspan="2" >
	<input type="button"  name = "Submitbtn" class = "Button"  id = "save" onclick="SessionSet();fnvalidation();"  tabindex="3" value="<bean:message bundle='<%=lang%>' key='7119'/>">
	<!--sendData('add')-->
	</td>
	<td>
<!--	<input type="button"  name = "deletebtn" class = "Button" id = "delete" onClick="sendData('delete')" style =  "display:none"  tabindex="3" value="<bean:message bundle='<%=lang%>' key='161'/>"> -->
	</td>
	<td>
	<input type="button"  name = "addressbtnname" class = "Button" id = "addressbtn" onClick="showAdrform()"  tabindex="3" value="<bean:message bundle='<%=lang%>' key='1063'/>">
	</td>
	<td>
	<input  name = "Cancelbtn" value="<bean:message bundle='<%=lang%>' key='87'/> " id = "Cancelbtn" class = "Button" type="button" onclick="bacck()"  style = "display: true" /> 
	</td>
  	<td>
	<input type="button" class = "Button" onclick="showBasicform();"  name = "submit1" id="submit1"tabindex="33"  value="OK" style = "display:none" > 
	</td>
	<td>  <input   value="Back " class = "Button" type="button" id = "adrback" onclick="showBasicform();" style = "display:none" />
	</td>
	</tr>
	<tr>
	<div id = "ahrefdel"> 
<!--	<a  onClick="deleteForm();"/> <B>CLICK HERE TO DELETE USER</B> -->
	</div>
	<div id = "ahrefadd" > 
	<!-- <a  onClick = "hideelement();"> <B> CLICK HERE TO ADD USER</B>   -->
	<!--	<a href = "/usrlimit/addnewUser.jsp" > CLICK HERE TO ADD USER-->
	</div>
	</tr>
	</table>
	</table>
<table>
<tr><td>
	<div id="diverrmessage"><font face="verdana" color="red">
	<logic:messagesPresent property="DeactiveUser"><html:errors property="DeactiveUser"/></logic:messagesPresent> 
	<logic:messagesPresent property="insertStatus"><html:errors property="insertStatus"/></logic:messagesPresent> 
	</td></tr></table>
	</div>
	<%}%>
	<%} else {%>
	No Operations found for entry user
<%	}%>
	</html:form>
	<script>
<%if( custRole.equals("S")) {%> // cib auTH MENU
document.getElementById("usrmode").style.display = 'none'; 
document.getElementById("custidtr").style.display = 'none'; 
	document.getElementById("Desigtr").style.display = 'none'; 
	document.getElementById("Occuptr").style.display = 'none'; 
	document.getElementById("radiobtn").style.display = 'none'; 
	document.getElementById("addressbtn").style.display = 'none'; 
<%}%>
	
</script>
	</body> 
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>
	</tiles:insert>  