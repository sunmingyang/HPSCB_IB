function validateinput()
{
	var uid = trim(document.getElementById("suserid").value);
	var uname = trim(document.getElementById("sUserName").value); 
	var upass =  ''; 
	//trim(document.getElementById("spassword").value);
	var utrnpass =  ''; 
	//trim(document.getElementById("sTxnpassword").value);
	var umob = trim(document.getElementById("sMobileNo").value);
	var umode = trim(document.getElementById("UserMode").value);
	if (uid == '' || uname=="" || umob=="" || umode =='')
	{
		alert("All Fields Are manadatory")
		sisNotNull = "blank";
		return false;
	} else {
		sisNotNull = "filled";
		/* var sPwd = calcMD5(document.getElementById("spassword").value);
		 var stxnPwd = calcMD5(document.getElementById("sTxnpassword").value);
		  document.getElementById("spassword").value=upass ;  
		  document.getElementById("sTxnpassword").value=utrnpass ;   */
	}
}

function sendData(purpose){
	validateinput();
	
	if(sisNotNull=="filled") {   
		if(purpose==='add') {
	        sessionStorage.clear();
			if(jsoncbusrdata === '') {
			alert("Fill Complete Details");
			return false; 
			}
	var usermode = document.getElementById("UserMode").value;
	var url = "/corporatebanking/AddNewUserAction.do?action=addUserUsr&jsoncbusrdata="+jsoncbusrdata+"&UserMode="+usermode;
    http.open("POST",url,false); 
	http.onreadystatechange= function (){processCreateRes()};
	http.send(null);   

	} else {
		alert("Enter Data Properly!")
			return;
	}
}
}

function bacck()
{
	document.forms[0].action="/usrlimit/corporatemenu.jsp?menu=home"; 
	document.forms[0].submit();
}
function deleteForm()
{  
	
	document.getElementById("delete").style.display = 'block';
	document.getElementById("save").style.display = 'none';
	document.getElementById("ahrefdel").style.display = 'none'; 
	document.getElementById("ahrefadd").style.display = 'block';
	document.getElementById("nametr").style.display = 'none';
	document.getElementById("passtr").style.display = 'none';
	document.getElementById("txnpasstr").style.display = 'none';
	document.getElementById("custidtr").style.display = 'none';
	document.getElementById("Desigtr").style.display = 'none';
	document.getElementById("Occuptr").style.display = 'none';
	document.getElementById("radiobtn").style.display = 'none';
	document.getElementById("usrmode").style.display = 'none';
}

function hideelement()
{   
		window.location.href = "/corporatebanking/AddNewUserAction.do?action=getParentCIBUsr";
		 jsoncbusrdata=sessionStorage.adressform;
	//	alert(jsoncbusrdata);
/*	document.getElementById("ahrefdel").style.display = 'block';
	document.getElementById("delete").style.display = 'none'; 
	document.getElementById("nametr").style.display = 'block';
	document.getElementById("passtr").style.display = 'block';
	document.getElementById("txnpasstr").style.display = 'block';
	document.getElementById("save").style.display = 'block';*/
}

function hideelement1()
{   
	document.getElementById("ahrefdel").style.display = 'block';
	document.getElementById("ahrefadd").style.display = 'none';
//	document.getElementById("delete").style.display = 'none'; 
	if(sessionStorage.getItem("AdressKnown")!=null) {
	// alert("sessionstorage is not null");
	sessionStorage.removeItem("AdressKnown");
	// alert("sessionstorage is null");
}
}

function CheckPassword(inputtxt)   
{   
    var id = inputtxt.id;
    var newPassword = inputtxt.value;
    var minNumberofChars = 6;
    var maxNumberofChars = 16;
	var stxnPwd ,sPwd ;
  var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
     if(newPassword.length < minNumberofChars || newPassword.length > maxNumberofChars){
           alert("password should contain atleast 6 to 16character");
		return false;
    }
    if(!regularExpression.test(newPassword)) {
        alert("password should contain atleast one number and one special character");
        return false;
    } else {
	 sPwd = calcMD5(document.getElementById(id).value);
	 	  document.getElementById(id).value=sPwd ; 
		  var pass = document.getElementById('spassword').value;
         var Txnpass = document.getElementById('sTxnpassword').value;
	    isSamePassword(pass,Txnpass);
	} 
	}
