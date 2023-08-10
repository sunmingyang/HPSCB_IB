<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%
String AdminName=(String)session.getAttribute("AdminName");
%>
<%
	String userlist[][]=null;
	String flag=null;
	if(session.getAttribute("userinfo")!=null)
	{
		userlist=(String[][])session.getAttribute("userinfo");
	}
	java.sql.Date dt=new java.sql.Date(106,11,22);
	Date curdate=new Date();
	String strdate=DateTimeFunction.dateToStrFmt(curdate,"dd/mm/yyyy");
	System.out.println("datei is "+strdate);
%>
<script>
function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=StatusChg","child", bar);
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
	if(frdate!=""){
		if(todate=="")
		{
		alert("fill Todate also")
		return false;
		}
	}
	if(frdate=="") {
		if(todate!="")
		{
		alert("Fill From date also")
		return false;
		}
	}
/*	if(todate!="")
	{
		if(isValidDateFormat("todate")==false)
		{
			alert("Invalid Todate");
			document.getElementById("todate").value="";
			document.getElementById("todate").focus();
			return false;
		}
	}
	if(frdate!="")
	{
		if(isValidDateFormat("frdate")==false)
		{
			alert("Invalid Fromdate");
			document.getElementById("frdate").value="";
			document.getElementById("frdate").focus();
			return false;
		}
	}
	*/
	if(todate!="")
	{
		if(frdate!="")
		{
			if(todate!=frdate)
			{
				//if(dateCompare("todate",frdate)==false)
			//	{
					//document.getElementById("todate").value="";
			//		alert("To Date should Greater Than From Date");
			//		return false;
		//		}
			}
		}
	//	if(dateCompare("todate",curdate))
	//	{
			//document.getElementById("todate").value="";
	//		alert("To Date should not Greated than Current Date");
	//	return false;
	//	}
	}
	 
	document.forms[0].action="/reports/StatusLogAction.do?action=statusreport";
	document.forms[0].submit();
}
function printpage()
{
	window.print();
}
function backpage()
{
document.forms[0].action="<%=request.getContextPath()%>/navigate.do?action=executeOpen&src=userStatuslog&dest=back";
		document.forms[0].submit();

}

</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>
</tiles:put>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=reports"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=StatusLogReport&src=reports"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>

<tiles:put name="content" type="String">

<html:form action= "/reports/StatusLogAction" >

