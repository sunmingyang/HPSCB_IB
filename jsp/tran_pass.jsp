<%@ include file="/common/Include.jsp" %>
<% String prev=(String)request.getParameter("prev"); 
String prevpg=(String)request.getAttribute("pre_pg"); 

if(prevpg!=null){
	session.setAttribute("prevTransPage",prevpg);
}

String prevTransPg  = "";
if(session.getAttribute("prevTransPage")!=null){
prevTransPg = (String)session.getAttribute("prevTransPage");
}

%>
<%String usrName = (String)session.getAttribute("user");
%>
<jsp:include page="/dashBoard/dashboardNew.jsp" />

<html:form action= "/jsp/login">

<table align="left" class="wrapperDataTable   container" style="width: 100%;"  >

	<tr >
	<%if(prevTransPg.equals("debCard")){%>
		<%  if(request.getParameter("success")!=null )
		{%>
	
		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> <a href="/openaction.do?src=debCard">Address Change Request</a></div>
						<div class="breadcrumb-item"><a>Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
		<%} else {%>
		<td class="wrapperDataTableTR" align="center"><font face="Verdana, Arial, Helvetica, sans-serif">Request >> Apply for Debit Card >> Transaction Password Entry</font></td>
		<%}%>
	<%}%>
	<%if(prevTransPg.equals("newChk")){%>
		<%  if(request.getParameter("success")!=null )
		{%>
	
		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> <a href="/openaction.do?src=newChk"> Order a new cheque book</a></div>
						<div class="breadcrumb-item"><a>Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
		<%} else {%>
		
		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> <a href="/openaction.do?src=newChk"> Order a new cheque book</a></div>
						<div class="breadcrumb-item"><a>Transaction Password Entry</a></div>
					</div>
				</div>
			</div>
		</div>
		<%}%>
	<%}%>
	<%if(prevTransPg.equals("stopChk")){%>
		<%  if(request.getParameter("success")!=null )
		{%>
		

		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> <a href="/openaction.do?src=stopChk"> Stop cheque request</a></div>
						<div class="breadcrumb-item"><a>Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
		<%} else {%>
		

		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> <a href="/openaction.do?src=stopChk"> Stop cheque request</a></div>
						<div class="breadcrumb-item"><a>Transaction Password Entry</a></div>
					</div>
				</div>
			</div>
		</div>
		<%}%>
	<%}%>
	<%if(prevTransPg.equals("chkStatus")){%>
		<%  if(request.getParameter("success")!=null )
		{%>
		

		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> <a href="/openaction.do?src=chkStatus"> Cheque Status Enquiry</a></div>
						<div class="breadcrumb-item"><a>Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
		<%} else {%>
		

		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> <a href="/openaction.do?src=chkStatus"> Cheque Status Enquiry</a></div>
						<div class="breadcrumb-item"><a>Transaction Password Entry</a></div>
					</div>
				</div>
			</div>
		</div>
		<%}%>
	<%}%>
	<%if(prevTransPg.equals("ldebcard")){%>
		<%  if(request.getParameter("success")!=null )
		{%>
		

		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> <a href="/openaction.do?src=ldebcard">Intimation For Loss of ATM Card </a></div>
						<div class="breadcrumb-item"><a>Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
		<%} else {%>
		
		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> <a href="/openaction.do?src=ldebcard">Intimation For Loss of ATM Card </a></div>
						<div class="breadcrumb-item"><a>Transaction Password Entry</a></div>
					</div>
				</div>
			</div>
		</div>
		<%}%>
	<%}%>
	<%if(prevTransPg.equals("AddrChangeReq")){%>
		<%  if(request.getParameter("success")!=null )
		{%>
		

		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> <a href="/openaction.do?src=AddrChangeReq">Address Change Request </a></div>
						<div class="breadcrumb-item"><a>Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
		<%} else {%>
		
		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Request</a></div>
						<div class="breadcrumb-item"> <a href="/openaction.do?src=AddrChangeReq">Address Change Request </a></div>
						<div class="breadcrumb-item"><a>Transaction Password Entry</a></div>
					</div>
				</div>
			</div>
		</div>
		<%}%>
	<%}%>
	</tr>
	<tr>
		<td align="center">
		
	
		<%  if(request.getParameter("success")!=null )
		{
		%>
	

		<div class="container "  style="width: 80%; margin-left: 200px; "  >
			<div class="row justify-content-center align-items-center box-sec   mt-5 p-4" style="width: 100%;">
			  <div class="">
				<div class="normalHeadText text-center">
				  <bean:message bundle='<%=lang %>' key='7220'/> &nbsp;!!!&nbsp;
				</div>
				<div class="text-center mt-2">
				  <button type="button" class="btn btn-primary" onclick="trback()">Back</button>
				</div>
			  </div>
			</div>
		  </div>
		  
		  
		<% 
		}else {%>


	
	<table class="container" >
		

		<div class="container text-center">
			<h2 class="wrapperDataTableTR  badge bg-primary p-2 fs-6 mt-5 ">Enter Transaction Password !!!</h2>
		</div>
		<tr >
		<td>

			<div class=" container justify-content-center align-items-center box-sec   mt-5 p-2" style="width: 80%;">
				<div class="row justify-content-center">
				  <div class="col-md-6">
					
					  <div class="mb-3">
						<label for="sIbUsr_TrnPass" class="form-label">Enter Password:</label>
						<input type="password" class="form-control" name="sIbUsr_TrnPass" id="sIbUsr_TrnPass" size="15" onKeyPress="isValidNumAlpha()">
					  </div>
					  <input type="hidden" id="sPrev_page" class="form-control" name="sPrev_page" value="<%=prev %>">
					  <% if( request.getParameter("error")!=null ) {
						  if (request.getParameter("error").equalsIgnoreCase("invalid")) { 
							  String prev_page=(String)request.getAttribute("prev_page");
							  if(prev_page!=null) {
								  prev=prev_page;
								  System.out.print("999999999"+prev_page);
							  } %>
							  <div class="alert alert-danger" role="alert">Invalid transaction Password!!!</div>
					  <% } } %>
					  <div class="mb-3 text-center">
						<button class="btn btn-primary" onclick="TransPass_submit('<%= prev %>')" type="button">
						  <bean:message bundle="<%=lang%>" key='86'/>
						</button>
						<button class="btn btn-primary" onclick="trback()" type="button">Back</button>
					  </div>
					
				  </div>
				</div>
			  </div>
			  
			</td>
		</tr>
		</table>

		<%}%>
		</td>
	</tr>
</table>
</html:form>

<script>
function trback()
{
	//alert('<%=prevTransPg%>');
	document.forms[0].action="/openaction.do?src="+'<%=prevTransPg%>'+"";
	document.forms[0].submit();
	
}

</script>





