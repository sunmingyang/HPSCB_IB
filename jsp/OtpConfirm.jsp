
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


<html:form action= "/jsp/login">
<br>
<table align="left" class="wrapperDataTable " style="width: 100%;" >

	<tr >
	<%if(prevTransPg.equals("debCard")){%>
		<%  if(request.getParameter("success")!=null )
		{%>
	

		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=debCard">  Apply for Debit Card</a></div>
						<div class="breadcrumb-item"><a> Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
		<%} else {%>
		
		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=debCard">  Apply for Debit Card</a></div>
						<div class="breadcrumb-item"><a> Transaction Password Entry</a></div>
					</div>
				</div>
			</div>
		</div>
		<%}%>
	<%}%>
	<%if(prevTransPg.equals("newChk")){%>
		<%  if(request.getParameter("success")!=null )
		{%>
		
		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=newChk"> Order a new cheque book</a></div>
						<div class="breadcrumb-item"><a> Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
		<%} else {%>
		

		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=newChk"> Order a new cheque book</a></div>
						<div class="breadcrumb-item"><a> Transaction Password Entry</a></div>
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
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=chkStatus"> Cheque Status Enquiry</a></div>
						<div class="breadcrumb-item"><a>  Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
	  	<%} else {%>
		

		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=stopChk"> Stop cheque request</a></div>
						<div class="breadcrumb-item"><a> Transaction Password Entry</a></div>
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
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=chkStatus"> Cheque Status Enquiry</a></div>
						<div class="breadcrumb-item"><a> Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
		<%} else {%>
		

		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=chkStatus"> Cheque Status Enquiry</a></div>
						<div class="breadcrumb-item"><a> Transaction Password Entry</a></div>
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
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=ldebcard"> Intimation For Loss of ATM Card</a></div>
						
						<div class="breadcrumb-item"><a> Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
		<%} else {%>
		

		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=ldebcard"> Intimation For Loss of ATM Card</a></div>
						
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
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=AddrChangeReq">Address Change Request </a></div>
						
						<div class="breadcrumb-item"><a> Transaction Status</a></div>
					</div>
				</div>
			</div>
		</div>
		<%} else {%>
		
		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a>request</a></div>
						<div class="breadcrumb-item"><a  href="/openaction.do?src=AddrChangeReq">Address Change Request </a></div>
						
						<div class="breadcrumb-item"><a> Transaction Password Entry</a></div>
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
		<table cellspacing="10" width="350">
			<tr  height="20">
				<td class="normalHeadText" align="center">
					<bean:message bundle='<%=lang %>' key='7220'/> &nbsp;!!!&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
					<input type="button" value="Back" onclick="trback()" ></td>
			</tr>
		</table>
		<% 
		}else {%>


	
	<table class="container justify-content-center align-items-center box-sec   mt-5 p-4" style="width: 80%;" >
		

		<div class="container text-center tableHeader  col-md-6">
			<h2 class="wrapperDataTableTR  badge bg-primary p-2 fs-6s">   Enter Your Otp !!</h2>
		</div>
		<tr bgcolor="#F2F2F2">
		<td align="center">

			<table class="container">

			
			<tr class="row" >
				<div class="row">
					<td class="normalHeadText col-md-4 mb-3 p-4">
						<label class="normalHeadText"><bean:message bundle="<%=lang%>" key= "7458"/> :</label>
						<input type="text" class="form-control" name="sIbUsr_TrnPass" id="sIbUsr_TrnPass" onKeyPress="isValidNumAlpha()">
					  </td>
				</div>
				
			  </tr>
			  
    			<input type="hidden"  id="sPrev_page" name="sPrev_page" value='<%=prev %>'>
			<%
			if( request.getParameter("error")!=null )
			{
				if (request.getParameter("error").equalsIgnoreCase("invalid"))
				{ 
					String prev_page=(String)request.getAttribute("prev_page");
					if(prev_page!=null)
					{
						prev=prev_page;
						System.out.print("999999999"+prev_page);
					}%>
			
			<tr>
     			<td align="center" class="errorInfoText">Your Otp did not match</td>
    		</tr>
			<%
				}
			}%>

				<tr>
					<td class=" text-center"> 
						 <button type="button" class="btn btn-primary" onclick="TransPass_submit('<%= prev %>')">
						<bean:message bundle='<%=lang%>' key='86'/>
					  </button>
					  <button type="button" class="btn btn-secondary" onclick="trback()">
						Back
					  </button>
				</tr>
				
					
				 
				  
				  
			</table>
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
	debugger;
	alert("fweffhfslkfsfskfslkf");
	//alert('<%=prevTransPg%>');
	document.forms[0].action="/openaction.do?src="+'<%=prevTransPg%>'+"";
	document.forms[0].submit();
}


</script>





