var data=new Array();
var data1=new Array();
var f=false;
function convertLanguage(source,target,thirdLang)
{
	var eng=document.getElementById(source).value;
	document.getElementById(target).value=region(eng ,thirdLang );
} 
function goToBack()
{	
	document.forms[0].action="personalForward.do" 
	document.forms[0].method="post";
	document.forms[0].submit();
}
function userConfirmation()
{	
	var x = window.showModalDialog(appcontext +"/custid/UserConfirmation.jsp","Dialog Arguments Value","dialogHeight: 60px; dialogWidth: 450px; dialogTop: 300px; dialogLeft: 100px; edge: Raised; center: Yes; help: Yes; resizable: No; status: No;");

	if(x=="close")
	{
		document.forms[0].action=appcontext +"/CustId/forwardAction.do?pageName=Main";
		document.forms[0].submit();//remove name of submit button also
	}
}
function isNull(form_path, field_name)
{
	fieldvalue =document.getElementById(field_name).value;
	if(fieldvalue == "" || fieldvalue == null)
	{
		//document.getElementById(field_name).focus();
		//document.getElementById(field_name).select();
		return true;
	}
	else
	{
		length_of_value = fieldvalue.length;
		check_value = fieldvalue;
		space_count =0;
		for(var i=0; i<length_of_value; i++)
		{
			if(check_value.charAt(i) == " ")
			space_count++;
		}
		if(space_count == length_of_value)
		{
		//	document.getElementById(field_name).focus();
			//document.getElementById(field_name).select();
			return true;
		}
	}
	return false;
}
function makeDisableForAuthorization()
{
	var form = window.document.forms[0];
	for(var i=0;i<document.images.length;i++)
		document.images[i].disabled=true;
	for(var i=0; i<form.elements.length; i++)
	{
		if(form.elements[i].type == "text")
			form.elements[i].readOnly = true;
		else if(form.elements[i].type == "button")
			form.elements[i].disabled = true;
		else if(form.elements[i].type == "select-multiple")
			form.elements[i].readOnly = true;
		else if(form.elements[i].type == "select-one")
			form.elements[i].readOnly = true;
		else if(form.elements[i].type == "select")
			form.elements[i].readOnly = true;
		else if(form.elements[i].type == "checkbox")
			form.elements[i].readOnly = true;
		else if(form.elements[i].type == "radio")
			form.elements[i].readOnly = true;
		else if(form.elements[i].type == "img")
			form.elements[i].disabled = true;
	}
}
 
