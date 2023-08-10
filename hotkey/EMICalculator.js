
function back_req()
{
	document.forms[0].action="/hotkey/BackAction.do";
	document.forms[0].submit();
}
function back_amor()
{
	document.forms[0].action="/hotkey/EMICalc.do?action=bmExecute";
	document.forms[0].submit();
}
function back_grad()
{
	document.forms[0].action="/hotkey/GraduatedEMI.do?action=executeGradEMI";
	document.forms[0].submit();
}


function instPayPrd(){
	if(isNull("EMICalForm","firstSlab") || isNull("EMICalForm","firstRate"))
	{
		showMessage(53);
		document.forms[0].firstRate.focus();
		return false;
	}
	if(document.getElementById("instPayPeriod").value=="X"){
		document.getElementById("divSI").style.display="block";
		document.getElementById("divGen").style.display="none";
	}
	else{
		document.getElementById("divSI").style.display="none";
		document.getElementById("divGen").style.display="block";
		document.getElementById("instPosting").focus();
	}
}

function totLoanAmtOld(){

	if(document.getElementById("totLoan").value==null || parseFloat(document.getElementById("totLoan").value)=="0" || 
		document.getElementById("totLoan").value==""){
		showMessage(53);
		document.getElementById("firstSlab").value="0";
		document.getElementById("totLoan").value="0";
		document.getElementById("roi").value="F";
		forROI();

		return false;
	}
	else{
		document.getElementById("firstSlab").value=document.getElementById("totLoan").value;
		document.getElementById("roi").value="F";
		forROI();
	}
}

function fixvar()
{
//	alert("in main function")
	if(document.getElementById("roi").value=="F")
	{
		fixed();
	}
	else
	{
		variable();
	}
}

function fixed(){
	if(document.getElementById("roi").value=="F"){
//		alert("in fixed");
		document.getElementById("secondSlab").value="0";
		document.getElementById("secondSlab").disabled=true;
		document.getElementById("secondSlab").className="TextDisable";
		document.getElementById("secondRate").value="0";
		document.getElementById("secondRate").disabled=true;
		document.getElementById("secondRate").className="TextDisable";

		document.getElementById("thirdSlab").value="0";
		document.getElementById("thirdSlab").disabled=true;
		document.getElementById("thirdSlab").className="TextDisable";
		document.getElementById("thirdRate").value="0";
		document.getElementById("thirdRate").disabled=true;
		document.getElementById("thirdRate").className="TextDisable";

		document.getElementById("fourthSlab").value="0";
		document.getElementById("fourthSlab").disabled=true;
		document.getElementById("fourthSlab").className="TextDisable";
		document.getElementById("fourthRate").value="0";
		document.getElementById("fourthRate").disabled=true;
		document.getElementById("fourthRate").className="TextDisable";

		document.getElementById("fifthSlab").value="0";
		document.getElementById("fifthSlab").disabled=true;
		document.getElementById("fifthSlab").className="TextDisable";
		document.getElementById("fifthRate").value="0";
		document.getElementById("fifthRate").disabled=true;
		document.getElementById("fifthRate").className="TextDisable";
		document.getElementById("advInst").focus();

	}
	
}

function variable(){
	if(document.getElementById("roi").value=="V"){
//		alert("in variable");			
		document.getElementById("secondSlab").disabled= false;
		document.getElementById("thirdSlab").disabled=false;
		document.getElementById("fourthSlab").disabled=false;
		document.getElementById("fifthSlab").disabled=false;

		document.getElementById("firstRate").value="0";
		document.getElementById("secondSlab").value="0";
		document.getElementById("secondSlab").className="SimpleText";
		document.getElementById("secondRate").disabled=false;
		document.getElementById("secondRate").value="0";
		document.getElementById("secondRate").className="SimpleText";

		
		document.getElementById("thirdSlab").value="0";
		document.getElementById("thirdSlab").className="SimpleText";
		document.getElementById("thirdRate").disabled=false;
		document.getElementById("thirdRate").value="0";
		document.getElementById("thirdRate").className="SimpleText";

		
		document.getElementById("fourthSlab").value="0";
		document.getElementById("fourthSlab").className="SimpleText";
		document.getElementById("fourthRate").disabled=false;
		document.getElementById("fourthRate").value="0";
		document.getElementById("fourthRate").className="SimpleText";

		
		document.getElementById("fifthSlab").value="0";
		document.getElementById("fifthSlab").className="SimpleText";
		document.getElementById("fifthRate").disabled=false;
		document.getElementById("fifthRate").value="0";
		document.getElementById("fifthRate").className="SimpleText";
		document.getElementById("advInst").focus();
	}
}


