<%@ include file='/common/Include.jsp' %>
<%@ page import="java.util.Date"%>
<%String usrName = (String)session.getAttribute("user");
String usrInfo[][]=(String[][])session.getAttribute("userInfo"); 
String accList=(String)session.getAttribute("allAccountlist");

String transferString=(String)session.getAttribute("transfer_details");
String resultFor = (String)session.getAttribute("resultFor");
String custRole=(String)session.getAttribute("custRole");	

System.out.println(resultFor+"    ");

session.removeAttribute("resultFor");
session.removeAttribute("transfer_details");

String  date=DateTimeFunction.getIbDateTime();
String time[]=date.split(" ")[1].split(":");
date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);

System.out.println("date:"+date+"   "+time[0]+"   "+time[1]+"  "+time[2]);

String title="Corporate Banking Fund Transfer Authorization";
String message="No Transactions Pending for authorization";
boolean isAuth=true;
if(request.getParameter("isAuth")==null){
	title="Corporate Banking Fund Transfer ReSchedule";
	isAuth=false;
	message="No transaction for Re-scheduling";
}else if(resultFor!=null){
	title="Corporate Banking Fund Transfer";
}

%>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Coorporate Banking Fund Transfer"/>
<%if(request.getParameter("row")==null){ %>
	<tiles:put name="menu" value="/common/user_left.jsp?mode=apforDbtCrd&src=request"/>
<%}%>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=corporatebanking&mode=CBFundTr"/>
<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking" />
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>
</tiles:put>
<tiles:put name="content" type="String">
<script language=JavaScript src="/scripts/MD5.js"> </script>
<script language=JavaScript src="/fundtransfer/scripts/cbFundTransfer.js"> </script>
<style>
.oper_button,.exp_btn{
    background: #698ed1;
    color: white;
    font-family: monospace;
    font-weight: bold;
    border-radius: 8px;
    border: 1px solid blue;
	cursor:pointer;
}
.exp_btn{
	border-radius: 2px;
}
.headerTD{
	 background: #698ed1;
	 font-family: serif;
	 font-size:12px;
	 color:white;
}
.messageTD{
	font-size:15px;
}
</style>
<script>
var resString='<%=transferString%>';
var resultfor = '<%=resultFor%>';
function hideelement()
{
	//debugger;
	if (resultfor === 'echkcancelreportdata')
{
		document.getElementById("authbtn").style.display = "none";
		document.getElementById("deletebtn").style.display = "none";
		document.getElementById("cancelechkbtn").style.display = "none"; 

} else if("<%=isAuth%>"=="false"){
	document.getElementById("authbtn").style.display = "none";
		document.getElementById("deletebtn").style.display = "none";
		document.getElementById("cancelechkbtn").style.display = "none";
}
else{
	document.getElementById("cancelechkbtn").style.display = "none";
}
}
	function fill(){
		
	
		if(resultfor === 'echkcancel' || resultfor === 'echkcancelreportdata') {

		if(resString!="null"){
			resString=JSON.parse(resString);
			var table1=document.getElementById("transferTable");
			for(var i=0;i<resString.length;i++){
				var resData=resString[i];
				var rowCount=table1.rows.length;
				var row = table1.insertRow(rowCount);
				//for add button
				var cell1 = row.insertCell(0);
				cell1.innerHTML="<input type='button' id='expBtn_"+rowCount+"' value='+' class='exp_btn' onclick='showChild("+rowCount+")' title='Expand'/>";
				
				cell1=row.insertCell(1);
				cell1.innerHTML=resData.debitAcc;
				
				cell1=row.insertCell(2);
				cell1.innerHTML=resData.transferAmt;
				
				cell1=row.insertCell(3);
				cell1.innerHTML=resData.chqNo;
				
				cell1=row.insertCell(4);
				cell1.innerHTML="<input type='checkbox' id='chk_"+rowCount+"'/>"
				rowCount++;
				row = table1.insertRow(rowCount);

				
				var trDetail=resData.transferDetail;
				var sHTML="";
				for(var j=0;j<trDetail.length;j++){
					var trStr=trDetail[j];
					//trStr=JSON.parse(trStr);
					sHTML+="<tr>";
					//sHTML+="<td><input type='checkbox' id='chk_"+trStr.kid+"'/></td>";
					sHTML+="<td>"+trStr.fromAccount+"</td>";
					sHTML+="<td>"+trStr.beneAccNo+"</td>";
					sHTML+="<td>"+trStr.beneName+"</td>";
					sHTML+="<td>"+trStr.amount+"</td>";
					sHTML+="<td><input type='hidden' id='trDetails_trnkid"+resData.chqNo+"' value='"+trStr.kid+"'/>";
					sHTML+="<input type='hidden' id='mkrid"+trStr.kid+"' value='"+trStr.mkrid+"'/>";
					}  
				sHTML='<td colspan="5"><div id="details_'+rowCount+'" style="width:100%;display:none;">'+
						'<table style="width:100%;text-align:center;" align="center" id="trDetails'+resData.chqNo+'"><tr>'+
						//'<th style=" background: #698ed1;width:3%;">&nbsp;</td>' +
						'<th class="headerTD" >From Account</th>'+
						'<th class="headerTD" >To Account</th>'+
						'<th class="headerTD" >Name</th>'+
						'<th class="headerTD" >Amount</th>'+
						'<th class="headerTD" >&nbsp;</th>'+
						'<th class="headerTD" >&nbsp;</th>'+
						'<th class="headerTD" >&nbsp;</th>'+
						'</tr>'+sHTML;
				sHTML+='</table>'+
						'</div></td>';
				row.innerHTML=sHTML;
			}
		}
		else{
			document.getElementById("table1").style.display="none";
			document.getElementById("table1_button").style.display="none";
			document.getElementById("table_message").style.display="inline";
			
		}
		} else {
		if(resString!="null"){
		//debugger;
			var flag=false;
			resString=JSON.parse(resString);
			var table1=document.getElementById("transferTable");
			for(var i=0;i<resString.length;i++){
				var resData=resString[i];
				if(resData.isSch=='N' && "<%=isAuth%>"=="false")
					continue;
				flag=true;
				var rowCount=table1.rows.length;
				var row = table1.insertRow(rowCount);
				//for add button
				var cell1 = row.insertCell(0);
				<% if(isAuth){%>
					cell1.innerHTML="<input type='button' id='expBtn_"+rowCount+"' value='+' class='exp_btn' onclick='showChild("+rowCount+")' title='Expand'/>";
				<%}else{%>
					cell1.className="headerTD";
				<%}%>
				cell1=row.insertCell(1);
				cell1.innerHTML=resData.debitAcc;
				
				cell1=row.insertCell(2);
				cell1.innerHTML=resData.transferAmt;
				
				cell1=row.insertCell(3);
				cell1.innerHTML=resData.chqNo;
				
				cell1=row.insertCell(4);
				<% if(isAuth){%>
					if(resData.isSch=='N')
						cell1.innerHTML="-"
					else
						cell1.innerHTML=resData.reschDate;
				<%}else{%>
					cell1.innerHTML=resData.reschDate.split(" ")[0];
				<%}%>
				
				cell1=row.insertCell(5);
				<% if(isAuth){%>
					cell1.innerHTML="<input type='checkbox' id='chk_"+rowCount+"'/>"
				<%}else{%>
					cell1.innerHTML="<input type='button' class='exp_btn' id='resch_"+rowCount+"' value='Re-Schedule' onclick='editScheduleDate(\""+rowCount+"\",\""+resData.reschDate+"\")'/>"
				<%}%>
				rowCount++;
				row = table1.insertRow(rowCount);
				cell1=row.insertCell(0);
				cell1.colSpan=6;
				
				var trDetail=resData.transferDetail;
				var sHTML="";
				for(var j=0;j<trDetail.length;j++){
					var trStr=trDetail[j];
					//trStr=JSON.parse(trStr);
					sHTML+="<tr>";
					//sHTML+="<td><input type='checkbox' id='chk_"+trStr.kid+"'/></td>";
					sHTML+="<td>"+trStr.fromAccount+"</td>";
					sHTML+="<td>"+trStr.beneAccNo+"</td>";
					sHTML+="<td>"+trStr.beneName+"</td>";
					sHTML+="<td>"+parseInt(trStr.amount).toFixed(2)+"</td>";
					sHTML+="<td><input type='hidden' id='trDetails_trnkid"+resData.chqNo+"' value='"+trStr.kid+"'/>";
					sHTML+="<input type='hidden' id='mkrid"+trStr.kid+"' value='"+trStr.mkrid+"'/>";
					sHTML+="<input type='hidden' id='isResch"+trStr.kid+"' value='"+resData.isSch+"'/>";
					sHTML+="<input type='button' id='edit_"+trStr.kid+"' class='oper_button' value='Edit' onclick='viewTransaction(\""+i+"\",\""+j+"\",\"Edit\")'/></td>";
					sHTML+="<td><input type='button' class='oper_button' id='delete_"+trStr.kid+"' value='Delete' onclick='deleteTransaction(\""+trStr.kid+"\",\"By kid\")'/></td>";
					sHTML+="<td><input type='button' class='oper_button' id='view_"+trStr.kid+"' value='Details' onclick='viewTransaction(\""+i+"\",\""+j+"\",\"View\")'/></td></tr>";

				}
				sHTML='<div id="details_'+rowCount+'" style="width:100%;display:none;">'+
						'<table style="width:100%;text-align:center;" align="center" id="trDetails'+resData.chqNo+'"><tr>'+
						//'<th style=" background: #698ed1;width:3%;">&nbsp;</td>' +
						'<th class="headerTD" >From Account</th>'+
						'<th class="headerTD" >To Account</th>'+
						'<th class="headerTD" >Name</th>'+
						'<th class="headerTD" >Amount</th>'+
						'<th class="headerTD" >&nbsp;</th>'+
						'<th class="headerTD" >&nbsp;</th>'+
						'<th class="headerTD" >&nbsp;</th>'+
						'</tr>'+sHTML;
				sHTML+='</table>'+
						'</div>';
				cell1.innerHTML=sHTML;
			}
			if(flag==false){
				document.getElementById("table1").style.display="none";
				document.getElementById("table1_button").style.display="none";
				document.getElementById("table_message").style.display="inline";
			}
		}
		else{
			document.getElementById("table1").style.display="none";
			document.getElementById("table1_button").style.display="none";
			document.getElementById("table_message").style.display="inline";
			
		}
	}
}
	function deleteTransaction(trkid,src){
		var str='{"operation":"delete '+src+'","kid":"'+trkid+'"}';
		var url="/TransactionAction.do?action=multipleTransactionOperations&operationStr="+str;
			http.open("POST",url,false);
			http.onreadystatechange= function (){
				if (http.readyState == 4)
				{ 
					if (http.status == 200)
					{
						var res=http.responseText;
						if(res=="true")
						{	alert("Enteries deleted successfully");
						}
						else
						{
							alert("Enteries not deleted successfully");
						}
						if (resultfor === 'echkcancelreportdata')
							window.location.href="/corporatebanking/AddNewUserAction.do?action=getParentCIBUsr"; 
						else if("<%=isAuth%>"=="false")
							window.location.href="/TransactionAction.do?action=getMultipleTransactionList&purpose=BULKTRN"; 
						else
							window.location.href="/TransactionAction.do?action=getMultipleTransactionList&isAuth=true&purpose=BULKTRN";
					}
				}
			}; 
	   		http.send(null);
	}
	function viewTransaction(i,j,oper){
		var resString='<%=transferString%>';
		if(resString!="null"){
			resString=JSON.parse(resString);
			var trStr=resString[parseInt(i)];
			trStr=trStr.transferDetail;
			trStr=trStr[parseInt(j)];
			//trStr=JSON.parse(trStr);
		document.getElementById("beneName").value=trStr.beneName;
		document.getElementById("beneAccount").value=trStr.beneAccNo;
		document.getElementById("amount").value=trStr.amount;
		document.getElementById("fromAccount").value=trStr.fromAccount;
		document.getElementById("tr_kid").value=trStr.kid;
		document.getElementById("beneName").readOnly=true;
		document.getElementById("beneAccount").readOnly=true;
		document.getElementById("fromAccount").readOnly=true;
		document.getElementById("sec_All").style.display="none";
		if(oper=="View"){
			document.getElementById("amount").readOnly=true;
			document.getElementById("table2_button").value="Back";
		}
		else
		{
			document.getElementById("table2_button").value="Update";
		}
		document.getElementById("header").innerHTML=oper+" Transaction";
		document.getElementById("transferTable").style.display="none";
		document.getElementById("table1_button").style.display="none";
		document.getElementById("table2").style.display="inline";
		
		}
	}