function goToErrorControl(select)
{	
	if(select.options.length!=0)
	{
	var str=select.selectedIndex;
	var str1=select.options[str].value;
	if(str1=="42"||str1=="52"||str1==
		"55"){ 
				tabOnClick(2,'P');
				oelement= document.getElementById(str1);
				oelement.focus();
	}
	else 	if(str1=="72"){ 
				tabOnClick(3,'W');
				oelement= document.getElementById(str1);
             	oelement.focus();
	}
	else {
				oelement= document.getElementById(str1);
				oelement.focus();
	}

	}
}
var sub;
function tabOnClick(ID,flag)
{ 
	var oElement = null;
	var countL,t;
	for (var i=0;i<3;i++)
	{
		var c=i+1;
		oElement = document.getElementById(c);
		oElement.style.display = "block";
 
	}
	 document.getElementById("3").disabled=false;
	oElement = document.getElementById(ID);
	oElement.style.display = "block";
	sub=false;
	if(ID==1)
	{	
		document.getElementById("1").style.backgroundColor="#3366FF";
		document.getElementById("1").style.color="white";
		document.getElementById("1").style.border="Solid 2 #3366FF";
		document.getElementById("2").style.color="black";
		document.getElementById("3").style.color="black";
		document.getElementById("2").style.backgroundColor="activeborder";
		document.getElementById("2").style.border="Solid 2 #3366FF";
		document.getElementById("3").style.backgroundColor="activeborder";
		document.getElementById("3").style.border="Solid 2 #3366FF";
		oElement = document.getElementById("div_block");
		oElement.style.display = "block";
		document.getElementById("Work_field").style.display = "none";
		document.getElementById("Addressdiv1").style.display = "block";
		//alert("div one");
		flag="L";
		countL=document.getElementById("countL").value;
		t=countL;
		document.getElementById("countL").value=++countL;
		var temp_flag =document.getElementById("tempSaveButton").value;
		if((t==0))
		{
			setValue(ID);
			sendData(temp_flag,"L");
		}
		else
		{
			sendData(temp_flag,"L");
			setValue(ID);
		}
			document.getElementById("tempSaveButton").value="L";
	}
		 
	if(ID==2)
	{
		document.getElementById("2").style.backgroundColor="#3366FF";
		document.getElementById("2").style.color="white";
		document.getElementById("2").style.border="Solid 2 #3366FF";
		document.getElementById("1").style.color="black";
		document.getElementById("3").style.color="black";
		document.getElementById("1").style.backgroundColor="activeborder";
		document.getElementById("1").style.border="Solid 2 #3366FF";
		document.getElementById("3").style.backgroundColor="activeborder";
		document.getElementById("3").style.border="Solid 2 #3366FF";
		oElement = document.getElementById("div_block");
		oElement.style.display = "block";
		document.getElementById("Work_field").style.display = "none";
		document.getElementById("Addressdiv1").style.display = "none";
		flag="P";//For Focus 
		var temp_flag =document.getElementById("tempSaveButton").value;
		sendData(temp_flag,"P");
		setValue(ID);
		document.getElementById("tempSaveButton").value="P";
		
	}
		 
	if(ID==3)
	{
		document.getElementById("3").style.backgroundColor="#3366FF";
		document.getElementById("3").style.color="white";
		document.getElementById("3").style.border="Solid 2 #3366FF";
		document.getElementById("1").style.color="black";
		document.getElementById("2").style.color="black";
		document.getElementById("1").style.backgroundColor="activeborder";
		document.getElementById("1").style.border="Solid 2 #3366FF";
		document.getElementById("2").style.backgroundColor="activeborder";
		document.getElementById("2").style.border="Solid 2 #3366FF";
		flag="O"; 
		document.getElementById("Work_field").style.display = "block";
		document.getElementById("Addressdiv1").style.display = "none";
		oElement = document.getElementById("div_block");
		oElement.style.display = "block";
		var temp_flag =document.getElementById("tempSaveButton").value;
		sendData(temp_flag,"O");
		setValue(ID);
		document.getElementById("tempSaveButton").value="O";
	}
	if(ID=="submit1")
	{
		var temp_flag =document.getElementById("tempSaveButton").value;
		sub=true;
		sendData(temp_flag,temp_flag);
		document.getElementById("tempSaveButton").value=temp_flag;
	}

 
 if((flag=="O"||flag=="P"||flag=="L")&&checkAuthorization!=true)
	{
	}
	else {
		//document.forms[0].submit1.focus();
	}
}
function addressCopy(id)
{	
   var no=id;
   var i,j;
	/////////////////// To Copy Address Into Permanent
	if(no==1)
	{
		for(i=34,j=4;i<64;i++,j++){
			document.getElementById(i).value=document.getElementById(j).value;
		}
		document.getElementById("isHCityPermanent").value=document.getElementById("isHCityLocal").value;
		document.getElementById("isDocNoPermanent").value=document.getElementById("isDocNoLocal").value;
		document.getElementById("isCountryPermanent").value=document.getElementById("isCountryLocal").value;
		document.getElementById("isCountryPermanentLabel").value=document.getElementById("isCountryLocalLabel").value;
		document.getElementById("isCountryPermanentKid").value=document.getElementById("isCountryLocalKid").value;
		document.getElementById("isDistrictPermanent").value=document.getElementById("isDistrictLocal").value;
		document.getElementById("isDistrictPermanentLabel").value=document.getElementById("isDistrictLocalLabel").value;
		document.getElementById("isDistrictPermanentKid").value=document.getElementById("isDistrictLocalKid").value;
		document.getElementById("isCityPermanentKid").value = document.getElementById("isCityLocalKid").value
		document.getElementById("wardnoP").value=document.getElementById("wardno").value;
		document.getElementById("ispostP").value=document.getElementById("ispost").value;
		document.getElementById("postenameP").value=document.getElementById("postename").value;
		document.getElementById("ispostkidP").value=document.getElementById("ispostkid").value;
		document.getElementById("isvillageP").value=document.getElementById("isvillage").value;
		document.getElementById("villageenameP").value=document.getElementById("villageename").value;
		document.getElementById("isvillagekidP").value=document.getElementById("isvillagekid").value;
		document.getElementById("blockCodeP").value =document.getElementById("blockCode").value;
		document.getElementById("blockNameP").value =document.getElementById("blockName").value;
		document.getElementById("blockKidP").value =document.getElementById("blockKid").value;
		document.getElementById("ispanchyatP").value=document.getElementById("ispanchyat").value;
		document.getElementById("panchayatenameP").value=document.getElementById("panchayatename").value;
		document.getElementById("ispanchayatkidP").value=document.getElementById("ispanchayatkid").value;
		document.getElementById("istalukP").value=document.getElementById("istaluk").value;
		document.getElementById("talukaenameP").value=document.getElementById("talukaename").value;
		document.getElementById("istalukakidP").value=document.getElementById("istalukakid").value;
		document.getElementById("amsomDesomCodep").value=document.getElementById("amsomDesomCode").value;
		document.getElementById("amsomDesomNamep").value=document.getElementById("amsomDesomName").value;
		document.getElementById("amsomDesomKidp").value=document.getElementById("amsomDesomKid").value;  
		document.getElementById("desomCodeP").value=document.getElementById("desomCode").value;
		document.getElementById("isDocNoPermanent").value=document.getElementById("isDocNoLocal").value;
	}
	/////////////////// To Copy Address Into Work
	if(no==2)
	{
		for(i=64,j=4;i<78;i++,j++) {
			document.getElementById(i).value=document.getElementById(j).value;
		}
		document.getElementById("isHCityWork").value=document.getElementById("isHCityLocal").value;
		document.getElementById("isCountryWork").value=document.getElementById("isCountryLocal").value;
		document.getElementById("isCountryWorkLabel").value=document.getElementById("isCountryLocalLabel").value;
		document.getElementById("isCountryWorkKid").value=document.getElementById("isCountryLocalKid").value;
		document.getElementById("isDistrictWork").value=document.getElementById("isDistrictLocal").value;
		document.getElementById("isDistrictWorkLabel").value=document.getElementById("isDistrictLocalLabel").value;
		document.getElementById("isDistrictWorkKid").value=document.getElementById("isDistrictLocalKid").value;
		document.getElementById("isCityWorkKid").value = document.getElementById("isCityLocalKid").value

		document.getElementById("wardnoW").value=document.getElementById("wardno").value;
		document.getElementById("ispostW").value=document.getElementById("ispost").value;
		document.getElementById("postenameW").value=document.getElementById("postename").value;
		document.getElementById("ispostkidW").value=document.getElementById("ispostkid").value;
		document.getElementById("isvillageW").value=document.getElementById("isvillage").value;
		document.getElementById("villageenameW").value=document.getElementById("villageename").value;
		document.getElementById("isvillagekidW").value=document.getElementById("isvillagekid").value;
		document.getElementById("blockCodeW").value =document.getElementById("blockCode").value;
		document.getElementById("blockNameW").value =document.getElementById("blockName").value;
		document.getElementById("blockKidW").value =document.getElementById("blockKid").value;
		document.getElementById("ispanchyatW").value=document.getElementById("ispanchyat").value;
		document.getElementById("panchayatenameW").value=document.getElementById("panchayatename").value;
		document.getElementById("ispanchayatkidW").value=document.getElementById("ispanchayatkid").value;
		document.getElementById("istalukW").value=document.getElementById("istaluk").value;
		document.getElementById("talukaenameW").value=document.getElementById("talukaename").value;
		document.getElementById("istalukakidW").value=document.getElementById("istalukakid").value;
		document.getElementById("amsomDesomCodew").value=document.getElementById("amsomDesomCode").value;
		document.getElementById("amsomDesomNamew").value=document.getElementById("amsomDesomName").value;
		document.getElementById("amsomDesomKidw").value=document.getElementById("amsomDesomKid").value;	
		document.getElementById("desomCodeW").value=document.getElementById("desomCode").value;


	}
}
function giveMasterData(str,field,fieldHelp,fieldHidden)
{
	//alert("Givemasterdata called" +str+field+fieldHelp+fieldHidden);
	var keycode=event.keyCode;

	open(appcontext +"/CustId/CmmhelpPanel.jsp?control="+str+"&control1="+field+"&control2="+fieldHelp+"&control3="+fieldHidden,"mychild", "width=600, height=250, scrollbars=no,Left=100,Top=100");
}
function callMasterHelp(str,field,fieldHelp,fieldHidden,evt)
{
	evt =window.event || arguments.callee.caller.arguments[0];
	var charCode =(evt.which)?evt.which :evt.keyCode;
	if(charCode == 112)
	{
		 if(str=='stateLocal')
			 openHelpPanel('12', '14', '13','StateMaster');
		 else if(str=='resownLocal')
			 openHelpPanel('22', '24', '23','ResidentOwnership');
		 else if (str=='adrProofLocal')
			  openHelpPanelIntroducer('25', '27', '26','isAddressProofWithoutExpDate','AddressCertificationMaster');
		 else if(str=='statePermanent')
			 openHelpPanel('42', '44', '43','StateMaster');
		 else if(str=='resownPermanent')
			 openHelpPanel('52', '54', '53','ResidentOwnership');
		 else if(str=='adrProofPermanent')
			openHelpPanelIntroducer('55', '57', '56','isAddressProofWithoutExpDateP','AddressCertificationMaster');	 
		 else if (str=='stateWork')
			openHelpPanel('72', '74', '73','StateMaster')	
	}
}
/////////////////Validation////////////////
function validEMail(text)
{
	if(document.getElementById(text).value!="")
	{
		if(isValidEMail(text));
		else
		{
			showMessage(1448,"error");
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
			showMessage(2213,"error");
			document.getElementById(text).value="";
			document.getElementById(text).focus();
		}
	}
}
function issueDate(text,sDate,Dob,personalFlag)
{
	//alert("In Issue date Check");
	if(document.getElementById(text).value!="")
	{
		if(isValidDateFormat(text))
			{	// cdate ----------> From Session

				if(currentDateCompare(sDate,text))
				{
						 if(personalFlag)
							{	
								if(dateCompare(text,Dob))
										{
								//			alert("Issue date  Greater than Date Of Birth:::"+'<%=dob%>');
											return true;
										}
									else
									{
								//	alert("<bean:message key='1887'/>");
								showMessage(1887,'error');
									if(text=="32")
										tabOnClick("1");
									else	if(text=="62")
										tabOnClick("2");
									else	if(text=="92")
											tabOnClick("3");
										document.getElementById(text).value="";
											//document.getElementById(text).focus();
											return false;
									}
							}
				}
			else
				{
						//alert("<bean:message key='873'/>");
						showMessage(873,'error');
									if(text=="32")
										tabOnClick("1");
									else	if(text=="62")
										tabOnClick("2");
									else	if(text=="92")
											tabOnClick("3");
					document.getElementById(text).value="";
					//document.getElementById(text).focus();
					return false;
				}
		}
//		else
//		{
			//	alert("<bean:message  key='25'/>");
//			showMessage(25,'error');
//			document.getElementById(text).value="";
			//document.getElementById(text).focus();
//			return  false;
//		} 
	}
	return true;
}
function expiryDate(expDate,issDate,sDate)
{	
	//alert("In Expiry date Check issDate"+issDate);
	if(document.getElementById(expDate).value!="" && document.getElementById(issDate).value!="")
	{
				if(isValidDateFormat(expDate))
						{	// cdate ----------> From Session

								if(!currentDateCompare(sDate,expDate))
								{
								//	alert("Current date Compare True");
										return true;
								}
								else
								{
							//		alert("<bean:message  key='1646'/>");
									showMessage(1646,'error');
									if(issDate=="32")
										tabOnClick("1");
									else	if(issDate=="62")
										tabOnClick("2");
									else	if(issDate=="92")
											tabOnClick("3");
									document.getElementById(expDate).value="";
								//	document.getElementById(expDate).focus();
								return false;
							}
			}
			else
					{
					//	alert("<bean:message key='25'/>");
					//	showMessage(25,'error');
					//			if(issDate=="32")
					//					tabOnClick("1");
					//				else	if(issDate=="62")
					//					tabOnClick("2");
					//				else	if(issDate=="92")
					//						tabOnClick("3");
					//	document.getElementById(expDate).value="";
					//	document.getElementById(expDate).focus();
					//	return false;
					}
	}
	return true;
}
	function showhide(di)
	{
		var divs = di;
		if(divs == "calAddressIssueLocal")
		{
			var sty = cal_isIssueDateLocal_display.style.display;
			if(sty == "none")
			{
				cal_isExpiryDateLocal_display.style.display = "none";
				cal_isExpiryDateLocal_display_year.style.display = "none";
				cal_isIssueDateLocal_display.style.display = "block";
				cal_isIssueDateLocal_display_year.style.display = "block";
			}
			else
			{
				cal_isIssueDateLocal_display.style.display = "none";
				cal_isIssueDateLocal_display_year.style.display = "none";
			}
		document.getElementById("btnShow2").focus();	
	}
	if(divs == "calAddressExpiryLocal")
		{
			var sty = cal_isExpiryDateLocal_display.style.display;
			if(sty == "none")
			{
				cal_isIssueDateLocal_display.style.display = "none";
				cal_isIssueDateLocal_display_year.style.display = "none";
				cal_isExpiryDateLocal_display.style.display = "block";
				cal_isExpiryDateLocal_display_year.style.display = "block";
			}
			else
			{
				cal_isExpiryDateLocal_display.style.display = "none";
				cal_isExpiryDateLocal_display_year.style.display = "none";
			}
				document.getElementById("btnShow4").focus();	
		}
	if(divs == "calAddressIssuePerm")
		{
			var sty = cal_isIssueDatePermanent_display.style.display;
			if(sty == "none")
			{
				cal_isExpiryDatePermanent_display.style.display = "none";
				cal_isExpiryDatePermanent_display_year.style.display = "none";
				cal_isIssueDatePermanent_display.style.display = "block";
				cal_isIssueDatePermanent_display_year.style.display = "block";
			}
			else
			{
				cal_isIssueDatePermanent_display.style.display = "none";
				cal_isIssueDatePermanent_display_year.style.display = "none";
			}
		document.getElementById("btnShow6").focus();	
		}
	if(divs == "calAddressExpiryPerm")
		{
			var sty = cal_isExpiryDatePermanent_display.style.display;
			if(sty == "none")
			{
				cal_isIssueDatePermanent_display.style.display = "none";
				cal_isIssueDatePermanent_display_year.style.display = "none";
				cal_isExpiryDatePermanent_display.style.display = "block";
				cal_isExpiryDatePermanent_display_year.style.display = "block";
			}
			else
			{
				cal_isExpiryDatePermanent_display.style.display = "none";
				cal_isExpiryDatePermanent_display_year.style.display = "none";
			}
		document.getElementById("btnShow8").focus();	
		}
	if(divs == "calAddressIssueWork")
		{
			var sty = cal_isIssueDateWork_display.style.display;
			if(sty == "none")
			{
				cal_isExpiryDateWork_display.style.display = "none";
				cal_isExpiryDateWork_display_year.style.display = "none";
				cal_isIssueDateWork_display.style.display = "block";
				cal_isIssueDateWork_display_year.style.display = "block";
			}
			else
			{
				cal_isIssueDateWork_display.style.display = "none";
				cal_isIssueDateWork_display_year.style.display = "none";
			}
document.getElementById("btnShow10").focus();	
		}
	if(divs == "calAddressExpiryWork")
		{
			var sty = cal_isExpiryDateWork_display.style.display;
			if(sty == "none")
			{
				cal_isIssueDateWork_display.style.display = "none";
				cal_isIssueDateWork_display_year.style.display = "none";
				cal_isExpiryDateWork_display.style.display = "block";
				cal_isExpiryDateWork_display_year.style.display = "block";
			}
			else
			{
				cal_isExpiryDateWork_display.style.display = "none";
				cal_isExpiryDateWork_display_year.style.display = "none";
			}
			document.getElementById("btnShow12").focus();	
		}
}
function moveNextL()
		{
				if(!validateInputForm("Address"))
					return false;
				if(!checkBlankL())
					return false;
		if(rCountL<tCountL && checkFlagL==false )
			{
			if(chengedRecordL())
				{
						//alert("In rcout<tcout && flaf=false:::");
							var  addCertificateRecordL=new Array();
							//addCertificateRecordL[0]=document.forms[0].isHAuthorityLocal.value;
							addCertificateRecordL[1]=document.forms[0].isEAuthorityLocal.value;
							//addCertificateRecordL[2]=document.forms[0].isHPlaceLocal.value;
							addCertificateRecordL[3]=document.forms[0].isEPlaceLocal.value;
							addCertificateRecordL[4]=document.forms[0].isIssueDateLocal.value;
							addCertificateRecordL[5]=document.forms[0].isExpiryDateLocal.value;
							addCertificateRecordL[6]=document.forms[0].isAddressProofLocal.value;
							addCertificateRecordL[8]=document.forms[0].isAddressProofLocalLabel.value;
							addCertificateRecordL[7]=document.forms[0].isAddressProofLocalKid.value;
							addCertificateRecordL[9]=document.forms[0].isDocNoLocal.value;
							addCertificateRecordL[10]=document.forms[0].DeletedL.checked;
							AddressCertificationL[rCountL]=addCertificateRecordL;
         		}
					 rCountL++;
					// alert("in  Display Next:::"+rCountL);
							//document.forms[0].isHAuthorityLocal.value=AddressCertificationL[rCountL][0];
							document.forms[0].isEAuthorityLocal.value=AddressCertificationL[rCountL][1];
							//document.forms[0].isHPlaceLocal.value=AddressCertificationL[rCountL][2];
							document.forms[0].isEPlaceLocal.value=AddressCertificationL[rCountL][3];
							document.forms[0].isIssueDateLocal.value=AddressCertificationL[rCountL][4];
							document.forms[0].isExpiryDateLocal.value=AddressCertificationL[rCountL][5];
							document.forms[0].isAddressProofLocal.value=AddressCertificationL[rCountL][6];
							document.forms[0].isAddressProofLocalLabel.value=AddressCertificationL[rCountL][8];
							document.forms[0].isAddressProofLocalKid.value=AddressCertificationL[rCountL][7];
							document.forms[0].isDocNoLocal.value=AddressCertificationL[rCountL][9];
							document.forms[0].DeletedL.checked=AddressCertificationL[rCountL][10];
							document.forms[0].rCounterL.value="  "+eval(parseInt(rCountL)+parseInt(1))+" Of "+eval(parseInt(tCountL)+parseInt(1));
			}
			else
			{
				if(checkFlagL==false)
					 {
			 		//	alert("In flag=false:::");
					     checkFlagL=true;
							var  addCertificateRecordL=new Array();
							//addCertificateRecordL[0]=document.forms[0].isHAuthorityLocal.value;
							addCertificateRecordL[1]=document.forms[0].isEAuthorityLocal.value;
							//addCertificateRecordL[2]=document.forms[0].isHPlaceLocal.value;
							addCertificateRecordL[3]=document.forms[0].isEPlaceLocal.value;
							addCertificateRecordL[4]=document.forms[0].isIssueDateLocal.value;
							addCertificateRecordL[5]=document.forms[0].isExpiryDateLocal.value;
							addCertificateRecordL[6]=document.forms[0].isAddressProofLocal.value;
							addCertificateRecordL[8]=document.forms[0].isAddressProofLocalLabel.value;
							addCertificateRecordL[7]=document.forms[0].isAddressProofLocalKid.value;
							addCertificateRecordL[9]=document.forms[0].isDocNoLocal.value;
							addCertificateRecordL[10]=document.forms[0].DeletedL.checked;
							AddressCertificationL[rCountL]=addCertificateRecordL;
							//document.forms[0].isHAuthorityLocal.value="";
							document.forms[0].isEAuthorityLocal.value="";
							//document.forms[0].isHPlaceLocal.value="";
							document.forms[0].isEPlaceLocal.value="";
							document.forms[0].isIssueDateLocal.value="";
							document.forms[0].isExpiryDateLocal.value="";
							document.forms[0].isAddressProofLocal.value="";
							document.forms[0].isAddressProofLocalLabel.value="";
							document.forms[0].isAddressProofLocalKid.value="";
							document.forms[0].isDocNoLocal.value="";
							document.forms[0].DeletedL.checked=false;
						blankcheckL=true;
					 }
				else
				    {
						//	alert("In Add next Mode :::");
					 		++tCountL;
							++rCountL;
							document.forms[0].rCounterL.value="  "+eval(parseInt(rCountL)+parseInt(1))+" Of "+eval(parseInt(tCountL)+parseInt(1));
								var  addCertificateRecordL=new Array();
							//addCertificateRecordL[0]=document.forms[0].isHAuthorityLocal.value;
							addCertificateRecordL[1]=document.forms[0].isEAuthorityLocal.value;
							//addCertificateRecordL[2]=document.forms[0].isHPlaceLocal.value;
							addCertificateRecordL[3]=document.forms[0].isEPlaceLocal.value;
							addCertificateRecordL[4]=document.forms[0].isIssueDateLocal.value;
							addCertificateRecordL[5]=document.forms[0].isExpiryDateLocal.value;
							addCertificateRecordL[6]=document.forms[0].isAddressProofLocal.value;
							addCertificateRecordL[8]=document.forms[0].isAddressProofLocalLabel.value;
							addCertificateRecordL[7]=document.forms[0].isAddressProofLocalKid.value;
							addCertificateRecordL[9]=document.forms[0].isDocNoLocal.value;
							addCertificateRecordL[10]=document.forms[0].DeletedL.checked;
							AddressCertificationL[rCountL]=addCertificateRecordL;
							//document.forms[0].isHAuthorityLocal.value="";
							document.forms[0].isEAuthorityLocal.value="";
							//document.forms[0].isHPlaceLocal.value="";
							document.forms[0].isEPlaceLocal.value="";
							document.forms[0].isIssueDateLocal.value="";
							document.forms[0].isExpiryDateLocal.value="";
							document.forms[0].isAddressProofLocal.value="";
							document.forms[0].isAddressProofLocalLabel.value="";
							document.forms[0].isAddressProofLocalKid.value="";
							document.forms[0].isDocNoLocal.value="";
							document.forms[0].DeletedL.checked=false;
							blankcheckL=true;
		  		   }
		    }
			if(cMode=="Authorization" && sizeL <= eval(parseInt(rCountL)+parseInt(1))){
			   document.getElementById("Next").disabled=true;
			}
	}