function isSamePassword(pass,Txnpass)
{
var pass = pass;
var Txnpass = Txnpass;
if(pass === Txnpass)
{
	alert("password could not be same");
	 document.getElementById('spassword').value = '';
	 document.getElementById('sTxnpassword').value = '';
	  return false;
}
} 
 function checkUserID(e)
{

var userid = e.value;
if(userid != 0 || userid!=""){
	if(!isNaN(userid)&& userid.length <=15) {
	var brncode = document.getElementById("sAccno").value.substring(0,3); 
    var entryUserId = userid+"^"+brncode;   
    var url = "/corporatebanking/AddNewUserAction.do?action=checkUserId&entryUserId="+entryUserId;
    http.open("POST",url,false);
	http.onreadystatechange= function (){processRes()};
	http.send(null);
		} else { 
		alert("Enter Numeric value upto 9 digits");
		document.getElementById("suserid").value = '';
		return;
		}
	}

}

function processRes(){
			 if (http.readyState == 4)
				{
					// Check that a successful server response was received
					if (http.status == 200)
					{ 
						eval('var resArray='+http.responseText);
						alert(resArray);
}
				} 
}
<!----Address JS-->
function showAdrform()
{
document.getElementById("addresstable").style.display = 'block'; 
document.getElementById("Addresstable1").style.display = 'block'; 
document.getElementById("addTable").style.display = "none";
//document.getElementById("tabela").style.display = "none";
document.getElementById("save").style.display = "none";
//document.getElementById("delete").style.display = "none";
document.getElementById("addressbtn").style.display = "none";
document.getElementById("Cancelbtn").style.display = "none";

document.getElementById("ahrefdel").style.display = "none";
document.getElementById("ahrefadd").style.display = "none";
document.getElementById("adrback").style.display = "block";
document.getElementById("submit1").style.display = "block";
sessionStorage.setItem("AdressKnown","CMMAddress") ;  
fetchCustIDData();
} 
var http=createRequestObject();
function checkResYear(resId){
	var sCmmAge ="";
	var sJspOpenedMode="";
	 sJspOpenedMode='';  
	if(sJspOpenedMode==""){
		if(document.getElementById(resId).value!=""){
			var sResYear=parseFloat(document.getElementById(resId).value);
		}
			sCmmAge = '38';
		
		if(sResYear >0 && parseFloat(sCmmAge) >0 && (sResYear > sCmmAge)){
		   alert("Year At Residence can't Greater than Age");
			document.getElementById(resId).value="0";
		}
	}
}
function serializeSchema(form) {
    return [].map.call(form.elements, function(el) {
        return {

            name: el.name,
            value:el.value
        };
    });
};

function validateInputForm(){

var d=document.forms[0];
var inputField;
var jssondataadd="{";
for(var i=0;i<d.length;i++)
{
inputField=d[i];
jssondataadd+='"'+inputField.name+'" : ';
jssondataadd+='"'+inputField.value+'" ,';
}

jssondataadd+="}";

var form = document.querySelector('form'),
schema = serializeSchema(form);

 sessionStorage.adressform =jssondataadd;
 jsoncbusrdata=jssondataadd;
document.getElementById("addresstable").style.display = 'none'; 
document.getElementById("Addresstable1").style.display = 'none'; 
document.getElementById("addTable").style.display = "block";
document.getElementById("tabela").style.display = "block";
document.getElementById("ahrefdel").style.display = "block";
document.getElementById("ahrefadd").style.display = "block";
document.getElementById("addressbtn").style.display = 'none'; 
sendData('add');

}