function advInstallment(){
	if(document.getElementById("roi").value=="V"){
		document.getElementById("firstSlab").focus();
	}
	else{
		document.getElementById("firstRate").focus();	
	}
}

function slabTwo(){
	if(document.getElementById("secondSlab").value!="0"){
		if(parseFloat(document.getElementById("firstSlab").value) > parseFloat(document.getElementById("secondSlab").value)){
			showMessage(227);
			document.getElementById("secondSlab").value="";
			document.getElementById("secondSlab").focus();
		}
	}
}

function slabThree(){
	if(document.getElementById("thirdSlab").value!="0"){
		if(parseFloat(document.getElementById("secondSlab").value) > parseFloat(document.getElementById("thirdSlab").value)){
			showMessage(227);
			document.getElementById("thirdSlab").value="";
			document.getElementById("thirdSlab").focus();
		}
	}
}

function slabFour(){
	if(document.getElementById("fourthSlab").value!="0"){
		if(parseFloat(document.getElementById("thirdSlab").value) > parseFloat(document.getElementById("fourthSlab").value)){
			showMessage(227);
			document.getElementById("fourthSlab").value="";
			document.getElementById("fourthSlab").focus();
		}
	}
}

function slabFive(){
	if(document.getElementById("fifthSlab").value!="0"){
		if(parseFloat(document.getElementById("fourthSlab").value) > parseFloat(document.getElementById("fifthSlab").value)){
			showMessage(227);
			document.getElementById("fifthSlab").value="";
			document.getElementById("fifthSlab").focus();
		}
	}
}

function prcNoOfInstall(){
	var totalLoan=parseFloat(document.getElementById("totLoan").value);
	var noOfInst=parseFloat(document.getElementById("divPrcNoOfInst").value);
	var emiInst
	if(document.getElementById("divPrcNoOfInst").value!="" &&
		parseFloat(document.getElementById("divPrcNoOfInst").value)!="0" ){
		
		emiInst=totalLoan/noOfInst;
		emiInst=Math.round(emiInst);
		if(emiInst % 10!=0) {
			emiInst = emiInst - ((emiInst % 10) + 10);
		}
		document.getElementById("divPrcAmt").value=emiInst;
		document.getElementById("divInstNoOfInst").focus();
	}
	else{
		showMessage(53);
		document.getElementById("divPrcAmt").value="0";
		document.getElementById("divPrcNoOfInst").focus();
		return false
		
		
	}
}