function moveBackL()
{
//	alert("moveBack");
	document.forms[0].rCounterL.value="  "+eval(parseInt(rCountL)+parseInt(1))+" Of "+eval(parseInt(tCountL)+parseInt(1));	
			if(!validateInputForm("Address"))
					return false;
			if(rCountL==-1)
				  return;
		if(rCountL==tCountL && blankcheckL==true)
			{
					blankcheckL=false;
					vv=tCountL-1;
					if(vv==-1)
						vv=0;
					if(validateInputForm()&&!chengedRecordL())
						{
							++tCountL;
							++rCountL;
							document.form[0].rCounterL.value="  "+eval(parseInt(rCountL)+parseInt(1))+" Of "+eval(parseInt(tCountL)+parseInt(1));
							var  addCertificateRecordL=new Array();
							//addCertificateRecordL[0]=document.forms[0].isHAuthorityLocal.value;
							addCertificateRecordL[1]=document.forms[0].isEAuthorityLocal.value;
							//addCertificateRecordL[2]=document.forms[0].isHPlaceLocal.value;
							addCertificateRecordL[3]=document.forms[0].isEPlaceLocal.value;
							addCertificateRecordL[4]=document.forms[0].isIssueDateLocal.value;
							addCertificateRecordL[5]=document.forms[0].isExpiryDateLocal.value;
							addCertificateRecordL[6]=document.forms[0].isAddressProofLocal.value;
							addCertificateRecordL[8]=document.forms[0].isAddressProofLocalLabel.value;
							addCertificateRecordL[7]=document.forms[0].isAddressProofLocalKid.value;
							addCertificateRecordL[9]=document.forms[0].isDocNoLocal.value;
							addCertificateRecordL[10]=document.forms[0].DeletedL.checked;
							AddressCertificationL[rCountL]=addCertificateRecordL;
						}
		}
			checkFlagL=false;
				if(checkBlankL())
				{
					if(chengedRecordL())
					{
						//alert("In  Move Back");
							var  addCertificateRecordL=new Array();
							//addCertificateRecordL[0]=document.forms[0].isHAuthorityLocal.value;
							addCertificateRecordL[1]=document.forms[0].isEAuthorityLocal.value;
							//addCertificateRecordL[2]=document.forms[0].isHPlaceLocal.value;
							addCertificateRecordL[3]=document.forms[0].isEPlaceLocal.value;
							addCertificateRecordL[4]=document.forms[0].isIssueDateLocal.value;
							addCertificateRecordL[5]=document.forms[0].isExpiryDateLocal.value;
							addCertificateRecordL[6]=document.forms[0].isAddressProofLocal.value
							addCertificateRecordL[8]=document.forms[0].isAddressProofLocalLabel.value;
							addCertificateRecordL[7]=document.forms[0].isAddressProofLocalKid.value;
							addCertificateRecordL[9]=document.forms[0].isDocNoLocal.value;
							addCertificateRecordL[10]=document.forms[0].DeletedL.checked;

							AddressCertificationL[rCountL]=addCertificateRecordL;
					}
				}
			 rCountL--;
				if(rCountL==-1)
					  rCountL=0;
				//	alert("in  Display Next:::"+rCountL);
							//document.forms[0].isHAuthorityLocal.value=AddressCertificationL[rCountL][0];
							document.forms[0].isEAuthorityLocal.value=AddressCertificationL[rCountL][1];
							//document.forms[0].isHPlaceLocal.value=AddressCertificationL[rCountL][2];
							document.forms[0].isEPlaceLocal.value=AddressCertificationL[rCountL][3];
							document.forms[0].isIssueDateLocal.value=AddressCertificationL[rCountL][4];
							document.forms[0].isExpiryDateLocal.value=AddressCertificationL[rCountL][5];
							document.forms[0].isAddressProofLocal.value=AddressCertificationL[rCountL][6];
							document.forms[0].isAddressProofLocalLabel.value=AddressCertificationL[rCountL][8];
							document.forms[0].isAddressProofLocalKid.value=AddressCertificationL[rCountL][7];
							document.forms[0].isDocNoLocal.value=AddressCertificationL[rCountL][9];
							document.forms[0].DeletedL.checked=AddressCertificationL[rCountL][10];
							document.forms[0].rCounterL.value="  "+eval(parseInt(rCountL)+parseInt(1))+" Of "+eval(parseInt(tCountL)+parseInt(1));	

	if(cMode=="Authorization" && sizeL >= eval(parseInt(rCountL)+parseInt(1))){
	   document.getElementById("Next").disabled=false;
	  }
 }
		function checkBlankL()
		{
			

			 var isAddressProofLocalKid = document.getElementById("isAddressProofLocalKid").value;
	//		var isAddressProofPermanentKid = document.getElementById("57").value;

			if(document.forms[0].isEAuthorityLocal.value!="" && document.forms[0].isEPlaceLocal.value!="" &&  document.forms[0].isAddressProofLocal.value!="" && document.forms[0].isDocNoLocal.value!="")
			{  
				if(trim(isAddressProofLocalKid) =='Y' )
					{
						if(document.forms[0].isIssueDateLocal.value!="" && document.forms[0].isExpiryDateLocal.value!="")
							return true;
						else
							return false;
					}
				else
				   return true;
			}
			else 
				return false;
		}
	function chengedRecordL()
		{
			 if(!((document.forms[0].isEAuthorityLocal.value==AddressCertificationL[rCountL][1])&&
				 (document.forms[0].isEPlaceLocal.value==AddressCertificationL[rCountL][3])&&
			//	 (document.forms[0].isIssueDateLocal.value==AddressCertificationL[rCountL][4])&&
			//	 (document.forms[0].isExpiryDateLocal.value==AddressCertificationL[rCountL][5])&&
				 (document.forms[0].isAddressProofLocal.value==AddressCertificationL[rCountL][6])&&
				 (document.forms[0].isDocNoLocal.value==AddressCertificationL[rCountL][9])&&
				  (document.forms[0].DeletedL.checked==AddressCertificationL[rCountL][10])))
						return true;
		}
 function changePageL(type,message)
 {
	 var flag=false;
	 if( cMode != "Authorization" && cMode=="Edit")
	 {
	  //alert(cMode);
	  var confrm = confirm(message);
	  if(confrm==false)
	  {
	  
	   return false;
	  }
	 }
	 
	if(trim(document.getElementById("isEHouseNoLocal").value)=="" && cMode != "Authorization")
	 {
		 showMessage(1509,'error');
		 return false;
	 }
	 if(trim(document.getElementById("isECityLocal").value)=="")
	 {
		 showMessage(1835,'error');
		 return false;
	 }
	
	// tabOnClick("submit1","true");
	// savData("OK_Click"); 
	 if(trim(document.getElementById("isPinCodeLocal").value)=="" && cMode != "Authorization")
	 {
		 showMessage(71059,'error');  
		 return false;
	 }
	 if(!validateInputForm())
		 return false ;
	// var flag=false;
	 if( (tCountL==-1) && checkBlankL())
	 {
		 flag=true;

	 }
	 if(rCountL==tCountL && blankcheckL==true)
	 {
		 blankcheckL=false;
		 vv=tCountL-1;
		 //alert("VVVV="+vv);
		 if(vv==-1)
			 vv=0;
		 if(validateInputForm() && checkBlankL())
		 {		
			 flag=true;
			 //	alert("flag=true Second ");
		 }
	 }
	 if(!validateInputForm())
	 {	
		 //tCount=-1	
		 flag=false;
	 }
	 if(flag==true)
	 {
		 //	alert("Flag== True:::");
		 var  addCertificateRecordL=new Array();
		// addCertificateRecordL[0]=document.forms[0].isHAuthorityLocal.value;
		 addCertificateRecordL[1]=document.forms[0].isEAuthorityLocal.value;
		 //addCertificateRecordL[2]=document.forms[0].isHPlaceLocal.value;
		 addCertificateRecordL[3]=document.forms[0].isEPlaceLocal.value;
		 addCertificateRecordL[4]=document.forms[0].isIssueDateLocal.value;
		 addCertificateRecordL[5]=document.forms[0].isExpiryDateLocal.value;
		 addCertificateRecordL[6]=document.forms[0].isAddressProofLocal.value;
		 addCertificateRecordL[8]=document.forms[0].isAddressProofLocalLabel.value;
		 addCertificateRecordL[7]=document.forms[0].isAddressProofLocalKid.value;
		 addCertificateRecordL[9]=document.forms[0].isDocNoLocal.value;
		 addCertificateRecordL[10]=document.forms[0].DeletedL.checked;
		 rCountL++;
		 tCountL++;
		 AddressCertificationL[rCountL]=addCertificateRecordL;
	 }
	 if(flag==false&&rCountL!=-1)
	 {
		 //	alert("before change check");  
		 //	&& chengedRecordL()
		 if(validateInputForm()  && checkBlankL())
		 {
			 //	alert("changes Found");
			 var  addCertificateRecordL=new Array();
			// addCertificateRecordL[0]=document.forms[0].isHAuthorityLocal.value;
			 addCertificateRecordL[1]=document.forms[0].isEAuthorityLocal.value;
			// addCertificateRecordL[2]=document.forms[0].isHPlaceLocal.value;
			 addCertificateRecordL[3]=document.forms[0].isEPlaceLocal.value;
			 addCertificateRecordL[4]=document.forms[0].isIssueDateLocal.value;
			 addCertificateRecordL[5]=document.forms[0].isExpiryDateLocal.value;
			 addCertificateRecordL[6]=document.forms[0].isAddressProofLocal.value;
			 addCertificateRecordL[8]=document.forms[0].isAddressProofLocalLabel.value;
			 addCertificateRecordL[7]=document.forms[0].isAddressProofLocalKid.value;
			 addCertificateRecordL[9]=document.forms[0].isDocNoLocal.value;
			 addCertificateRecordL[10]=document.forms[0].DeletedL.checked;
			 AddressCertificationL[rCountL]=addCertificateRecordL;
		
		 }
	 }			
	 // alert("Array to hidden Called  tCountL::"+tCountL);
	 arrayToHiddenL(type);
	 tabOnClick("submit1","true");
	 savData("OK_Click"); 
	 //return true;
	 w=CallUserConfirmation(message);
	 if(w==true)
	 {
		 return true;
		 //document.forms[0].action=appcontext +"/CustId/CmmOccupationForm.do";
		 //document.forms[0].submit();
	 }
	 else
	 {
		 		 return false;
	 }
	 
 }
  function  arrayToHiddenL(type)
   {
	 //alert("arrayToHiddenL");
						    document.forms[0].ihHAuthorityLocal.value="";
							document.forms[0].ihEAuthorityLocal.value="";
							document.forms[0].ihHPlaceLocal.value="";
							document.forms[0].ihEPlaceLocal.value="";
							document.forms[0].ihIssueDateLocal.value="";
							document.forms[0].ihExpiryDateLocal.value="";
							document.forms[0].ihAddressProofLocal.value="";
							document.forms[0].ihAddressProofLocalLabel.value="";
							document.forms[0].ihAddressProofLocalKid.value="";
							document.forms[0].ihDocNoLocal.value="";
							document.forms[0].isDeletedL.value="";
	
		    for( i=0;i<=tCountL;i++)
				{
							document.forms[0].ihHAuthorityLocal.value=document.forms[0].ihHAuthorityLocal.value+AddressCertificationL[i][0]+":";
							document.forms[0].ihEAuthorityLocal.value=document.forms[0].ihEAuthorityLocal.value+AddressCertificationL[i][1]+":";
							document.forms[0].ihHPlaceLocal.value=document.forms[0].ihHPlaceLocal.value+AddressCertificationL[i][2]+":";
							document.forms[0].ihEPlaceLocal.value=document.forms[0].ihEPlaceLocal.value+AddressCertificationL[i][3]+":";
							document.forms[0].ihIssueDateLocal.value=document.forms[0].ihIssueDateLocal.value+AddressCertificationL[i][4]+":";
							document.forms[0].ihExpiryDateLocal.value=document.forms[0].ihExpiryDateLocal.value+AddressCertificationL[i][5]+":";
							document.forms[0].ihAddressProofLocal.value=document.forms[0].ihAddressProofLocal.value+AddressCertificationL[i][6]+":";
							document.forms[0].ihAddressProofLocalLabel.value=document.forms[0].ihAddressProofLocalLabel.value+AddressCertificationL[i][8]+":";
							document.forms[0].ihAddressProofLocalKid.value=document.forms[0].ihAddressProofLocalKid.value+AddressCertificationL[i][7]+":";
							document.forms[0].ihDocNoLocal.value=document.forms[0].ihDocNoLocal.value+AddressCertificationL[i][9]+":";
							document.forms[0].isDeletedL.value=document.forms[0].isDeletedL.value+AddressCertificationL[i][10]+":";
							document.forms[0].isCountL.value=tCountL;
				}
	
			 //alert("tCountL::"+document.Family.isCount.value);
			 //alert("type ----"+type);
//	if(type=="A")
		//changePageP();
  }