<BODY  >
<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > Reports  >>  User Status Change Report </td>
	</tr>
	<tr>
		<td align="center">

  <table  cellpadding="0" cellspacing="0" class="miniStmtBackBorder" width="90%" >
		<tr class="miniStmtBack">
	         <td width="100%" > 

			 <table align="center" border ="0" width="100%">
				<tr>
					<td  nowrap class="normalText">
						User ID
					</td>
					<td >
						:&nbsp;<html:text property="userid" maxlength="15"/>
					</td>
			 	
					<td class="normalText">
						Admin ID
					</td>
					<td >
						:&nbsp;<html:text property="adminid" maxlength="15"/>
					</td>
				</tr>
				<tr>
					<td class="normalText">
						From Date
					</td>
					
					<td>
						:&nbsp;<html:bmdate styleId="fromdate" property="fromdate" size="15" onkeypress="isValidDatechar()" maxlength="10"/>	
						
						<input	align ="left" type="button" tabIndex ='4' style="display:none;" name="btnfromdate" id="btnfromdate" 
							value=" " OnClick="showhide('IBfromdate')" 					style="background-image:url('/images/Calendar.gif');width:20px;height:18px;display:none;"/> 

						<!--    <div	id="cal_fromdate_display_year" style="display:none;position:absolute;top:160px;left:485px;"> 
							<input	type="text" class="fancy" id="fromdate_year"  value="" maxLength="4" size="5" tabIndex ='4' style="background-color:#CCCCEE;"/>
					   </div>	
					   <div id="cal_fromdate_display" style="display:none;position:absolute;top:160px;left:520px;"> 
						
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
				   </div>  -->

					</td>
					<td class="normalText">
						To Date</td>
					
					<td >
						:&nbsp;<html:bmdate styleId="todate"  property="todate" size="15" onkeypress="isValidDatechar()" maxlength="10"/>
							<input style="display:none;"	align ="left" type="button" tabIndex ='4' name="btntodate" id="btntodate" 
							value=" " OnClick="showhide('IBtodate')" 					style="background-image:url('/images/Calendar.gif');width:20px;height:18px;display:none;"/> 

						   <!--  <div	id="cal_todate_display_year" style="display:none;position:absolute;top:160px;left:485px;"> 
							<input	type="text" class="fancy" id="todate_year"  value="" maxLength="4" size="5" tabIndex ='4' style="background-color:#CCCCEE;"/>
					   </div>	
					   <div id="cal_todate_display" style="display:none;position:absolute;top:160px;left:520px;"> 
						
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
				   </div> -->
					</td>
				</tr>
				 <tr>
					<td colspan="1" class="normalText">
						Specify User Status
					 </td>
					 <td colspan="1">
					 :&nbsp;<html:select property="flag" >
						 <html:option value="all">All</html:option>
						 <html:option value="activated">Activated</html:option>
						 <html:option value="deactivated">Deactivated</html:option>
						 <html:option value="Locked">Locked</html:option>
					</html:select>				 
					 <input type="button" name="Detail" value="Detail" onclick="detailInfo()" />
					 </td>
				 </tr>
				<tr>
					<td colspan="4">
					<%
			if(userlist!=null){
				for(int i=0;i<userlist.length;i++){
					if(i==0){
			%>
			
			<br>
			
			<table border="2" bordercolor="#ffffff" align="center" width="90%" cellpadding="0" cellspacing="0" id="table">
				<TR> 
					<TD class="dataTableTH">
							<bean:message bundle="hindi" key= "2010"/></TD>
  					<TD class="dataTableTH" nowrap>
						Brach Code   </TD>
					<TD class="dataTableTH">
						User Name    </TD>
					<TD class="dataTableTH" nowrap>
						Account No.  </TD>
					<TD class="dataTableTH" nowrap>
						Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Time </TD>
  					<TD class="dataTableTH">
						Activity     </TD>
            		<TD class="dataTableTH">
						Authorized by   </TD>
				</tr>
	
			<%}%>	
				<tbody>
					<tr <%out.println(i%2==0?"class=trforReportRow1":"class=trforReportRow2");%>>
						<td class="dataTableTD"  align="center"><%=i+1%></td>
						<td  align="center" class="dataTableTD"><%= userlist[i][5]%></td>
						<td class="dataTableTD"><%= userlist[i][1]%></td>
						<td class="dataTableTD"><%= userlist[i][6]%></td>
						<td nowrap class="dataTableTD"><%out.print(DateTimeFunction.ibStrDatetoStr(userlist[i][2]));%></td>
						<%if(userlist[i][3].equals("L")){%>
						<td class="dataTableTD">Lock</td>
						<%}%>
						<%if(userlist[i][3].equals("A")){%>
						<td class="dataTableTD">Activation</td>
						<%}%>
						<%if(userlist[i][3].equals("D")){%>
						<td class="dataTableTD">Deactivation</td>
						<%}%>
						<td class="dataTableTD"><%= userlist[i][4]%></td>
						<% if(i==userlist.length-1){%>
						</table>		
					<%	}
					}
					} %>
				<table border="0" width="100%">
					<tr>
						<td align="center" >
							<!-- <input type="button" name="back"  value="Back To Menu" onclick="backpage()" class="button"/> -->
							<input   value="<bean:message bundle='<%=lang%>' key='33'/>" 
							type="button" tabindex="5" onclick="helpopen()"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<%
							if(userlist!=null)
							{%>
							<input type="button" name="Print1" onclick="printpage()" value="Print">
							<%}%>
						</td>
					</tr>	
				</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<div id="diverrmessage">
							<logic:messagesPresent property="NoRecord">
								<font color="Red" face="verdana">No Information Exist for given Criteria</font>
							</logic:messagesPresent>
							<logic:messagesPresent property="invalidadmin">
								<font color="Red" face="verdana">Specified Admin does not Exist.</font>
							</logic:messagesPresent>
							<logic:messagesPresent property="invaliduser">
								<font color="Red" face="verdana"><html:errors property="invaliduser"/></font>
							</logic:messagesPresent>
						</font>
						</div>
					</td>
					</tr>
				</table>
			 </td>
		 </tr>
</table>
</td>
</tr>
</table>
<script>
if(document.getElementById("fromdate").value==""){
		document.getElementById("fromdate").value = '<%=systemDate%>';
	}
	if(document.getElementById("todate").value==""){
		document.getElementById("todate").value = '<%=systemDate%>';
	}
</script>
</body>
</html:form>
</tiles:put>
</tiles:insert>