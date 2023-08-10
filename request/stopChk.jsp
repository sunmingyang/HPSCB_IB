<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>

<body onBlur="onLoad()">

<html:form action="/request/reqchk.do">
<br>
<table align="left" class="wrapperDataTable container" style="width: 100%;">
	<!-- <tr >
		<td class="wrapperDataTableTR" align="center">
			Request >> Stop cheque request</td>
	</tr> -->

	<div class="breadcrumb-container">
		<div class="row">
			<div class="col">
				<div class="breadcrumb">
					<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
					<div class="breadcrumb-item"><a>Request</a></div>
					
					<div class="breadcrumb-item"><a>Stop Cheque Request</a></div>
				</div>
			</div>
		</div>
	</div>
	<tr>
		<td align="center">
			<br>
			<div id="diverrmessage" class="errorInfoText">
				<logic:messagesPresent property="NoServer">
				<html:errors property="NoServer"/>
				</logic:messagesPresent>
				<logic:messagesPresent property="NotValidCheque">
				<html:errors property="NotValidCheque"/>
				</logic:messagesPresent>
			</div>
			<!-- <table align="center" width=527 cellpadding="0" cellspacing="0" border=1 bordercolor="red">
				<tr>
					<td colspan="5" align="right" class="simple">
						<input type="button" onClick="back_req(<%=(String)request.getParameter("row")%>,'STOPCHECK')" 
						class="button" value="<bean:message bundle='<%=lang%>' key='843'/>"> -->
						<!-- <input   value="<bean:message bundle='<%=lang%>' key='33'/>" type="button" 	onclick="helpopen()"/>
						<input type="hidden"  id="sPrev_page" name="sPrev_page" value='stopChk'> -->
					<!-- </td>
				</tr>
			</table> -->

			<!-- <tr> 
				<td class="tableHeader" align="center" colspan="2"><u>
					<bean:message bundle='<%=lang%>' key='7140'/></u></td>
			</tr> -->
			<div class=" tableHeader text-center">
				<h2 class="wrapperDataTableTR  badge bg-primary p-2 fs-6s"> <bean:message bundle='<%=lang%>' key='7140'/></h2>
			</div>
			


			<div class="container miniStmtBackBorder mt-5">
				<div class=" miniStmtBack row align-items-center box-sec p-4 s" style="width: 100%;">
				  <div class="col-md-4">
					<label class="normalHeadText"><bean:message bundle='<%=lang%>' key='1027'/> </label>
									<% 
									String userInfo[][]=(String[][])session.getAttribute("userInfo");   
									if(userInfo!=null)
									{ 
										String[] acc_nums =new String[userInfo.length];
										for(int i=0;i<userInfo.length;i++)
											acc_nums[i]=userInfo[i][0];
										int j=acc_nums.length;
										if(j!=0)
										{ %>
											<select  name="sAccList" id ="sAccList"  class="form-select">
											<% 
											for(int l=0;l<j;l++)
											{%>
												<option ><%= (String)acc_nums[l] %></option>
											<%
											}%>
											</select>
				   
										<%
										} 
									}%>
									<html:hidden property="usrid" value="aaa"></html:hidden>
				  </div>
				  <div class="col-md-4">
					<label class="normalHeadText">	<bean:message bundle='<%=lang%>' key='7122'/> : </label>


		
								

									<input type="text" class="form-control" id="schk_no" name="schk_no" size="15" maxlength="15" onkeypress="javascript:isValidNumAlpha()"  />
				  </div>
				  <div class="col-md-4">
					<label class="normalHeadText"><bean:message bundle='<%=lang%>' key='2276'/>
						<font color="red"><b>**</b></font> : </label>
					

					<input type="text" class="form-control" id="s_remark" name="s_remark" tabindex="5" maxlength="45" onkeypress="javascript:isValidAlpha()"  />
				  </div>
				  <div class="col-md-12 text-center mt-3">
					<input type="button" class="btn btn-primary btn-sm" value = "<bean:message bundle='<%=lang%>' key='7128'/>" onClick=" return stop_chk_1()">
									<input class="btn btn-primary btn-sm"  value="<bean:message bundle='<%=lang%>' key='33'/>" type="button" 	onclick="helpopen()"/>
									<input type="hidden"  id="sPrev_page" name="sPrev_page" value='stopChk'>
				  </div>
				  <div class="col-md-12 text-left normalInfoText mt-3 d-flex">
					
					
						<p class="normalHeadText text-left">
							<font color="red"><b>**</b></font>
						
							<bean:message bundle='<%=lang%>' key='7132'/>
						  </p>
					
				  </div>
				</div>
			  </div>
			  
			
		</td>
	</tr>
</table>
 </html:form>
 
<script language="JavaScript">
alert("stopchk")
function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=stopcheque","child", bar);
}
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
</body>



                                 