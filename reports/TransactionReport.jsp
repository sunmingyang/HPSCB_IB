<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.util.Date,java.util.Calendar" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%
String AdminName=(String)session.getAttribute("AdminName");
%>

<%
	String trdata[][]=null;
	String flag=null;
	if(session.getAttribute("trdata")!=null)
	{
		trdata=(String[][])session.getAttribute("trdata");
	}
	Date curdate=new Date();
	Calendar cal = Calendar.getInstance();    
	java.sql.Date dt=new java.sql.Date(cal.get(Calendar.YEAR)-1900,cal.get(Calendar.MONTH)-1,cal.get(Calendar.DATE));

	
	String strdate=DateTimeFunction.dateToStrFmt(curdate,"mm/dd/yyyy");
	System.out.println("date is ---------------------"+strdate);

%>
<script>
function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=TranRept","child", bar);
}
function changeDate(g_dte)
{
	var d1_year =g_dte.substring(0,4);
	var d1_month= g_dte.substring(5,7);
	var d1_day = g_dte.substring(8,10);
	var d1_devide = d1_month + "/" + d1_day + "/" + d1_year;
	gCompDate = d1_devide;
	var dd = parseInt(parseFloat(d1_day));
	dd++;
	var dd1;
	if(dd < 10)
	dd1 = "0" + dd;
	else
	dd1 = dd;
	var d1_devide = d1_month + "/" + dd + "/" + d1_year;
	return (d1_devide);
}

function changeStrToDate(g_dte)
{
	var slindex=g_dte.indexOf("/");
	if(slindex==2)
	{	
		var d1_day = g_dte.substring(0,2);
		slindex=g_dte.indexOf("/",slindex+1);
		if(slindex==5)
		{
			var d1_month = g_dte.substring(3,5);
			var d1_year = g_dte.substring(6,10);
		}else
		{
			var d1_month = g_dte.substring(3,4);
			var d1_year = g_dte.substring(5,9);
		}
	}
	else if(slindex==1)
	{
		var d1_day = g_dte.substring(0,1);
		slindex=g_dte.indexOf("/",slindex+1);
		if(slindex==4)
		{
			var d1_month = g_dte.substring(2,4);
			var d1_year = g_dte.substring(5,9);
		}
		else
		{
			var d1_month = g_dte.substring(2,3);
			var d1_year = g_dte.substring(4,8);
		}
	}
	var sqlDate = new Date();
	sqlDate.setMonth(d1_month - 1);
	sqlDate.setYear(d1_year);
	sqlDate.setDate(d1_day);
	
	return (sqlDate);
}

function showhide(di)
{
		var divs = di;
		if(divs == "IBtodate")
		{
			var sty = cal_todate_display.style.display;
			if(sty == "none"){

				cal_fromdate_display.style.display = "none";
				cal_fromdate_display_year.style.display = "none";

				cal_todate_display.style.display = "block";
				cal_todate_display_year.style.display = "block";
				
				
			}
			else
				{
				cal_todate_display.style.display = "none";
				cal_todate_display_year.style.display = "none";
				cal_fromdate_display.style.display = "none";
				cal_fromdate_display_year.style.display = "none";
	
			}
		}
		else if(divs == "IBfromdate")
		{
			var sty = cal_fromdate_display.style.display;
			if(sty == "none")
				{
				cal_fromdate_display.style.display = "block";
				cal_fromdate_display_year.style.display = "block";
				cal_todate_display.style.display = "none";
				cal_todate_display_year.style.display = "none";
				}
			else
				{
				cal_todate_display.style.display = "none";
				cal_todate_display_year.style.display = "none";
				cal_fromdate_display.style.display = "none";
				cal_fromdate_display_year.style.display = "none";
				}
		}

}


function changeDateFormat(ddate)
{
	var year=ddate.substring(6,10);
	var month=ddate.substring(3,5);
	var day=ddate.substring(0,2);
	comdate=day+"/"+month+"/"+year;
	return comdate;
}

