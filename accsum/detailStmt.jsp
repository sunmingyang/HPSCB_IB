<%@ include file="/common/Include.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%@ page import= "java.awt.*"%>
<%@ page import= "java.awt.event.*"%>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.ArrayList, javax.servlet.ServletOutputStream "%>
<% 
	ArrayList<String> accTypeList=null;
	String resleng ="";
  	if(session.getAttribute("resleng")!=null){
	   resleng = (String)session.getAttribute("resleng");
       session.removeAttribute("resleng");
    }
	if(session.getAttribute("accTypeList")!=null)
 	{
  		accTypeList = (ArrayList<String>)session.getAttribute("accTypeList");
 	}


	ArrayList<String> myList=null;
	if(session.getAttribute("resStr")!=null)
	{
		myList = (ArrayList<String>)session.getAttribute("resStr");
	}
	
	if(request.getAttribute("FileDetails")!=null){}
	String[] acc_nums = null;
	String[] acc_curr = null;
    String userInfo[][]=null;
	String acc_num ="";
    String arr = null,curCode="",curBal="",usrName="",source="";
	int l = 0;
	if(session.getAttribute("AccNum")!=null)
     acc_num=(String)session.getAttribute("AccNum");
	
	
    if(session.getAttribute("userInfo")!=null){
	   userInfo = (String[][])session.getAttribute("userInfo");
       //session.removeAttribute("userInfo");
    }
	// like 0-accno,1-brcode,2-brnstatus,3-appserver
	System.out.println("LENGTH OF USERINFO is : "+userInfo.length);
	l = userInfo.length;
	java.sql.Date dt=new java.sql.Date(106,11,22);
	Date curdate=new Date();
	String strdate=DateTimeFunction.dateToStrFmt(curdate,"dd/mm/yyyy");

	
	
	HashMap mini_stmt = null;
	ArrayList mini_date = null;
	ArrayList mini_Edesc= null;
	ArrayList mini_Hdesc= null;
	ArrayList mini_crdr = null;
	ArrayList mini_amt = null;
	ArrayList mini_cumbal = null;
	String flag = "m";
	if(request.getAttribute("flag") != null)
		 flag = (String)request.getAttribute("flag");
	if(session.getAttribute("currency") != null)
	{
		curCode = (String)session.getAttribute("currency");
		session.removeAttribute("currency");
	}
	if(session.getAttribute("nCurBal") != null)
	{
		curBal = (String)session.getAttribute("nCurBal");
		session.removeAttribute("nCurBal");
	}
	if(session.getAttribute("user") != null){
		usrName = (String)session.getAttribute("user");
         //session.removeAttribute("user");
    }
	if(request.getParameter("success") != null){
		source = (String)request.getParameter("success");
       // session.removeAttribute("success");
    }
	
	if(session.getAttribute("mini_stmt") != null)	{
		mini_stmt = (HashMap)session.getAttribute("mini_stmt"); 
		session.removeAttribute("mini_stmt");
		if(mini_stmt != null) { 
			mini_date =(ArrayList)mini_stmt.get("mini_date");
			mini_Edesc=(ArrayList)mini_stmt.get("mini_Edesc");
			mini_Hdesc=(ArrayList)mini_stmt.get("mini_Hdesc");
			mini_crdr=(ArrayList)mini_stmt.get("mini_crdr");
			mini_amt=(ArrayList)mini_stmt.get("mini_amt");
			String acc_no=(String)mini_stmt.get("acc_no");
			mini_cumbal=(ArrayList)mini_stmt.get("mini_cumbal");
		}
	}
%>





<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Accounts"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>

<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=acc"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=detailStmt&src=acc"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp; </tiles:put>
<script language="JavaScript">
//	function bn(){
//		document.getElementById("sTran_type").value = "a"
//		alert(document.getElementById("sTran_type").value)
//	}
	

function helpopen()
{
	var bar = "width=600,height=350,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=detailst","child", bar);
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

				cal_frdate_display.style.display = "none";
				cal_frdate_display_year.style.display = "none";
				cal_todate_display.style.display = "block";
				cal_todate_display_year.style.display = "block";
				
				
			}
			else
				{
				cal_todate_display.style.display = "none";
				cal_todate_display_year.style.display = "none";
				cal_frdate_display.style.display = "none";
				cal_frdate_display_year.style.display = "none";
	
			}
		}
		else if(divs == "IBfrdate")
		{
			var sty = cal_frdate_display.style.display;
			if(sty == "none")
				{
				cal_frdate_display.style.display = "block";
				cal_frdate_display_year.style.display = "block";
				cal_todate_display.style.display = "none";
				cal_todate_display_year.style.display = "none";
				}
			else
				{
				cal_todate_display.style.display = "none";
				cal_todate_display_year.style.display = "none";
				cal_frdate_display.style.display = "none";
				cal_frdate_display_year.style.display = "none";
				}
		}

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

