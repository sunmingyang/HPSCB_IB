<%@ include file="/common/Include.jsp" %>
<%
String usrName = (String)session.getAttribute("user");
%>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<script language="JavaScript">

	function helpopen()
	{
		var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
		window.open("/jsp/IBHelp.jsp?src=stopatm","child", bar);
	}
	function onloadFn(yy)
	{
		if (yy!=null)
		{
		disabledControlsOnAction(document.forms[0]);
		}
	}
	function myfun(){
		console.log("Testing myfun");
	}
	document.body.addEventListener('DOMContentLoaded', onloadFn(<%=request.getParameter("row")%>));
</script>


<body>

<html:form action="/request/reqchk.do" >
<table class="wrapperDataTable container">
	<tr >
		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> Intimation For Loss of ATM Card</div>
					</div>
				</div>
			</div>
		</div>  
		<!-- <td class="wrapperDataTableTR">
		Request >> Intimation For Loss of ATM Card</td> -->
	</tr>

	<div class="wrapperDataTableTR  container text-center" >
								
								
		<h2 class=" label-style badge bg-primary p-2 fs-6 mt-2 ">	<bean:message bundle='<%=lang%>' key='7186'/> </h2>
	</div>
	<tr>
		<td class="d-flex justify-content-center">
			
			<div id="diverrmessage" class="errorInfoText">
			<logic:messagesPresent property="NoServer">
			<html:errors property="NoServer"/>
			</logic:messagesPresent>
			<logic:messagesPresent property="WrongATM">
			<html:errors property="WrongATM"/>
			</logic:messagesPresent>
			</div>
		<!-- <table width=527>
			<tr>
				<td colspan="5" align="right" class="simple">
					<input type="button" name="back"
					onClick="back_req(<%=(String)request.getParameter("row")%>,'LDEBCARD')" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>"> -->
					<!-- <input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " class="Button" type="button" onclick="helpopen()"/> -->
				<!-- </td>
			</tr>
		</table> -->
		<br>
		<table class="miniStmtBackBorder col-md-6 border box-sec">
			<tr class="miniStmtBack miniStmtBack d-flex justify-content-center p-5">
				<td>
					<table>
						
						<% 
						String userInfo[][]=(String[][])session.getAttribute("userInfo");
						if(userInfo!=null)
						{ 
							//String[] acc_nums =userInfo.getsIbUsr_AccNums();
							String[] acc_nums =new String[userInfo.length];
							for(int i=0;i<userInfo.length;i++)
								acc_nums[i]=userInfo[i][0];
							int j=acc_nums.length;
							if(j!=0)
							{ %>
						<tr>
							
							<td>

								<label class=""><bean:message bundle='<%=lang%>' key='1027'/> :</label>
								
							</td>
							<td>
								<select  name="sAccList" id ="sAccList" class="form-select">
									<% 
									for(int l=0;l<j;l++)	
									{%>
										<option ><%= (String)acc_nums[l] %></option>
									<%
									}%>
									</select>
							</td>
						</tr>
						
						<tr>
							
							<td >

								<label  class="normalInfoText form-label"><bean:message bundle='<%=lang%>' key='7187'/>
									<font color="red"><b>**</b></font> :</label>
								
							</td>
							<td>
								<input   property="scard_no" class="form-control" id="scard_no" size="30" maxlength="20"  onkeypress="javascript:isValidNumAlpha()" />
								<input type="hidden"  id="sPrev_page" name="sPrev_page" value='ldebcard'>
							</td>
						</tr>
						
						<tr>
							<td class="normalHeadText">
								<label><bean:message bundle='<%=lang%>' key='7188'/>
									<font color="red"><b>**</b></font> :</label>
							</td>
							<td >
								<input property="sname" class="form-control" id="sname" size="20" onkeypress="javascript:isValidAlpha()" />
							</td>
						</tr>
						
						 <%} 
						} 
						
						HashMap req_detail=(HashMap)session.getAttribute("req_detail");   
						if(req_detail!=null)
						{ 
							ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
							ArrayList req_cardNum=(ArrayList)req_detail.get("req_cardNum");
							ArrayList ibreq_name=(ArrayList)req_detail.get("req_frmName");
	
							int k=acc_nums.size();
							if(k!=0)
							{%>
	
						<tr>
							<td class="normalHeadText">
								<label>
									<bean:message bundle='<%=lang%>' key='1027'/> : 
								</label>
							</td>
							<td>
								<select  name="sAccList" id ="sAccList" disabled>
									<option><%= (String)acc_nums.get(Integer.parseInt((String)request.getParameter("row")))%></option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td class="normalHeadText">
								<bean:message bundle='<%=lang%>' key='7187'/>** : </td>
							<td>
								<input type="text" readonly="true"  name="scard_no" id="scard_no" value="<%= (String)req_cardNum.get(Integer.parseInt((String)request.getParameter("row")))%>"  >
								<input type="hidden"   id="sPrev_page" name="sPrev_page" value='ldebcard'>
							</td>
						</tr>
						
						<tr>
							<td class="normalHeadText">
								<bean:message bundle='<%=lang%>' key='7188'/>** : </td>
							<td>
								<input type="text" readonly="true" name="sname" stid="sname" value="<%= (String)ibreq_name.get(Integer.parseInt((String)request.getParameter("row")))%>" >
							</td>
						</tr>
						 <%}
						}%>
					
						<tr>
								<td class="normalHeadText d-flex justify-content-center">
									<div>
										<input type="button" onClick="return submit_ldeb()" 
									value="<bean:message bundle='<%=lang%>' key='7119'/>" class="btn btn-primary">
										<input type="button" onclick="helpopen()" 
									value="<bean:message bundle='<%=lang%>' key='33'/>" class="btn btn-primary"/>
									</div>
								</td>
						</tr>

						<!-- <tr>
							<td colspan="2" align="left" class="normalInfoText">
								<font color="red"><b>**</b></font>
								<bean:message bundle='<%=lang%>' key='7132'/>
							</td>
						</tr> -->
					</table>
				</td>
			</tr>
		</table>
<br>
	</td>
</tr>
</table>
</html:form>
</body>

<script language="JavaScript">

function onLoad()
{
	<logic:messagesPresent property="WrongATM">
	document.getElementById("diverrmessage").style.display ="block";
	</logic:messagesPresent>


	<logic:messagesPresent property="NoServer">
	document.getElementById("diverrmessage").style.display ="block";
	</logic:messagesPresent>

}

</script>