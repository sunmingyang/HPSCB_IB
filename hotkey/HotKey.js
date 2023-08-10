/*
* For Search Short Name Hotkey Validations
*/
function setFocusOnFilterCriteria(Account)
{
	var FilterCriteria= document.getElementById("criteria");
	var BranchCode= document.getElementById("branchCode");
	if(FilterCriteria.value==""){
		showMessage(53);
		FilterCriteria.focus();
		return false;
	}
	else if(BranchCode.value=="")
	{
		showMessage(1356);
		BranchCode.focus();
		return false;
	}
	document.getElementById("Go").disabled = true;
}

function openROI() {
	var bar = "width = 400, height=200, left=25, top=25";
	var win = open("/hotkey/ROIDetails.do", "new", bar);
}

function openNpaMemo() {
	var bar = "width = 750, height=350, left=25, top=25";
	var win = open("/hotkey/NpaMemo.do", "new", bar);
}

/*
* Close the window on Escape Key
*/
function escapeKey(evt) {
	evt =(evt)?evt:window.event;
	var charCode =(evt.which)?evt.which :evt.keyCode;
	if(charCode == 27)
		window.close();
}

/*
* For By Name Search Hotkey Validations
*/
function checkEntries(){
	var sName = document.getElementById("engName").value;
	var branch = document.getElementById("branchCode").value;
	if(sName == "") {
		showMessage(2);
		document.getElementById("engName").focus();
		return false;
	} else if(branch == "") {
		showMessage(1356);
		document.getElementById("branchCode").focus();
		return false;
	}
	document.getElementById("Go").disabled = "true";
}

function goToMenu() {
	document.forms[0].action="/hotkey/ByNameSearch.do?action=executeCancel";
	document.forms[0].submit();
}

/*
* Cheque Enquiry Window
*/
function getDetails() {
	var chqNo = document.getElementById("chqNo").value;
	if(chqNo == "")
		return;
	document.forms[0].submit();
}

/*
* For By Remittance Charges Validations
*/
function checkEntriesRemitCharges(){
	alert("CAN12 " + window.event.srcElement.name);
	//alert("Cancel " +document.getElementById("can").Clicked);
	var sDocType = document.getElementById("docType").value;
	var sCatType = document.getElementById("categoryType").value;
	if(sDocType == "") {
		showMessage(53);
		document.getElementById("docType").focus();
		return false;
	} else if(sCatType == "") {
		showMessage(53);
		document.getElementById("categoryType").focus();
		return false;
	}
	document.getElementById("Go").disabled = "true";
}

function back(){
	document.forms[0].action="/hotkey/HotKey.jsp";
	document.forms[0].submit(); 
}

/*For Handling Hot Keys and PopUp Menus*/
function hotKey(evt) {
	evt =(evt)?evt :window.event;
	var charCode =(evt.which)?evt.which :evt.keyCode;
	try	{
		document.getElementById("Ctrl" + String.fromCharCode(charCode)).click();
	}
	catch (Error) {
	}
	/* For F3(114) Key */
	if(window.event.keyCode == 113){
		evt.keyCode =0;
		document.getElementById("CtrlF3").click();
		return true;
	}
	if(window.event.keyCode == 113){
		evt.keyCode =0;
		document.getElementById("CtrlF3").click();
		return true;
	}
	if(window.event.keyCode == 113){
		evt.keyCode =0;
		document.getElementById("CtrlF3").click();
		return true;
	}
}

/**----------------- For RD Maturity Value Calculator ----------------------*/