function intNoOfInstall() {
	if((document.getElementById("firstSlab").value=="0" || document.getElementById("firstSlab").value=="0")
		&& (document.getElementById("divPrcAmt").value=="0"  || document.getElementById("divPrcAmt").value=="0") 
		&& (document.getElementById("divPrcAmt").value=="0" || document.getElementById("divPrcAmt").value==""))
	{
		showMessage(53);
		return false;
	}
	var totalLoanAmt=parseFloat(document.getElementById("totLoan").value);
	var totalInst=parseFloat(document.getElementById("divInstNoOfInst").value);
	var dAmtArr = new Array(5)
	var dRateArr = new Array(5)
	var dTotalAmt
	var dReducedLoan
	var emi1=0
	var emi2=0
	var emi3=0
	var emi4=0
	var emi5=0
	var	emi=0
	
	dAmtArr[0] = parseFloat(document.getElementById("firstSlab").value);
	//alert("Amount 1..."+dAmtArr[0]);
	dAmtArr[1] = parseFloat(document.getElementById("secondSlab").value);
	dAmtArr[2] = parseFloat(document.getElementById("thirdSlab").value);
	dAmtArr[3] = parseFloat(document.getElementById("fourthSlab").value);
	dAmtArr[4] = parseFloat(document.getElementById("fifthSlab").value);

	dRateArr[0] = parseFloat(document.getElementById("firstRate").value);
	//alert("Rate of Interest 1.."+dRateArr[0]);
	dRateArr[1] = parseFloat(document.getElementById("secondRate").value);
	dRateArr[2] = parseFloat(document.getElementById("thirdRate").value);
	dRateArr[3] = parseFloat(document.getElementById("fourthRate").value);
	dRateArr[4] = parseFloat(document.getElementById("fifthRate").value);

	dReducedLoan = dAmtArr[4] - dAmtArr[3]
		//alert("dReducedLoan 1.."+dReducedLoan);
	var i;
	if(dReducedLoan > 0){
		i = 0
		  do{
				dTotalAmt += (dReducedLoan - parseFloat(document.getElementById("divPrcAmt").value)) 
				dReducedLoan -= parseFloat(document.getElementById("divPrcAmt").value)
				i ++;
		  }
		  while (dReducedLoan > 0)	
			
		  emi1 = dTotalAmt * dRateArr[4] / 1200
		  emi1 += i * ( dAmtArr[3] - dAmtArr[2] ) * dRateArr[3] / 1200.00
		  emi1 += i * ( dAmtArr[2] - dAmtArr[1] ) * dRateArr[2] / 1200.00
		  emi1 += i * ( dAmtArr[1] - dAmtArr[0] ) * dRateArr[1] / 1200.00
		  emi1 += i * dAmtArr[0] * dRateArr[0] / 1200.00
	}
	dTotalAmt = 0
	i = 0
	dReducedLoan = dAmtArr[3] - dAmtArr[2] 
				//alert("dReducedLoan 2.."+dReducedLoan);
	if(dReducedLoan > 0){
		do{
			dTotalAmt += (dReducedLoan - parseFloat(document.getElementById("divPrcAmt").value))
			dReducedLoan -= parseFloat(document.getElementById("divPrcAmt").value)
			i ++;
		  }
		  while (dReducedLoan > 0)	
		
		  emi2 = dTotalAmt *  dRateArr[3] / 1200.00
		  emi2 += i * ( dAmtArr[2] - dAmtArr[1] ) * dRateArr[2] / 1200.00
		  emi2 += i * ( dAmtArr[1] - dAmtArr[0] ) * dRateArr[1] / 1200.00
		  emi2 += i *  dAmtArr[0] * dRateArr[0] / 1200.00
	}
	dTotalAmt = 0
	i = 0
	dReducedLoan = dAmtArr[2] - dAmtArr[1] 
				//alert("dReducedLoan 3.."+dReducedLoan);
	if(dReducedLoan > 0){
		do{
			dTotalAmt += (dReducedLoan - parseFloat(document.getElementById("divPrcAmt").value)) 
			dReducedLoan -= parseFloat(document.getElementById("divPrcAmt").value)
			i ++;
	      }
	    while (dReducedLoan > 0)
		emi3 = dTotalAmt *  dRateArr[3] / 1200.00
		emi3 += i * ( dAmtArr[1] - dAmtArr[0] )  * dRateArr[1] / 1200
		emi3 += i * dAmtArr[0] * dRateArr[0] / 1200.00
	}
	dTotalAmt = 0
	i = 0
	dReducedLoan = dAmtArr[1] - dAmtArr[0]
				//alert("dReducedLoan 4.."+dReducedLoan);
	if(dReducedLoan > 0){
		do{
			dTotalAmt += (dReducedLoan - parseFloat(document.getElementById("divPrcAmt").value)) 
			dReducedLoan -= parseFloat(document.getElementById("divPrcAmt").value)
			i ++;
	      }
	    while (dReducedLoan > 0)
		emi4 = dTotalAmt *  dRateArr[1] / 1200.00
		emi4 += i * dAmtArr[0] * dRateArr[0] / 1200.00
	}
	dTotalAmt = 0
	i = 0
	dReducedLoan = dAmtArr[0]
				//alert("dReducedLoan 5.."+dReducedLoan);
	if(dReducedLoan > 0){
		do{
			dTotalAmt += (dReducedLoan - parseFloat(document.getElementById("divPrcAmt").value)) 
			dReducedLoan -= parseFloat(document.getElementById("divPrcAmt").value)
			i ++;
	      }
	    while (dReducedLoan > 0)
		emi5 = dTotalAmt *  dRateArr[0] / 1200.00
					//alert("emi5 .."+emi5);
	}
	emi = emi1 + emi2 +emi3 + emi4 + emi5
				//alert("emi .."+emi);
				//alert("totalInst.."+totalInst);
	emi = emi / totalInst
	emi = Math.round(emi);
	//alert("emi after round .. "+emi+"..after MOD.."+emi % 10);
	if(emi % 10!=0) {
		emi = emi - (emi % 10) + 10;
		//alert("emi..final.."+emi);
	}
	document.getElementById("divInstAmt").value=emi;
	if(document.getElementById("roi").value=="F"){
		forROI();
	}
}

