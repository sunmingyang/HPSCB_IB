<%@ include file='/common/Include.jsp' %>
<%@ page import="easycbs.bancmateib.common.dto.BMConfig" %>
<%String usrName = (String)session.getAttribute("user");
String usrInfo[][]=(String[][])session.getAttribute("userInfo"); 
								
%>


<script type="text/javascript">
	function deactivateAtm()
	{
		alert("wihtin deactivate ATM")
		
		var userId=<%=session.getAttribute("userid")%>;
		alert("user id is"+userId)
		var token =<%=session.getAttribute("token")%>;
		alert("token is"+token)
		var message="";
		var a=document.getElementById("sAccList").value;
		var url="/AccountInfoAction.do?action=atmDeactivateBySMS&accountNo="+a+"&userid="+<%=session.getAttribute("userid")%>+"&Token="+<%=session.getAttribute("token")%>;
	
		http.open("post",url,false);
		 http.onreadystatechange= function (){
										try{
											var resArray1=http.responseText;
											var jsonData1=JSON.parse(resArray1);
										
											if(jsonData1=="Y")
											{
							       				message="ATM Deactivated Successfully";
									
											}
											else
											{
												message="ATM not deactivated Successfully";
									
											}
										}
										catch(e)
										{ 
										
										}
										alert(message);
										

								};
								 http.send(null);			 
		
	}
// document.body.addEventListener('DOM')

</script>
<jsp:include page="/dashBoard/dashboardNew.jsp" />
<body >

<html:form action="/request/reqchk.do" >

<table align="left" class="wrapperDataTable " style="width: 100%;">
	
	<div class="breadcrumb-container">
		<div class="row">
			<div class="col">
				<div class="breadcrumb">
					<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
					<div class="breadcrumb-item"><a>Request</a></div>
					
					<div class="breadcrumb-item"><a>Deactivate ATM</a></div>
				</div>
			</div>
		</div>
	</div>

	<div class="container text-center">
		
		<h2 class="wrapperDataTableTR  badge bg-primary p-2 fs-6s"> Request for ATM Deactivation !!!!!!!!</h2>
	</div>
	
	<tr>
		<td align="center">

<%  if(request.getParameter("success")!=null )
{
%>
<bean:message bundle='<%=lang %>' key='7220'/>
<% 
} 
%>

<%  if(request.getParameter("error")!=null )
{
%>
<bean:message bundle='<%=lang %>' key='626'/>
<% 
} 
%>

<div class="container "  style="width: 80%; "  >
	<div class="row justify-content-center align-items-center box-sec   mt-5 p-4" style="width: 100%;">
	 
		
		<div class="text-left mt-2 col-md-6">
			<label for="sAccList" class="normalHeadText d-flex ">Select Account Number:</label>
			<select class="form-select" id="sAccList">
				
					<% String accNo = "";
					for (int i = 0; i < usrInfo.length; i++) {
					  accNo = usrInfo[i][1] + "-" + usrInfo[i][0];%>
					  <option value="<%=accNo%>"><%=accNo%></option>
					<%}%>
				 
			</select>
		</div>
		<div class="text-center mt-3">
			<!-- <button class="btn btn-primary" onClick="return deactivateAtm()"><bean:message bundle='<%=lang%>' key='7119'/></button> -->
			<input type="button" class="btn btn-primary" onClick="return deactivateAtm()" value="<bean:message bundle='<%=lang%>' key='7119'/>">
		</div>
	
	</div>
  </div>
  
</td>
</tr>
</table>
</html:form>
</body>
