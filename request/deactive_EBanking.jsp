<%@ include file='/common/Include.jsp' %>
<%
	String usrName = (String)session.getAttribute("user");
	String usrInfo[][]=(String[][])session.getAttribute("userInfo"); 
%>
	<script type="text/javascript">
		document.body.addEventListener('DOMContentLoaded', hello(<%=request.getParameter("row")%>));
		function deactive_EBanking()
		{
			var message="";
			var a=document.getElementById("sAccList").value;
			var url="/AccountInfoAction.do?action=ebankingDeactivateReq&accountNo="+a+"&userid="+<%=session.getAttribute("userid")%>;
		
			http.open("post",url,false);
			http.onreadystatechange= function (){
											if(http.readyState==4 && http.status==200){
											try{
												var resArray1=http.responseText;
												//alert(resArray1);
												if(resArray1=="Y")
												{
													message="E-Banking Account deactivated Successfully";
													window.location.href="/jsp/login.do?action=ibUsrLogout";
												}
												else
												{
													message="E-Banking Account not deactivated Successfully";
										
												}
											}
											catch(e)
											{ 
												alert(e);
											}
											alert(message);
											}	

									};
									 http.send(null);			 
			
		}
		function hello(yy)
		{
			
			if (yy!=null)
			{

			disabledControlsOnAction(document.forms[0],"ibreq");
			}
		}
	</script>
	<body>
		<!-- <html:form action="/request/reqchk.do" ><br>
			<table width="50%" align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0" style="height:200px;">
				<tr>
					<td class="wrapperDataTableTR" align="center">Request >> Deactivate E-Banking Account</td>
				</tr>
				<tr>
					<td class="tableHeader" align="center" style="font-size:medium;">
						<u> 
							Request for Deactivation of  E-Banking Account 
						</u> 
					</td>
				</tr>
				<tr style="height:80px;">
					<td align="center">
						<table style="width:50%;" >
							<tr style="/*height:50px;*/">
								<td align="center"  style="font-size:12pt;">
									Account Number:
									&nbsp;&nbsp;&nbsp;
									<html:select property="sAccList" styleId="sAccList" style="width:150px;height:35px;font-size:12pt;font-weight;bold;">
									<%
										if(usrInfo!=null)
										{
											String accNo = "";
											for(int i=0; i<usrInfo.length; i++)
											{
												//accNo = usrInfo[i][1]+"-"+usrInfo[i][0];
												accNo =usrInfo[i][0];
									%>
												<html:option value='<%=accNo%>'><%=accNo%></html:option>
									<%		}
										}
									%>
									</html:select >
								</td>
							</tr>
							<tr style="height:50px;">	
								<td align="center" >
									<br/>
									<br/>
									<input type="button" onClick="return deactive_EBanking()" value="<bean:message bundle='<%=lang%>' key='7119'/>" class="button" style="height:35px;width:80px;border:none;font-size:12pt;">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</html:form> -->

		<div class="container">

			<form action="/request/reqchk.do">
				<div class="container">
					<!-- Breadcrumb container inside targetDiv -->
					<div class="breadcrumb-container">
					  <div class="row">
						<div class="col">
						  <div class="breadcrumb">
							<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
							<div class="breadcrumb-item"><a>Request</a></div>
							<div class="breadcrumb-item">Deactivate E-Banking Account</div>
						  </div>
						</div>
					</div>
					</div>
				<div class="border p-4 shadow-lg">
					<h5 class="mb-4 text-center"><label class="badge bg-primary">Request for Deactivation of E-Banking Account</label></h5>
					<div class="row justify-content-center mb-3">
					<div class="col-md-6">
						<label for="accountNumber" class="form-label">Account Number:</label>
						<select class="form-select form-select-lg" name="accountNumber" id="sAccList">
						<!-- Replace the dynamic options here (using server-side code) -->
						<%
											if(usrInfo!=null)
											{
												String accNo = "";
												for(int i=0; i<usrInfo.length; i++)
												{
													//accNo = usrInfo[i][1]+"-"+usrInfo[i][0];
													accNo =usrInfo[i][0];
										%>
													<option value='<%=accNo%>'><%=accNo%><option>
										<%		}
											}
							%>
						</select>
					</div>
					</div>
					<div class="text-center">
					<input type="button" onClick="return deactive_EBanking()" value="<bean:message bundle='<%=lang%>' key='7119'/>" class="btn btn-primary btn-lg">
					</div>
				</div>
			</form>
		</div>
		  
	</body>