function moveNextP()
		{
			//alert("MoveNext");
				
				if(!validateInputForm("Address"))
					return false;
				if(!checkBlankP())
					return false;
		if(rCountP<tCountP && checkFlagP==false )
			{
				if(chengedRecordP())
				{
						//alert("In rcout<tcout && flaf=false:::");
							var  addCertificateRecordP=new Array();
							addCertificateRecordP[0]=document.forms[0].isHAuthorityPermanent.value;
							addCertificateRecordP[1]=document.forms[0].isEAuthorityPermanent.value;
							addCertificateRecordP[2]=document.forms[0].isHPlacePermanent.value;
							addCertificateRecordP[3]=document.forms[0].isEPlacePermanent.value;
							addCertificateRecordP[4]=document.forms[0].isIssueDatePermanent.value;
							addCertificateRecordP[5]=document.forms[0].isExpiryDatePermanent.value;
							addCertificateRecordP[6]=document.forms[0].isAddressProofPermanent.value;
							addCertificateRecordP[8]=document.forms[0].isAddressProofPermanentLabel.value;
							addCertificateRecordP[7]=document.forms[0].isAddressProofPermanentKid.value;
							addCertificateRecordP[9]=document.forms[0].isDocNoPermanent.value;
							addCertificateRecordP[10]=document.forms[0].DeletedP.checked;
							AddressCertificationP[rCountP]=addCertificateRecordP;
         		}
					 rCountP++;
					// alert("in  Display Next:::"+rCountP);
							document.forms[0].isHAuthorityPermanent.value=AddressCertificationP[rCountP][0];
							document.forms[0].isEAuthorityPermanent.value=AddressCertificationP[rCountP][1];
							document.forms[0].isHPlacePermanent.value=AddressCertificationP[rCountP][2];
							document.forms[0].isEPlacePermanent.value=AddressCertificationP[rCountP][3];
							document.forms[0].isIssueDatePermanent.value=AddressCertificationP[rCountP][4];
							document.forms[0].isExpiryDatePermanent.value=AddressCertificationP[rCountP][5];
							document.forms[0].isAddressProofPermanent.value=AddressCertificationP[rCountP][6];
							document.forms[0].isAddressProofPermanentLabel.value=AddressCertificationP[rCountP][8];
							document.forms[0].isAddressProofPermanentKid.value=AddressCertificationP[rCountP][7];
							document.forms[0].isDocNoPermanent.value=AddressCertificationP[rCountP][9];
							document.forms[0].DeletedP.checked=AddressCertificationP[rCountP][10];
							document.forms[0].rCounterP.value="  "+eval(parseInt(rCountP)+parseInt(1))+" Of "+eval(parseInt(tCountP)+parseInt(1));
			}
			else
			{
				if(checkFlagP==false)
					 {
			 		//	alert("In flag=false:::");
					     checkFlagP=true;
							var  addCertificateRecordP=new Array();
							addCertificateRecordP[0]=document.forms[0].isHAuthorityPermanent.value;
							addCertificateRecordP[1]=document.forms[0].isEAuthorityPermanent.value;
							addCertificateRecordP[2]=document.forms[0].isHPlacePermanent.value;
							addCertificateRecordP[3]=document.forms[0].isEPlacePermanent.value;
							addCertificateRecordP[4]=document.forms[0].isIssueDatePermanent.value;
							addCertificateRecordP[5]=document.forms[0].isExpiryDatePermanent.value;
							addCertificateRecordP[6]=document.forms[0].isAddressProofPermanent.value;
							addCertificateRecordP[8]=document.forms[0].isAddressProofPermanentLabel.value;
							addCertificateRecordP[7]=document.forms[0].isAddressProofPermanentKid.value;
							addCertificateRecordP[9]=document.forms[0].isDocNoPermanent.value;
							addCertificateRecordP[10]=document.forms[0].DeletedP.checked;
							AddressCertificationP[rCountP]=addCertificateRecordP;
							document.forms[0].isHAuthorityPermanent.value="";
							document.forms[0].isEAuthorityPermanent.value="";
							document.forms[0].isHPlacePermanent.value="";
							document.forms[0].isEPlacePermanent.value="";
							document.forms[0].isIssueDatePermanent.value="";
							document.forms[0].isExpiryDatePermanent.value="";
							document.forms[0].isAddressProofPermanent.value="";
							document.forms[0].isAddressProofPermanentLabel.value="";
							document.forms[0].isAddressProofPermanentKid.value="";
							document.forms[0].isDocNoPermanent.value="";
							document.forms[0].DeletedP.checked=false;
						blankcheckP=true;
					 }
				else
				    {
						//	alert("In Add next Mode :::");
					 		++tCountP;
							++rCountP;
							document.forms[0].rCounterP.value="  "+eval(parseInt(rCountP)+parseInt(1))+" Of "+eval(parseInt(tCountP)+parseInt(1));
								var  addCertificateRecordP=new Array();
							addCertificateRecordP[0]=document.forms[0].isHAuthorityPermanent.value;
							addCertificateRecordP[1]=document.forms[0].isEAuthorityPermanent.value;
							addCertificateRecordP[2]=document.forms[0].isHPlacePermanent.value;
							addCertificateRecordP[3]=document.forms[0].isEPlacePermanent.value;
							addCertificateRecordP[4]=document.forms[0].isIssueDatePermanent.value;
							addCertificateRecordP[5]=document.forms[0].isExpiryDatePermanent.value;
							addCertificateRecordP[6]=document.forms[0].isAddressProofPermanent.value;
							addCertificateRecordP[8]=document.forms[0].isAddressProofPermanentLabel.value;
							addCertificateRecordP[7]=document.forms[0].isAddressProofPermanentKid.value;
							addCertificateRecordP[9]=document.forms[0].isDocNoPermanent.value;
							addCertificateRecordP[10]=document.forms[0].DeletedP.checked;
							AddressCertificationP[rCountP]=addCertificateRecordP;
							document.forms[0].isHAuthorityPermanent.value="";
							document.forms[0].isEAuthorityPermanent.value="";
							document.forms[0].isHPlacePermanent.value="";
							document.forms[0].isEPlacePermanent.value="";
							document.forms[0].isIssueDatePermanent.value="";
							document.forms[0].isExpiryDatePermanent.value="";
							document.forms[0].isAddressProofPermanent.value="";
							document.forms[0].isAddressProofPermanentLabel.value="";
							document.forms[0].isAddressProofPermanentKid.value="";
							document.forms[0].isDocNoPermanent.value="";
							document.forms[0].DeletedP.checked=false;
							blankcheckP=true;
		  		   }
		    }
			if(cMode=="Authorization" && sizeP <= eval(parseInt(rCountP)+parseInt(1))){
			   document.getElementById("Next").disabled=true;
			}
	}
