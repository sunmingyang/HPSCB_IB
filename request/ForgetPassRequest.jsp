<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<script>
<%
HashMap req_detail=(HashMap)session.getAttribute("req_detail");   
String userInfo1=(String)session.getAttribute("validToken");  
String usrName = (String)session.getAttribute("user");
%>


function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=cheque","child", bar);
}
function disctrl()
{
	<% if(userInfo1.equals("admin")) { %>
	//disabledControlsOnAction(document.forms[0],"ibreq")
		<%}%>
}
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Request"/>

<%if(request.getParameter("row")!=null){ 
	System.out.println("####### when row s not null");%>
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=userReqStatus"/>
<%}%>

<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>

<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>
</tiles:put>
<tiles:put name="content" type="String">
<body onload="disctrl()">
<html:form action="/request/reqchk.do" >
<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr >
	
		<td class="wrapperDataTableTR" align="center">
			User Request Status >> Forgot Password Request Detail</td>
	
	</tr>
	<tr>
		<td align="center"><br>
			<%
			if(req_detail!=null)
						{ 
							ArrayList kids=(ArrayList)req_detail.get("req_Kids");  // request Kids..
							ArrayList names= (ArrayList)req_detail.get("req_Names"); //user id..
							ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum"); // account no..
							ArrayList pass_dobs=(ArrayList)req_detail.get("req_Dob"); // Date of Birth...
							ArrayList pass_address=(ArrayList)req_detail.get("req_Address"); // Address...
							ArrayList pass_citycodes=(ArrayList)req_detail.get("req_CityCode"); // City Code...
							ArrayList pass_countrycodes=(ArrayList)req_detail.get("req_CountryCode"); // Country Code...
							ArrayList pass_pincodes=(ArrayList)req_detail.get("req_PinCode"); // Pin Code...
							ArrayList pass_mobileno=(ArrayList)req_detail.get("req_MobileNo"); // Mobile No...
							ArrayList pass_emails=(ArrayList)req_detail.get("req_Email"); // Email...
							ArrayList dates =(ArrayList)req_detail.get("req_Dates"); // request date
							ArrayList req_flags=(ArrayList)req_detail.get("req_Flags");  // request flage..
							ArrayList req_remarks=(ArrayList)req_detail.get("req_Remarks"); // request remarks..
							int k=acc_nums.size();
							if(k!=0)
							{
				
				String usr_id = (String) names.get(Integer.parseInt((String)request.getParameter("row")));
				String acc_no = (String)acc_nums.get(Integer.parseInt((String)request.getParameter("row")));
				String dob = (String)pass_dobs.get(Integer.parseInt((String)request.getParameter("row")));
				String addr = (String)pass_address.get(Integer.parseInt((String)request.getParameter("row")));
				String citycode = (String)pass_citycodes.get(Integer.parseInt((String)request.getParameter("row")));
				String countrycode = (String)pass_countrycodes.get(Integer.parseInt((String)request.getParameter("row")));
				String pincode = (String)pass_pincodes.get(Integer.parseInt((String)request.getParameter("row")));
				String mobno = (String)pass_mobileno.get(Integer.parseInt((String)request.getParameter("row")));
				String email = (String)pass_emails.get(Integer.parseInt((String)request.getParameter("row")));
				
				
				String cr_date = (String) dates.get(Integer.parseInt((String)request.getParameter("row")));
				String req_remark = (String) req_remarks.get(Integer.parseInt((String)request.getParameter("row")));
				%>
								<table width="350" cellspacing=0 cellpadding=5 border=1 bordercolor="#E0E0E0">
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											User Id 
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											 <%=usr_id%> <!--printing user id.--></td>
										</td>
									</tr>
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											<bean:message bundle='<%=lang%>' key='1027'/>
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											 <%=acc_no%> <!--printing account no.--></td>
										</td>
									</tr>
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											Date of Birth
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											 <%=dob%> <!--printing date of birth.--></td>
										</td>
									</tr>
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											Address
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											 <%=addr%> <!--printing date of birth.--></td>
										</td>
									</tr>
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											City Name
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											 <%=citycode%> <!--printing date of birth.--></td>
										</td>
									</tr>
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											Country Name
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											 <%=countrycode%> <!--printing date of birth.--></td>
										</td>
									</tr>
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											PIN No.
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											 <%=pincode%> <!--printing date of birth.--></td>
										</td>
									</tr>
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											Contact No.
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											 <%=pass_mobileno%> <!--printing date of birth.--></td>
										</td>
									</tr>
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											Email Id
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											 <%=email%> <!--printing date of birth.--></td>
										</td>
									</tr>
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											Request Date 
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											 <%=cr_date%> <!--printing creation date.--></td>
										</td>
									</tr>
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											Status<!--printing status.-->
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											<%if(((String)req_flags.get(Integer.parseInt((String)request.getParameter("row")))).equalsIgnoreCase("D"))
											{%>
													 Done 
											<%}
											else if(((String)req_flags.get(Integer.parseInt((String)request.getParameter("row")))).equalsIgnoreCase("R"))
											{%>
												 Reject 
											<%}
											else
											{%>
												 Pending
											<%}%>
										</td>
									</tr>
									<tr height="20">
										<td class="normalText" align="left" style="padding-left:7">
											Remarks
										</td>
										<td class="normalHeadText" align="left" style="padding-left:7">
											 <%=req_remark%>&nbsp; <!--printing request remarks--></td>
										</td>
									</tr>
								</table>
							<% 
							}%>

								<table width="350">
									<tr >
										<td align="center" colspan="2" >
											<input type="button" onClick="goToBackDetail(<%=request.getParameter("row")%>)" value="Back">
										</td>
									</tr>
								</table>
							<%}%>
							
			</td>
		</tr>
	</table>
</body>
</html:form>
</tiles:put>

</tiles:insert >

<script>
function goToBackDetail(sRow){
	<%  
	if(request.getParameter("detailparam")!=null ){
		String detailparam1 = (String)request.getParameter("detailparam");
		System.out.println("##################### detailparam :"+detailparam1);%>
		var detailparam = '<%=detailparam1%>';
		document.forms[0].action="/IBReqProcess/IbreqProcess.jsp?prevSelectedRow="+sRow+"&backdetparam="+detailparam;
		document.forms[0].method="POST";
		document.forms[0].submit();
<%}%>
}
</script>