function detailInfo()
{
	if(document.getElementById("selcri").value=="date")
	{
	var curdate=changeDateFormat('<%=strdate%>');
	var frdate=document.getElementById("fromdate").value;
	var todate=document.getElementById("todate").value;
	if(todate!="")
	{
		if(frdate!="")
		{
			if(todate!=frdate)
			{
				if(dateCompare("todate",frdate)==false)
				{
					//document.getElementById("todate").value="";
					alert("To Date should Greater Than From Date");
					return false;
				}
			}
		}
		if(dateCompare("todate",curdate))
		{
			//document.getElementById("todate").value="";
			alert("To Date should not Greated than Current Date");
			return false;
		}
	}
	}
	else if(document.getElementById("selcri").value=="branch")
	{
		if(document.getElementById("srbranch").value=="")
		{
			alert("Please Specify the From Branch Code");
			document.getElementById("srbranch").focus();
			return false;
		}
		if(document.getElementById("trbranch").value=="")
		{
			alert("Please Specify the To Branch Code");
			document.getElementById("trbranch").focus();
			return false;
		}
	}
	else if(document.getElementById("selcri").value=="amount")
	{
		var stamount=parseFloat(document.getElementById("startamount").value);
		var endamount=parseFloat(document.getElementById("endamount").value);
		if(document.getElementById("startamount").value=="")
		{
			alert("Please Specify the Strating Amount");
			document.getElementById("srartamount").focus();
			return false;
		}
		if(document.getElementById("endamount").value=="")
		{
			alert("Please Specify the end amount");
			document.getElementById("endamount").focus();
			return false;
		}
		if(stamount>endamount)
		{
			alert("Starting Amount must Less Than Ending Amount");
			return false;
		}
	}
	

	document.forms[0].action="/reports/StatusLogAction.do?action=transactionreport";
	document.forms[0].submit();
}
function printpage()
{
	window.print();
}
function backpage()
{
	document.forms[0].action="<%=request.getContextPath()%>/navigate.do?action=executeOpen&src=userTransactionlog&dest=back";
	document.forms[0].submit();

}
 
function changediv()
{
	var divArr = new Array(8);
	var divname ="";
    divArr[0] ="accno";
    divArr[1] ="branch";
	divArr[2] ="amount";
	divArr[3] ="trntype";
	divArr[4] ="trnstatus";
	divArr[5] ="trnmode";
	divArr[6]="abbib";
	divArr[7]="acttype";
    divName = document.getElementById("selcri").value;
	for(var i =0; i<8;i++){
		if(divArr[i] == divName){
		//	alert("same "+divArr[i]);
			document.getElementById(divArr[i]).style.display="block";
		}else{
		//	alert("others "+divArr[i]);
		   document.getElementById(divArr[i]).style.display="none";
		}
	}
	
}

</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b>
</font>&nbsp;&nbsp;&nbsp;Reports ->  Transaction Log Report
</tiles:put>
<tiles:put name="menu" value="/common/left.jsp"/>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
<tiles:put name="content" type="String">

<html:form action= "/reports/StatusLogAction" >