function changeDateFormat(ddate)
{
	var year=ddate.substring(6,10);
	var month=ddate.substring(3,5);
	var day=ddate.substring(0,2);
	comdate=day+"/"+month+"/"+year;
	return comdate;
}
function isValidDateValue(control1,control2,ismax)
{
	var check=true;
	var UDate1 = document.getElementById(control1).value;
	var UDate2=(control2!='g_Date')?document.getElementById(control2).value:g_Date;
	
	if(UDate1!= 'DD/MM/YYYY')
	{
		if(UDate2!= 'DD/MM/YYYY')
		{
			if(control2=='g_Date')
				check = dateComparison(control1,g_Date);
			else
				check = dateComparisionOnControls(control1,control2);
			//if want to check wether control1 is max from control2 then check will oposite of itself. 
			if(!ismax)
				check=!check;
		}//end of if udate2
		else
			check=false;// if control 2 is blank then user cant fill its dependent control!!!
	}//end of if udate1
	return check;
}
function isValidValueDate(control1,control2,ismax)
{
	alert("Invalid Date");
    alert(<%=strdate%>);
    control2=(control2=='<%=strdate%>')?'<%=strdate%>':control2;// this will change dependancy on retirement date to penstart date in case of Direct Family Pension.
	if(!isValidDateValue(control1,control2,ismax))//if check is false then error will raise!!!
	{    
	   alert("Invalid Date");
	   document.getElementById(control1).value='<%=strdate%>'; 
	}
 }

function fillData(){  

if('<%=resleng%>'=="crAcc")
{
	alert("To date can not greater than one month");
}
else if('<%=resleng%>'=="othAcc"){
	alert("To date can not greater than six month");
}
}


</script>
<html>
<body onload="fillData()" >
<html:form action="/accsum/acc_sum.do" >
<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr >
		<td class="wrapperDataTableTR" align="center">
					Accounts >> Detailed Statement</td>
	</tr>
	<tr>
		<td align="center">

