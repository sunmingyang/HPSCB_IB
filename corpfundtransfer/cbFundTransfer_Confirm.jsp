<%@ include file='/common/Include.jsp' %>
<%@ page import="java.util.Date"%> 
<%@ page import="easycbs.bancmateib.common.DateTime.DateTimeFunction"%>
<%@ page import="easycbs.bancmateib.common.globalfunction.GeneralGlobalFunction"%>
<% String
usrName = (String)session.getAttribute("user"); 
String userInfo[][]=(String[][])session.getAttribute("userInfo"); 
String custRole=(String)session.getAttribute("custRole"); 
String transactionDetails=(String)session.getAttribute("transactionDetails");
session.removeAttribute("transactionDetails");
String  date=DateTimeFunction.getIbDateTime();
String time[]=date.split(" ")[1].split(":");
date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);

System.out.println("date:"+date+"   "+time[0]+"   "+time[1]+"  "+time[2]);

%>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Coorporate Banking Fund Transfer" />
<%if(request.getParameter("row")==null){ %>
	<tiles:put name="menu"
		value="/common/user_left.jsp?mode=apforDbtCrd&src=request" />
<%}%>
<tiles:put name="header" value="/common/header.jsp" />
	<tiles:put name="footer_jsp" value="/common/footer.jsp" />
	<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp" />
	<tiles:put name="header_marquee" value="/common/header_marquee.jsp" />
	<tiles:put name="line" value="/common/line.html" />
	<tiles:put name="menu_tab"
		value="/common/menu_tab.jsp?src=corporatebanking&mode=CBFundTr" />
	<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking" />
	<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null)
				out.print(usrName);%>!</b></font>
	</tiles:put>
	<tiles:put name="content" type="String">
		<script language=JavaScript
			src="/fundtransfer/scripts/cbFundTransfer.js">
			
		</script>


		<script type="text/javascript">
			function fill() {
				var trDetails = '<%=transactionDetails%>';
				if (trDetails != "null") {
					var res = JSON.parse(trDetails);
					var table = document.getElementById("mainTab");
					var chqNo=res.chqNo;
					var payerName=res.payerName;
					table.rows[0].cells[1].innerHTML = chqNo;
					table.rows[1].cells[1].innerHTML = 'Pending Confirmation';
					table.rows[3].cells[1].innerHTML = 'From '+payerName;
					table.rows[4].cells[1].innerHTML = 'Third-Party Transaction';
					table = document.getElementById("confirmData");
					var data = res.trDetails;
					var name="";
					for (var i = 0; i < data.length; i++) {
						var data1 = data[i];
						var row = table.insertRow(i + 1);
						var cell = row.insertCell(0);
						cell.innerHTML = res.FromAcc;

						cell = row.insertCell(1);
						cell.innerHTML = data1.name;
						cell = row.insertCell(2);
						cell.innerHTML = data1.accNo;
						cell = row.insertCell(3);
						cell.innerHTML = data1.trAmt;
						name=data1.name;
					}
					var sData=res.kid.split("|");
					var kid=sData[0].split("~");
					var kid1="";
					for(var i=0;i<kid.length-1;i++)
					{
						kid1+=kid[i];
						if(i!=kid.length-2)
							kid1+=",";
					}
					kid=sData[1];
					
					document.getElementById("confirm_kid").value=kid1+"~"+kid;
					table= document.getElementById("chequeTable1");
					table.rows[0].cells[1].innerHTML='<u><%=date%></u>';
					table.rows[2].cells[0].innerHTML='"'+res.chqNo+'"';
					document.getElementById("chequeTable2").rows[1].cells[2].innerHTML="RS. "+res.amount;
					var amt=res.amount_words.split(" ");
					document.getElementById("chequeTable2").rows[1].cells[1].innerHTML=res.amount_words;
					document.getElementById("chequeTable2").rows[2].cells[1].innerHTML=res.FromAcc;
					if(data.length==1)
						document.getElementById("chequeTable2").rows[0].cells[1].innerHTML=name;
					
					document.getElementById("chequeTable2").rows[3].cells[1].innerHTML='<br><br><br><font style="color:black"><%=usrName%></font><br><CENTER>MAKER</CENTER>';

				}
			}
		</script>
		<body onload="fill()">

			<html:form action="/request/reqchk.do">
				<br>
				<table align="left" class="wrapperDataTable" cellpadding="0"
					cellspacing="0">
					<tr>
						<td class="wrapperDataTableTR" align="center">Fund Transfer
							>> Co-orporate Banking Fund Transfer</td>
					</tr>
					<tr>
						<td align="center">
							<div style="width:100%;overflow:auto;height:380px;">
								<table style="width: 100%;" cellpadding="0" cellspacing="15">
								<tr>
									<td class="tableHeader" align="center"><u> Co-orporate
											Banking Fund Transfer </u></td>
								</tr>
								<tr>
									<td>
										<table id="mainTab" 
											style=" width: 100%">
											<tr>
												<td class="normalHeadText" style=" width: 20%">Cheque Number :</td>
												<td class="normalHeadText">&nbsp;</td>
											</tr>
											<tr>
												<td class="normalHeadText">Status :</td>
												<td class="normalHeadText">&nbsp;</td>
											</tr>
											<tr>
												<td colspan="2">
													<table id="chequeTable1" style="width:75%;height: 250px;color:#E91E63;font-weight:bolder;" align="center" cellpadding="0"
					cellspacing="0">
														<tbody>
															<tr>
																<td style="height:8%;background:rgba(202, 178, 182, 0.15);text-align:right">
																	Date :
																</td>
																<td style="color:black;width:10%;height:8%;background:rgba(202, 178, 182, 0.15);">&nbsp;</td>
															</tr>
															<tr>
																<td colspan="2" style="height: 84%;background: url(/images/chqueBack.png);">
																	<table id="chequeTable2" style="color:#E91E63;font-weight:bolder;width:100%">
																		<tr>
																			<td style="width:15%">PAY</td>
																			<td colspan="2" style="color:black;border-bottom:2px solid #E91E63;">&nbsp;</td>
																		</tr>
																		<tr>
																			<td >Rupees(In Words)</td>
																			<td style="border-bottom:2px solid #E91E63;text-align:left;color:black;">&nbsp;</td>
																			<td style="color:black;text-align:center;width:25%;border:2px solid #E91E63">&nbsp;</td>
																		</tr>
																		<tr>
																			<td style="width:5%">Account No</td>
																			<td  style="color:black;border-bottom:2px solid #E91E63; ">&nbsp;</td>
																			<td  style="width:25%;>&nbsp;">&nbsp;</td>
																		</tr>
																		<tr>
																			<td colspan="2" style="font-size:large;text-align:left;"><br />HP. State Co-operative Bank<br /></td>
																			<td  style="width:25%;"><br /><br /><br /><br />Maker</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr>
																<td colspan="2"  style="text-align:center;color:black;height:8%;background:rgba(202, 178, 182, 0.15);">&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td class="normalHeadText" style=" width: 20%">Counterfoil Description:</td>
												<td class="normalHeadText">&nbsp;</td>
											</tr>
											<tr>
												<td class="normalHeadText" style=" width: 20%">Transaction Type:</td>
												<td class="normalHeadText">&nbsp;</td>
											</tr>
											<tr>
												<td colspan="2" class="normalHeadText"><br /><br /><span onclick="showTransactionDetails()" class="detailSpan">Credit and Debit Account Details</td>
											</tr>
											<tr>
												<td colspan="2">
													<div id="confirmDiv" style="overflow:auto;height:80px;display:none;"><table id="confirmData" align="center" border="1"
														style="text-align: center; width: 100%">
														<tr>
															<th class="headerTD">From Account</th>
															<th class="headerTD">Benificiary Name</th>
															<th class="headerTD">Beneficiary Account Number</th>
															<th class="headerTD" style="width: 15%;">Amount to
																be Transfered</th>
														</tr>
														</table></div>
															</td>
															</tr>
														</table>
														</td>
														</tr>
														<tr>
															<td align="center"><input type="button"
																onClick="return confirmTransaction()" class="Button"
																value="Confirm"> <input type="button"
																onClick="return back()" class="Button" value="Cancel">
																<input type="hidden" id="confirm_kid" /></td>
														</tr>
													</table>
													</div>
												</td>
											</tr>
										</table> 
								</html:form>
		</body>
	</tiles:put>

</tiles:insert>

<style>
.oper_button {
	background: #698ed1;
	color: white;
	font-family: monospace;
	font-weight: bold;
	border-radius: 8px;
	border: 1px solid blue;
	cursor: pointer;
}

.headerTD {
	background: #698ed1;
	font-family: serif;
	font-size: 12px;
	color: white;
}
.detailSpan{
	font-weight:bold;
	color:blue;
	cursor:pointer;
}
</style>