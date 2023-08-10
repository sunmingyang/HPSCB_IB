	function showChild(rowCount){
		if(document.getElementById("expBtn_"+rowCount).value=="+"){
			document.getElementById("expBtn_"+rowCount).value="-";
			document.getElementById("details_"+(rowCount+1)).style.display="block";
		}
		else{
			document.getElementById("expBtn_"+rowCount).value="+";
			document.getElementById("details_"+(rowCount+1)).style.display="none";
		}
	}
	function do_oper(){
		var btn_val=document.getElementById("table2_button").value;
		if(btn_val=="Back"){
			window.location.href="";
		}else if(btn_val=="Update"){
			var kid=document.getElementById("tr_kid").value;
			var amt=document.getElementById("amount").value;
			var str='{"kid":"'+kid+'","amount":"'+amt+'","operation":"'+btn_val+'"}';
			var url="/TransactionAction.do?action=multipleTransactionOperations&operationStr="+str;
			http.open("POST",url,false);
			http.onreadystatechange= function (){
				if (http.readyState == 4)
				{
					if (http.status == 200)
					{
						var res=http.responseText;
						if(res=="true")
						{	alert("Enteries updated successfully");
						}
						else
						{
							alert("Enteries not updated successfully");
						}
						window.location.href="/TransactionAction.do?action=getMultipleTransactionList&isAuth=true&purpose=BULKTRN";

					}
				}
			};
	   		http.send(null);
				
		}

		
	}
	function authorizeTransaction(oper){
		var table=document.getElementById("transferTable");
		var rowCount=table.rows.length;
		var chqNo="";
		var flag=false;
		for(var i=1;i<rowCount;i++)
		{
			if(document.getElementById("chk_"+i)!=null && document.getElementById("chk_"+i).checked==true)
			{
				flag=true;
				chqNo+=table.rows[i].cells[3].innerHTML+"~";
			}
		}
		if(!flag){
			alert("Please select a checkbox");
			return false;
		}
		var data=chqNo.split("~");
		chqNo="";
		for(var i=0;i<data.length-1;i++)
		{
			chqNo+=data[i];
			if(i!=data.length-2)
				chqNo+=",";
		}
		if(oper=="delete" || oper=="cancel" ){
			deleteTransaction(chqNo,"By ChqNo");
		}
		else if(oper=='reschedule'){
			reschedule(chqNo);
		}
		else if(oper=="auth"){
			var str='{"operation":"Authorize","kid":"'+chqNo+'"}';
			var trdetails='{"operation":"Authorize","authorizeDetails":[';
			for(var i=0;i<data.length-1;i++)
			{
				var table=document.getElementById("trDetails"+data[i]);
				var rowCount=table.rows.length;
				for(var j=1;j<rowCount;j++)
				{
					var name=table.rows[j].cells[2].innerHTML;
					var amt=table.rows[j].cells[3].innerHTML;
					var beneAcc=table.rows[j].cells[1].innerHTML;
					var fromAcc=table.rows[j].cells[0].innerHTML;
					var data1=table.rows[j].cells[4].childNodes;
					var kid=data1[0].value;
					var mkrid=data1[1].value;
					var isResch=data1[2].value;
					
					trdetails+='{"srno":"'+j+'","name":"'+name+'","mobile":"","beneAcc":"'+beneAcc+'","ifsc":"","amount":"'+amt+'","remark":"transfer","isResch":"'+isResch+'","maker":"'+mkrid+'","kid":"'+kid+'","fromAcc":"'+fromAcc+'","chqNo":"'+data[i]+'"}';
					if(j!=rowCount-1)
						trdetails+=",";
				}
				if(i!=data.length-2)
					trdetails+=",";
				
			}
			trdetails+="]}";
			
			document.getElementById("tr_kid").value=trdetails;
			document.getElementById("table1_button").style.display="none";
			document.getElementById("sec_All").style.display="none";
			document.getElementById("transferTable").style.display="none";
			document.getElementById("table3").style.display="inline";
		}
	}
	function submitTxnPassword(sessionid){
		//debugger;
		var txnPass=document.getElementById("txnpass").value;
		if(txnPass==""){
			alert("Enter transaction password");
			document.getElementById("txnpass").focus();
			return false;
		}
		var str=document.getElementById("tr_kid").value;
		txnpass = calcMD5(document.getElementById("txnpass").value);
		var url="/TransactionAction.do?action=multipleTransactionOperations&sessionID="+sessionid+"&mode=authorize&txnpass="+txnpass+"&purpose=BulkTrn&operationStr="+str;
			http.open("POST",url,false);
			http.onreadystatechange= function (){
				if (http.readyState == 4)
				{
					if (http.status == 200)
					{
						var res=http.responseText;
						if(res=="false"){
							alert("Internal error");
							back();
						}
						else if(res=="Password Failure")
						{
							alert("Transaction Password donot match");
							back();
						}
						else{
							res=JSON.parse(res);
							var flag=false;
							var successlist=res.successlist;
							var table=document.getElementById("table4");
							var rowCount=table.rows.length;
							rowCount-=1;
							for(var i=0;i<successlist.length;i++)
							{
								flag=true;
								var data=successlist[i];
								var row=table.insertRow(rowCount++);
								var cells=row.insertCell(0);
								cells.innerHTML=data.fromAcc;
								cells=row.insertCell(1);
								cells.innerHTML=data.toAcc;
								cells=row.insertCell(2);
								cells.innerHTML=data.chqNo;
								cells=row.insertCell(3);
								cells.innerHTML=data.message;
								cells.className="messageTD";
								cells=row.insertCell(4);
								cells.innerHTML=data.Trdid;
								

							}
							var failurelist=res.failurelist;
							for(var i=0;i<failurelist.length;i++)
							{
								flag=true;
								var data=failurelist[i];
								var row=table.insertRow(rowCount++);
								var cells=row.insertCell(0);
								cells.innerHTML=data.fromAcc;
								cells=row.insertCell(1);
								cells.innerHTML=data.toAcc;
								cells=row.insertCell(2);
								cells.innerHTML=data.chqNo;
								cells=row.insertCell(3);
								cells.innerHTML=data.message;
								cells.className="messageTD";
								cells=row.insertCell(4);
								cells.innerHTML=data.Trdid;

							}
							if(!flag){
								var row=table.insertRow(rowCount++);
								row.innerHTML="<td colspan='5'>Transaction scheduled </td>";
							}
						document.getElementById("table4").style.display="inline-table";
						document.getElementById("table3").style.display="none";
						
					}
				}
			}
			};
	   		http.send();
	}
	function back(){
		window.location.href="/jsp/main_page.jsp";
	}
	function showMessage(dataStr,debAccNo){
		//debugger;
		if (http.readyState == 4)
			{

				if (http.status == 200)
				{
					var res=http.responseText;
					var data=res.split("~");
					var result=JSON.parse(data[0]);
				//	alert(res);
					alert(result.Error);
				//	document.getElementById("confirm_kid").value=result.transactionId;
					if(result.result=="Success"){
					/*	var tab=document.getElementById("mainTab");
						tab.style.display="none";
						var showTab=document.getElementById("confirmData");
						rowCount=showTab.rows.length;
						document.getElementById("confirmData").style.display="block";
						res=JSON.parse(dataStr);
						for(var i=0;i<res.length;i++)
						{
							var data=res[i];
							var row=showTab.insertRow(i+2);
							var cell1=row.insertCell(0);
							cell1.innerHTML=debAccNo;
							cell1=row.insertCell(1);
							cell1.innerHTML=data.accNo;
							cell1=row.insertCell(2);
							cell1.innerHTML=data.name;
							cell1=row.insertCell(3);
							cell1.innerHTML=data.trAmt;

						}	*/
						window.location.href="/fundtransfer/cbFundTransfer_Confirm.jsp";
					}
					else{
						window.location.href="/jsp/main_page.jsp";
					}
				
				}
			}
	}
	function confirmTransaction(){
		//debugger;
		var kid=document.getElementById("confirm_kid").value.split("~");
		var chqNo=document.getElementById("mainTab").rows[0].cells[1].innerHTML;
		var str='{"operation":"confirm","BulkTrnkid":"'+kid[0]+'","chqNo":"'+chqNo+'","schTrnKid":"'+kid[1]+'"}';
		var url="/TransactionAction.do?action=multipleTransactionOperations&operationStr="+str;
	 	http.open("POST",url,false);
  		http.onreadystatechange= function (){
			if (http.readyState == 4 && http.status == 200)
	      	{
				var resArray=http.responseText;
	       		if(resArray=="true")
				{
					alert("Cheque Confirmed Successfully");
				}
				else{
					alert("Cheque not Confirmed Successfully");
				}
				window.location.href="/jsp/main_page.jsp";
			}
		};
  		http.send(null);
	}
	function focusAmount(fld){
		
		var amt=document.getElementById(fld).value;
		if(amt=="0.00" || amt==".00")
			document.getElementById(fld).value="";
	}
	function checkIfAlready(i)
		{
			var table = document.getElementById("beneAccTable");
			var rowCount = table.rows.length;
			var flag=false;
			for(var j=0;j<rowCount-1;j++)
			{
				if(document.getElementById("chk_"+j+"").checked==true && i!=j)
				{
					flag=true;
					document.getElementById("chk_"+j+"").checked=false;
				}
			}
			if(!flag){
				document.getElementById("beneAmtDiv").style.display="none";
				document.getElementById("amount").value="0.00";
			}

			
		}
	function enableAmount(i){
		//debugger;
		if(document.getElementById("sAccList").value=="-1")
		{
			alert("Select Account Number first");
			document.getElementById("sAccList").focus();
			document.getElementById("chk_"+i).checked=false;
			return false;
		}
		else if(document.getElementById("totalAmt").value=="0.00"){
			alert("Enter debit amount");
			document.getElementById("totalAmt").focus();
			document.getElementById("chk_"+i).checked=false;
			return false;
		}
		checkIfAlready(i);
		document.getElementById("select_bene").value=i;
		if(document.getElementById("beneAmtDiv").style.display=="none")
		{
			document.getElementById("beneAmtDiv").style.display="block";
			//document.getElementById("balance").value=document.getElementById("totalAmt").value;
			calBalance();
		}
		else{
			document.getElementById("amount").value="0.00";
		}
	}
	function bacck(){
		window.location.href="/jsp/main_page.jsp";
	}
	function calculateBalance(){
		//debugger;
		var amount=parseFloat(document.getElementById("amount").value);
	
		var totalAmount=parseFloat(document.getElementById("totalAmt").value);
		var balance=parseFloat(document.getElementById("balance").value);
		var sum=0;
		if(isNaN(balance))
			balance=0;
		if(document.getElementById("beneAmtTable").rows.length>1)
		{
			var len=document.getElementById("beneAmtTable").rows.length;
			for(var i=1;i<len;i++)
			{
				var a=document.getElementById("beneAmtTable").rows[i].cells[2].childNodes[0].value;
				sum+=parseFloat(a);
			}
			if(balance==0 && sum==totalAmount){
				alert("Balance Amount is zero");
				document.getElementById("amount").value="0.00";
				
				return false;
			}
		}
		if(amount<0.00 || amount==0.00)
		{
			alert("Amount must be greater than 0.00");
			document.getElementById("amount").value="0.00";
			document.getElementById("amount").focus();
			return false;
		}else if(amount>totalAmount && balance==0){
			alert("Please enter amount less than or equal to total amount");
			document.getElementById("amount").value="0.00";
			document.getElementById("amount").focus();
			return false;
		}
		else if(amount>balance || amount>(totalAmount-sum)){
			alert("Amount is greater than balance amount");
			document.getElementById("amount").value="0.00";
			document.getElementById("amount").focus();
			return false;
		}/*else if(totalAmount-amount-sum<0){
			alert("Amount is greater than balance amount");
			document.getElementById("amount").value="0.00";
			document.getElementById("amount").focus();
			return false;
		}*/
		document.getElementById("balance").value=totalAmount-amount-sum;
		/*if(balance=="")
			document.getElementById("balance").value=totalAmount-amount;
		else
			document.getElementById("balance").value=balance-amount;*/
	}
	function addBeneAmt(){
		//debugger;
		var i=parseInt(document.getElementById("select_bene").value);
		var amount=document.getElementById("amount").value;
		if(i==-1){
			alert("Please select a beneficiary Account first");
			return false;

		}
		if(amount=="0.00")
		{
			alert("Enter amount");
			document.getElementById("amount").value="0.00";
			document.getElementById("amount").focus();
			return false;
		}
		var table1=document.getElementById("beneAmtTable");
		var table2=document.getElementById("beneAccTable");
		var rowCount=table1.rows.length;
		var row = table1.insertRow(rowCount);
		var cell1 = row.insertCell(0);
		/*var cols1 = document.createElement("input");
    	cols1.type = "checkbox";
    	cols1.id = "beneAmtChk_"+rowCount;
		cell1.appendChild(cols1);*/
		//cell1.innerHTML="<input type='button' style='cursor:pointer;color:red;font-weight:bold;' value='X' id='delete_"+rowCount+"' 
		//onclick='deleteSelectedBene(this)'></input>";
		//cell1 = row.insertCell(1);
		cell1.innerHTML=table2.rows[i+1].cells[1].innerHTML;
        cell1 = row.insertCell(1);
		cell1.innerHTML=table2.rows[i+1].cells[2].innerHTML;;
		
		cell1 = row.insertCell(2);
		cell1.innerHTML="<input type='text' value='"+amount+"' readonly style='text-align:center;height:100%;width:100%;border:none;'/>";
		
		cell1 = row.insertCell(3);
		var shtml="<input type='button' "+
						"id='edit_"+rowCount+"' class='oper_button' value='Edit' onclick='editSelectedBene(this)'/>";
		shtml+="&emsp;<input type='button' class='oper_button' value='Delete' id='delete_"+rowCount+"' onclick='deleteSelectedBene(this)'></input>";
		cell1.innerHTML=shtml;
		table1.style.display="block";
		document.getElementById("beneAmtTable_Div").style.display="block";
		document.getElementById("div1").style.display="block";
	// document.getElementById("beneAmtTable_Div").value=;
		document.getElementById("amount").value="0.00";
		document.getElementById("chk_"+i).checked=false;
		document.getElementById("beneAmtDiv").style.display="none";
		document.getElementById("select_bene").value="-1";	
	}
	function deleteSelectedBene(i){
		//debugger;
		var table=document.getElementById("beneAmtTable");
		var rowCount=table.rows.length;
		for(var j=1;j<rowCount;j++)
		{
			if(table.rows[j].cells[3].childNodes[2].id==i.id)
			{
				table.deleteRow(j);
				break;
			}
		}
		rowCount=table.rows.length;
		if(rowCount==1){
			document.getElementById("beneAmtTable_Div").style.display="none";
			document.getElementById("div1").style.display="none";
		// document.getElementById("beneAmtTable_Div").value=;
			document.getElementById("amount").value="0.00";
		}
		calBalance();
	}
	function editSelectedBene(i){
		//debugger;
		var table=document.getElementById("beneAmtTable");
		var rowCount=table.rows.length;
		for(var j=1;j<rowCount;j++)
		{
			if(table.rows[j].cells[3].childNodes[0].id==i.id)
			{
				if(document.getElementById(i.id).value=="Edit"){
					var id=table.rows[j].cells[2].childNodes[0].id;
					table.rows[j].cells[2].childNodes[0].readOnly=false;
					document.getElementById(i.id).value="Update";
				}
				else{
					var amt=table.rows[j].cells[2].childNodes[0].value;
					var balance=parseFloat(document.getElementById("balance").value);
					if(isNaN(balance))
						balance="";
					if(amt>balance){
						alert("Amount greater than balance amount");
						table.rows[j].cells[2].childNodes[0].value="";
						calBalance();
						table.rows[j].cells[2].childNodes[0].focus();
						return false;
					}
					table.rows[j].cells[2].childNodes[0].readOnly  =true;
					document.getElementById(i.id).value="Edit";
					calBalance();
					break;
				}
				

			}
		}
		rowCount=table.rows.length;
		if(rowCount==1){
			document.getElementById("beneAmtTable_Div").style.display="none";
			document.getElementById("div1").style.display="none";
		// document.getElementById("beneAmtTable_Div").value=;
			document.getElementById("amount").value="0.00";
		}
		calBalance();
	}
	function calBalance(){
		//debugger;
		isValidAmount(this,document.getElementById("totalAmt"));

		if(parseFloat(document.getElementById("totalAmt").value)==.00)
			focusAmount('totalAmt');
		var totalAmount=parseFloat(document.getElementById("totalAmt").value);
		var beneAmtTable=document.getElementById("beneAmtTable");
		var balance=parseFloat("0.00");
		var rowCount=beneAmtTable.rows.length;
		for(var i=1;i<rowCount;i++)
		{
			var val=parseFloat(beneAmtTable.rows[i].cells[2].childNodes[0].value);
			if(isNaN(val))
				val=0;
			balance+=val;
			
		}
		if(totalAmount<balance)
		{
			alert("Please enter amount greater or less than Transfer amount");
			document.getElementById("totalAmt").focus();
			return false;
		}

		if(document.getElementById("amount").style.display!="none" && !isNaN(parseFloat(document.getElementById("amount").value)))
			balance+=parseFloat(document.getElementById("amount").value);
		var bal=totalAmount-balance;
		if(isNaN(bal)){
			document.getElementById("balance").value="0.00";
			document.getElementById("totalAmt").value="0.00";
		}
		else
			document.getElementById("balance").value=bal;
	}
		function getAvailableBal()
   	{
    	
		var accno=document.getElementById("sAccList").value;
		if(accno=="-1")
		{
			document.getElementById("aval_bal").value="";
			return;
		}
		var ran=parseInt(Math.random()*9999);
        var URL ="/AccountInfoAction.do?action=fetchAccountBalance&accNo="+accno;
     	http.open("POST",URL,false);
  		http.onreadystatechange= function (){
			if (http.readyState == 4 && http.status == 200)
	      	{
				var resArray=http.responseText;
	       		var jsonData = JSON.parse(resArray);
				var bal=parseFloat(jsonData.accBalance);
				var Afterbal= bal.toFixed(2);
	       		document.getElementById("aval_bal").value=Afterbal;
			}
		};
  		http.send(null);
   	}
	function showScheduleDiv(){
		if(document.getElementById("isSchedule").value=="N"){
			document.getElementById("schTable").style.display="none";
			document.getElementById("paymentDiv").style.display="none";
			document.getElementById("periodicityDiv").style.display="none";
			
		}
		else{
			document.getElementById("schTable").style.display="inline";
			document.getElementById("paymentDiv").style.display="inline";
			
			
			
		}
	}

	function reschedule(oper,date){
		//debugger;
		if(oper=='back'){
			window.location.href="";
		}
		else{
			var chqno=document.getElementById("table5").rows[4].cells[1].innerHTML;
			var scDate=document.getElementById("schDate").value;
			var scTime_hr=parseInt(document.getElementById("schTime_hr").value);
			var scTime_min=parseInt(document.getElementById("schTime_min").value);
			var time=date.split(" ")[1].split(":");
			var dd=date.split(" ")[0];
			if(isValidDateFormat("schDate")==false)
			{
				alert("Enter valid Schedule date");
				document.getElementById("schDate").focus();
				return false;
			}
			else if(dateComparision("tDate","schDate")  || document.getElementById("tDate").value==scDate)
			{
				alert("Schedule date must be greater than today's date");
				document.getElementById("schDate").value="";
				document.getElementById("schDate").focus();
				return false;
			}else if(dateComparision("tDate","schDate") && (scTime_hr<parseInt(time[0]) || scTime_hr==parseInt(time[0])) && scTime_min<parseInt(time[1])){
				alert("Schedule time must be greater than current time");
				return false;
			}
			var d=scDate.substring(3,5)+"/"+scDate.substring(0,2)+"/"+scDate.substring(6,10);
			var scTime=scTime_hr+":"+scTime_min+":"+"00";
			var str="{'operation':'reschedule','kid':'"+chqno+"','schDate':'"+d+" "+scTime+"'}";
			var url="/TransactionAction.do?action=multipleTransactionOperations&operationStr="+str;
				http.open("POST",url,false);
				http.onreadystatechange= function (){
					if (http.readyState == 4)
					{
						if (http.status == 200)
						{
							var res=http.responseText;
							if(res=="true")
							{	alert("Enteries rescheduled successfully");
							}
							else
							{
								alert("Enteries not rescheduled successfully");
							}
						window.location.href="/TransactionAction.do?action=getMultipleTransactionList&purpose=BULKTRN";

						}
					}
				};
				http.send(null);
		}
	}
	function editScheduleDate(i,dd){
		//debugger;
		var table=document.getElementById("transferTable");
		var showTab=document.getElementById("table5");
		var rowCount=showTab.rows.length;
		showTab.rows[2].cells[1].innerHTML=table.rows[i].cells[1].innerHTML;
		showTab.rows[3].cells[1].innerHTML=table.rows[i].cells[2].innerHTML;
		showTab.rows[4].cells[1].innerHTML=table.rows[i].cells[3].innerHTML;
		if(dd!="-"){
			document.getElementById("schDate").value=table.rows[i].cells[4].innerHTML;
			var time=dd.split(" ")[1].split(":");
			document.getElementById("schTime_hr").value=time[0];
			document.getElementById("schTime_min").value=time[1];
		}
		
		table.style.display="none";
		showTab.style.display="inline";
		document.getElementById("table1_button").style.display="none";

							
	}
	function showPeriodicityDiv(){
		var a=document.getElementById("paymentType").value;
		if(a=="O"){
			document.getElementById("periodicityDiv").style.display="none";
			document.getElementById("periodicity").value="-1";
		}
		else{
			document.getElementById("periodicityDiv").style.display="block";
			//document.getElementById("periodicity").value="-1";
		}
	}
	function showTransactionDetails(){
		if(document.getElementById("confirmDiv").style.display=="none")
			document.getElementById("confirmDiv").style.display="inline";
		else
			document.getElementById("confirmDiv").style.display="none";
	}
	function selectAll(){
		var title=document.getElementById("sec_All").innerHTML;
		if(title=="Select All")
			document.getElementById("sec_All").innerHTML="De-Select All";
		else 
			document.getElementById("sec_All").innerHTML="Select All";
		var rc=document.getElementById("transferTable").rows.length;
		for(var i=0;i<rc;i++)
		{
			var chk=document.getElementById("chk_"+i);
			if(chk!=null)
			{
				if(title=="Select All")
					chk.checked=true;
				else
					chk.checked=false;
			}
		}
	}