function moveBackP()
{
//	alert("moveBack");
			if(!validateInputForm("Address"))
					return false;
			if(rCountP==-1)
				  return;
		if(rCountP==tCountP && blankcheckP==true)
			{
					blankcheckP=false;
					vv=tCountP-1;
					if(vv==-1)
						vv=0;
					if(validateInputForm()&&!chengedRecordP())
						{
							++tCountP;
							++rCountP;
							document.form[0].rCounterP.value="  "+eval(parseInt(rCountP)+parseInt(1))+" Of "+eval(parseInt(tCountP)+parseInt(1));
							var  addCertificateRecordP=new Array();
							addCertificateRecordP[0]=document.forms[0].isHAuthorityPermanent.value;
							addCertificateRecordP[1]=document.forms[0].isEAuthorityPermanent.value;
							addCertificateRecordP[2]=document.forms[0].isHPlacePermanent.value;
							addCertificateRecordP[3]=document.forms[0].isEPlacePermanent.value;
							addCertificateRecordP[4]=document.forms[0].isIssueDatePermanent.value;
							addCertificateRecordP[5]=document.forms[0].isExpiryDatePermanent.value;
							addCertificateRecordP[6]=document.forms[0].isAddressProofPermanent.value;
							addCertificateRecordP[8]=document.forms[0].isAddressProofPermanentLabel.value;
							addCertificateRecordP[7]=document.forms[0].isAddressProofPermanentKid.value;
							addCertificateRecordP[9]=document.forms[0].isDocNoPermanent.value;
							addCertificateRecordP[10]=document.forms[0].DeletedP.checked;
							AddressCertificationP[rCountP]=addCertificateRecordP;
						}
		}
			checkFlagP=false;
				if(checkBlankP())
				{
					if(chengedRecordP())
					{
					//	alert("In  Move Back");
							var  addCertificateRecordP=new Array();
							addCertificateRecordP[0]=document.forms[0].isHAuthorityPermanent.value;
							addCertificateRecordP[1]=document.forms[0].isEAuthorityPermanent.value;
							addCertificateRecordP[2]=document.forms[0].isHPlacePermanent.value;
							addCertificateRecordP[3]=document.forms[0].isEPlacePermanent.value;
							addCertificateRecordP[4]=document.forms[0].isIssueDatePermanent.value;
							addCertificateRecordP[5]=document.forms[0].isExpiryDatePermanent.value;
							addCertificateRecordP[6]=document.forms[0].isAddressProofPermanent.value;
							addCertificateRecordP[8]=document.forms[0].isAddressProofPermanentLabel.value;
							addCertificateRecordP[7]=document.forms[0].isAddressProofPermanentKid.value;
							addCertificateRecordP[9]=document.forms[0].isDocNoPermanent.value;
							addCertificateRecordP[10]=document.forms[0].DeletedP.checked;
							AddressCertificationP[rCountP]=addCertificateRecordP;
					}
				}
			 rCountP--;
				if(rCountP==-1)
					  rCountP=0;
			//		alert("in  Display Next:::"+rCountP);
							document.forms[0].isHAuthorityPermanent.value=AddressCertificationP[rCountP][0];
							document.forms[0].isEAuthorityPermanent.value=AddressCertificationP[rCountP][1];
							document.forms[0].isHPlacePermanent.value=AddressCertificationP[rCountP][2];
							document.forms[0].isEPlacePermanent.value=AddressCertificationP[rCountP][3];
							document.forms[0].isIssueDatePermanent.value=AddressCertificationP[rCountP][4];
							document.forms[0].isExpiryDatePermanent.value=AddressCertificationP[rCountP][5];
							document.forms[0].isAddressProofPermanent.value=AddressCertificationP[rCountP][6];
							document.forms[0].isAddressProofPermanentLabel.value=AddressCertificationP[rCountP][8];
							document.forms[0].isAddressProofPermanentKid.value=AddressCertificationP[rCountP][7];
							document.forms[0].isDocNoPermanent.value=AddressCertificationP[rCountP][9];
							document.forms[0].DeletedP.checked=AddressCertificationP[rCountP][10];
							document.forms[0].rCounterP.value="  "+eval(parseInt(rCountP)+parseInt(1))+" Of "+eval(parseInt(tCountP)+parseInt(1));	
		if(cMode=="Authorization" && sizeL >= eval(parseInt(rCountL)+parseInt(1))){
		   document.getElementById("Next").disabled=false;
		}

	}
		function checkBlankP()
		{
					if(document.forms[0].isHAuthorityPermanent.value!="" &&document.forms[0].isEAuthorityPermanent.value!=""&&
					document.forms[0].isHPlacePermanent.value!=""&&document.forms[0].isEPlacePermanent.value!=""&&
					document.forms[0].isIssueDatePermanent.value!=""&&document.forms[0].isExpiryDatePermanent.value!=""&&
					document.forms[0].isAddressProofPermanent.value!=""&&document.forms[0].isDocNoPermanent.value!="")
				  return true;
		}
		function chengedRecordP()
		{
			 if(!((document.forms[0].isHAuthorityPermanent.value==AddressCertificationP[rCountP][0])&&
				 (document.forms[0].isEAuthorityPermanent.value==AddressCertificationP[rCountP][1])&&
				 (document.forms[0].isHPlacePermanent.value==AddressCertificationP[rCountP][2])&&
				 (document.forms[0].isEPlacePermanent.value==AddressCertificationP[rCountP][3])&&
				// (document.forms[0].isIssueDatePermanent.value==AddressCertificationP[rCountP][4])&&
				// (document.forms[0].isExpiryDatePermanent.value==AddressCertificationP[rCountP][5])&&
				 (document.forms[0].isAddressProofPermanent.value==AddressCertificationP[rCountP][6])&&
				 (document.forms[0].isDocNoPermanent.value==AddressCertificationP[rCountP][9])&&
				 (document.forms[0].DeletedP.checked==AddressCertificationP[rCountP][10])))
					return true;
		}
 function changePageP()
  {
//	 alert("changePageP");
	   if(!validateInputForm())

				return ;
			var flag=false;
					if(tCountP==-1)
										{
											flag=true;
										//	alert("flag=true");
										}
		if(rCountP==tCountP && blankcheckP==true)
				{
				//	alert("rCount==tCount"+blankcheck);
					blankcheckP=false;
					vv=tCountP-1;
//					alert("VVVV="+vv);
					if(vv==-1)
						vv=0;
					if(validateInputForm())
							{		
								flag=true;
	//							alert("flag=true Second ");
							}
		     	}
				if(!validateInputForm())
					{	
						//tCount=-1	
						flag=false;
					}
					if(flag==true)
							{
											//alert("Flag== False::::");
											var  addCertificateRecordP=new Array();
											addCertificateRecordP[0]=document.forms[0].isHAuthorityPermanent.value;
											addCertificateRecordP[1]=document.forms[0].isEAuthorityPermanent.value;
											addCertificateRecordP[2]=document.forms[0].isHPlacePermanent.value;
											addCertificateRecordP[3]=document.forms[0].isEPlacePermanent.value;
											addCertificateRecordP[4]=document.forms[0].isIssueDatePermanent.value;
											addCertificateRecordP[5]=document.forms[0].isExpiryDatePermanent.value;
											addCertificateRecordP[6]=document.forms[0].isAddressProofPermanent.value;
											addCertificateRecordP[8]=document.forms[0].isAddressProofPermanentLabel.value;
											addCertificateRecordP[7]=document.forms[0].isAddressProofPermanentKid.value;
											addCertificateRecordP[9]=document.forms[0].isDocNoPermanent.value;
											addCertificateRecordP[10]=document.forms[0].DeletedP.checked;
											rCountP++;
											tCountP++;
											AddressCertificationP[rCountP]=addCertificateRecordP;
							}
					if(flag==false&&rCountP!=-1)
								 {
										if(validateInputForm() && chengedRecordP())
												{
															//alert("changes Found");
															var  addCertificateRecordP=new Array();
															addCertificateRecordP[0]=document.forms[0].isHAuthorityPermanent.value;
															addCertificateRecordP[1]=document.forms[0].isEAuthorityPermanent.value;
															addCertificateRecordP[2]=document.forms[0].isHPlacePermanent.value;
															addCertificateRecordP[3]=document.forms[0].isEPlacePermanent.value;
															addCertificateRecordP[4]=document.forms[0].isIssueDatePermanent.value;
															addCertificateRecordP[5]=document.forms[0].isExpiryDatePermanent.value;
															addCertificateRecordP[6]=document.forms[0].isAddressProofPermanent.value;
															addCertificateRecordP[8]=document.forms[0].isAddressProofPermanentLabel.value
															addCertificateRecordP[7]=document.forms[0].isAddressProofPermanentKid.value;
															addCertificateRecordP[9]=document.forms[0].isDocNoPermanent.value;
															addCertificateRecordP[10]=document.forms[0].DeletedP.checked;
															AddressCertificationP[rCountP]=addCertificateRecordP;
												}
								 }			
			   //    alert("Array to hidden Called::");
		    arrayToHiddenP();
	  }
