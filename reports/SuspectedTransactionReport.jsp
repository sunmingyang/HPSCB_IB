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
		session.removeAttribute("trdata");
	}
	Date curdate=new Date();
	Calendar cal = Calendar.getInstance();    
	java.sql.Date dt=new java.sql.Date(cal.get(Calendar.YEAR)-1900,cal.get(Calendar.MONTH)-1,cal.get(Calendar.DATE));

	
	String strdate=DateTimeFunction.dateToStrFmt(curdate,"dd/mm/yyyy");
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
	
	
	document.forms[0].action="/reports/StatusLogAction.do?action=suspecttransreport";
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
 
/*function changediv()
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
    divName = "";//document.getElementById("selcri").value;
	for(var i =0; i<8;i++){
		if(divArr[i] == divName){
		//	alert("same "+divArr[i]);
			document.getElementById(divArr[i]).style.display="block";
		}else{
		//	alert("others "+divArr[i]);
		   document.getElementById(divArr[i]).style.display="none";
		}
	}
	
}*/

</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b>
</font>&nbsp;&nbsp;&nbsp;Reports ->  Suspected Transaction Log Report
</tiles:put>
<tiles:put name="menu" value="/common/left.jsp"/>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
<tiles:put name="content" type="String">

<html:form action= "/reports/StatusLogAction" >

<BODY  onLoad="javascript:makeScrollableTable('tabela','true','100px')" >

	<html:hidden property="selcri" value="suspectedtran"/>
  <table  cellpadding="0" cellspacing="0" BORDER="1" width="540" bordercolor="brown">
		<tr>
	         <td width="100%" > 
		
			 <table  >
			
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
						   <font color="#FFFFFF" nowrap> Txn. No.</font> 
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