<table width="90%" border="0" bordercolor="red" align="center" cellspacing="5" cellpadding="0">
	<!-- <tr>
		<td width="38%" class="heading"> <bean:message bundle='<%=lang %>' key='7103'/></td>
		<td colspan="4" align="right" style="padding-right:40px">
							<input type="button" value="<bean:message bundle='<%=lang %>' key='843'/>" class="Button" onClick="back1()" >
							<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " class="Button" type="button"  
					onclick="helpopen()"/>
						</td>
   </tr> -->
	<tr>
		<td align="left" class="normalHeadText" width="40%">
			<bean:message bundle='hindi' key='1027'/></td>
		<td align="center" width="6%" class="normalHeadText"><b>:</b></td>
		<td align="left" class="normalHeadText">
			 <html:select property="sAccnum" styleId="sAccnum">
   			 <% if(myList.size() != 0)
			      {
			       String accNo = "";
			       for(int i=0; i<myList.size(); i++)
			       {
			        accNo = accTypeList.get(i)+"@"+userInfo[0][1]+"-"+myList.get(i);
			
			        %>
			      <html:option value="<%=accNo%>" >
			       <%=myList.get(i)%></html:option> 
			      <% }
			      } %>
   			</html:select>
   
		</td>
				
			

	</tr>
					<!-- <tr>
						<td colspan="2" ><font color="brown" ><b>
							Account Currency</font>
						</td>
						<td colspan="3"><font color="brown" ><b>
							<input type="text" id="accCurr" value="<%=curCode%>" style="border:none" readonly>
							<!-- <% String curren=(String)session.getAttribute("sCurr"); %>
							<%=(String)session.getAttribute("sCurr")%> --></b></font>
						<!--</td>
					</tr>
					<br>-->
	<tr>
		<td align="left" class="normalHeadText" width="40%">
			<bean:message bundle='<%=lang%>' key='7096'/> </td>
		<td align="center" width="6%" class="normalHeadText"><b>:</b></td>
		<td class="normalHeadText">
			<html:bmdate styleId="frdate" property="frdate" size="15" onkeypress="isValidDatechar()" maxlength="10"/>	
			<!-- <input	align ="left" type="button" tabIndex ='4' name="btnfrdate" id="btnfrdate" 
			value=" " OnClick="showhide('IBfrdate')" 					style="background-image:url('/images/Calendar.gif');width:20px;height:18px"/> 

			<div	id="cal_frdate_display_year" style="display:none;position:absolute;top:250px;left:308px;"> 
				<input	type="text" class="fancy" id="frdate_year"  value="" maxLength="4" size="5" tabIndex ='4' style="background-color:#CCCCEE;"/>
			</div>	
			<div id="cal_frdate_display" style="display:none;position:absolute;top:262px;left:350px;"> 
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
					if(document.getElementById("frdate").value != ""){
						d = changeStrToDate(document.getElementById("frdate").value);
					}
					IBfrdate = new Calendar ("IBfrdate", "frdate",d);
					renderCalendar(IBfrdate);
				 </script>
			   </div>  -->
			<b>&nbsp;&nbsp;To&nbsp;:&nbsp; </b>
			<html:bmdate styleId="todate" property="todate" size="15" onkeypress="isValidDatechar()" maxlength="10"/>			

			<font color="black" size="-2">(dd/mm/yyyy)</font>
		<!-- <input	align ="left" type="button" tabIndex ='4' name="btntodate" id="btntodate" 
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
			   </div>(DD/MM/YYYY) -->
			</td>
		</tr>
		
		<tr id="invisible" style="display:none;">
			<td align="left" class="normalHeadText" width="40%">
				<bean:message bundle='<%=lang%>' key='117'/>&nbsp;:&nbsp;
				<bean:message bundle='<%=lang%>' key='7098'/></td>
				<td align="center" class="normalHeadText" width="6%">:</td>
			<td class="normalHeadText">
				<input type="radio" name="sTran_type" id="sTran_type" value="a"/><bean:message bundle='<%=lang%>' key='7100'/>
				<input type="radio" name="sTran_type" id="sTran_type" value="d" checked="true"/><bean:message bundle='<%=lang%>' key='7101'/> 
			</td>
		</tr>
		<tr>
			<td align="center" colspan="3" ><br>
				<table class="miniStmtBackBorder">
					<tr class="miniStmtBack">
						<td>
							<table cellspacing="5" >
								<tr style="padding-left:30;padding-right:30;">
									<td class="tableHeader" align="center" colspan="3" >
									<br>
									<u>Select a format for statement and click on "Statement" button</u></td>
								</tr>
								<tr >
									<td width="40%">&nbsp;</td>
									<td align="left" class="normalText">
										<input type="radio" id="sOut_req" name="sOut_req" value="screen" checked="true"><bean:message bundle='<%=lang %>' key='7102'/>
									</td>
									<td >&nbsp;</td>
								</tr>  
								<tr >
									<td width="40%">&nbsp;</td>
									<td align="left" class="normalText">
										<input type="radio" name="sOut_req" id="sOut_req" value="text">Display as a plain Text
									</td>
									<td >&nbsp;</td>
								</tr>  
								<tr >
									<td width="40%">&nbsp;</td>
									<td align="left" class="normalText">
										<input type="radio" name="sOut_req" id="sOut_req" value="pdf">Display in pdf File
									</td>
									<td >&nbsp;</td>
								</tr>  
								<tr >
									<td width="40%">&nbsp;</td>
									<td align="left" class="normalText">
										<input type="radio" name="sOut_req" id="sOut_req" value="xls">Display in MS Excel File
									</td>
									<td >&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
				</table><br>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" onclick="return detail_statment('<%= acc_num %>','<%=curCode %>');" value="<bean:message bundle='<%=lang %>' key='3627'/>">