</script>
<body onload="fill(); hideelement();">

<html:form action="/request/reqchk.do" ><br>

<table align="left"  class="wrapperDataTable" cellpadding="0" cellspacing="0" >
	<tr>
		<td class="wrapperDataTableTR" align="center">Fund Transfer >> <%=title%> </td>
	</tr>
	<tr >
		<td align="center" >
		<div id="table_message" style="display:none;color:red;font-weight:bold;font-size:15px;">
			<%=message%>
		</div>
			<table style="width:100%;" id="table1" cellpadding="0" cellspacing="15" >
				<tr>
					<td class = "tableHeader" align="center"><u> 
					<%=title%> </u> 
					</td>
				</tr>
				<tr>
					<td align="center">
					<% if(isAuth){%>
								<span id="sec_All" class="detailSpan" onclick="selectAll()">Select All</span>
							<%}%>
						<br /><div style="text-align:center;overflow:auto;height:200px;width:850px">
							
								<table id="transferTable" border="" align="center" style="text-align:center;width:100%;">
								<tr>
									<th class="headerTD" style="width:2%;">&nbsp;</td>
									<th class="headerTD" >From Account</th>
									<th class="headerTD" >Amount</th>
									<th class="headerTD" >Cheque No</th>
									<% if(resultFor==null){%>
										<th class="headerTD" >Schedule Date</th>
									<%}%>
									<th class="headerTD" style="width:2%;"></th>
								</tr>
							</table>
							<center>
							<table id="table2" border="" align="center" style="display:none;text-align:center;width:90%">
								<tr>
									<th colspan="2"  id="header" class="headerTD" style="font-size:15px;" ></th>
								</tr>
								<tr>
									<td>From Account</td>
									<td><input type="text" id="fromAccount" /></td>
								</tr>
								<tr>
									<td>Beneficiary Account</td>
									<td><input type="text" id="beneAccount" /></td>
								</tr>
								<tr>
									<td>Beneficiary Name</td>
									<td><input type="text" id="beneName" /></td>
								</tr>
								<tr>
									<td>Amount</td>
									<td><input type="text" id="amount" /><input type="hidden" id="tr_kid" /></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center;">
										<input type="button" id="table2_button" class="button" onclick="do_oper();"/>
									</td>
								</tr>
							</table>
							</center>
							<center>
							<table id="table3" border="" align="center" style="display:none;text-align:center;width:90%">
								<tr>
									<th colspan="2"  id="header" class="headerTD" style="font-size:15px;" >
									 Transaction Password</th>
								</tr>
								<tr>
									<td>Enter Transaction Password</td>
									<td><input type="password" id="txnpass" />
									</td>
								</tr>
								
								<tr>
									<td colspan="2" style="text-align:center;">
										<br />
										<input type="button"  class="button" onclick="submitTxnPassword('<%=session.getId()%>');" value="Submit"/>
									</td>
								</tr>
							</table>
							<table id="table4" border="" align="center" style="text-align:center;display:none;width:100%">
								<tr>
									<th colspan="5"  id="header" class="headerTD" style="font-size:15px;" >
									 Transaction Status</th>
								</tr>
								<tr>
									<th class="headerTD">From Account</th>
									<th class="headerTD">To Account</th>
									<th class="headerTD">Cheque Number</th>
									<th class="headerTD">Remarks</th>
									<th class="headerTD">Transaction ID</th>
								</tr>
								
								<tr>
									<td colspan="5" style="text-align:center;">
										<br />
										<input type="button"  class="button" onclick="return bacck()" value="&nbsp;&nbsp;OK&nbsp;&nbsp;"/>
									</td>
								</tr>
							</table>
							<table id="table5" border="" align="center" style="display:none;width:90%">
								<tr>
									<th colspan="2"  id="header" class="headerTD" style="font-size:15px;" >
									Edit Schedule Date</th>
								</tr>
								<tr>
									<th colspan="2"  id="header" class="headerTD" style="font-size:15px;" ></th>
								</tr>
								<tr>
									<td class="normalHeadText">
										From Account:
									</td>
									<td>
									</td>
								</tr>
								<tr>
									<td class="normalHeadText">
										Amount:
									</td>
									<td>
									</td>
								</tr>
								<tr>
									<td class="normalHeadText">
										Cheque Number:
									</td>
									<td>
									</td>
								</tr>
								<tr>
									<td class="normalHeadText">
										Schedule Start Date:
									</td>
									<td>
										<input type="text" id="schDate"  onkeypress="isValidDatechar('')"  maxlength="10" value="<%=date%>" placeholder="dd/mm/yyyy"  />
										<input type="hidden" value="<%=date%>" id="tDate" />
										<b>
											(dd/mm/yyyy)
										</b>
									</td>
									<tr>
											<td class="normalHeadText">
												Time
											</td>
											<td class="normalHeadText" colspan="3">
												<select id="schTime_hr" value="10" >
													<%for(int i=0;i<=23;i++){
															String t=i+"";
															if(i<=9)
																t="0"+t;
														%>
														<option value="<%=t%>"><%=t%></option>
													<%}%>
												</select>
												Hrs.&emsp;&emsp;
												<select id="schTime_min" value="<%=time[1]%>" >
													<%for(int i=0;i<=59;i++){
															String t=i+"";
															if(i<=9)
																t="0"+t;
														%>
														<option value="<%=t%>"><%=t%></option>
													<%}%>
												</select>
												Mins.
											</td>
										</tr>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center;">
										<br />
										<input type="button"  class="button" onclick="return reschedule('update','<%=DateTimeFunction.getIbDateTime()%>')" value="&nbsp;&nbsp;Update&nbsp;&nbsp;"/>
										&emsp;
										<input type="button"  class="button" onclick="return reschedule('back','<%=DateTimeFunction.getIbDateTime()%>')" value="&nbsp;&nbsp;Back&nbsp;&nbsp;"/>
									</td>
								</tr>
							</table>
							</center>
						</div>
					</td>
				</tr>
			<tr>	
				<td align="center" id="table1_button">
						<input type="button" id = "authbtn" onClick="return authorizeTransaction('auth')" class="Button" value="Authorize">
						<input type="button" id = "deletebtn" onClick="return authorizeTransaction('delete')" class="Button" value="Delete">
						<input type="button" id = "cancelbtn" onClick="return bacck()" class="Button" value="Cancel">
						<input type="button" id = "cancelechkbtn" onClick="return authorizeTransaction('cancel')" value="Cancel E-cheque">
				</td>
			</tr>
		</table>
	</td>
	</tr> 
	
</table>
</html:form>
</body>
</tiles:put>
</tiles:insert >
<style>
	.detailSpan{
	font-weight:bold;
	color:blue;
	cursor:pointer;
	float:right;
}
</style>