function emiCalc(){
	if(document.getElementById("roi").value=="F"){
		forROI();
	}
	if(isNull("EMICalForm","totLoan") || parseFloat(document.getElementById("totLoan").value)=="0" ||
		document.getElementById("totLoan").value=="" ){
		showMessage(53);
		document.forms[0].totLoan.focus();
		return false;	
	} 
	else if(isNull("EMICalForm","totInst") || parseFloat(document.getElementById("totInst").value)=="0" ||
		document.getElementById("totInst").value=="" ){
		showMessage(53);
		document.forms[0].totInst.focus();
		return false;
	}
	else if(isNull("EMICalForm","firstRate") || parseFloat(document.getElementById("firstRate").value)=="0" || 
		document.getElementById("firstRate").value=="" ){	
		showMessage(53);
		document.forms[0].firstRate.focus();
		return false;
	}
}

function graduatedEMI(){
	var sTotLoan= document.getElementById("totLoan").value;
	var sTotInst= document.getElementById("totInst").value;
	var sFirstRate= document.getElementById("firstRate").value;
	if((sTotLoan!=null) || (sTotInst!=null) || (sFirstRate!=null)){
		var bar = "width = 400, height= 300, left=100, top=200 status=yes";
//		var win = open("/hotkey/GraduatedEMI.do?action=executeOpen&TotLoan="+sTotLoan+"&TotInst="+sTotInst+"&FirstRate="+sFirstRate,"child1",bar);
	document.forms[0].action="/hotkey/EMICalc.do?action=executeGraduatedOpen&TotLoan="+sTotLoan+"&TotInst="+sTotInst+"&FirstRate="+sFirstRate;	
	document.forms[0].submit();
	}
}

function emiSI(){
	document.getElementById("EMI").focus();
}
//////////////////// Graduated EMI Hotkey///////////////////////////////
function roiFocus(){
	document.getElementById("EMI").focus();
}

function gradEMI(){
	if(isNull("GradEMIForm","totLoanAmt") || document.getElementById("totLoanAmt").value=="0"){
		showMessage(53);
		document.forms[0].totLoanAmt.focus();
		return false;
	}
	else if(isNull("GradEMIForm","totNoInst") || document.getElementById("totNoInst").value=="0"){
		showMessage(53);
		document.forms[0].totNoInst.focus();
		return false;
	}
	else if(isNull("GradEMIForm","roi") || document.getElementById("roi").value=="0"){
		showMessage(53);
		document.forms[0].roi.focus();
		return false;
	}
	else{
		var dLoan=parseFloat(document.getElementById("totLoanAmt").value);
		var dROI=parseFloat(document.getElementById("roi").value);
		var dNoofInst=parseFloat(document.getElementById("totNoInst").value);
		var dEMI=calculateEMI(dLoan,dROI,dNoofInst,"M")
		document.getElementById("emiInst").value=dEMI;
		document.getElementById("emiInstOne").focus();
	}
}