<!-- <hr color="#CFEDFF"> -->

				</td>
			</tr>
			
			<tr>
						<td colspan="3" align="center">
						<% 
						if(mini_stmt != null)
						{
							System.out.println("ministatement not null");
							int j=0;
							if(mini_date != null)
							 j= mini_date.size();
							System.out.print("jjj"+j);
							if(j!=0)
							{%>

							<table border = "0" bordercolor="green" style="border-left-style:none;border-bottom-style:none;border-right-style:none;border-left-style:none" cellspacing=0 cellpadding=0>
							<tr class="miniStmtResultback">
								<td align="right" nowrap class="dataInfoText">
									<bean:message bundle='hindi' key='1027'/>&nbsp;:&nbsp; 
								</td>
								<td>
									<html:text property="sAccnum" styleId="sAccnum1"readonly="true" size="24"/>
								</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr class="miniStmtResultback">

								<td align="right" nowrap class="dataInfoText">
									Current Balance&nbsp;:&nbsp; 
								<td >
									<input type="text" id="acc_curbal" value="<%=mini_cumbal.get(0)%>" class="miniStmtResultback" readonly="true"> 
								</td>
								<td align="right" nowrap class="dataInfoText">
									Account Currency&nbsp;:&nbsp; 
								</td>
								<td >
									<input type="text" id="acc_currency" value="<%=curCode%>"  class="miniStmtResultback" readonly="true"> 
								</td>							
							</tr>
							<br>
							<%if(source.equals("detail")){
								String frdate=(String)request.getAttribute("frdate");
								String todate=(String)request.getAttribute("todate");
								%>

							<tr class="miniStmtResultback">
								<td align="right" nowrap class="dataInfoText">
									 <bean:message bundle='<%=lang %>' key='115'/>&nbsp;:&nbsp;
								</td>
								<td >
									<input type="text" id="fromdate" value="<%=frdate%>" class="miniStmtResultback" > 
								
								</td>
								<td align="right" nowrap class="dataInfoText">
								
									 <bean:message bundle='<%=lang %>' key='116'/>&nbsp;:&nbsp;
								</td>
								<td >
									<input type="text" id="todate" value="<%=todate%>" class="miniStmtResultback" > 
								
								</td>
							</tr>

							<%}%>
								
							</table><br>
			<table border="2" bordercolor="#ffffff" align="center" width="90%" cellpadding="0" cellspacing="0" id="table">
				<TR> 
					<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "1710"/></TD>
					<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "43"/></TD>
					<!--	<TH width="15%"><font color="#FFFFFF"> 
							<script language="JavaScript">
								Arr=splitString('<bean:message bundle="<%= lang %>" key="167"/>','/');
								document.write(Arr[0] );
							</script></font>  
						</TH>
						<TH width="21%"><font color="#FFFFFF"> 
							<script language="JavaScript">
								Arr=splitString('<bean:message bundle="<%= lang %>" key="167"/>','/');
								document.write(Arr[1] );
							</script></font>  
						</TH>  
						<TH width="15%" ><font color="#FFFFFF"> <bean:message bundle="<%= lang %>" key="167"/></font></TH>-->
					<TD class="dataTableTH" >
						<bean:message bundle="<%= lang %>" key="167"/></TD>
					<TD class="dataTableTH">
						Credit</TD>
					<TD class="dataTableTH">
						Debit</TD>
					<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "652"/></TD>
				</TR>
				<tbody  class="scrolling" style="max-height:20px;">
						<%
						for(int i=0;i<j;i++)
						{
						int k=0;
						%>
							<tr <%out.println(i%2==0?"class=trforReportRow1":"class=trforReportRow2");%>>
								<td  class="dataTableTD" id="text<%=i%><%=k++%>"  
									><%=i+1%>
								</td>
								<td class="dataTableTD" id="text<%=i%><%=k++%>"  
									><%= mini_date.get(i) %>
								</td>
								<td id="text<%=i%><%=k++%>" class="dataTableTD">
									<%=mini_Hdesc.get(i) %> / <%=mini_Edesc.get(i) %>
								</td>
							<!--	<td width="154" id="text<%=i%><%=k++%>"  onClick="setRow(<%=i%>,6,<%=  mini_Edesc.size() %>)" >
									<%=mini_Edesc.get(i) %>
								</td> -->
								<td id="text<%=i%><%=k++%>" class="dataTableTD" >
									<%if(mini_crdr.get(i).equals("C")) {%> <%= mini_amt.get(i)%><%}%>
								</td>
								<td id="text<%=i%><%=k++%>" class="dataTableTD">
									<%if(mini_crdr.get(i).equals("D")){%> <%= mini_amt.get(i)%><%}%>
								</td>
								 <td id="text<%=i%><%=k++%>"  class="dataTableTD"><%= mini_cumbal.get(i) %>
								</td>
							</tr>
					<%  session.removeAttribute("mini_stmt");
						} %>
				</tbody>
				</table>
				<%}
				}%>
				</tr>
			
			
			
			<tr>
				<td align="center" colspan="5">
					<div id="diverrmessage" >
						<font color="Red">
						<logic:messagesPresent property="NoRecord">
						<html:errors property="NoRecord"/>
						</logic:messagesPresent>
						</font>
					</div>
				</td>
			</tr>
			</table>
						<input type="hidden" name ="sCurrency" id ="sCurrency" value=<%=curCode %>>
			
			
			</td>
		</tr>




	</table>
</html:form>
</body>
</html>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
<style>
.normalHeadText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		font-weight: bold;
}
.tableHeader{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: #92610E;
        text-decoration: none;

}
.normalText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		
}
.dataTableTH{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
		
        font-weight: bold;
        color: #092771;
        text-decoration: none;
		background-color:#BFBFBF;
		text-align:center;

}
.dataTableTD{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
        text-decoration: none;
		background-color:#EFEFEF;
		text-align:center;


}
.dataInfoText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 7pt;
        font-weight: bold;
        color: brown;
        text-decoration: none;

}
</style>
<script>
	if(document.getElementById("sAccnum1")) // added by abhishek
	document.getElementById("sAccnum1").className="miniStmtResultback";
	
	if(document.getElementById("fromdate").value==""){
		document.getElementById("fromdate").value = '<%=systemDate%>';
	}
	if(document.getElementById("todate").value==""){
		document.getElementById("todate").value = '<%=systemDate%>';
	}

	
</script>