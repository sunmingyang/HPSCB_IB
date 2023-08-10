<%@ include file='/common/Include.jsp' %>
<%@ page import="java.util.Date"%>
<%@ page import="easycbs.bancmateib.common.DateTime.DateTimeFunction"%>
<%String usrName = (String)session.getAttribute("user");
String userInfo[][]=(String[][])session.getAttribute("userInfo"); 
String accList=(String)session.getAttribute("allAccountlist");
if(accList==null)
	accList="";
String accNoList[]=accList.split(",");

String  date=DateTimeFunction.getIbDateTime();
String time[]=date.split(" ")[1].split(":");
date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);

System.out.println("date:"+date+"   "+time[0]+"   "+time[1]+"  "+time[2]);
String[][] beneAccList=(String[][])session.getAttribute("beneficiaryAccount");
String custRole=(String)session.getAttribute("custRole");						
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
<script language=JavaScript src="/fundtransfer/scripts/cbFundTransfer.js"> </script>


<script type="text/javascript">
	
	function saveDetail(){
		//debugger;
		var custRole="<%=custRole%>";
		if(parseInt(document.getElementById("balance").value)!=0){
   			alert("Transfer amount is remaining");
   			return false;
		}
		if(document.getElementById("beneAmtDiv").style.display=="block"){
			var c=confirm("Do you want to add this beneficiary");
			if(c){
				addBeneAmt();
			}
		}
		
		var debAccNo=document.getElementById("sAccList").value;
		var scDate=document.getElementById("schDate").value;
		var scTime_hr=parseInt(document.getElementById("schTime_hr").value);
		var scTime_min=parseInt(document.getElementById("schTime_min").value);
		//var scTime_sec=parseInt(document.getElementById("schTime_sec").value);
		var debAmt=document.getElementById("totalAmt").value;
		var remarks=document.getElementById("remarks").value;
		var payType=document.getElementById("paymentType").value;
		var periodicity1=document.getElementById("periodicity").value;
		
		var table=document.getElementById("beneAmtTable");
        var date="<%=DateTimeFunction.getIbDateTime()%>";
		var time=date.split(" ")[1].split(":");
		var isSch=document.getElementById("isSchedule").value;
		if(debAccNo=="-1"){
			alert("Select account number first");
			document.getElementById("sAccList").focus();
			return false;
		}
		if(debAmt=="" || debAmt=="0.00"){
			alert("Total amount cann't be blank or zero");
			document.getElementById("totalAmt").focus();
			return false;
		}
		if(isSch=="Y"){
			if(isValidDateFormat("schDate")==false)
			{
				alert("Enter valid Schedule date");
				document.getElementById("schDate").value="";
				document.getElementById("schDate").focus();
				return false;
			}
			else if(dateComparision("tDate","schDate") || document.getElementById("tDate").value==scDate)
			{
				alert("Schedule date must be greater than today's date");
				document.getElementById("schDate").value="";
				document.getElementById("schDate").focus();
				return false;
			}else if(dateComparision("tDate","schDate") && (scTime_hr<parseInt(time[0]) || scTime_hr==parseInt(time[0])) && scTime_min<parseInt(time[1])){
				alert("Schedule time must be greater than current time");
				return false;
			}
		}
		if(payType=="R" && periodicity1=="-1"){
			alert("Select periodicity");
			document.getElementById("periodicity").focus();
			return false;
		}
		if(table.style.display=="none"){
			alert("Please select beneficiary account first");
			return false;
		}
		var actAmt=0.00;
		var rowCount=table.rows.length;
		var str="[";
		for(var i=1;i<rowCount;i++){
			var name=table.rows[i].cells[0].innerHTML;
			var amt=table.rows[i].cells[2].childNodes[0].value;
			var data=table.rows[i].cells[1].childNodes;
			var accNo=data[0].value;
			var ifsc=data[2].value;
			var accType=data[4].value;
			var mobile=data[6].value;
			var bankType=data[8].value;
			str+='{"name":"'+name+'","accNo":"'+accNo+'","ifsc":"'+ifsc+'","accType":"'+accType+'","benemobile":"'+mobile+'","trAmt":"'+amt+'","bankType":"'+bankType+'"}';
			if(i!=rowCount-1)
				str+=",";
			actAmt+=parseFloat(amt);
		}
		str+="]";
		//alert("str="+str);
		var d=scDate.substring(3,5)+"/"+scDate.substring(0,2)+"/"+scDate.substring(6,10);
	//	var scTime=scTime_hr+":"+scTime_min+":"+scTime_sec;
		var scTime=scTime_hr+":"+scTime_min;
		if(periodicity1=="-1")
			periodicity1="";
		var url="/TransactionAction.do?action=thirdPartyFundTransfer&sessionID=<%=session.getId()%>&accNo="+debAccNo+"&transferAmt="+debAmt+"&purpose=BulkTrn&Remark="+remarks+"&tranferJson="+str+"&actualAmount="+actAmt+"&schDate="+d+"&schTime="+scTime+"&isSch="+isSch+"&paymentType="+payType+"&periodicity="+periodicity1;
		
		http.open("POST",url,false);
		http.onreadystatechange= function (){ showMessage(str,debAccNo);};
	   	http.send(null);
				
	}
	function fill(){
		document.getElementById("schTime_hr").value="<%=time[0]%>";
		document.getElementById("schTime_min").value="<%=time[1]%>";
	//	document.getElementById("schTime_sec").value="<%=time[2]%>";
		document.getElementById("isSchedule").value="N";
	}
