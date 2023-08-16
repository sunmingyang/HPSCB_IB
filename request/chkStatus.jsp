<%@ include file='/common/Include.jsp' %>
<%
String usrName = (String)session.getAttribute("user");
%>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<script>

  
	function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=CBEnquiry","child", bar);
}
function Onload()
{
<logic:messagesPresent property="Lost">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

<logic:messagesPresent property="NoServer">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

<logic:messagesPresent property="UnUsed">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

<logic:messagesPresent property="Cancle">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>


<logic:messagesPresent property="Stopped">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>



<logic:messagesPresent property="Returned">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

<logic:messagesPresent property="EnCashed">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>


<logic:messagesPresent property="Marked">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>


<logic:messagesPresent property="NotIssued">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

}
</script>
<% 
int errorcount=0;
%>
<jsp:include page="/dashBoard/dashboardNew.jsp" />
<body onLoad="Onload()">
<html:form action="/request/reqchk.do"  >

<table align="left" class="wrapperDataTable  container-fluid" style="width: 100%;">
	<tr >
		<!-- <td class="wrapperDataTableTR" align="center" >
		 Request >> Cheque Status Enquiry</td> -->

		 <div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						
						<div class="breadcrumb-item"><a> Cheque Status Enquiry</a></div>
					</div>
				</div>
			</div>
		</div>
	</tr>
	<tr>
		<td align="center">
			<% 
			if (request.getParameter("cheque")!=null)
			{ %>
				<table>
					<tr>
						<td class="errorInfoText">
							Not a Valid Cheque </td>
					</tr>
				</table>
			<% 
			}%>
			
			<!-- <table width="98%">
				<tr>
					<td colspan="5" align="right" class="simple">
						<input type="button" onClick="back_req()" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>"> -->
						<!-- <input   value="<bean:message bundle='<%=lang%>' key='33'/>" type="button" 	onclick="helpopen()"/> -->
					<!-- </td>
				</tr>
			</table> -->
			<!-- <tr>
				<Td colspan="2" class="tableHeader" align="center"><u>
					<bean:message bundle='<%=lang%>' key='7123'/></u></td>
			</tr> -->

			<!-- <div class=" text-center">
				<h2 class="wrapperDataTableTR  badge bg-primary p-2 fs-6s"> <bean:message bundle='<%=lang%>' key='7123'/></h2>
			</div>
			 -->
		

						<div class="container d-flex justify-content-center ">
							<div class="row align-items-center box-sec  mt-5  " style="width: 100%;">
								<div class=" wrapperDataTableTR text-center p-0 mb-4">	<h6 class="heading wrapperDataTableTR ">
									<img style="width: 20px"  src="/styles/images/add-user-account-icon 1.png" alt="">
									<bean:message bundle='<%=lang%>' key='7123'/>
									</h6>    
											</div>
											
								
								<div class=" col-md-6">
									
									
										<label  class="normalHeadText d-flex"><bean:message bundle='<%=lang%>' key='1027'/> :</label>
										<% 
										//	LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");   
										String userInfo[][]=(String[][])session.getAttribute("userInfo");
										if(userInfo!=null)
										{ 
											String[] acc_nums =new String[userInfo.length];
											for(int i=0;i<userInfo.length;i++)
											acc_nums[i]=userInfo[i][0];
											//String[] acc_nums =userInfo.getsIbUsr_AccNums();
											int j=acc_nums.length;
											if(j!=0)
											{ %>
												<select  name="sAccList" id ="sAccList" class="form-select">
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
									
								</div>
								<div class=" col-md-6">
									

										<label class="d-flex normalHeadText"><bean:message bundle='<%=lang%>' key='7122'/> :</label>
										<input type="text" class="form-control" name="schk_no" id="schk_no" size="15" maxlength="15" onkeypress="javascript:isValidNumber()"/>
										<input type="hidden"  id="sPrev_page" name="sPrev_page" value='chkStatus'></div>
								<div class="mt-4">
									<div class=" col-md-3 justify-content-center">
									
										<input type="button"  class="btn btn-primary btn-sm" value ="<bean:message bundle='<%=lang%>' key='7124'/>" onClick=" return chk_status()" >
										<input   class="btn btn-primary btn-sm"  value="<bean:message bundle='<%=lang%>' key='33'/>" type="button" 	onclick="helpopen()"/>

								</div>
								</div>

								<div class=" row container mt-5">
									<div class=" container">
									  <div class="normalText col-md-12 d-flex">
										<p class="normalHeadText">
										  ** Please note that the issue date refers to the date when the cheque book was issued.
										 
										</p>
									  </div>
									
									</div>
								  </div>
								  
									
							
								
								
									<div  valign="bottom " >
										<div id ="errorhead" style="display:none;">
											<label >
											<font color="#FF0000"><u>
											<bean:message bundle= "<%=lang%>" key= "1808"/></u></font></label>
										</div></div>
								
								
							</div>
						</div>
					</td>
				</tr>
			</table>

			<table width="500">
				<tr>
					<td class="normalText" align="left ">
						<div id="diverrmessage" style="margin-left: 60px; ">
							<logic:messagesPresent property="NoSerevr">
							<html:errors property="NoSerevr"/>
							</logic:messagesPresent>

							<logic:messagesPresent property="UnUsed">
							<html:errors property="UnUsed"/>
							</logic:messagesPresent>

							<logic:messagesPresent property="Lost">
							<html:errors property="Lost"/>
							</logic:messagesPresent>

							<logic:messagesPresent property="Cancle">
							<html:errors property="Cancle"/>
							</logic:messagesPresent>

							<logic:messagesPresent property="Stopped">
							<html:errors property="Stopped"/>
							</logic:messagesPresent>

							<logic:messagesPresent property="Returned">
							<html:errors property="Returned"/>
							</logic:messagesPresent>

							<logic:messagesPresent property="EnCashed">
							<html:errors property="EnCashed"/>
							</logic:messagesPresent>

							<logic:messagesPresent property="Marked">
							<html:errors property="Marked"/>
							</logic:messagesPresent>

							<logic:messagesPresent property="NotIssued">
							<html:errors property="NotIssued"/>
							</logic:messagesPresent>
							<h6 class="mx-4 normalHeadText"> Cheque not issued yet.</h6>
						</div>
					</td>
				</tr>
			</table>
			<br>
		</td>
	</tr>
</table>
</body>
</html:form>