function displayRDMatVal(){
	if(document.getElementById("category").value=="" || document.getElementById("category").value=="0")
	{
		showMessage(1271);
		document.getElementById("category").focus();
		return;
	}
	if(document.getElementById("scheme").value=="" || document.getElementById("scheme").value=="0")
	{
		showMessage(524);
		document.getElementById("scheme").focus();
		return;
	}
	if((document.getElementById("year").value!="" && document.getElementById("year").value!="0")  &&
		document.getElementById("month").value>="0")
	{
		if(document.getElementById("month").value>11){
			showMessage(232);
			document.getElementById("month").focus();
			return;
		}
	}
	if(document.getElementById("amount").value=="" || document.getElementById("amount").value=="0")
	{
		showMessage(65);
		document.getElementById("amount").focus();
		return;
	}
	if(document.getElementById("chgROI").checked){
		if(document.getElementById("roi").value=="" || document.getElementById("roi").value=="0")
		{
			showMessage(53);
			document.getElementById("roi").focus();
			return;
		}	
	}
	document.forms[0].action="/hotkey/RDMatCalc.do?action=executeDispData";
	document.forms[0].submit();
}

function enterROI(){
	if(document.getElementById("chgROI").checked){
		document.getElementById("roi").readOnly=false;
		document.getElementById("roi").value="";
		document.getElementById("roi").focus();
	}
	else{
		document.getElementById("roi").readOnly=true;
		document.getElementById("view").focus();
	}
}
function byAmount(){
	document.getElementById("chgROI").focus();
}


/**----------------- For FD Maturity Value Calculator ----------------------*/

function byRoi(){
	document.getElementById("view").focus();
}

function displayFDMatVal(){
	
	if(document.getElementById("accType").value=="" || document.getElementById("accType").value=="0")
	{
		showMessage(2033);
		document.getElementById("accType").focus();
		return;
	}
	if(document.getElementById("category").value=="" || document.getElementById("category").value=="0")
	{
		showMessage(1271);
		document.getElementById("category").focus();
		return;
	}
	if(document.getElementById("scheme").value=="" || document.getElementById("scheme").value=="0")
	{
		showMessage(524);
		document.getElementById("scheme").focus();
		return;
	}
	if((document.getElementById("year").value!="" && document.getElementById("year").value!="0")  &&
		document.getElementById("month").value>="0")
	{
		if(document.getElementById("month").value>11){
			showMessage(232);
			document.getElementById("month").focus();
			return;
		}
		if(document.getElementById("day").value>="0"){
			if(document.getElementById("month").value<=12 && document.getElementById("day").value>30){
				showMessage(557);
				document.getElementById("month").focus();
				return;
			}
		}
	}
	if((document.getElementById("year").value=="" || document.getElementById("year").value=="0") &&
			(document.getElementById("month").value=="" || document.getElementById("month").value=="0") &&
			(document.getElementById("day").value=="" || document.getElementById("day").value=="0")){
				
				showMessage(556);
				return;
	}
	if(document.getElementById("amount").value=="" || document.getElementById("amount").value=="0")
	{
		showMessage(65);
		document.getElementById("amount").focus();
		return;
	}
	if(document.getElementById("chgROI").checked){
		if(document.getElementById("roi").value=="" || document.getElementById("roi").value=="0")
		{
			showMessage(53);
			document.getElementById("roi").focus();
			return;
		}
		else if(document.getElementById("roi").value>"99.99"){
			showMessage(1758);
			document.getElementById("roi").focus();
			return;
		}
	}
	document.forms[0].action="/hotkey/FDMatCalc.do?action=executeDispFDMatVal";
	document.forms[0].submit();
}

function onFDScheme(){
	var sActKid=document.getElementById("accTypeKid").value;
	if(sActKid=="" || sActKid=="0")
		return;
	 openHelpPanel('scheme', 'schemeKid', 'schemeLabel','FDCreationSchemeMaster',sActKid);
}

 function emiRebt(){
	var amt = window.opener.document.getElementById("sAmount2").value;
	var bal = window.opener.document.getElementById("sBalance").value;
	if(parseFloat(amt) == 0){
		return;
	}
	document.forms[0].action="/hotkey/EMIRebate.do?action=emiRebateData&sAmount="+amt+"&sBalance="+bal;
	document.forms[0].submit();
}