function  arrayToHiddenP()
   {
	//   alert("arrayToHiddenP");
						    document.forms[0].ihHAuthorityPermanent.value="";
							document.forms[0].ihEAuthorityPermanent.value="";
							document.forms[0].ihHPlacePermanent.value="";
							document.forms[0].ihEPlacePermanent.value="";
							document.forms[0].ihIssueDatePermanent.value="";
							document.forms[0].ihExpiryDatePermanent.value="";
							document.forms[0].ihAddressProofPermanent.value="";
							document.forms[0].ihAddressProofPermanentLabel.value="";
							document.forms[0].ihAddressProofPermanentKid.value="";
							document.forms[0].ihDocNoPermanent.value="";
							document.forms[0].isDeletedP.value="";
		    for( i=0;i<=tCountP;i++)
				{
							document.forms[0].ihHAuthorityPermanent.value=document.forms[0].ihHAuthorityPermanent.value+AddressCertificationP[i][0]+":";
							document.forms[0].ihEAuthorityPermanent.value=document.forms[0].ihEAuthorityPermanent.value+AddressCertificationP[i][1]+":";
							document.forms[0].ihHPlacePermanent.value=document.forms[0].ihHPlacePermanent.value+AddressCertificationP[i][2]+":";
							document.forms[0].ihEPlacePermanent.value=document.forms[0].ihEPlacePermanent.value+AddressCertificationP[i][3]+":";
							document.forms[0].ihIssueDatePermanent.value=document.forms[0].ihIssueDatePermanent.value+AddressCertificationP[i][4]+":";
							document.forms[0].ihExpiryDatePermanent.value=document.forms[0].ihExpiryDatePermanent.value+AddressCertificationP[i][5]+":";
							document.forms[0].ihAddressProofPermanent.value=document.forms[0].ihAddressProofPermanent.value+AddressCertificationP[i][6]+":";
							document.forms[0].ihAddressProofPermanentLabel.value=document.forms[0].ihAddressProofPermanentLabel.value+AddressCertificationP[i][8]+":";
							document.forms[0].ihAddressProofPermanentKid.value=document.forms[0].ihAddressProofPermanentKid.value+AddressCertificationP[i][7]+":";
							document.forms[0].ihDocNoPermanent.value=document.forms[0].ihDocNoPermanent.value+AddressCertificationP[i][9]+":";
							document.forms[0].isDeletedP.value=document.forms[0].isDeletedP.value+AddressCertificationP[i][10]+":";
							document.forms[0].isCountP.value=tCountP;
				}
		   //alert("tCountL::"+document.Family.isCount.value);
   }
   function getPinCode(postId, pinId,focusId){  //vijay
	var postKid = document.getElementById(postId).value; 
	var ran=parseInt(Math.random()*9999);
	var send = "&postkid="+postKid+"&ran="+ran;
	var url=appcontext +"/custid/AddressDetail.do?action=getPinCodeFromPost"+send;
	http.open("POST",url,false);
	http.onreadystatechange = function(){
        if((http.readyState == 4) && (http.status == 200)) {
			var res=http.responseText;
			if(res != null && res!="undefined" && res!="") {
				var pinCode = trim(res);
				document.getElementById(pinId).value = pinCode;
				document.getElementById(focusId).focus();
			} else {
				document.getElementById(pinId).value = '';
			}
        }
    };
	http.send(null);
}
   function isValidPINNumber(id)  {
	   var val=document.getElementById(id).value;
	   evt =window.event || arguments.callee.caller.arguments[0];
	   var c= evt.keyCode;
	   evt.keyCode=(!(c>=48 && c<=57))?0:evt.keyCode;
	   evt.keyCode=(val.length==0 && evt.keyCode==48)?0:evt.keyCode;
   }

   function onblurPIN(id) {
	   var val=document.getElementById(id).value;
	   if(trim(val).length<6 && trim(val).length!=0)
	   {
		   alert("PIN no should be in 6 digits");
		   document.getElementById(id).focus();
	   }
   }