function getval() {
 var isAddressType=sessionStorage.getItem("AdressKnown");
 var a = sessionStorage.isPhoneLocal;
 var b = sessionStorage.length;
// alert(isAddressType);
   if (isAddressType=="CMMAddress"){
   document.getElementById("isAddressType").innerHTML ="CustomerID Address Details";
   }
if (typeof(sessionStorage.country) !== "undefined")
{
document.getElementById("CountryMaster").value=sessionStorage.getItem(AddressKnown+'CountryMaster');

		var select= document.getElementById('CountryMaster');
		select.innerHTML = '';
	    var opt = document.createElement('option');
		opt.value = sessionStorage.CustIdPersonalCategory;;
		opt.innerHTML = sessionStorage.country;
		select.appendChild(opt);
		document.getElementById('CountryMaster').disabled="true";
document.getElementById("isEHouseNoLocal").value=sessionStorage.getItem(AddressKnown+'isEHouseNoLocal');
document.getElementById("isEStreetNoLocal").value=sessionStorage.getItem(AddressKnown+'isEStreetNoLocal');
document.getElementById("isELocalityLocal").value=sessionStorage.getItem(AddressKnown+'isELocalityLocal');
document.getElementById("StateMaster").value=sessionStorage.getItem(AddressKnown+'StateMaster');
		select= document.getElementById('StateMaster');
		select.innerHTML = '';
	    opt = document.createElement('option');
		opt.value = sessionStorage.StateMaster;;
		opt.innerHTML = sessionStorage.state;
		select.appendChild(opt);
		document.getElementById('StateMaster').disabled="true";
document.getElementById("districtcode").value=sessionStorage.getItem(AddressKnown+'districtcode');
		select= document.getElementById('districtcode');
		select.innerHTML = '';
	    opt = document.createElement('option');
		opt.value = sessionStorage.districtcode;;
		opt.innerHTML = sessionStorage.district;
		select.appendChild(opt);
		document.getElementById('districtcode').disabled="true";
document.getElementById("isECityLocal").value=sessionStorage.getItem(AddressKnown+'isECityLocal');
document.getElementById("postMaster").value=sessionStorage.getItem(AddressKnown+'postMaster');
		select= document.getElementById('postMaster');
		select.innerHTML = '';
	    opt = document.createElement('option');
		opt.value = sessionStorage.postMaster;;
		opt.innerHTML = sessionStorage.post;
		select.appendChild(opt);
		document.getElementById('postMaster').disabled="true";
document.getElementById("isPinCodeLocal").value=sessionStorage.getItem(AddressKnown+'isPinCodeLocal');
document.getElementById("isPhoneLocal").value=sessionStorage.getItem(AddressKnown+'isPhoneLocal');
document.getElementById("isMobileLocal").value=sessionStorage.getItem(AddressKnown+'isMobileLocal');
document.getElementById("isOfficePhoneLocal").value=sessionStorage.getItem(AddressKnown+'isOfficePhoneLocal');
document.getElementById("CustTalukaMaster").value=sessionStorage.getItem(AddressKnown+'CustTalukaMaster');
		select= document.getElementById('CustTalukaMaster');
		select.innerHTML = '';
	    opt = document.createElement('option');
		opt.value = sessionStorage.CustTalukaMaster;;
		opt.innerHTML = sessionStorage.taluka;
		select.appendChild(opt);
		document.getElementById('CustTalukaMaster').disabled="true";
document.getElementById("Custvillagemaster").value=sessionStorage.getItem(AddressKnown+'Custvillagemaster');
select= document.getElementById('Custvillagemaster');
		select.innerHTML = '';
	    opt = document.createElement('option');
		opt.value = sessionStorage.Custvillagemaster;;
		opt.innerHTML = sessionStorage.village;
		select.appendChild(opt);
		document.getElementById('Custvillagemaster').disabled="true";
document.getElementById("CustAmsomDesomMaster").value=sessionStorage.getItem(AddressKnown+'CustAmsomDesomMaster');
select= document.getElementById('CustAmsomDesomMaster');
		select.innerHTML = '';
	    opt = document.createElement('option');
		opt.value = sessionStorage.CustAmsomDesomMaster;;
		opt.innerHTML = sessionStorage.amsom;
		select.appendChild(opt);
		document.getElementById('CustAmsomDesomMaster').disabled="true";
document.getElementById("desomCode").value=sessionStorage.getItem(AddressKnown+'desomCode');
document.getElementById("wardno").value=sessionStorage.getItem(AddressKnown+'wardno');
document.getElementById("CustBlockMaster").value=sessionStorage.getItem(AddressKnown+'CustBlockMaster');
select= document.getElementById('CustBlockMaster');
		select.innerHTML = '';
	    opt = document.createElement('option');
		opt.value = sessionStorage.CustBlockMaster;;
		opt.innerHTML = sessionStorage.block;
		select.appendChild(opt);
		document.getElementById('CustBlockMaster').disabled="true";
document.getElementById("CustPanchyatMaster").value=sessionStorage.getItem(AddressKnown+'CustPanchyatMaster');
select= document.getElementById('CustPanchyatMaster');
		select.innerHTML = '';
	    opt = document.createElement('option');
		opt.value = sessionStorage.CustPanchyatMaster;
		opt.innerHTML = sessionStorage.panchayat;
		select.appendChild(opt);
		document.getElementById('CustPanchyatMaster').disabled="true";
document.getElementById("isMailLocal").value=sessionStorage.getItem(AddressKnown+'isMailLocal');
document.getElementById("isURLLocal").value=sessionStorage.getItem(AddressKnown+'isURLLocal');
document.getElementById("isYrsAtResLocal").value=sessionStorage.getItem(AddressKnown+'isYrsAtResLocal');
document.getElementById("ResidentOwnership").value=sessionStorage.getItem(AddressKnown+'ResidentOwnership');
select= document.getElementById('ResidentOwnership');
		select.innerHTML = '';
	    opt = document.createElement('option');
		opt.value = sessionStorage.ResidentOwnership;
		opt.innerHTML = sessionStorage.resident;
		select.appendChild(opt);
		document.getElementById('ResidentOwnership').disabled="true";
document.getElementById("AddressCertificationMaster").value=sessionStorage.getItem(AddressKnown+'AddressCertificationMaster');
select= document.getElementById('AddressCertificationMaster');
		select.innerHTML = '';
	    opt = document.createElement('option');
		opt.value = sessionStorage.AddressCertificationMaster;
		opt.innerHTML = sessionStorage.addressproof;
		select.appendChild(opt);
		document.getElementById('AddressCertificationMaster').disabled="true";
document.getElementById("isDocNoLocal").value=sessionStorage.getItem(AddressKnown+'isDocNoLocal');
document.getElementById("isEAuthorityLocal").value=sessionStorage.getItem(AddressKnown+'isEAuthorityLocal');
document.getElementById("isEPlaceLocal").value=sessionStorage.getItem(AddressKnown+'isEPlaceLocal');
document.getElementById("txtDate").value=sessionStorage.getItem(AddressKnown+'txtDate');
document.getElementById("txtDate1").value=sessionStorage.getItem(AddressKnown+'txtDate1');
var k=sessionStorage.getItem(AddressKnown+'StateMaster');
	if(sessionStorage.getItem(AddressKnown+'StateMaster')!=null)
	{
		processAccount10();
	}
}
 else {

		var URL1 ="/request/DDRequest.do?action=getMaster&masterType=AddressCertificationMaster";
		http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountCertification("AddressCertificationMaster")};
		http.send(null);

		var URL1 ="/request/DDRequest.do?action=getMaster&masterType=ResidentOwnership";
	    http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountResident("ResidentOwnership")};
		http.send(null);

		var URL1 ="/request/DDRequest.do?action=getMaster&masterType=CustPanchyatMaster";
		http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountPanchyat("CustPanchyatMaster")};
		http.send(null);

		var URL1 ="/request/DDRequest.do?action=getMaster&masterType=CustBlockMaster";
	    http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountBlock("CustBlockMaster")};
		http.send(null);

		var URL1 ="/request/DDRequest.do?action=getMaster&masterType=CustAmsomDesomMaster";
		http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountAmsom("CustAmsomDesomMaster")};
		http.send(null);

		var URL1 ="/request/DDRequest.do?action=getMaster&masterType=Custvillagemaster";
	    http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountvillage("Custvillagemaster")};
		http.send(null);

		var URL1 ="/request/DDRequest.do?action=getMaster&masterType=CustTalukaMaster";
	    http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountTaluka("CustTalukaMaster")};
		http.send(null);

		var URL1 ="/request/DDRequest.do?action=getMaster&masterType=postMaster";
	    http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountpost("postMaster")};
		http.send(null);

		var URL1 ="/request/DDRequest.do?action=getMaster&masterType=StateMaster";
	    http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountstate("StateMaster")};
		http.send(null);

		var URL1 ="/request/DDRequest.do?action=getMaster&masterType=CountryMaster";
		http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountcountry("CountryMaster")};
		http.send(null);

        var URL1 ="/request/DDRequest.do?action=getMaster&masterType=DesignationMaster";
		http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountcountry("DesignationMaster")};
		http.send(null);
		
		var URL1 ="/request/DDRequest.do?action=getMaster&masterType=OccupationMaster";
		http.open("POST",URL1,false);
		http.onreadystatechange= function (){processAccountcountry("OccupationMaster")};
		http.send(null);
			
		document.getElementById("isPhoneLocal").value="";;
	}
}
function SessionSet() 
{
validateInputForm();
}