function months1(){
	var firstSlab=parseFloat(document.getElementById("monthsOne").value)
	var dLoanAmt=parseFloat(document.getElementById("totLoanAmt").value)
	var dROI=parseFloat(document.getElementById("roi").value)
	var NoofInst=parseFloat(document.getElementById("totNoInst").value)
	var dFirstEMI=parseFloat(document.getElementById("emiInstOne").value)
	var dNextSlab
	var dEMI
	var dPrinciple=dLoanAmt
	if(document.getElementById("emiInst").value=="")
	{
		alert("First calculate the EMI");
		document.getElementById("EMI").focus();
		return false;
	}
	var calEMI=parseFloat(document.getElementById("emiInst").value)
	//alert("firstSlab"+firstSlab);
	//alert("NoofInst"+NoofInst);
	//alert("dFirstEMI"+dFirstEMI);
	//alert("calEMI"+calEMI);
		if((firstSlab == NoofInst) && (dFirstEMI==calEMI))
		{
			//alert("12433"+calEMI);
			document.getElementById("emiInstTwo").value="0";
			document.getElementById("monthsTwo").value="0";
			document.getElementById("emiInstThree").value="0";
			document.getElementById("monthsThree").value="0";
			document.getElementById("emiInstTwo").readOnly=true;
			document.getElementById("monthsTwo").readOnly=true;
			document.getElementById("emiInstThree").readOnly=true;
			document.getElementById("monthsThree").readOnly=true;
			return
		}
		else
		{
			document.getElementById("emiInstTwo").readOnly=false;
			document.getElementById("monthsTwo").readOnly=false;
			document.getElementById("emiInstThree").readOnly=false;
			document.getElementById("monthsThree").readOnly=false;
		}
	if((firstSlab == NoofInst)&& (dFirstEMI<calEMI))
	{
		alert("Entered EMI is Less Than Calculated EMI");

		return false;
	}
	if(dFirstEMI > 0){
		if(firstSlab > 0){
			if(!(firstSlab > NoofInst)){
				for(var i = 1;i<=firstSlab;i++){
					dPrinciple = dPrinciple + (dPrinciple * dROI ) /1200  - dFirstEMI
				}
				dNextSlab = NoofInst - firstSlab 
					//alert("principle"+dPrinciple)
					//alert("droi"+dROI);
					//alert("dNextSlab"+dNextSlab);
				dEMI = calculateEMI(dPrinciple,dROI,dNextSlab,"M")
			
				document.getElementById("emiInstTwo").value=dEMI
				document.getElementById("monthsTwo").value=dNextSlab
			}
			else{
				showMessage(2475);
				document.getElementById("monthsOne").value="0"
				document.getElementById("monthsOne").focus();
				return false;
			}
		}
		else{
			showMessage(53);
			document.getElementById("monthsOne").focus();
			return false;
		}
	}
	else{
		showMessage(53);
		document.getElementById("emiInstOne").focus();
		return false;
	}
		
}

function months2(){
	var dLoanAmt=parseFloat(document.getElementById("totLoanAmt").value)
	var dROI=parseFloat(document.getElementById("roi").value)
	var NoofInst=parseFloat(document.getElementById("totNoInst").value)
	
	var dFirstSlab=parseFloat(document.getElementById("monthsOne").value)
	var dFirstEMI=parseFloat(document.getElementById("emiInstOne").value)
	var dSecSlab=parseFloat(document.getElementById("monthsTwo").value)
	var dSecEMI=parseFloat(document.getElementById("emiInstTwo").value)
	var dNextSlab
	var dEMI
	var dPrinciple=dLoanAmt;
	if(dSecEMI==0)
	{
		return
	}
	if((dFirstSlab + dSecSlab) > NoofInst){
		showMessage(2475);
		document.getElementById("monthsTwo").value=""
		document.getElementById("monthsTwo").focus();
		return false;
	}
	if(dSecEMI > 0){
		if(dFirstSlab  > 0){
			for(var i=1;i<=dFirstSlab;i++){ 
				dPrinciple = dPrinciple + (dPrinciple * dROI ) /1200  - dFirstEMI
			} 
			dNextSlab = NoofInst - dFirstSlab 
		}
		if(dSecSlab >0){
			for(var i=1;i<=dSecSlab;i++){ 
				dPrinciple = dPrinciple + (dPrinciple * dROI ) /1200  - dSecEMI
			}
			dNextSlab = dNextSlab - dSecSlab
		}
		else{
			showMessage(53);
			document.getElementById("monthsTwo").focus();
			return false;
		}
		dEMI = calculateEMI(dPrinciple,dROI,dNextSlab,"M")
		if(isNaN(dEMI)){
			dEMI="0"
			document.getElementById("Back").focus();
		}
		else{
			document.getElementById("emiInstThree").focus();
		}
		document.getElementById("emiInstThree").value=dEMI
		document.getElementById("monthsThree").value=dNextSlab
	}
	else{
		showMessage(53);
		document.getElementById("emiInstTwo").focus();
		return false;
	}
}

function months3(){
	var NoofInst=parseFloat(document.getElementById("totNoInst").value)
	var dSecSlab=parseFloat(document.getElementById("monthsTwo").value)
	var dFirstSlab=parseFloat(document.getElementById("monthsOne").value)
	if((dFirstSlab + dSecSlab + parseFloat(document.getElementById("monthsThree").value)) > NoofInst){
		showMessage(2475);
		document.getElementById("monthsThree").value=""
		document.getElementById("monthsThree").focus();
		return false;
	}
}


