<%@ include file='/common/Include.jsp' %>
<%
	String usrInfo[][] = (String[][])session.getAttribute("userInfo");	
int len=0;
String usrType=(String)session.getAttribute("validToken");
if(usrInfo != null)
	{
			len = usrInfo.length;
	}
	String usrName = (String)session.getAttribute("user");

 	HashMap req_detail=(HashMap)session.getAttribute("req_detail");   
	String address="";
	String phone="";
	String mobile="";
	String accno="";
	if(req_detail!=null)
	{
		ArrayList chk_desc=(ArrayList)req_detail.get("req_desc");
		ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
		String desc=(String)chk_desc.get(Integer.parseInt((String)request.getParameter("row"))) ;
//        System.out.println("the value of description is  this -----"+desc);
		accno=(String)acc_nums.get(Integer.parseInt((String)request.getParameter("row"))) ;
		if(desc!=null){
		address=desc.substring(10,desc.indexOf(";phone="));
		phone=desc.substring(desc.indexOf(";phone=")+7,desc.indexOf(";mobile="));
		mobile=desc.substring(desc.indexOf(";mobile=")+8);
//        System.out.println("the value of mobile no  is  this -----"+mobile);
		}
	}

%>


<html>
<jsp:include page="/dashBoard/dashboardNew.jsp" />
<body>

<div class="breadcrumb-container">
	<div class="row">
		<div class="col">
			<div class="breadcrumb">
				<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
				<div class="breadcrumb-item"><a>Request</a></div>
				<div class="breadcrumb-item">Address Change Request</div>
			</div>
		</div>
	</div>
</div>


<div class="d-flex justify-content-center col-md-12">
	<div class="card box-sec container">
		<div class="card-body">
			<form action="/request/reqchk.do">
				<div class="row mb-3">
					<div class="col">
						<label for="sAccList" class="normalHeadText">Account No :</label>
						<%
						if (req_detail == null) {
						%>
							<select class="form-control" name="sAccList" id="sAccList">
								<%
								if (len != 0) {
									System.out.println("NOT IN ELSE");
									String accNo = "";
									for (int i = 0; i < len; i++) {
										accNo = usrInfo[i][1] + "-" + usrInfo[i][0];
								%>
										<option value='<%=accNo%>'><%=accNo%></option>
									<%
									}
								}
								%>
							</select>
							<input type="button" value="Detail" onclick="getdetail()" class="btn btn-primary" />
						<%
						} else {
							System.out.println("IN THE ELSE");
						%>
							<select class="form-control" name="sAccList" id="sAccList" disabled="true">
								<option value="accno"><%=accno%></option>
							</select>
							<input type="button" value="Detail" class="btn btn-primary" disabled/>
						<%
						}
						System.out.println("Account number in Address Change is  " + accno);
						%>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col">
						<table class="table table-bordered">
							<tr>
								<th class="normalHeadText" scope="col" align="right" valign="top" width="194">Address :</th>
								<td>
									<%
									if (req_detail == null) {
									%>
										<textarea class="form-control" name="address" rows="5" cols="30" onblur="checkAddr()"></textarea>
									<%
									} else {
									%>
										<textarea class="form-control" name="address" rows="5" cols="30" disabled="true"><%=address%></textarea>
									<%
									}
									%>
								</td>
							</tr>
							<tr>
								<th class="normalHeadText" scope="col" align="right">Phone No. :</th>
								<td>
									<%
									if (req_detail == null) {
									%>
										<input class="form-control" type="text" name="phoneno" size="20" maxlength="15" onkeypress="javascript:isValidNumber()" />
									<%
									} else {
									%>
										<input class="form-control" type="text" name="phoneno" size="20" value="<%=phone.trim()%>" maxlength="15" readonly="true" />
									<%
									}
									%>
								</td>
							</tr>
							<tr>
								<th class="normalHeadText" scope="col">Mobile No. :</th>
								<td>
									<%
									if (req_detail == null) {
									%>
										<input class="form-control" type="text" name="mobile" size="20" maxlength="15" onkeypress="javascript:isValidNumber()" />
									<%
									} else {
									%>
										<input class="form-control" type="text" name="mobile" size="20" maxlength="15" readonly="True" value="<%=mobile.trim()%>" />
									<%
									}
									%>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<%
									if (req_detail == null) {
									%>
										<input type="button" value="Edit" onclick="editctr()" class="btn btn-primary" />
									<%
									} else {
									%>
										<input type="button" value="Edit" disabled class="btn btn-primary" />
									<%
									}
									%>
								</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="row mb-3">
					<%
					if (req_detail == null) {
					%>
						<div class="col">
							<label for="sIbUsr_TrnPass" class="normalHeadText">Enter Transaction Password :</label>
							<input class="form-control" type="password" name="sIbUsr_TrnPass" maxlength="20" />
						</div>
					<%
					}
					%>
				</div>

				<div class="row">
					<div class="col text-center">
						<input type="button" name="save" value="Save" onclick="saveData()" disabled=true class="btn btn-primary" />
					</div>
				</div>
			</form>

			<div id="diverrmessage" class="errorInfoText">
				<logic:messagesPresent property="NoServer">
					<html:errors property="NoServer" />
				</logic:messagesPresent>
				<logic:messagesPresent property="FatalError">
					<html:errors property="FatalError" />
				</logic:messagesPresent>
				<logic:messagesPresent property="InvalidTranPass">
					<html:errors property="InvalidTranPass" />
				</logic:messagesPresent>
			</div>
		</div>
	</div>
</div>
</body>

<script>
	document.body.addEventListener('DOMContentLoaded', loadfun());

function editctr()
{
	document.getElementById("address").readOnly=false;
	document.getElementById("phoneno").readOnly=false;
	document.getElementById("mobile").readOnly=false;
	document.getElementById("save").disabled=false;
	document.getElementById("address").focus();
}
function getdetail()
{
document.forms[0].action="/request/reqchk.do?action=showAddressInfo";
document.forms[0].submit();
}
function saveData()
{

	if(document.getElementById("sIbUsr_TrnPass").value=="")
	{
		alert("Please Enter Transaction Password");
		return false;
	}
<%session.setAttribute("prevTransPage","AddrChangeReq");%>
document.forms[0].action="/request/reqchk.do?action=saveAddressInfo";
document.forms[0].submit();
}
function loadfun()
{
	document.getElementById("address").readOnly="true";
	document.getElementById("phoneno").readOnly="true";
	document.getElementById("mobile").readOnly="true";
}
function checkAddr()
{
	var addValue=document.getElementById("address").value;
	var alength=addValue.length;
	if(alength>25)
	{
		document.getElementById("address").value=addValue.substring(0,25);
	}
}
function backPage()
{
<% if(usrType.equals("admin")){%>
window.location.href="/IBReqProcess/IbreqProcess.jsp";
	<%}
	else if(usrType.equals("ibUser")){%>
	window.location.href="/request/reqChk.jsp";
		<%}%>
}
</script>
</html>