function fnvalidation() {
     if ((document.getElementById("CountryMaster").value).length == 0) {
             alert("The Country should not be empty");
    }else
     if ((document.getElementById("isEHouseNoLocal").value).length == 0) {
             //alert("The HouseNoLocal should not be empty");
    } else
     if(document.getElementById("isEHouseNoLocal").value.includes('/') || document.getElementById("isEHouseNoLocal").value.includes('?') || document.getElementById("isEHouseNoLocal").value.includes('*') || document.getElementById("isEHouseNoLocal").value.includes('-') || document.getElementById("isEHouseNoLocal").value.includes('+') || document.getElementById("isEHouseNoLocal").value.includes('(') || document.getElementById("isEHouseNoLocal").value.includes(')') || document.getElementById("isEHouseNoLocal").value.includes('{') || document.getElementById("isEHouseNoLocal").value.includes('}') || document.getElementById("isEHouseNoLocal").value.includes('[') || document.getElementById("isEHouseNoLocal").value.includes(']')) {
      alert("Special Characters alre not allowed in HouseNoLocal");
    }else
      if ((document.getElementById("isEStreetNoLocal").value).length == 0) {
             alert("The StreetNoLocal should not be empty");
    } else
	   if(document.getElementById("isEStreetNoLocal").value.includes('/') || document.getElementById("isEStreetNoLocal").value.includes('?') || document.getElementById("isEStreetNoLocal").value.includes('*') || document.getElementById("isEStreetNoLocal").value.includes('-') || document.getElementById("isEStreetNoLocal").value.includes('+') || document.getElementById("isEStreetNoLocal").value.includes('(') || document.getElementById("isEStreetNoLocal").value.includes(')') || document.getElementById("isEStreetNoLocal").value.includes('{') || document.getElementById("isEStreetNoLocal").value.includes('}') || document.getElementById("isEStreetNoLocal").value.includes('[') || document.getElementById("isEStreetNoLocal").value.includes(']')) {
            alert("Special Characters alre not allowed in isEStreetNoLocal ");
    }else
     if ((document.getElementById("isELocalityLocal").value).length == 0) {
             alert("The LocalityLocal should not be empty");
    } else
	   if(document.getElementById("isELocalityLocal").value.includes('/') || document.getElementById("isELocalityLocal").value.includes('?') || document.getElementById("isELocalityLocal").value.includes('*') || document.getElementById("isELocalityLocal").value.includes('-') || document.getElementById("isELocalityLocal").value.includes('+') || document.getElementById("isELocalityLocal").value.includes('(') || document.getElementById("isELocalityLocal").value.includes(')') || document.getElementById("isELocalityLocal").value.includes('{') || document.getElementById("isELocalityLocal").value.includes('}') || document.getElementById("isELocalityLocal").value.includes('[') || document.getElementById("isELocalityLocal").value.includes(']')) {
          alert("Special Characters alre not allowed in isELocalityLocal ");
     }else
     if ((document.getElementById("districtcode").value).length == 0) {
             alert("The district should not be empty");
    }else
     if ((document.getElementById("isECityLocal").value).length == 0) {
             alert("The City should not be empty");
    }else
     if ((document.getElementById("isPinCodeLocal").value).length == 0) {
             alert("The PinCode should not be empty");
    }else
     if ((document.getElementById("isPhoneLocal").value).length == 0) {
             alert("The Phone should not be empty");
    }else
     if ((document.getElementById("isMobileLocal").value).length == 0) {
             alert("The Mobile should not be empty");
    }else
     if ((document.getElementById("isOfficePhoneLocal").value).length == 0) {
             alert("The OfficePhone should not be empty");
    }else
     if ((document.getElementById("desomCode").value).length == 0) {
             alert("The desom should not be empty");
    }else
     if ((document.getElementById("wardno").value).length == 0) {
             alert("The wardno should not be empty");
    }else
     if ((document.getElementById("isMailLocal").value).length == 0) {
             alert("Mail should not be empty");
    }else
     if ((document.getElementById("isURLLocal").value).length == 0) {
             alert("URL should not be empty");
    }else
     if ((document.getElementById("ResidentOwnership").value).length == 0) {
             alert("The ResidentOwnership should not be empty");
    }else
     if ((document.getElementById("AddressCertificationMaster").value).length == 0) {
             alert("The AddressCertification should not be empty");
    }else
     if ((document.getElementById("isDocNoLocal").value).length == 0) {
             alert("The DocNo should not be empty");
    }else
     if ((document.getElementById("isEAuthorityLocal").value).length == 0) {
             alert("The Authority should not be empty");
    }else
     if ((document.getElementById("isEPlaceLocal").value).length == 0) {
             alert("The issue Place should not be empty");
    }  
}

