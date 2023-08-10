<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<script>
<%String userInfo1=(String)session.getAttribute("validToken");  
String usrName = (String)session.getAttribute("user");
String mobNO="";
String login_id="";
if(session.getAttribute("userid")!=null){
   login_id = (String)session.getAttribute("userid");
   System.out.println("snxw--------------------------"+login_id);
  }
if(session.getAttribute("customerMobile")!=null){
 mobNO = (String)session.getAttribute("customerMobile");
}
%>


function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=cheque","child", bar);
}
function disctrl()
{
	<% if(userInfo1.equals("admin")) { %>
	disabledControlsOnAction(document.forms[0],"ibreq")
		<%}%>
}

</script>

<body onload="disctrl()">
<html:form action="/request/reqchk.do" ><br>
<table  class="wrapperDataTable container" style="width: 90%;">
	

	<div class="breadcrumb-container">
		<div class="row">
			<div class="col">
				<div class="breadcrumb">
					<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
					<div class="breadcrumb-item"><a>Request</a></div>
					
					<div class="breadcrumb-item"><a> Order A New Cheque Book</a></div>
				</div>
			</div>
		</div>
	</div>
	<tr>
		<td align="center">
			<div class=" tableHeader text-center">
				<h2 class="wrapperDataTableTR  badge bg-primary p-2 fs-6s">  Order A New Cheque Book</h2>
			</div>
		<table class="miniStmtBackBorder row align-items-center box-sec p-4 s>
				<tr class="miniStmtBack container">
				<td align="center">
			
				<tr>
					<td class="row">
						<%
						//LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");  
						String userInfo[][]=(String[][])session.getAttribute("userInfo");   
						if(userInfo!=null)
						{ 
							%>
      
					       <input type="hidden"  id="AccNO" name="AccNO" value='<%=userInfo[0][0]%>'>
					       <input type="hidden"  id="usrid" name="usrid" value='<%=login_id%>'>
					       <input type="hidden"  id="mobNo" name="mobNo" value='<%=mobNO%>'>
					       <input type="hidden"  id="sessionId" name="sessionId" value='<%=session.getId()%>'>
					      <%
      
							String[] acc_nums =new String[userInfo.length];
							for(int i=0;i<userInfo.length;i++)
								acc_nums[i]=userInfo[i][0];
								//String[] acc_nums =userInfo.getsIbUsr_AccNums();
							int j=acc_nums.length;
							String accNo=null;
							if(j!=0)
							{ %>
								<table
								id="tabela" class="justify-content-center " style="margin-left: 180px;">
									<tr class="row  justify-content-center " >
									
										<td class="col-md-6"  >
											<label class="normalHeadText d-flex">	<bean:message bundle='<%=lang%>' key='1027'/> : </label>
											<select  name="sAccList" id ="sAccList" class="form-select"  tabindex='1'>
											<% 
											for(int l=0;l<j;l++)
											{ 
												accNo = userInfo[l][1]+"-"+userInfo[l][0];%>
											   <option value='<%=accNo%>'><%=accNo%></option>
											<%
											}%>
										    </select>
											
											<input type="hidden"  class="form-control" id="sPrev_page" name="sPrev_page" value='newChk'>
										</td>
										<td class="col-md-6" >
											<label class="normalHeadText d-flex"><bean:message bundle='<%=lang%>' key='592'/> :</label>
											<input type="text" class="form-control"  name="s_leaf"  tabindex="2" id="s_leaf" size="5" onkeypress="javascript:isValidNumber()" maxlength="3"/>
										</td>
									</tr>
									
									
									
							<%
							} 
						}%>
						<% 	
						HashMap req_detail=(HashMap)session.getAttribute("req_detail");   
						if(req_detail!=null)
						{ 
							ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
							ArrayList cks_leafs=(ArrayList)req_detail.get("req_Leafs");
							int k=acc_nums.size();
							if(k!=0)
							{%>
								<table align="center" width=360 cellpadding="0" cellspacing="7" 
								id="tabela" border="0" bordercolor="blue">
									<tr>
										<td  align="left" class="normalHeadText">
											<bean:message bundle='<%=lang%>' key='1027'/> : 
										</td>
										<td>
											<select  name="sAccList" id ="sAccList" disabled tabindex="1">
												<option ><%= (String)acc_nums.get(Integer.parseInt((String)request.getParameter("row")))%></option>
											</select>
											<input type="hidden"  id="sPrev_page" name="sPrev_page" value='newChk'>
										</td>
									</tr>
									<tr>
										<td  align="left" class="normalHeadText">
											 <bean:message bundle='<%=lang%>' key='592'/> : 
										</td>
										<td>
											 <input type="text"  name="s_leaf" value='<%= (String)cks_leafs.get(Integer.parseInt((String)request.getParameter("row")))%>'  tabindex="2" id="s_leaf" size="5" readonly="true" maxlength="3"/>
										</td>
									</tr>
									
							<% 
							}
						}%>

									<tr >
										<td style="margin-left: 205px;"  class="d-flex mt-4 ">
											<!-- <input type="button" name="back"  onClick="back_req(<%=(String)request.getParameter("row")%>,'CHEQUE')" class="button" value="Back To Menu"> -->
											<input type="button" class="btn btn-primary btn-sm mx-2"  onClick=" return submit_newreq()"  tabindex="3" value="<bean:message bundle='<%=lang%>' key='7119'/>">
											<input class="btn btn-primary btn-sm"   value="<bean:message bundle='<%=lang%>' key='33'/>    " type="button" onclick="helpopen()"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					
					</td>
					</tr>
					</table>
				</td>
			</tr>
		</table>
</body>
</html:form>
