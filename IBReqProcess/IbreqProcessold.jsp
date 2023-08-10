<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%
	String AdminName=(String)session.getAttribute("AdminName");
	Date curdate=new Date();
	Calendar cal = Calendar.getInstance();    
	java.sql.Date dt=new java.sql.Date(cal.get(Calendar.YEAR)-1900,cal.get(Calendar.MONTH),cal.get(Calendar.DATE));

	String strdate=DateTimeFunction.dateToStrFmt(curdate,"dd/mm/yyyy");
	System.out.println("datei is "+strdate);
%>
<script language="JavaScript" src="scripts/ibreq.js"></script>
<script language="JavaScript" src="scripts/city_help.js"></script>
<script language="JavaScript">
	function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=statusreq","child", bar);
}
function onLoad()
{
//<logic:messagesPresent property="NoRecord">
//document.getElementById("diverrmessage").style.display ="block";
//</logic:messagesPresent>

//<logic:messagesPresent property="Saved">
//document.getElementById("diverrmessage").style.display ="block";
//</logic:messagesPresent>
}
function fetch()
{
	var curdate=changeDateFormat('<%=strdate%>');
	var date1=document.getElementById("fromdate").value;
/*
if(isValidDateFormat("fromdate")==false)
{
	alert("Please Enter first date in valid dd/mm/yyy format")
	document.getElementById("sDate1").value="";
	document.getElementById("fromdate").focus();
	return false;
}

if(isValidDateFormat("todate")==false)
{
alert("Please Enter second date in valid dd/mm/yyy format")
document.getElementById("sDate2").value="";
document.getElementById("todate").focus();
return false;
}

if(dateCompare("todate",date1)==false)
{
	//	document.getElementById("sDate2").value="";
		alert("To Date should Greater Than From Date");
		return false;
}

if(dateCompare("todate",curdate))
{
		//document.getElementById("todate").value="";
		alert("To Date should not Greated than Current Date");
		return false;
} 
*/
	document.forms[0].action="/IBReqProcess/ibreqProcess.do?action=fetchRequests";

}