function checkAndFetchCustID(e)
{

 var scustID = trim(document.getElementById("scustID").value);
 if(scustID === '')
	{
 showAdrform();
 } else {
var url="/AccountInfoAction.do?action=fetchCustomerAddress&custID="+scustID;  
	 http.open("POST",url,true);  
	http.onreadystatechange= function (){processFetchCustID()};
	http.send(null);
}
}
function fetchCustIDData()
{
 var scustID = trim(document.getElementById("scustID").value);
 if(scustID === '')
	{
 showAdrform();
 } else {
	var url="/AccountInfoAction.do?action=fetchCustomerAddress&custID="+scustID;  
    http.open("POST",url,true);  
	http.onreadystatechange= function (){processFetchCustID()};
	http.send(null);
}
}
function processFetchCustID(){
	
			 if((http.readyState == 4) && (http.status == 200)){
		 var res1=http.responseText;
		 if (res1==='"{}"')
		 {
			 alert("No Data Fetched for customer ID");
			 return;
		 }
	      var jsonData = JSON.parse(res1);
		setValue(jsonData);
		 }

}

function setValue(jsonData)
{
document.getElementById("sUserName").value=jsonData.cust_ename
var sel = document.getElementById("CountryMaster").selectedIndex= jsonData.adr_cntid; 
document.getElementById("isEHouseNoLocal").value=jsonData.adr_ehno;
document.getElementById("isEStreetNoLocal").value=jsonData.adr_eloc;
document.getElementById("isELocalityLocal").value=jsonData.adr_ehdtl;
document.getElementById("StateMaster").value=jsonData.adr_stateid;
select= document.getElementById('StateMaster').selectedIndex = jsonData.adr_stateid;		
document.getElementById("districtcode").selectedIndex=jsonData.adr_distid;
document.getElementById("isECityLocal").value=jsonData.adr_ecity
document.getElementById("postMaster").selectedIndex=jsonData.adr_post
document.getElementById("isPinCodeLocal").value=jsonData.adr_pincode;
document.getElementById("isPhoneLocal").value=jsonData.adr_phone;
document.getElementById("isMobileLocal").value=jsonData.adr_mobile; 
document.getElementById("isOfficePhoneLocal").value=jsonData.adr_offphno;
document.getElementById("CustTalukaMaster").selectedIndex=jsonData.adr_taluk;
document.getElementById("Custvillagemaster").selectedIndex=jsonData.adr_villege;
document.getElementById("CustAmsomDesomMaster").selectedIndex=jsonData.adr_amsomdesom;
document.getElementById("desomCode").value=jsonData.adr_desom;
document.getElementById("wardno").value=jsonData.adr_wardno;
document.getElementById("CustBlockMaster").selectedIndex=jsonData.adr_block;
document.getElementById("CustPanchyatMaster").selectedIndex=jsonData.adr_panchayat;
document.getElementById("isMailLocal").value=jsonData.adr_emailid;
document.getElementById("isURLLocal").value=jsonData.adr_urlname;
document.getElementById("isYrsAtResLocal").value=jsonData.adr_yrsatres;
document.getElementById("ResidentOwnership").selectedIndex=jsonData.adr_resOwn;
document.getElementById("AddressCertificationMaster").selectedIndex=jsonData.adrcer_docid;
document.getElementById("isDocNoLocal").value=jsonData.adrcer_no;

document.getElementById("isEAuthorityLocal").value=jsonData.adrcer_eauthority;
document.getElementById("isEPlaceLocal").value=jsonData.adrcer_eplace;
document.getElementById("isAddressProofLocalKid").value = document.getElementById("AddressCertificationMaster").selectedIndex;
if(jsonData.adrcer_issuedt === undefined)
{
	jsonData.adrcer_issuedt = '1900-01-01';
}
document.getElementById("usrtxtDate").value= convertToddmmyyyy(jsonData.adrcer_issuedt);
document.getElementById("txtDate").value = jsonData.adrcer_issuedt;
if(jsonData.adrcer_expirydt === undefined)
{
	jsonData.adrcer_expirydt = '1900-01-01';
}
document.getElementById("usrtxtDate1").value= convertToddmmyyyy(jsonData.adrcer_expirydt);
document.getElementById("txtDate1").value = jsonData.adrcer_issuedt;
}

