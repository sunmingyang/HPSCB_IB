// Text Box creation at run time
//totalRow keeps the index of current row
var totalRow = 0;
//Tab Counter is for setting tabindex
var tabCounter = 4;
//selectedRow keeps track of selected row at a time for deletetion
var selectedRow = 0;
function back_req()
{
	document.forms[0].action="/hotkey/HotKey.jsp";
	document.forms[0].submit();
}
function addNewRow() {
	var i, j; 
	var num_cells = 5;
	//Get the id of tbody
	var TBody = getObject("bodyLoan");
	var row = TBody.insertRow();

	var cell = new Array();
	var celleven = new Array();
	for(i = 0; i < num_cells; i++ ) {
		cell[i] = row.insertCell(i);
		if(i == 0) {
			//Installment Amount
			var e1 = document.createElement('input');
			e1.setAttribute('type', 'text');
			e1.setAttribute('id', 'amount'+totalRow);
			e1.setAttribute('name', 'amount'+totalRow);
			e1.setAttribute('tabIndex', tabCounter);
			e1.setAttribute('onkeypress', checkAmount);
			e1.setAttribute('onfocus', updateSelectedRow);
			e1.setAttribute('maxLength', '15');
			e1.style.textAlign = "right";
			cell[i].appendChild(e1);
			tabCounter++;
		} else if(i == 1) {
			//No of Installments
			var e2 = document.createElement('input');
			e2.setAttribute('type', 'text');
			e2.setAttribute('size', '10');
			e2.setAttribute('id', 'no'+totalRow);
			e2.setAttribute('name', 'no'+totalRow);
			e2.setAttribute('tabIndex', tabCounter);
			e2.setAttribute('onkeypress', isValidNumber);
			e2.setAttribute('maxLength', '3');
			e2.style.textAlign = "right";
			cell[i].appendChild(e2);
			cell[i].align = "center";
			tabCounter++;
		} else if(i == 2) {
			//Period
			var e3 = document.createElement('select');
			e3.setAttribute('id', 'period'+totalRow);
			e3.setAttribute('name', 'period'+totalRow);
			e3.setAttribute('tabIndex', tabCounter);
			tabCounter++;
			cell[i].appendChild(e3);
			setValue(totalRow);
			cell[i].align = "center";
		} else if(i == 3) {
			//Button for Loan Amount
			var e4 = document.createElement('input');
			e4.setAttribute('type', 'button');
			e4.setAttribute('id', 'calculate'+totalRow);
			e4.setAttribute('name', 'calculate'+totalRow);
			e4.setAttribute('tabIndex', tabCounter);
			e4.setAttribute('value', "Calculate");
			e4.className = "Button";
			e4.setAttribute('onclick', calculateAmount);
			tabCounter++;
			cell[i].appendChild(e4);
			cell[i].align = "center";
		} else if(i == 4) {
			//Text Box for Loan Amount
			var e5 = document.createElement('input');
			e5.setAttribute('type', 'text');
			e5.setAttribute('id', 'loanAmount'+totalRow);
			e5.setAttribute('name', 'loanAmount'+totalRow);
			e5.setAttribute('readOnly', true);
			e5.style.textAlign = "right";
			tabCounter++;
			cell[i].appendChild(e5);
			cell[i].align = "center";
		}
	}
	document.getElementById('amount' + totalRow).focus();
	//countRow ++;
	totalRow ++;
}

//Text Box remove at run Time 
function deleteRow() {
	//Get the id of tbody
	if(selectedRow == -1)
		return;
	var TBody = getObject("bodyLoan");
	//alert("Selected Row is " + selectedRow);
	var iDeleteIndex = 0;
	for(var i = 0; i < selectedRow; i ++) {
		if(document.getElementById('amount' + i) != null) {
			//alert("Element Found at " + i);
			iDeleteIndex ++;
		}
	}
	//alert("Deleted Row is " + iDeleteIndex);
	var row = TBody.deleteRow(iDeleteIndex);
	selectedRow ++;
	if(getTotalRows() == 0)
		document.getElementById("statusText").value = "";
	else
		previousRow();
	selectedRow = -1;
	document.getElementById("delete").disabled = true;

}

/* Create Object Of the Row */
function getObject(obj) {
	var theObj;
	if (document.all) {
		if (typeof obj == "string") {
			return document.all(obj);
		} else {
			return obj.style;
		}
	}
	if (document.getElementById) {
		if (typeof obj == "string") {
			return document.getElementById(obj);
		} else {
			return obj.style;
		}
	}
	return null;
}