</script>
<body onload="fill()">

<html:form action="/request/reqchk.do" ><br>
<table align="left"  class="wrapperDataTable" cellpadding="0" cellspacing="0" >
	<tr>
		<td class="wrapperDataTableTR" align="center">Fund Transfer >> Co-orporate Banking Fund Transfer</td>
	</tr>
	<tr >
		<td align="center" >
			<div style="width:100%;overflow:auto;height:380px;">
			<table id="mainTab" style="width:100%;" cellpadding="0" cellspacing="15" >
				<tr>
					<td class = "tableHeader" align="center"><u> 
						Co-orporate Banking Fund Transfer </u> 
					</td>
				</tr>
				<% if(beneAccList==null){%>
			    <tr>
			     <td align="center" style="font-weigh:bolder;font-size:large;color:red;">
			      No Payee added
			     </td>
			    </tr>
			    <%}else{%>
				<tr>
					<td>
						<table  style="width:100%;" >
							<tr>
								<td  class="normalHeadText" style="width:25%" >
									From Account Number:&nbsp;&nbsp;&nbsp;
								</td>
								<td style="width:25%">
									<select id="sAccList" name="sAccList" style="width:140px;" onchange="getAvailableBal()">
										<option value='-1'>--SELECT--</option>
									<%
										String accNo = "";
										if(accNoList!=null){
										for(int i=0; i<accNoList.length; i++)
										{
											accNo = accNoList[i];%>
										<option value='<%=accNo%>'><%=accNo%></option>
										<%}}%>
									</select>
								</td>
								<td class="normalHeadText"  style="width:25%" >
									Total Amount : 
								</td>
								<td style="width:25%">
									<input type="text" id="totalAmt" value="0.00" onkeypress="alphaAmount(document.getElementById('totalAmt'));" maxlength="20" onfocus="focusAmount('totalAmt')" onblur="calBalance();" />
								</td>
							</tr>
							<tr>
								<td class="normalHeadText" >
									Remarks :
								</td>
								<td>
									<input type="text" id="remarks"  onkeypress="" maxlength="20"/>
									
								</td>
								<td class="normalHeadText">
									Balance :
								</td>
								<td>
									<input type="text" id="balance"    readonly />
						
								</td>
							<tr>
							<tr>
								<td class="normalHeadText" >
									Available Balance :
								</td>
								<td>
									<input type="text" id="aval_bal"  onkeypress=""  readonly/>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="normalHeadText" >
									Schedule e-Pay :
								</td>
								<td>
									<select id="isSchedule" value="N" onchange="showScheduleDiv()">
										<option value="Y">Yes</option>
										<option value="N">No</option>
									</select>
								</td>
								<td></td>
								<td></td>
							</tr>

							<tr>
								<td colspan="4">
									<table id="schTable" style="width:100%;display:none;">
										<tr>
											<td class="normalHeadText">
												Schedule Start Date:
											</td>
											<td colspan="3">
												<input type="text" id="schDate"  onkeypress="isValidDatechar('')"  maxlength="10" placeholder="dd/mm/yyyy" value="<%=date%>" />
												<input type="hidden" value="<%=date%>" id="tDate" />
												<b>
													(dd/mm/yyyy)
												</b>
											</td>
										</tr>
										<tr>
											<td>
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
												Mins.&emsp;&emsp;
												<!-- <select id="schTime_sec" value="<%=time[2]%>">
													<%for(int i=0;i<=59;i++){
															String t=i+"";
															if(i<=9)
																t="0"+t;
														%>
														<option value="<%=t%>"><%=t%></option>
													<%}%>
												</select>
												Seconds&emsp; -->
											</td>
										</tr>
										<tr>
											<td>
											</td>
											<td align="left"><font color="red" style="font-weight: normal;font-family: cursive;">
												(Trsnsaction will be processed after selected date and time)</font>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr id="paymentDiv" style="display:none;">
								<td class="normalHeadText" >
									Payment Type :
								</td>
								<td>
									<select id="paymentType"  onchange="showPeriodicityDiv()">
										<option value="O">One Time</option>
										<option value="R">Recurring</option>
										
									</select>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr  id="periodicityDiv" style="display:none;">
								<td class="normalHeadText" >
									Periodicity :
								</td>
								<td>
									<select id="periodicity" >
										<option value="-1">--Select Prediocity--</option>
										<option value="D">Daily</option>
										<option value="W">Weekly</option>
										<option value="F">FortNight</option>
										<option value="M">Monthly</option>
										<option value="B">Bi-Monthly</option>
										<option value="Q">Quaterly</option>
										<option value="H">Half-Yearly</option>
										<option value="Y">Yearly</option>
									</select>
								</td>
								<td></td>
								<td></td>
							</tr>
						</table>
				</td>
			</tr>
			<tr>
				<td style="height:20px;" class="normalHeadText">
					Select Beneficiary Account:
					<div style="height:125px;overflow:auto">
					<table id="beneAccTable" border="1" align="center" style="text-align:center;width:100%;">
						<% if(beneAccList!=null)
						   {%>
								<tr>
									<th class="headerTD" style="width:2%;"></th>
									<th class="headerTD" >Benificiary Name</th>
									<th class="headerTD" >Beneficiary Account Number</th>
									
								</tr>
								<%
									for (int i=0;i<beneAccList.length;i++){%>
									<tr>
										<td style="text-align:center;"><input type="checkBox" id="chk_<%=i%>" onchange="enableAmount('<%=i%>')"/></td>
										<td style="text-align:center;"><%=beneAccList[i][5]%></td>
										<td style="text-align:center;"><input type="text" value="<%=beneAccList[i][2]%>" style="text-align:center;height:100%;width:100%;border:none" readonly/>
											<input type="hidden" id="ifsc_<%=i%>" value="<%=beneAccList[i][3]%>">
											<input type="hidden" id="accType_<%=i%>" value="<%=beneAccList[i][6]%>">
											<input type="hidden" id="mobile_<%=i%>" value="<%=beneAccList[i][1]%>">
											<input type="hidden" id="bank_<%=i%>" value="<%=beneAccList[i][4]%>">
											
										</td>
										
									</tr>
									
								<%}
								
							}%>
							<input type="hidden" id="select_bene" value="-1" />
							<input type="hidden" id="select_bene_list" value="" />
						</table>
						</div>
				</td>
			</tr>
				<tr>
				<td style="text-align:center;">
					<div id="beneAmtDiv" style="display:none;text-align:center">
						Amount:&nbsp;&nbsp;&nbsp;
						<input type="text" id="amount" value="0.00" onkeypress="alphaAmount(document.getElementById('amount'));" maxlength="20" onfocus="focusAmount('amount')"  onchange="calculateBalance()" />
						<!-- <br />
						<br />
						Balance:&nbsp;&nbsp;
						 -->
					</div>
				</td>
			</tr>
				<tr>
				<td>
					<div id="div1" style="display:none;" class="normalHeadText">
						Selected Beneficiary Account:
						<div id="beneAmtTable_Div" style="display:none;height:100px;overflow:auto">
							<table id="beneAmtTable" border="1" style="display:none;text-align:center;width:95%;">
									<tr>
											<!-- <th class="headerTD" style=" background: #698ed1;width:2%;"></th> -->
											<th class="headerTD" >Benificiary Name</th>
											<th class="headerTD" >Beneficiary Account Number</th>
											<th class="headerTD" style="width:15%;">Amount to be Transfered</th>
											<th class="headerTD" style="width:15%;">&nbsp;&nbsp;</th>
									</tr>
									
							</table>
						</div>
					</div>
				</td>
			<tr>
		
			<tr>	
				<td align="center">
						<input type="button" onClick="return addBeneAmt()" class="Button" value="More">
						<input type="button" onClick="return saveDetail()" class="Button" value="<bean:message bundle='<%=lang%>' key='7119'/>">
						<input type="button" onClick="return back()" class="Button" value="Cancel">
				</td>
			</tr>
		<%}%>
		</table>
		
		</div>
	</td>
	</tr>
	
</table>
</html:form>
</body>
</tiles:put>

</tiles:insert >

<style>
.oper_button{
    background: #698ed1;
    color: white;
    font-family: monospace;
    font-weight: bold;
    border-radius: 8px;
    border: 1px solid blue;
	cursor:pointer;
}
.headerTD{
	 background: #698ed1;
	 font-family: serif;
	 font-size:12px;
	 color:white;
}
</style>