function callMasterHelp(str)
{
	evt =window.event || arguments.callee.caller.arguments[0];

	var charCode =(evt.which)?evt.which :evt.keyCode;
	if(charCode == 112)
	{
		 if(str=='isOther')
		{
			 
			openHelpPanel('isOther', 'isOtherKid', 'isOtherLabel','IdentityMaster');
		}
	}
}


function createRequestObject()
{
	var req;
	if(window.XMLHttpRequest){
		req=new XMLHttpRequest();
		
	}
	else if(window.ActiveXObject)		{
		req=new ActiveXObject("Microsoft.XMLHTTP");
	}
	else{
		alert("Browser is not IE 5 or higher, or Firefox or Safari or Opera");	
	}
	return req;
}


function callAjax(cityKid,stateCode,stateLabel,stateKid,distCode,distLabel,distKid,
    cntCode,cntLabel,cntKid,validDistKid,validStateKid,validCountryKid)
{
  var cityParam=stateCode+","+stateLabel+","+stateKid+","+distCode+","+distLabel+","+distKid+","+cntCode+","+cntLabel+","+cntKid+","+validDistKid+","+validStateKid+","+validCountryKid;
  retrieveCityURL(cityKid,cityParam); 
}


function checkValidKids(mode,KidField,validDistStatCntKid,sHCityLocal,sECityLocal,sCityLocalCode,sCityLocalKid,sCityLocalLabel,sDistrictLocal,sDistrictLocalKid,sDistrictLocalLabel,sStateLocal,sStateLocalKid,sStateLocalLabel)
{
 if(document.getElementById(validDistStatCntKid).value!=""){
 if(mode == "district"){
  if(KidField!=document.getElementById(validDistStatCntKid).value){
   document.getElementById(sHCityLocal).value="";
   document.getElementById(sECityLocal).value="";
   document.getElementById(sCityLocalCode).value="";
   document.getElementById(sCityLocalKid).value="";
   document.getElementById(sCityLocalLabel).value="";
  }
 }
 if(mode == "state"){
  if(KidField!=document.getElementById(validDistStatCntKid).value){
   document.getElementById(sDistrictLocal).value="";
   document.getElementById(sDistrictLocalKid).value="";
   document.getElementById(sDistrictLocalLabel).value="";
   document.getElementById(sHCityLocal).value="";
   document.getElementById(sECityLocal).value="";
   document.getElementById(sCityLocalCode).value="";
   document.getElementById(sCityLocalKid).value="";
   document.getElementById(sCityLocalLabel).value="";
  }
 }
 
 if(mode == "country"){
  if(KidField!=document.getElementById(validDistStatCntKid).value)
  {
   document.getElementById(sDistrictLocal).value="";
   document.getElementById(sDistrictLocalKid).value="";
   document.getElementById(sDistrictLocalLabel).value="";
   document.getElementById(sHCityLocal).value="";
   document.getElementById(sECityLocal).value="";
   document.getElementById(sCityLocalCode).value="";
   document.getElementById(sCityLocalKid).value="";
   document.getElementById(sCityLocalLabel).value="";   document.getElementById(sStateLocal).value="";
   document.getElementById(sStateLocalKid).value="";
   document.getElementById(sStateLocalLabel).value="";
  }
 }
}
}