function setValue(countRow) {
	document.getElementById('period'+countRow).options[document.getElementById('period'+countRow).length] =  
		new Option("Monthly", 'M', false, false); 
	document.getElementById('period'+countRow).options[document.getElementById('period'+countRow).length] =  
		new Option("Quarterly", 'Q', false, false); 
	document.getElementById('period'+countRow).options[document.getElementById('period'+countRow).length] =  
		new Option("Half Yearly", 'H', false, false); 
	document.getElementById('period'+countRow).options[document.getElementById('period'+countRow).length] =  
		new Option("Yearly", 'Y', false, false); 
}

function calculateAmount() {
	//calculate length is 9
	var iRowNo = (window.event.srcElement.name).substring(9);
	//alert("Row No is " + iRowNo);
	//alert(document.getElementById('period' + iRowNo).value);

	var dAmount = parseFloat(document.getElementById('amount'+iRowNo).value);
	if(isNaN(dAmount)) {
		//Installment Amount Not defined
		showMessage(1668);
		document.getElementById('amount' + iRowNo).focus();
		return;
	}
	if(dAmount == 0) {
		//Incomplete entries
		showMessage(53);
		document.getElementById('amount' + iRowNo).focus();
		return;
	}

	var iInstallment = parseInt(document.getElementById('no'+iRowNo).value);
	if(isNaN(iInstallment)) {
		showMessage(53);
		document.getElementById('no' + iRowNo).focus();
		return;
	}
	if(iInstallment == 0) {
		showMessage(53);
		document.getElementById('no' + iRowNo).focus();
		return;
	}
	
	var dRoi = parseFloat(document.getElementById('interestRate').value);
	//alert(dRoi);
	if(isNaN(dRoi)) {
		showMessage(53);
		document.getElementById('interestRate').focus();
		return;
	}
	if(dRoi == 0) {
		showMessage(53);
		document.getElementById('interestRate').focus();
		return;
	}

	var period = document.getElementById('period' + iRowNo).value;
	var iMonth = 0;
	if(period == 'M')
		iMonth = 1;
	else if(period == 'Q')
		iMonth = 3;
	else if(period == 'H')
		iMonth = 6;
	else if(period == 'Y')
		iMonth = 12;
	
	//var iNoOfPeriods = iInstallment / iMonth;
	var dPrincipalAmount = 0;
	//Math.pow(1+(dRoi/400), iInstallment/3)
	if(iMonth == 1)
		dPrincipalAmount = (dAmount*(Math.pow(1+(dRoi/1200), iInstallment)-1) * 
		(1200/dRoi)) / Math.pow(1+(dRoi/1200), iInstallment);
	else if(iMonth == 3)
		dPrincipalAmount = (dAmount * (Math.pow(1+(dRoi/400), iInstallment/3) - 1) * 
		(1 + 1200/dRoi))/Math.pow(1+(dRoi/400), iInstallment/3);
	
	dPrincipalAmount = Math.round(dPrincipalAmount);
	document.getElementById("loanAmount"+iRowNo).value = dPrincipalAmount;
	document.getElementById("insert").focus();
}

function checkAmount() {
	var iRowNo = (window.event.srcElement.name).substring(6);
	isValidAmount(event, document.getElementById('amount'+iRowNo));
}

function updateSelectedRow() {
	selectedRow = (window.event.srcElement.name).substring(6);
	document.getElementById("delete").disabled = false;
	document.getElementById("statusText").value = parseInt(parseInt(getCurrentRow(selectedRow)) + 1) 
		+ " OF " + getTotalRows();
}

function lastRow() {
	if(totalRow <= 0)
		return;
	var iIndex = totalRow;
	if(totalRow > 0) {
		while(document.getElementById('amount' +iIndex) == null) {
			if(iIndex < 0)
				break;
			iIndex --;
		}
	}
	if(iIndex > -1)
		document.getElementById('amount' +iIndex).focus();
}

function firstRow() {
	for(var i = 0; i < totalRow; i ++) {
		if(document.getElementById('amount' +i) != null) {
			document.getElementById('amount' +i).focus();
			break;
		}
	}
}

function nextRow() {
	for(var i = parseInt(selectedRow) + 1; i <= totalRow; i ++) {
		if(document.getElementById('amount' +i) != null) {
			document.getElementById('amount' +i).focus();
			break;
		}
	}
}

function previousRow() {
	//alert(selectedRow);
	for(var i = parseInt(selectedRow) - 1; i >= 0; i --) {
		//alert(i);
		if(document.getElementById('amount' +i) != null) {
			document.getElementById('amount' +i).focus();
			break;
		}
	}
}

function getTotalRows() {
	var iLen = 0;
	for(var i = 0; i < totalRow; i ++) {
		if(document.getElementById('amount' +i) != null) {
			iLen ++;
		}
	}
	return iLen;
}

function getCurrentRow(selectedRow) {
	var iLen = 0;
	for(var i = 0; i < selectedRow; i ++) {
		if(document.getElementById('amount' +i) != null) {
			iLen ++;
		}
	}
	return iLen;
}