function set_prevPage()
{
	<%
	String d="";
	if(bancDate!=null)
	{
		String str = bancDate.toString();
		String dd = str.substring(8);
		String mm = str.substring(5,7);
		String yyyy = str.substring(0,4);
		d=dd+"/"+mm+"/"+yyyy;
	}%>
	if(document.getElementById("fromdate").value=="")
		document.getElementById("fromdate").value='<%=d%>'
	if(document.getElementById("todate").value=="")
	document.getElementById("todate").value='<%=d%>'
	<%
	if( request.getParameter("prev_page") !=null)
	{%>
		document.forms[0].sReq_type.value='<%= (String) request.getParameter("prev_page") %>';
	<%}%>
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



</script>
<link href="../styles/styles.css" rel="stylesheet" type="text/css">
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet Banking User's Request Processing"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="menu" value="/common/left.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;
	<font color="#99FF00">
	<b>
	<%if(AdminName!=null) out.print(AdminName);%>!</b>
	</font>&nbsp;&nbsp;&nbsp;
	User Request Status
</tiles:put>
<tiles:put name="content" type="String">
<body >
<html:form action="/IBReqProcess/ibreqProcess.do">
	<table align="center" width=400 border="1" bordercolor="brown" style="border-left:none;border-top:none;border-bottom:none;border-right:none"  >
		<tr>
			<td>
			<table align="center" width=500 border="0">
			<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
		<tr>
			<td>
				<bean:message bundle='<%= lang%>' key='7215'/>
			</td>
			<td>&nbsp;</td>
			<td colspan="3" align="left">
				<html:select property="sReq_type" styleId="sReq_type">
				<!--  <html:option value="FD"><bean:message bundle='<%= lang%>' key='7304'/></html:option>
				<html:option value="FFD"><bean:message bundle='<%= lang%>' key='7305'/></html:option>
				<html:option value="RD"><bean:message bundle='<%= lang%>' key='7306'/></html:option>
				 -->
				 <html:option value="DEBCARD" ><bean:message bundle='<%= lang%>' key='7307'/></html:option>
				<html:option value="CHEQUE" ><bean:message bundle='<%= lang%>' key='7308'/></html:option>
				 <html:option value="LDEBCARD"><bean:message bundle='<%= lang%>' key='7309'/></html:option>
				<!--<html:option value="MOBILE"><bean:message bundle='<%= lang%>' key='7310'/></html:option>
				<html:option value="DD"><bean:message bundle='<%= lang%>' key='7384'/></html:option>
				 -->
				 </html:select>
			</td>
		</tr>
		<tr>
			<td>
				From Date : </td><td>&nbsp;
			</td><td>
				<html:text styleId="fromdate" property="fromdate" size="15" readonly="true"   maxlength="10"/>
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
		</tr>
		<tr>
			<td> To Date :</td><td>&nbsp;</td><td>
				<html:text styleId="todate"  property="todate" size="15"  readonly="true" maxlength="10"/>
				<input	align ="left" type="button" tabIndex ='4' name="btntodate" id="btntodate" 
				value=" " OnClick="showhide('IBtodate')" 					style="background-image:url('/images/Calendar.gif');width:20px;height:18px"/> 
			   <div	id="cal_todate_display_year" style="display:none;position:absolute;top:250px;left:308px;"> 
					<input	type="text" class="fancy" id="todate_year"  value="" maxLength="4" size="5" tabIndex ='4' style="background-color:#CCCCEE;"/>
			   </div>	
			   <div id="cal_todate_display" style="display:none;position:absolute;top:262px;left:350px;"> 
				   <script type="text/javascript">	
				   var d = new Date(); //dd/mm/yyyy
				   <%
					if(dt!=null)
					{
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
		<tr>
			<td>Request Status<td>&nbsp;</td><td>
				<html:select property="sCrite" styleId="sCrite">
					<html:option value="A">
					All</html:option>
					<html:option value="Y">
					Pending</html:option>
					<html:option value="R">
					Rejected </html:option>
					<html:option value="D">
					Done</html:option>
				</html:select>
			</td>
		</tr>
	</table>
	</td>
	</tr>
</table>
<table>
	<tr>
		<td colspan="3" align="right">
			<input value="Show Request"  type="submit" name="submit1" class="Button" onClick="return fetch()">
			<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " class="Button" type="button" tabindex="5" style="width:100px"
	onclick="helpopen()"/>

		
		<td>
	</tr>
</table>
<br>

<% 

HashMap req_detail=(HashMap)session.getAttribute("req_detail");   

if(req_detail!=null)
{ 
ArrayList dates =(ArrayList)req_detail.get("req_Dates");
ArrayList names= (ArrayList)req_detail.get("req_Names");
ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
ArrayList req_flags=(ArrayList)req_detail.get("req_Flags");
ArrayList req_remarks=(ArrayList)req_detail.get("req_Remarks");
ArrayList chk_leafs=(ArrayList)req_detail.get("req_Leafs");
ArrayList chk_type=(ArrayList)req_detail.get("req_type");

int k=dates.size();
if(k!=0)
{ %>
<table border="1" width="500" align="center" cellpadding="-1" cellspacing="-1" id="tabela">
	 <thead>
	  <TR> 
		  <TH width="15"> <bean:message bundle="<%=lang %>" key= "1710"/> </TH>
		  <TH width="180"> <bean:message bundle="<%=lang %>" key= "1181"/> </TH>
		  <TH width="100">
			<bean:message bundle="<%=lang %>" key= "2565"/> </TH>
			<%
			String chqtype=(String)chk_type.get(0);
			System.out.println("chk_type444444444444444444444"+chqtype);
			if(chqtype.equals("CHEQUE")){%>
			<TH nowrap> No of Leafs </TH>	
			<%}%>
		   <TH> <bean:message bundle="<%=lang %>" key= "43"/>  </TH>
			<TH><bean:message bundle="<%=lang %>" key= "177"/>   </TH>
			<TH> <bean:message bundle="<%=lang %>" key= "345"/> </TH>
		</tr>
	</thead>
<script language="JavaScript">
function  hello()
{
		var r=<%=k%>
		for(y=0;y<r;y++)
		{
		if(document.getElementById("text"+y+0).className=="SelectText")
		find_data(y,document.getElementById("sReq_type").value)
		else 
		continue;
		}
}

function find_data(a,b)
 {
	 if(b=="FD")
		document.forms[0].action="/request/fdReq.jsp?row="+a;
	 if(b=="FFD")
		document.forms[0].action="/request/flexFd.jsp?row="+a;
	 if(b=="RD")
		document.forms[0].action="/request/rdReq.jsp?row="+a;
	 if(b=="DEBCARD")
		 document.forms[0].action="/request/debCard.jsp?row="+a;
	 if(b=="LDEBCARD")
		 document.forms[0].action="/request/ldebcard.jsp?row="+a;
	 if(b=="MOBILE")
		document.forms[0].action="/request/mobcomm.jsp?row="+a;
	 if(b=="CHEQUE")
		document.forms[0].action="/request/newChk.jsp?row="+a;
	 if(b=="DD")
		document.forms[0].action="/request/payorder.jsp?row="+a;

	 document.forms[0].submit();
 }
  
 function Enabled()
 {
	 document.getElementById("detail").disabled=false
 }
</script>
    <tbody class="scrolling" style="max-height:20ex;">
		<%
		for(int i=0;i<k;i++)
		{
		int j=0; %>
	<tr <%out.println(i%2==0?"class=trforReportRow1":"class=trforReportRow2");%>>
		<td width="40" align="center">
			<input type="text" name= 'text<%=i%><%=j++%>' value='<%= i+1%>'
				onKeyDown="selectNextRow(<%=i%>, event);Enabled()" onFocus="changeColor_new(<%=i%>,5,<%=k%>);Enabled()"
				readonly size="8" class="TableText"  >
		</td>
		<td width="82" align="left">
			<input type="text"  name= 'text<%=i%><%=j++%>' value='<%= (String)acc_nums.get(i) %>'
			onKeyDown="selectNextRow(<%=i%>, event);Enabled()" onFocus="changeColor_new(<%=i%>,5,<%=k%>);Enabled()"
			readonly size="20" class="TableText" >
		</td>
        <td width="70"> 
            <input type="text" name= 'text<%=i%><%=j++%>' value='<%= (String) names.get(i) %>'
			onKeyDown="selectNextRow(<%=i%>, event);Enabled()" onFocus="changeColor_new(<%=i%>,5,<%=k%>);Enabled()"
			readonly size="10" class="TableText" >
		</td>
		<%if(chqtype.equals("CHEQUE")){%>
		 <td width="70"> 
            <input type="text" name= 'text<%=i%><%=j++%>' value='<%= (String) chk_leafs.get(i) %>'
			onKeyDown="selectNextRow(<%=i%>, event);Enabled()" onFocus="changeColor_new(<%=i%>,5,<%=k%>);Enabled()"
			readonly size="10" class="TableText" >
		</td>
		<%}%>
		<td width="140">
			<input type="text" name= 'text<%=i%><%=j++%>' value='<%= (String)dates.get(i) %>'
				onKeyDown="selectNextRow(<%=i%>, event);Enabled()" onFocus="changeColor_new(<%=i%>,5,<%=k%>);Enabled()"
				readonly size="23" class="TableText">
		</td>
		<td width="100">
			<select name="sStatus" id="sStatus">
				<% if( ((String)req_flags.get(i)).equalsIgnoreCase("Y") ) 
				{%>
				<option value="Y" >Pending</option>
				<option value="D" >Done</option>
				<option value="R" >Reject</option>
				<% } 
				 else if(((String)req_flags.get(i)).equalsIgnoreCase("D"))
				{ %><option value="Y">Pending</option>
				<option value="D" selected >Done</option>
				<option value="R" >Reject</option>
				<% } 
				else if(((String)req_flags.get(i)).equalsIgnoreCase("R"))
				{ %>
				<option value="Y">Pending</option>
				<option value="D">Done</option>
				<option value="R" selected >Reject</option>
				<%}
				else { %>
				<option value="Y">Pending</option>
				<option value="D">Done</option>
				<option value="R" >Reject</option>
				<% } %>
			</select>
		 </td>
       <td width="177" align="center" class="heading"> 
		   <input type="text" name="sRemark" id="sRemark" class="TableText" value='<%= req_remarks.get(i)%>'>
		</td>
	</tr>
	<% } // fr ends %>
	</tbody>
	<%
	
	
	%>


<table align="center">
	<tr>
		<td colspan="6" align="center">
			<input type="button" name="detail" id="detail" disabled  class="Button"   value="<bean:message bundle='<%=lang %>' key='3609'/>" onclick="hello()">
			<input type="submit"  class="Button" value="Save" onClick="save_data()">
		</td>
	</tr>
	<tr>
		<td>
		
		</td>
	</tr>
</table>
<%}}%>
<div id="diverrmessage">
			<font color="Green">
			<logic:messagesPresent property="Saved">
				<html:errors property="Saved"/>
			</logic:messagesPresent>
			</font>
			<font color="Red">
			<logic:messagesPresent property="NoRecord">
				<html:errors property="NoRecord"/>
			</logic:messagesPresent>
			</font>
		</div>
</td>
</tr>
</table>
</html:form>
</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="../common/footer.jsp"/>
</tiles:insert>