function setAdrKid()
{ 
	
	document.getElementById("isAddressProofLocalKid").value = document.getElementById("AddressCertificationMaster").selectedIndex;
}

function showBasicform()   
{
 checkWildcard("isEHouseNoLocal");
 checkWildcard("isEStreetNoLocal");
 checkWildcard("isELocalityLocal");
document.getElementById("addresstable").style.display = 'none'; 
document.getElementById("Addresstable1").style.display = 'none'; 
document.getElementById("addTable").style.display = "block";
//document.getElementById("tabela").style.display = "block";
document.getElementById("ahrefdel").style.display = "block";
document.getElementById("ahrefadd").style.display = "block";
document.getElementById("adrback").style.display = "none";
document.getElementById("submit1").style.display = "none";
document.getElementById("save").style.display = "block";
 // document.getElementById("delete").style.display = "block";
document.getElementById("addressbtn").style.display = "block";
//sessionStorage.setItem("AdressKnown","CMMAddress") ;  
//fetchCustIDData();
}
 
function processCreateRes()
{
 if((http.readyState == 4) && (http.status == 200)){
		 var res1=http.responseText;
		
	  
		 if(res1==='success')
	    {
         alert('User Created Successfully');
		 document.getElementById("diverrmessage").value = 'User Created Successfully';
		 window.location.href = "/corporatebanking/AddNewUserAction.do?action=getParentCIBUsr";
		 } else if (res1==='fail')
		 {
			  alert('User Creation  Failed');
		 document.getElementById("diverrmessage").value = 'User Creation  Failed';
		 return;
		 } 
 }
}
 function  isValidIssue(date,id)  
{  
	 
  	//var date = document.getElementById(date.id).value; 
         
		 var m = date.substring(3,5);
		 var d = date.substring(0,2);
		 var y = date.substring(6,10);

	if(!(date.length == 10) ||((date.charAt(2)!="-") ||((date.charAt(5)!="-")) ||(d>31) ||(m>12) ||(y<1900)))
	{ 
		alert("Enter Date in DD-MM-YYYY format");
	 	  return false;
	} 
	else{
   
		 var m = date.substring(3,5);
		 var d = date.substring(0,2);
		 var y = date.substring(6,10);
	
		if (d==0 ||m==0 ||y==0 )
		{
			alert("Enter Date Proper");
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
		 
        if (d>dmax) {
				alert("Enter Date Proper");
	    return false;
		}
				
 }

	document.getElementById(id.substring(3,id.length)).value =  convertToyyyyddmm(date)
	return true;
}

 function phonenumber(inputtxt)  
{     
  var phoneno = /^\d{10}$/;  
  if((inputtxt.match(phoneno)))  
   {  
      return true; 
	  document.getElementById("isMobileLocal").value = inputtxt;
	    document.getElementById("isMobileLocal").readonly = 'true';
      } 
      else  
        {  
        alert("Enter Mobile Number properly");  
        return false;  
        }  
} 

function validEMail(text)
{
	if(document.getElementById(text).value!="")
	{
		if(isValidEMail(text));
		else
		{
		alert("Enter Mail Proper");
			document.getElementById(text).value="";
			document.getElementById(text).focus();
		}
	}
}
function validUrl(text)
{
	if(document.getElementById(text).value!="")
	{
		if(isValidUrl(text));
		else
		{
			alert("Enter URL Proper");
			document.getElementById(text).value="";
			document.getElementById(text).focus();
		}
	}
}
function checkWildcard(e)
{

var text = document.getElementById(e).value;
if(text.includes('/') || text.includes('?') || text.includes('*') || text.includes('-') || text.includes('+') || text.includes('(') || text.includes(')') || text.includes('{') || text.includes('}') || text.includes('[') || text.includes(']') ||  text.includes('!') || text.includes('@') || text.includes('#') ||  text.includes('$') ||  text.includes('%') ||  text.includes('^') || text.includes('&') || text.includes('<') || text.includes('>') || text.includes(':') || text.includes(';') || text.includes('"'))
{	
alert('Special Characters not Allowed in ' +e  );
document.getElementById(e).value="";
document.getElementById(e).focus();
return false;
}
}

function convertToddmmyyyy(inputDate) {
    var date = new Date(inputDate);
    if (!isNaN(date.getTime())) {
        var day = date.getDate().toString();
        var month = (date.getMonth() + 1).toString();
        // Months use 0 index.

        return (month[1] ? month : '0' + month[0]) + '-' +
           (day[1] ? day : '0' + day[0]) + '-' + 
           date.getFullYear();
    }
}
function convertToyyyyddmm(inputDate)
{
return  inputDate.split("/").reverse().join("-");

}
