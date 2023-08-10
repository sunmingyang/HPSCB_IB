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



<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" >
<head>
<meta http-equiv="content-type" content="text/html" charset="utf-8" />
<title>acc Detail stmt</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" >
<link rel="StyleSheet" href="/allNewCSS/accDetailStmt.css" />
<script src="https://secure.exportkit.com/cdn/js/ek_googlefonts.js?v=6"></script>
<script>
	if(document.getElementById("sAccnum1")) // added by abhishek
	document.getElementById("sAccnum1").className="miniStmtResultback";
	
	if(document.getElementById("fromdate").value==""){
		document.getElementById("fromdate").value = '<%=systemDate%>';
	}
	if(document.getElementById("todate").value==""){
		document.getElementById("todate").value = '<%=systemDate%>';
	}


	function radioClick() {
		//var x = document.getElementsByName("accNO").value;
		//document.getElementsByName("demo").innerHTML = x;
		var gender = document.querySelector('input[name = accNO]:checked').value;
		demo.innerHTML = 'Acc No : '+gender;		
		alert(gender)		
	}

	
</script>
<!-- Add your custom HEAD content here -->

</head>
<body>
<div id="content-container" >
	<div id="_bg___07_e_statement"  ></div>
	<img src="/allNewSkins/rectangle_373.png" id="rectangle_373" />
	<div id="rectangle_270"  ></div>
	<div id="rectangle_271"  ></div>
	<div id="e_statement" >
		Detail Statement
	</div>
	<img src="/allNewSkins/vector.png" id="vector" />
	
			<div id="choose_an_account" >
				Choose an account
			</div>
			<div id="saving_a_c_123xx678xxx234xx" >
				Saving A/C                                               123XX678XXX234XX
			</div>
			<div id="current_a_c_123xx678xxx234xx" >
				Current A/C                                             123XX678XXX234XX
			</div>
	
	<div id="dear_customer__bank_has_introduced_an_automated_process_of_sending_accounts_statements_every_month__on_your_registered_e_mail_id_with_the_bank__therefore__an_explicit_registration_for_e_statement_through_internet_banking_is_not_required__please_ensure_to_register_your_e_mail_id_with_the_bank_to_avail_the_facility_" >
		<html:form action="/accsum/acc_sum.do" >
		
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
   <br/>
   <br/><br/>
   
   <h3>Please select an account</h3>
   
  <%
	for(int i=0; i<myList.size();i++ ){
		String acc = null;
		acc = myList.get(i);
	%>	
		<input type="radio" name="accNO" id=<%=acc%>" value="<%=acc%>" onclick="radioClick()" /> <%=acc%>	&nbsp; &nbsp; 
  <% }%>
 
 <div id="demo" name="demo"></div>
   
   <br/><br/><br/><br/>
   
   
  
  
   
	<tr>
		<td  align="center" class="normalHeadText" width="40%">
			<bean:message bundle='hindi' key='1027'/></td>
		<td align="center" class="normalHeadText" width="6%" ><b>:</b></td>
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
		<td align="center" class="normalHeadText" width="40%">
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
		
		
		
		
		
		
		
		
		
		
		
	</div>
	
	<div class="test">
		<%
	for(int i=0; i<myList.size();i++ ){
		String acc = null;
		acc = myList.get(i);
	%>	
		<input type="radio" name="accNO" value="<%=acc%>" /> <%=acc%>	&nbsp; &nbsp; &nbsp; &nbsp;  
 <% }%>
   
   <br/>
   <br/><br/><br/><br/><br/><br/><br/>
	</div>
	

	<div id="group_100"  >

		<div id="header"  >
			<div id="rectangle_1"  ></div>

			<div id="logo"  >
				<img src="/allNewSkins/logo__2__1.png" id="logo__2__1" />

			</div>

		</div>
		<div id="hpscb_bank_home_about_us_customer_care_find_atm_branch_mobile_banking" >
			HPSCB Bank Home          About Us          Customer Care          Find ATM/Branch          Mobile Banking
		</div>
		<div id="line_19"  ></div>
		<div id="line_20"  ></div>
		<div id="line_21"  ></div>
		<div id="line_22"  ></div>

		<div id="mobile_usability_icon__1__1"  >
			<img src="/allNewSkins/vector_ek1.png" id="vector_ek1" />

		</div>

		<div id="caret_down_icon_10"  >

		</div>

		<div id="caret_down_icon_11"  >

		</div>

		<div id="caret_down_icon_12"  >

		</div>

		<div id="caret_down_icon_13"  >

		</div>

		<div id="group_14"  >
			<div id="overview_my_accounts_payments___transfer_investments___insurance_exclusive_offerings_customer_service" >
				OVERVIEW                     MY ACCOUNTS                       PAYMENTS &amp; TRANSFER                      INVESTMENTS &amp; INSURANCE                      EXCLUSIVE OFFERINGS                     CUSTOMER SERVICE
			</div>

			<div id="customer_service_icon_1"  >
				<img src="/allNewSkins/vector_ek2.png" id="vector_ek2" />

			</div>

			<div id="offer_icon_1"  >
				<img src="/allNewSkins/vector_ek3.png" id="vector_ek3" />

			</div>

			<div id="overview_icon_1"  >
				<img src="/allNewSkins/vector_ek4.png" id="vector_ek4" />

			</div>

			<div id="my_account_icon_1"  >
				<img src="/allNewSkins/vector_ek5.png" id="vector_ek5" />

			</div>

			<div id="caret_down_icon_8"  >
				<img src="/allNewSkins/vector_ek6.png" id="vector_ek6" />

			</div>

			<div id="caret_down_icon_9"  >
				<img src="/allNewSkins/vector_ek7.png" id="vector_ek7" />

			</div>
			<img src="/allNewSkins/vector_ek8.png" id="vector_ek8" />
			<img src="/allNewSkins/vector_ek9.png" id="vector_ek9" />
			<img src="/allNewSkins/vector_ek10.png" id="vector_ek10" />
			<img src="/allNewSkins/vector_ek11.png" id="vector_ek11" />

			<div id="wire_transfer_icon_1"  >
				<img src="/allNewSkins/vector_ek12.png" id="vector_ek12" />

			</div>

			<div id="investment_analysis_icon_1"  >
				<img src="/allNewSkins/vector_ek13.png" id="vector_ek13" />

			</div>

		</div>
		<div id="line_41"  ></div>
		<div id="dashboard___e_statement" >
			<span style="font-style:normal; font-weight:normal; text-decoration:NONE; ">Dashboard  ></span><span style="color:#000000; font-style:normal; font-weight:normal; text-decoration:NONE; ">  DetailStatement</span>
		</div>
		<img src="/allNewSkins/group_35.png" id="group_35" />
		<div id="_28_mar_2023____04_16_06_am_ist__" >
			28-Mar-2023, [ 04:16:06 AM IST ]
		</div>

		<div id="thin_chevron_arrow_right_icon_1"  >
			<img src="/allNewSkins/vector_ek14.png" id="vector_ek14" />

		</div>
		<div id="line_44"  ></div>

	</div>

	<div id="group_106"  >

		<div id="group_105"  >
			<div id="rectangle_262"  ></div>
			<div id="back" >
				BACK
			</div>

			<div id="login_icon__1__1"  >

				<div id="group"  >
					<img src="/allNewSkins/vector_ek15.png" id="vector_ek15" />

				</div>

			</div>

		</div>

		<div id="group_104"  >

			<div id="group_102"  >
				<div id="rectangle_262_ek1"  ></div>
				<div id="home" >
					HOME
				</div>

			</div>

			<div id="group_103"  >
				<img src="/allNewSkins/vector_ek16.png" id="vector_ek16" />
				<img src="/allNewSkins/vector_ek17.png" id="vector_ek17" />

			</div>

		</div>

	</div>

	<div id="group_99"  >

		<div id="footer"  >
			<div id="rectangle_233"  ></div>
			<div id="rectangle_231"  ></div>
			<div id="copyright___2023_himachal_pradesh_state_co_operative_bank_ltd_all_rights_reserved_" >
				Copyright <span class="char">%C2%A9 </span> 2023 Himachal Pradesh State Co-operative Bank Ltd.All Rights Reserved.
			</div>
			<div id="line_10"  ></div>

			<div id="logo_ek1"  >
				<img src="/allNewSkins/logo__2__1_ek1.png" id="logo__2__1_ek1" />

			</div>
			<div id="the_himachal_pradesh_state_cooperative_bank_ltd__is_an_apex_bank_of_the_state_of_himachal_pradesh__and_is_listed_as_scheduled_bank_with_its_branches_spread_across_6_districts_of_the_state_and_one_branch_at_new_subzi_mandi__new_delhi_" >
				The Himachal Pradesh State Cooperative Bank Ltd. is an Apex bank of the State of Himachal Pradesh; and is listed as Scheduled Bank with its branches spread across 6 districts of the State and one branch at New Subzi Mandi, New Delhi.
			</div>
			<div id="rectangle_232"  ></div>
			<div id="follow___hpscblofficial" >
				Follow:  @hpscblofficial
			</div>
			<div id="hpscb" >
				HPSCB
			</div>
			<div id="loans" >
				Loans
			</div>
			<div id="deposits" >
				Deposits
			</div>
			<div id="acsti" >
				ACSTI
			</div>
			<div id="line_11"  ></div>
			<div id="line_12"  ></div>
			<div id="line_13"  ></div>
			<div id="line_14"  ></div>
			<div id="about_us_managing_committee_board_of_directors_branches_network_atm_network_contact_us_right_to_information_list_of_unclaimed_deposits_customer_grievance_redressal_policy" >
				About Us<br/>Managing Committee<br/>Board of Directors<br/>Branches Network<br/>ATM Network<br/>Contact Us<br/>Right To Information<br/>List of Unclaimed Deposits<br/>Customer grievance Redressal Policy
			</div>
			<div id="home_loan_car_loan_personal_loan_education_loan_hotel_motel_tiny_tourism_financing_of_hydel_projects_interest_rates_on_loans" >
				Home Loan<br/>Car Loan<br/>Personal Loan<br/>Education Loan<br/>Hotel/Motel/Tiny Tourism<br/>Financing of Hydel Projects<br/>Interest Rates on Loans
			</div>
			<div id="savings_account_current_account_recurring_deposit_fixed_deposit_himpurnivesh_deposit_sarvapriya_deposit_mahalaxmi_deposit_interest_rates_on_deposits" >
				Savings Account<br/>Current Account<br/>Recurring Deposit<br/>Fixed Deposit<br/>Himpurnivesh Deposit<br/>Sarvapriya Deposit<br/>Mahalaxmi Deposit<br/>Interest Rates on Deposits
			</div>
			<div id="about_acsti_facilities_faculty_courses_calendar_how_to_reach_contact_us" >
				About ACSTI<br/>Facilities<br/>Faculty<br/>Courses Calendar<br/>How to Reach<br/>Contact Us
			</div>

		</div>

		<div id="twitter_color_icon_1"  >
			<img src="/allNewSkins/vector_ek18.png" id="vector_ek18" />

		</div>

	</div>

</div>
<script>var specialChars = document.querySelectorAll("span.char"); for(var c=0; c<specialChars.length; c++){ specialChars[c].innerHTML = decodeURIComponent(specialChars[c].innerHTML); }</script>
</body>
</html>



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