function calculateEMI(dLoan,dROI,dNoofInst,sType){
	var dEMI;
	if(sType=="M"){
		var dNume = dLoan * (Math.pow((1 + dROI/1200),parseInt(dNoofInst))) ;
		var dDenom =  (Math.pow((1 + dROI/1200),parseInt(dNoofInst)) - 1 ) * (1200/dROI);
		if(dDenom != 0){
			dEMI = dNume / dDenom;
		}
		dEMI = Math.round(dEMI);
	}
	return dEMI
}

function onOK(){
	if(window.opener.document.getElementById("instPayPeriod").value=="X"){
		window.opener.document.getElementById("divPrcAmt").value==""
		window.opener.document.getElementById("divPrcNoOfInst").value==""
		window.opener.document.getElementById("principal").value==""
		window.opener.document.getElementById("divInstAmt").value==""
		window.opener.document.getElementById("divInstNoOfInst").value==""
		window.opener.document.getElementById("interest").value==""

		if(parseFloat(document.getElementById("emiInstOne").value) > 0 && parseFloat(document.getElementById("monthsOne").value) > 0){
			
			window.opener.document.getElementById("divPrcAmt").value=document.getElementById("emiInstOne").value
			window.opener.document.getElementById("divPrcNoOfInst").value=document.getElementById("monthsOne").value
			window.opener.document.getElementById("principal").value=""
		}
		if(parseFloat(document.getElementById("emiInstTwo").value) > 0 && parseFloat(document.getElementById("monthsTwo").value) > 0){
			
			window.opener.document.getElementById("divInstAmt").value=document.getElementById("emiInstTwo").value
			window.opener.document.getElementById("divInstNoOfInst").value=document.getElementById("monthsTwo").value
			window.opener.document.getElementById("interest").value=""
		}
		if(parseFloat(document.getElementById("emiInstThree").value) > 0 && parseFloat(document.getElementById("monthsThree").value) > 0){
			
			window.opener.document.getElementById("divThird1").style.display="block";
			window.opener.document.getElementById("divThird2").style.display="block";
			window.opener.document.getElementById("divThird3").style.display="block";
			
			window.opener.document.getElementById("divAmtThree").value=document.getElementById("emiInstThree").value
			//window.opener.document.getElementById("divAmtThree").value=document.getElementById("emiInstThree").value
			window.opener.document.getElementById("divNoOfInstThree").value=document.getElementById("monthsThree").value
		}
	//	window.opener.document.getElementById("cancel").focus();
		window.close();
	}
	else{
	//	window.opener.document.getElementById("cancel").focus();
		window.close();
	}

}

function forROI(){
	document.getElementById("secondSlab").value="0";
	document.getElementById("secondSlab").disabled=true;
	document.getElementById("secondSlab").className="TextDisable";
	document.getElementById("secondRate").value="0";
	document.getElementById("secondRate").disabled=true;
	document.getElementById("secondRate").className="TextDisable";

	document.getElementById("thirdSlab").value="0";
	document.getElementById("thirdSlab").disabled=true;
	document.getElementById("thirdSlab").className="TextDisable";
	document.getElementById("thirdRate").value="0";
	document.getElementById("thirdRate").disabled=true;
	document.getElementById("thirdRate").className="TextDisable";

	document.getElementById("fourthSlab").value="0";
	document.getElementById("fourthSlab").disabled=true;
	document.getElementById("fourthSlab").className="TextDisable";
	document.getElementById("fourthRate").value="0";
	document.getElementById("fourthRate").disabled=true;
	document.getElementById("fourthRate").className="TextDisable";

	document.getElementById("fifthSlab").value="0";
	document.getElementById("fifthSlab").disabled=true;
	document.getElementById("fifthSlab").className="TextDisable";
	document.getElementById("fifthRate").value="0";
	document.getElementById("fifthRate").disabled=true;
	document.getElementById("fifthRate").className="TextDisable";
}

///////////////////Amortization Schedule//////////////////////////////////