function saveKid(setKidField,KidField)
{
 document.getElementById(setKidField).value = KidField;
}

function fillCityLabel(LableFiled,HindiControl,EnglishControl)
{
  var array = new Array();
  var citylabel = document.getElementById(LableFiled).value;
  if(citylabel!="")
	{
	  array = citylabel.split("/");
	  document.getElementById(HindiControl).value=array[0];
	  document.getElementById(EnglishControl).value=array[1];
	}
}


function retrieveCityURL(cityKid,cityParam){
	var ran=parseInt(Math.random()*9999);
	var url=appcontext +"/CustId/CustDistStateByCity.do";
	var send ="cityKid="+cityKid+"&ran="+ran;
	http.open("POST",url,true);
	http.onreadystatechange =  function(){
		if((http.readyState == 4) && (http.status == 200)){
			var res=http.responseText;
			var addVal = new Array(); 
			var addParam = new Array();
			if(res != null && res.length!=0){
				addVal = res.split(",");
				addParam = cityParam.split(",");
				document.getElementById(addParam[0]).value=addVal[0];
				document.getElementById(addParam[1]).value=addVal[1]+"/"+addVal[2];
				document.getElementById(addParam[2]).value=addVal[3];
				document.getElementById(addParam[3]).value=addVal[4];
				document.getElementById(addParam[4]).value=addVal[5]+"/"+addVal[6];
				document.getElementById(addParam[5]).value=addVal[7];
				document.getElementById(addParam[6]).value=addVal[8];
				document.getElementById(addParam[7]).value=addVal[9];+"/"+addVal[10];
				document.getElementById(addParam[8]).value=addVal[11];
				document.getElementById(addParam[9]).value=addVal[7];
				document.getElementById(addParam[10]).value=addVal[3];
				document.getElementById(addParam[11]).value=addVal[11]; 
			} 
		}		
	}
	http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	http.setRequestHeader("content-length",send.length);
	http.setRequestHeader("connection","close");
	http.send(send);
}