<BODY  onLoad="javascript:makeScrollableTable('tabela','true','100px'),changediv()" >


  <table  cellpadding="0" cellspacing="0" BORDER="1" width="540" bordercolor="brown">
		<tr>
	         <td width="100%" > 
		




			 <table  >
				<tr>
			       <td width="100%" > 
			
					 <table align="center" border ="0" width="100%">
						<tr>
							<td  width="150" nowrap>
								Selection Criterian
							</td>
							<td align="left">
								<html:select property="selcri" onchange="changediv()">
								 <html:option value="accno">account Number</html:option>
								 <html:option value="branch">Branch Code Wise</html:option>
								 <html:option value="acttype">Account Type</html:option>
								 <html:option value="amount">Amount Wise</html:option>
								 <html:option value="trntype">Transaction Type</html:option>
								 <html:option value="trnmode">Transaction Mode</html:option>	
								 <html:option value="trnstatus">Transaction Status</html:option>	
								 <html:option value="abbib">ABB/IB</html:option> 
							</html:select>
							</td>
							<td>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
			<td>
			<div id="accno" style="display:none;">
			<table>
				<tr>
					<td>
						account No:
					</td>
					<td>
						<html:text styleId="accountno"  property="accountno" size="15" onkeypress="isValidAmount(event,accountno)" maxlength="10" style="text-align:right;"/>
					</td>
				</tr>
			</table>
			</div>
			</td>
			</tr>

			<tr>
			<td>
			<div id="Branch" style="display:none;">
			<table>
				<tr>
					<td>
						Source Branch: 
					</td>
					<td>
						<html:text styleId="srbranch" property="srbranch" size="15" onkeypress="isValidNumber()" maxlength="10" style="text-align:right;"/>
					</td>
					<td>
						Target Branch:
					</td>
					<td>
						<html:text styleId="trbranch"  property="trbranch" size="15" onkeypress="isValidNumber()" maxlength="10" style="text-align:right;"/>
					</td>
				</tr>
			</table>
			</div>
			<div id="acttype" style="display:none;">
			<table>
				<tr>
					<td>
						Source Account Type: 
					</td>
					<td>
						<html:text styleId="sracttype" property="sracttype" size="15" onkeypress="isValidNumber()" maxlength="5" style="text-align:right;"/>
					</td>
					<td>
						Target Account Type:
					</td>
					<td>
						<html:text styleId="tracttype"  property="tracttype" size="15" onkeypress="isValidNumber()" maxlength="5" style="text-align:right;"/>
					</td>
				</tr>
			</table>
			</div>

			<div id="Amount" style="display:none;">
			<table>
				<tr>
					<td>
						Starting Amount: 
					</td>
					<td>
						<html:text styleId="startAmount" property="startAmount" size="15" onkeypress="isValidAmount(event,startAmount)" maxlength="10" style="text-align:right;"/>
					</td>
					<td>
						Ending Amount:
					</td>
					<td>
						<html:text styleId="endAmount"  property="endAmount" size="15" onkeypress="isValidAmount(event,endAmount)" maxlength="10" style="text-align:right;"/>
					</td>
				</tr>
			</table>
			</div>
			<div id="trntype" style="display:none;">
			<table>
				<tr>
					<td>
						Transaction Type: 
					</td>
					<td>
						<html:select styleId="trntype" property="trntype" >
							<html:option value="Cr">Cr</html:option>
							<html:option value="Dr">Dr</html:option>
						</html:select>
					</td>
					
				</tr>
			</table>
			</div>
			<div id="trnMode" style="display:none;">
			<table>
				<tr>
					<td>
						Transaction mode: 
					</td>
					<td>
						<html:select styleId="trnMode" property="trnMode" >
							<html:option value="Cash">Cash</html:option>
							<html:option value="Transfer">Transfer</html:option>
						</html:select>
					</td>
					
				</tr>
			</table>
			</div>
			<div id="trnstatus" style="display:none;">
			<table>
				<tr>
					<td>
						Transaction Status: 
					</td>
					<td>
						<html:select styleId="trnstatus" property="trnstatus"  >
						<html:option value="RRMB">RRMB</html:option>
						<html:option value="RSSB">RSSB</html:option>
						<html:option value="RRSB">RRSB</html:option>
						<html:option value="RSTB">RSTB</html:option>
						<html:option value="RRTB">RRTB</html:option>
						<html:option value="RSMB">RSMB</html:option>
						<html:option value="TRNFSB">TRNFSB</html:option>
						<html:option value="TRNFTB">TRNFTB</html:option>
						<html:option value="TRNFCS">TRNFCS</html:option>
						</html:select>
					</td>
					
				</tr>
			</table>
			</div>
			<div id="abbib" style="display:none;">
			<table>
				<tr>
					<td>
						 Transaction Environment: 
					</td>
					<td>
						<html:select styleId="abbib" property="abbib"  >
						<html:option value="ABB">ABB</html:option>
						<html:option value="ib">IB</html:option>
						</html:select>
					</td>
					
				</tr>
			</table>
			</div>
			
			</td>
			</tr>
			<tr>
				<td>
					
					<table>
						<tr>
							<td>
								From Date : 
							</td>
							<td>
							<html:text styleId="fromdate" property="fromdate" size="15"  maxlength="10" readonly="true"/>
								<input	align ="left" type="button" tabIndex ='4' name="btnfromdate" id="btnfromdate" 
							value=" " OnClick="showhide('IBfromdate')" 					style="background-image:url('/images/Calendar.gif');width:20px;height:18px"/> 

						   <div	id="cal_fromdate_display_year" style="display:none;position:absolute;top:250px;left:308px;"> 
							<input	type="text" class="fancy" id="fromdate_year"  value="" maxLength="4" size="5" tabIndex ='4' style="background-color:#CCCCEE;"/>
					   </div>	
					   <div id="cal_fromdate_display" style="display:none;position:absolute;top:262px;left:350px;"> 
						
					   <script type="text/javascript">	
					   var d = new Date(); //dd/mm/yyyy

					   <%
							if(dt!=null){
								String str = dt.toString();
								String dd = str.substring(8);
								//	dd="5";
								String mm = str.substring(5,7);						
								//	mm="6";
								String yyyy = str.substring(0,4);
								//	yyyy="2005";				
						%>
								d.setMonth(<%=mm%>-1); //0-11				         
								d.setDate(<%=dd%>);
								d.setYear(<%=yyyy%>);
						<%
							}
						%>
						if(document.getElementById("fromdate").value != ""){
							d = changeStrToDate(document.getElementById("fromdate").value);
						}
						IBfromdate = new Calendar ("IBfromdate", "fromdate",d);
						renderCalendar(IBfromdate);

					 </script>
				   </div>&nbsp;&nbsp;&nbsp; 

							</td>
							<td>
								To Date :
							</td>
							<td>
								<html:text styleId="todate"  property="todate" size="15" readonly="true" maxlength="10"/>
										<input	align ="left" type="button" tabIndex ='4' name="btntodate" id="btntodate" 
							value=" " OnClick="showhide('IBtodate')" 					style="background-image:url('/images/Calendar.gif');width:20px;height:18px"/> 

						   <div	id="cal_todate_display_year" style="display:none;position:absolute;top:250px;left:308px;"> 
							<input	type="text" class="fancy" id="todate_year"  value="" maxLength="4" size="5" tabIndex ='4' style="background-color:#CCCCEE;"/>
					   </div>	
					   <div id="cal_todate_display" style="display:none;position:absolute;top:262px;left:350px;"> 
						
					   <script type="text/javascript">	
					   var d = new Date(); //dd/mm/yyyy

					   <%
							if(dt!=null){
								String str = dt.toString();
								String dd = str.substring(8);
								//	dd="5";
								String mm = str.substring(5,7);						
								//	mm="6";
								String yyyy = str.substring(0,4);
								//	yyyy="2005";				
						%>
								d.setMonth(<%=mm%>-1); //0-11				         
								d.setDate(<%=dd%>);
								d.setYear(<%=yyyy%>);
						<%
							}
						%>
						if(document.getElementById("todate").value != ""){
							d = changeStrToDate(document.getElementById("todate").value);
						}
						IBtodate = new Calendar ("IBtodate", "todate",d);
						renderCalendar(IBtodate);

					 </script>
				   </div>&nbsp;&nbsp;&nbsp; 

					</td>
				</tr>
			</table>
			</td>
			</tr>
			
			<tr>
				<td colspan="4" align="center">				 
						 <input type="button" name="Detail" value="Detail" onclick="detailInfo()" class="button"/>
				</td>
			</tr>




			<tr>
					<td colspan="4">
					<%
					if(trdata!=null){
						for(int i=0;i<trdata.length;i++){
							if(i==0){
					%>
				<br>
			<table border="1" align="center" width="300" cellpadding="-1" cellspacing="-1" id="tabela" bordercolor="a52a2a" >
			    <thead>
					 <TR bgcolor="brown"> 
						  <TH>
						  <font color="#FFFFFF" nowrap> <bean:message bundle="hindi" key= "2010"/></font> 
						  </TH>
  					      <TH>
						  <font color="#FFFFFF" nowrap>From Branch</font>  
						  </TH>
						  <TH>
						  <font color="#FFFFFF" nowrap>From Account</font> 
						  </TH>
  					      <TH>
						  <font color="#FFFFFF" nowrap>To Branch </font> 
						  </TH>
            			  <TH>
						   <font color="#FFFFFF" nowrap>To Account</font> 
						  </TH>
						  <TH>
						   <font color="#FFFFFF" nowrap>Transaction Date</font> 
						  </TH>
						  <TH>
						   <font color="#FFFFFF" nowrap>Amount</font> 
						  </TH>
						  <TH>
						   <font color="#FFFFFF" nowrap>Transaction Type</font> 
						  </TH>
 						  <TH>
						   <font color="#FFFFFF"  nowrap>Transaction Mode</font> 
						  </TH>

						  <TH>
						   <font color="#FFFFFF" nowrap> User Id</font> 
						  </TH>
						  <TH>
						   <font color="#FFFFFF" nowrap>Doc. Type</font> 
						  </TH>
  						  <TH>
						   <font color="#FFFFFF" nowrap>Doc. Series</font> 
						  </TH>
						  <TH>
						   <font color="#FFFFFF" nowrap>Doc. No.</font> 
						  </TH>
					</tr>
				</thead>
			<%}%>	
				<tbody >
					<tr <%out.println(i%2==0?"class=trforReportRow1":"class=trforReportRow2");%>>
						<td  align="center" nowrap><%=i+1%></td>
						<td  align="center" nowrap><%=trdata[i][0]%></td>
						<td  align="center" nowrap><%=trdata[i][1]%></td>
						<td  align="center" nowrap><%=trdata[i][2]%></td>
						<td  align="center" nowrap><%=trdata[i][3]%></td>
						<td  align="center" nowrap><%=trdata[i][4]%></td>
						<td  align="center" nowrap><%=trdata[i][5]%></td>
						<td  align="center" nowrap><%=trdata[i][6]%></td>
						<td  align="center" nowrap><%=trdata[i][7]%></td>
						<td  align="center" nowrap><%=trdata[i][8]%></td>
						<td  align="center" nowrap><%=trdata[i][9]%></td>
						<td  align="center" nowrap><%=trdata[i][10]%></td>
						<td  align="center" nowrap><%=trdata[i][11]%></td>
						</tr>
						<% if(i==trdata.length-1){%>
						</table>		
					<%	}
					}
					} %>

				<table border="0" width="100%">
				<tr>
					<td align="left" width="250">
						<input type="button" name="back"  value="Back To Menu" onclick="backpage()" class="button"/>
						
		<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " class="Button" type="button" 	onclick="helpopen()"/>
	
					</td>
					<td align="left">
					<%if(trdata!=null){%>
					<input type="button" name="Print1" onclick="printpage()" value="Print"   class="button">
					<%}%>
					</td>
					<td>&nbsp;
					</td>
				</tr>	
				</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<div id="diverrmessage">
						<font color="Red">
							<logic:messagesPresent property="NoRecord">
								No Information Exist for given Criteria
							</logic:messagesPresent>
							<logic:messagesPresent property="invalidSrBrn">
								Source Branch is Invalid
							</logic:messagesPresent>
							<logic:messagesPresent property="invalidTrBrn">
								Target Branch is Invalid
							</logic:messagesPresent>
						</font>
						</div>
					</td>
					</tr>
				</table>
			 </td>
		 </tr>
</table>	
</body>
</html:form>
</tiles:put>
</tiles:insert>