function amortSchd(){
	if(parseFloat(document.getElementById("totLoan").value) <= "0"){
		showMessage(53);
		document.getElementById("totLoan").focus();
		return false;
	}
	var sTotLoan= document.getElementById("totLoan").value;
	var instPayPeriod= document.getElementById("instPayPeriod").value;
	var sFirstRate= document.getElementById("firstRate").value;
	var sTotInst= document.getElementById("totInst").value;
	var sEMIInst= document.getElementById("installment").value;
	var sIntPosting= document.getElementById("instPosting").value;
	
	var divPrcAmt= document.getElementById("divPrcAmt").value;
	var prcSlab= document.getElementById("divPrcNoOfInst").value;
	
	var divInstAmt= document.getElementById("divInstAmt").value;
	var IntSlab= document.getElementById("divInstNoOfInst").value;

	var divAmtThree= document.getElementById("divAmtThree").value;
	var thirdSlab= document.getElementById("divNoOfInstThree").value;

	var advInst=document.getElementById("advInst").value;
	var amtOne= document.getElementById("firstSlab").value;
	var intOne= document.getElementById("firstRate").value;

	var amtTwo= document.getElementById("secondSlab").value;
	var intTwo= document.getElementById("secondRate").value;

	var amtThree= document.getElementById("ThirdSlab").value;
	var intThree= document.getElementById("ThirdRate").value;

	var amtFour= document.getElementById("fourthSlab").value;
	var intFour= document.getElementById("fourthRate").value;

	var amtFive= document.getElementById("fifthSlab").value;
	var intFive= document.getElementById("fifthRate").value;
	
	
	var bar = "width = 700, height= 500, left=50, top=50 scrollbars=yes status=yes";
	if(instPayPeriod=="X"){
	document.forms[0].action="/hotkey/EMICalc.do?action=executeAmortOpen&TotLoan="+sTotLoan+"&FirstRate="
					+sFirstRate+"&divPrcAmt="+divPrcAmt+"&prcSlab="+prcSlab+"&divInstAmt="+divInstAmt+"&IntSlab="+IntSlab+"&divAmtThree="
					+divAmtThree+"&thirdSlab="+thirdSlab+"&instPayPeriod="+instPayPeriod;

	document.forms[0].submit();

	//	var win = open("/hotkey/AmortSchedule.do?action=executeOpen&TotLoan="+sTotLoan+"&FirstRate="
	//				+sFirstRate+"&divPrcAmt="+divPrcAmt+"&prcSlab="+prcSlab+"&divInstAmt="+divInstAmt+"&IntSlab="+IntSlab+"&divAmtThree="
	//				+divAmtThree+"&thirdSlab="+thirdSlab+"&instPayPeriod="+instPayPeriod,"child1",bar);
	}
	else if(instPayPeriod!="X"){
	document.forms[0].action="/hotkey/EMICalc.do?action=executeAmortOpen&TotLoan="+sTotLoan+"&FirstRate="
					+sFirstRate+"&instPayPeriod="+instPayPeriod+"&sTotInst="+sTotInst+"&sEMIInst="
					+sEMIInst+"&sIntPosting="+sIntPosting;
	document.forms[0].submit();
	//	var win = open("/hotkey/AmortSchedule.do?action=executeOpen&TotLoan="+sTotLoan+"&FirstRate="
	//				+sFirstRate+"&instPayPeriod="+instPayPeriod+"&sTotInst="+sTotInst+"&sEMIInst="
	//				+sEMIInst+"&sIntPosting="+sIntPosting,"child1",bar);
	}
}

function printing(){
	document.getElementById("prn").style.display="none";
	window.print();
	document.getElementById("prn").style.display="block";
}


function EmiCal()
{
var dAmtArr=new Array();
var dRateArr=new Array();
dAmtArr[0]=parseFloat(document.getElementById("firstSlab").value);
dAmtArr[1]=parseFloat(document.getElementById("secondSlab").value);
dAmtArr[2]=parseFloat(document.getElementById("thirdSlab").value);
dAmtArr[3]=parseFloat(document.getElementById("fourthSlab").value);
dAmtArr[4]=parseFloat(document.getElementById("fifthSlab").value);

dRateArr[0]=parseFloat(document.getElementById("firstRate").value);
dRateArr[1]=parseFloat(document.getElementById("secondRate").value);
dRateArr[2]=parseFloat(document.getElementById("thirdRate").value);
dRateArr[3]=parseFloat(document.getElementById("fourthRate").value);
dRateArr[4]=parseFloat(document.getElementById("fifthRate").value);

if(parseInt(dAmtArr[0])==0)
{
	dAmtArr[0]=parseFloat(document.getElementById("totLoan").value);
}

if(parseFloat(document.getElementById("totLoan").value)==0){
	alert("Enter Total Loan Amount");
	document.getElementById("totLoan").focus();
	return;
	}
if(parseInt(document.getElementById("totInst").value)==0){
	alert("Enter No. of Installments");
	document.getElementById("totInst").focus();
	return;
	}
if(parseInt(dRateArr[0])==0){
	alert("Enter Rate of Interest");
	document.getElementById("firstRate").focus();
	return;
	}
var dPrincipleAmt=0;
var dTotalAmt=0;
var iMonth=0;
var iNoOfMonths=0;
var dTotalEmiAmt = 0;
var iNoOfInstallments=0;
var sIntCompound=document.getElementById("instPosting").value;
var dROI=parseFloat(document.getElementById("firstRate").value);
if(document.getElementById("advInst").value=="")
{
document.getElementById("advInst").value="0";
}
for(var i=0;i<5;i++){
		if(parseFloat(dAmtArr[i])!=0) {
			if(parseInt(i)==0)
				{
					if(document.getElementById("emiWithSub").checked)
					{
						 dPrincipleAmt = parseInt(dAmtArr[0]); 
					}
					else
					{
						dPrincipleAmt = parseInt(dAmtArr[0]) - parseFloat(document.getElementById("advInst").value);
					//	alert(" advance inst"+parseFloat(document.getElementById("advInst").value));	
					}
				}
				else
				{
					dPrincipleAmt = parseInt(dAmtArr[i]) - parseInt(dAmtArr[i - 1]);
				}
				if((document.getElementById("intWithInt").value=="I") && (parseFloat(dROI)!=0)) {
							dTotalAmt += parseFloat(dPrincipleAmt);
							if(document.getElementById("instPayPeriod").value=="M"){
								iMonth = 1;
							}
							else if(document.getElementById("instPayPeriod").value=="Q"){
								iMonth = 3;
							}
							else if(document.getElementById("instPayPeriod").value=="H"){
								iMonth = 6;
							}
							else if(document.getElementById("instPayPeriod").value=="Y"){
								iMonth = 12;
							}
							else{
								iMonth = 1;
							}
							iNoOfMonths = parseInt(iMonth) * parseInt(document.getElementById("totInst").value); 
							if((parseInt(iNoOfMonths)%parseInt(iMonth))!=0) {
								//alert("error loan 308");
							}
							iNoOfPeriods = parseInt(iNoOfMonths) / parseInt(iMonth);
							if(sIntCompound=="M"){
								dNume = parseInt(dPrincipleAmt) * Math.pow((1 + (parseFloat(dROI)/1200)),parseFloat(iNoOfPeriods));
								dDenom =  (Math.pow((1 + (parseFloat(dROI)/1200)),parseInt(iNoOfPeriods)) - 1) * (1200/parseFloat(dROI));
							}
							else if(sIntCompound=="Q") {
								dNume = parseFloat(dPrincipleAmt) * Math.pow((1 + (parseFloat(dROI)/400)),(parseFloat(iNoOfPeriods)/3)); 
								dDenom = (1 + (1200/parseFloat(dROI))) * (Math.pow((1 + (parseFloat(dROI)/400)),(parseFloat(iNoOfPeriods)/3))-1);
							}
							else if(sIntCompound=="S") {
								dNume = parseFloat(dPrincipleAmt) * ((1 + (parseFloat(iNoOfPeriods) - 1)* (parseFloat(dROI)/2400)));
								dDenom = parseFloat(iNoOfPeriods);
							}
							if(parseInt(dDenom)!=0){ 
								dEmiAmt = parseFloat(dNume)/parseFloat(dDenom);
							}
							dTotalEmiAmt += dEmiAmt * iMonth;
						
					
						}
						else
						{
							iNoOfInstallments = parseInt(document.getElementById("totInst").value);
							dEmiAmt = parseFloat(dPrincipleAmt) / parseFloat(iNoOfInstallments);
							dTotalEmiAmt += parseFloat(dEmiAmt);
							
						}
					}
				}
				document.getElementById("installment").value=bmRound(parseFloat(dTotalEmiAmt),2);
}
function bmRound(amt,power)
{
	var x=1;
	var i;
	for( i=1;i<=power;i++)
	{
		x = x * 10;
	}
	var newAmt = Math.round(amt * x);
	newAmt = newAmt/x;
	return newAmt; 
		
}