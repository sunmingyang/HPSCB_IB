<%@ include file="/common/Include.jsp" %> 
<script language="JavaScript" src="/scripts/MD5.js"></script> 
<link rel = "stylesheet" href="/scripts/table.css"  type = "text/css">
<script language="JavaScript" src="fundtransfer/scripts/fund.js"></script>    
<%
String accountList="" ; 
String [] AccListArr= null ; 
String openFor="",custRole="",userid="";
userid = (String)session.getAttribute("userid");
if (session.getAttribute("allAccountlist") != null ) { 
	accountList=(String)session.getAttribute("allAccountlist");
	System.out.println("FundAccountList----------------"+accountList);
	AccListArr =accountList.split(",");
}

String  date=DateTimeFunction.getIbDateTime();
		String time[]=date.split(" ")[1].split(":");
		date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);

String mob=(String)session.getAttribute("customerMobile");
int errorcount=0; 
String usrName = "";   
String fundinfo[][] = null ;
if(request.getParameter("mode")!=null && request.getParameter("mode").equals("S"))
	fundinfo = (String[][])session.getAttribute("FUNDINFO_S");   
else if(request.getParameter("mode")!=null && request.getParameter("mode").equals("O"))
	fundinfo = (String[][])session.getAttribute("FUNDINFO_O");   
else 
	fundinfo = (String[][])session.getAttribute("FUNDINFO");   


if(session.getAttribute("user") != null)
	usrName = (String)session.getAttribute("user");

String login_id="";
if(session.getAttribute("userid")!=null){
	login_id = (String)session.getAttribute("userid");//New changes on 16/07/2008;
}
String sessionId= session.getId() ;
      
String res="";
if(session.getAttribute("response") != null)
{
	res= (String)session.getAttribute("response");
}
String accNo="";
if(session.getAttribute("beneaccountNo") != null)
{
	accNo= (String)session.getAttribute("beneaccountNo");
}
String mode=(String)session.getAttribute("VALUE");

System.out.println("mode is ----------------"+mode);
session.removeAttribute("VALUE");
custRole=(String)session.getAttribute("custRole");

    System.out.print("session Attribute is not null and value is ::::"+(String)session.getAttribute("openFor"));
    session.removeAttribute("openFor");
    System.out.print("session Attribute value is ::::"+(String)session.getAttribute("openFor"));
   

if(request.getParameter("jspopenFor") != null) {
	 openFor = request.getParameter("jspopenFor");
  System.out.print("PAram jspopenFor is :::"+request.getParameter("jspopenFor"));
}

//String sPendingListJson=(String)session.getAttribute("sVoucherData");
String aPendingListarr[][] =(String[][])session.getAttribute("aVoucherData");
session.removeAttribute("aVoucherData");
// set fund Transfer mode
String sfundTranMode="" ;
if(session.getAttribute("FUNDINFO_O") != null) { 
	sfundTranMode = "OtherBank";
	System.out.println("Fund Transfer Mode is  "+mode); 
	System.out.println("sfundTranMode is  "+sfundTranMode); 
	session.removeAttribute("FUNDINFO_O"); 

} 
if(session.getAttribute("FUNDINFO_S") != null) {
	sfundTranMode = "SameBank";
	System.out.println("Fund Transfer Mode is "+mode); 
	System.out.println("sfundTranMode is  "+sfundTranMode);
	session.removeAttribute("FUNDINFO_S");
}


// purpose come when Authorization data arrive at JSP and it is use  SameBank etc
if(session.getAttribute("purpose") != null) { 
	sfundTranMode = (String)session.getAttribute("purpose");
	System.out.println("purpose is "+sfundTranMode);
	session.removeAttribute("purpose"); 
}

String purp = request.getParameter("purpose");
	System.out.println("purpose is --------"+purp); 
if(sfundTranMode!=null) {
	mode=sfundTranMode ; // assign mode (P2P /P2A to sFtran and send this to Action)
	System.out.println("Mode is not null here and value is::"+sfundTranMode); 
}

String impsmode = (String)request.getParameter("mode");
System.out.println("Mode from URL for IMPS is::"+impsmode); 

String sMod = (String)request.getParameter("sMode");
System.out.println("sMode  from URL(Oper/Auth) is::"+sMod); 
// added by  geetika
if(mode!=null && mode.equals(""))
{
	mode = impsmode;
}
%>  

<script>	
var sTranMode = '<%=sfundTranMode%>'; // FUNDINFO_S -samebank ;FUNDINFO_O --> Otherbank 
// alert("sTranMode"+sTranMode);
var custrole='<%=custRole%>';
var jspOpenFor = '<%=openFor%>'; // A--> authorization ,then, disable some fiels; E--> Edit
var sMode='<%=sMod%>'; // operation / CIBAuth 
var impsMode = '<%=impsmode%>';
// alert("open for "+ '<%=openFor%>');
var pur = '<%=purp%>';  
//alert("pur:::"+ '<%=purp%>');
var mytotalJsonString = '';
// alert("open for "+ '<%=openFor%>');
</script>
<style>
	label{
		display: flex;
	}
</style>
<html:form action="/TransactionAction.do">
<body>
<input type = "hidden" id = "userid" value = "<%=login_id%>">
<%if(((fundinfo!=null) && (!openFor.equals("A")) && (!openFor.equals("E")))) {%> 
<table  class="wrapperDataTable  container" style="width: 100%;" >
	
		<!-- <tr>
			<td  class="wrapperDataTableTR" align="center" > Fund Transfer >> <%=sfundTranMode%></td>
		</tr> -->
		<div class="breadcrumb-container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb">
						<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
						<div class="breadcrumb-item"><a>Fund Transfer</a></div>
						<div class="breadcrumb-item"><%=sfundTranMode%></div>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="container text-center">
			<h2 class="wrapperDataTableTR  badge bg-primary p-2 fs-6s">  Fund Transfer >> <%=sfundTranMode%></h2>
		</div> -->
		<tr >
			<td align="center"  >
				<div  class="row justify-content-center align-items-center box-sec   mt-5 p-4" style="width: 100%;">
					<div class="row">
					  <div class="col-md-3">
						<label class="normalHeadText">Acc No. From</label>
						<select name="sUsrList1" list="AccountNoList" listkey="custId" listValue="accountNo" id="accList" class="form-select" onChange="mobileNo()">
						  <% if (AccListArr != null) for (int i = 0; i < AccListArr.length; i++) { %>
						  <option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
						  <% } %>
						</select>
					  </div>
					  <div class="col-md-3">
						<label class="normalHeadText">Customer Mobile No.</label>
						<input type="text" size="20" class="form-control" readonly="true" value="<%=mob%>" id="UserMobile" />
					  </div>
					  <div class="col-md-3">
						<label class="normalHeadText">Select Beneficiary</label>
						<select id="sNickName" class="form-select" onchange="getAccNo()">
						  <option value="-1">--Select--</option>
						  <% if (fundinfo != null) {
							  for (int i = 0; i < fundinfo.length; i++) {
								String value = fundinfo[i][2] + "~" + fundinfo[i][7] + "~" + fundinfo[i][1] + "~" + fundinfo[i][3] + "~" + fundinfo[i][10];
							%>
						  <option value='<%=value%>'><%=fundinfo[i][0]%></option>
						  <% }
							} %>
						</select>
					  </div>
					  <div class="col-md-3">
						<label class="normalHeadText">Beneficiary Account Number:</label>
						<input type="text" size="20" class="form-control" readonly="true" id="sPayeeAcc" />
					  </div>
					</div>
					<% if (mode.equals("P2P")) { %>
					<div class="row">
					  <div class="col-md-3">
						<label class="normalHeadText">MMID:</label>
						<input type="text" name="mmid" id="mmid" onkeypress="isValidNumber()">
					  </div>
					  <div class="col-md-3">
						<label class="normalHeadText">Beneficiary Mobile Number:</label>
						<input type="text" size="20" id="benMob" />
					  </div>
					</div>
					<% } %>
					<div class="row mt-2">
					  <div class="col-md-3">
						<label class="normalHeadText ">Amount:</label>
						<input type="text" name="amount" id="amount" class="form-control" value=".00">
					  </div>
					  <% if (!(mode.equals("P2P") || mode.equals("P2A"))) { %>
					  <div class="col-md-3">
						<label class="normalHeadText">Schedule Transfer:</label>
						<select id="isSchedule" value="N" onchange="showScheduleDiv()">
						  <option value="Y">Yes</option>
						  <option value="N">No</option>
						</select>
					  </div>
					  <div class="col-md-3" id="schTable" style="display:none;">
						<label class="normalHeadText">Schedule Start Date:</label>
						<input type="text" id="schDate" onkeypress="isValidDatechar('')" maxlength="10" placeholder="dd/mm/yyyy" value="<%=date%>" />
						<input type="hidden" value="<%=date%>" id="tDate" />
						<b>(dd/mm/yyyy)</b>
						<br>
						<label>Time:</label>
						<select id="schTime_hr" value="10">
						  <% for (int i = 0; i <= 23; i++) {
								String t = i + "";
								if (i <= 9) t = "0" + t;
							%>
						  <option value="<%=t%>"><%=t%></option>
						  <% } %>
						</select>
						Hrs.
						<select id="schTime_min" value="<%=time[1]%>">
						  <% for (int i = 0; i <= 59; i++) {
								String t = i + "";
								if (i <= 9) t = "0" + t;
							%>
						  <option value="<%=t%>"><%=t%></option>
						  <% } %>
						</select>
						Mins.
						<br>
						<font color="red" style="font-weight: normal;font-family: cursive;">
						  (Transaction will be processed after the selected date and time)
						</font>
					  </div>
					  <div class="col-md-3">
						<label class="normalHeadText">Payment Type:</label>
						<select id="paymentType" onchange="showPeriodicityDiv()" style="width:140px">
						  <option value="O">One Time</option>
						  <option value="R">Recurring</option>
						</select>
					  </div>
					  </div>
					  <div class="row" id="periodicityDiv" style="display:none;width:140px;">
						<div class="col-md-3">
						  <label class="normalHeadText">Periodicity:</label>
						  <select id="periodicity">
							<option value="-1">--Select Periodicity--</option>
							<option value="D">Daily</option>
							<option value="W">Weekly</option>
							<option value="F">FortNight</option>
							<option value="M">Monthly</option>
							<option value="B">Bi-Monthly</option>
							<option value="Q">Quarterly</option>
							<option value="H">Half-Yearly</option>
							<option value="Y">Yearly</option>
						  </select>
						</div>
					  </div>
					  <% } %>
					
					  <div class="col-md-6">
						<label class="normalHeadText">Remark:</label>
						<input type="text" class="form-control" name="remark" id="remark">
					  </div>
				
					<% if (custRole.equals("S") || ((custRole.equals("C") && openFor.equals("A")))) { %>
					<div class="row">
					  <div class="col-md-3">
						<label class="normalHeadText">Enter Transaction Password:</label>
						<input type="password" name="txnpass" id="txnpass" maxlength="16" value="">
					  </div>
					</div>
					<% } else { %>
						<!-- <div class="row">
							<div class="col-md-3 d-flex justify-content-center">
							  <button type="button" onClick='otp_number("<%=DateTimeFunction.getIbDateTime()%>")' class="btn btn-primary">Pay</button>
							</div>
						  </div> -->

						  <div class="container">
							<div class="row justify-content-center">
								<div class="col-md-4">
									<!-- Replace the button element with the Bootstrap styled button -->
									<button type="button" onClick='otp_number("<%=DateTimeFunction.getIbDateTime()%>")' class="btn btn-primary btn-sm mt-2">Pay</button> 
								</div>
							</div>
						</div>
						  
					<div class="d-flex" >
					  <div class="col-md-3 justify-content-left " >
						<label class="normalHeadText">Enter OTP:</label>
						<input type="text" class="form-control" name="otp" id="otp">
					  </div>
					</div>
					<% } %>
					
						<div class="container d-flex mt-2">
							<% if (custRole.equals("S") || custRole.equals("E") && !(openFor.equals("A")) && !(openFor.equals("E"))) { %>
								<input type="button" onClick="otp_confirm()" class="Button btn btn-primary button btn-sm" id="createEntry" style="width:100px" value="Create Entry" />
								<% } else { %>
								<!-- <input type="button" class="button" onClick='fundTrRetail("<%=DateTimeFunction.getIbDateTime()%>")' style="width:100px" value="Confirm" /> -->
		
								<div class="container ">
									<div class="row justify-content-center ">
										<div class="col-md-4">
											<!-- Replace the button element with the Bootstrap styled button -->
											<button type="button" class="btn btn-primary button btn-sm" onClick='fundTrRetail("<%=DateTimeFunction.getIbDateTime()%>")'   value="Confirm">Confirm</button>
										</div>
									</div>
								</div>
								<% } %>
							
								<!-- <html:button property="back" styleClass="button" onclick="bacck()">
								  <bean:message bundle="hindi" key='843' />
								</html:button> -->
								<div class="container">
									<div class="row justify-content-center">
										<div class="col-md-4">
											<!-- Replace the button element with the Bootstrap styled button -->
											<button type="button" class="btn btn-primary button btn-sm" onclick="bacck()">
												<bean:message bundle="hindi" key='843' />
											</button>
										</div>
									</div>
								</div>
								
						</div>
						
					  </div>
					
				  
				<script>
				if(jspOpenFor === 'A')
				{     
					document.getElementById("ftran_operation").style.display = "none";

				} 
				</script>


				<%}%>
				<% 
			if (openFor.equals("A") || openFor.equals("E")) { %>
			<table id = "acctbl">
			<tr>
							<td style="width:50%">
								Acc No. From
							</td>
							<td>
								<select name="sUsrList1" list="AccountNoList" listkey="custId" listValue="accountNo" style="width:150" id="accList" onChange="mobileNo()">
								<%
									if (AccListArr != null)
										for(int i=0;i<2;i++){%>
										<option value='002010173192'>002010173192</option>
											<option value='000022000001'>000022000001</option>
								<%}%>
								</select>  
							</td> 
						</tr>
						</table>
			<% if(aPendingListarr != null) {
			 %>
		
  					<div border="10 px:solid" style="
    border: 1px solid black;
    border-radius: 20px;">
<table width = "98%">
<tr>
<td align = "left">
<td>
<p  id = "label">
</td>
<td align = "right"> <p><u style="color: blue;"> <B><%=date%></B></td>
</tr>&nbsp;
<tr>				
<td colspan = "2">
<p align = "left" bgcolor="blue" id = "label" style="
    background-color: #cccccc;"> <b> Link below  enable you to edit/authorise transactions.</b></p>
</td>
</tr>
				<script>
					debugger;
					if(sMode==='CIBAuth'){
			    	document.getElementById("label").innerHTML='<u style="color: blue;"> <B>Authorise Fund  Transfer</B></u>';
					} else
					{
				   document.getElementById("label").innerHTML='<u style="color: blue;"> <B>Authorise Fund  Transfer</B></u>';
					} 
					</script>
				<!--	</div>
				<div style="height:150px;overflow:auto"> -->
				<table  border="1" bordercolor="#ffffff" align="center" id = "table" style="width: 98%; table-layout: fixed;" cellpadding="0" cellspacing="0">	<tr>    
				<TD class="dataTableTH " width = "50px">
				<bean:message bundle="hindi" key= "357"/></TD>
				<TD class="dataTableTH" width = "50 px ">
				<bean:message bundle="hindi" key= "1710"/></TD> 
				<td class="dataTableTH" width = "105px "><bean:message bundle="hindi" key= "7086"/></td>
				<td  class="dataTableTH" width = "105px "> <bean:message bundle="hindi" key= "7088"/></td>
				<td class="dataTableTH" width = "105px "> <bean:message bundle="hindi" key= "7085"/></td>
				<td class="dataTableTH" width = "105px "> <bean:message bundle="hindi" key= "7453"/></td>
				<td class="dataTableTH" width = "105px "><bean:message bundle="hindi" key= "39"/></td>	
				<td class="dataTableTH" width = "105px "><bean:message bundle="hindi" key= "345"/></td>
				<td class="dataTableTH" width = "105px "><bean:message bundle="hindi" key= "1013"/></td>
				<td class="dataTableTH" width = "105px ">Remitance Account</td>
				<td class="dataTableTH" width = "20px "><bean:message bundle="hindi" key= "216"/></td>
				</tr> 	

				<% for(int i=0;i<aPendingListarr.length;i++) {
					%>
					<tr>
					<td class="dataTableTD">
					<input style="background-color:#BFBFBF;" name="sOut_req" type="checkbox" id="checkbox<%=i%>"  value="screen"  name="1" onclick="setUserId(this)">
								 </td>
					<td class="dataTableTD"><%=i+1%></td>
					<td class="dataTableTD"><%=aPendingListarr[i][1]%> </td>
					<td class="dataTableTD"><%=aPendingListarr[i][9]%> </td>
					<td class="dataTableTD"><%=aPendingListarr[i][0]%> </td>
					<td class="dataTableTD"><%=aPendingListarr[i][2]%> </td> 
					<td class="dataTableTD"><%=aPendingListarr[i][3]%> </td>
					<td class="dataTableTD"><%=aPendingListarr[i][4]%> </td>
					<td class="dataTableTD"><%=aPendingListarr[i][6]%> </td>
					<td style ="display:none" class="dataTableTD"> <%=aPendingListarr[i][8]%> </td>
					<td class="dataTableTD"> <%=aPendingListarr[i][11]%> </td>
					<td style="dataTableTD">
					<img src="images/editButton.png" alt="Edit" onclick = "editform(this);"/>
					</td>    

					<input type ="hidden" name="sessionID" id="sessionID" value="" >
					<input type ="hidden" name="sessionID" id="sessID" value="'<%=sessionId%>'" >
											
					</tr>
					<%} %> </table></table> 
					</div>
					

<!--EDit tble -->
<table border="2" bordercolor="#ffffff" align="center"  cellpadding="0" cellspacing="0" id="edittable"  style="display:none;margin-left: 340px;">
	<tr class="dataTableTH" ><td colspan = "2"><bean:message bundle="hindi" key= "2075"/></td></tr>
	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "1027"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtaccno" ></TD> <!--Name-->
	</tr>
   <tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "9"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtname" ></TD> <!--Name-->
  </tr>
   <tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7453"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtifcs" ></TD> <!--Name-->
</tr>
   	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7409"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtamnt" ></TD> <!--Name-->
   </tr>
   <tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "345"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtremark" ></TD> <!--Name-->
   </tr>
   <tr>
	 <input type = "hidden" id = "edtblktrd">
	 <TD class="dataTableTH" colspan = "2" >
	 <input type = "button" class = "button" id = "editbtn" value = "Edit" onclick = "editInfo('samebank');">
	 <input type = "button" class = "button"  value = "Back" onclick = "editinfoback(pur);">
	</TD>
	</tr> 
   
</table>
<!--EDit tble -->
	
					<% } else { %> 
					<div id="table_message" style="display:none;color:red;font-weight:bold;font-size:15px;">
			No Transactions Pending for authorization
		</div>
					
					<%} }%>
			<!--Page Buttons --> 
<table id = "btntable" align="center" style=" margin-left: 340px;" > 

<%if  (custRole.equals("S") || custRole.equals("E") || ((custRole.equals("C") && openFor.equals("A") ))) { %>
<tr> 	<td>  Enter Transaction Password:	
<input type ="password" name="txnpass" id="txnpass"  maxlength = "16"  value="" >   </td></tr>
 <%}%>
<tr><td colspan = "4">
<%if  (custRole.equals("S")|| custRole.equals("E") || ((custRole.equals("C") && openFor.equals("A") ))) { %>
		<input type="button" class = "Button" value="Reject Entry" id = "reject" onclick="rejectEntry();" /> 

<html:button property="back" styleClass = "Button" styleId = "back"  onclick="bacck()" >
<bean:message bundle="hindi" key='843'/></html:button>

<%}%>
 <%if  ((custRole.equals("S")||(custRole.equals("C"))) && openFor.equals("A") ) { %>
<input type="button" class = "Button"  id = "send" value="Authorize" onclick="otp_confirm();" />
<%}%>    

<%if((custRole.equals("S") || custRole.equals("E")) && !(openFor.equals("A")) && !(openFor.equals("E"))) {%>
<input type="button" onClick="otp_confirm()"  class = "Button"  id = "createEntry" style="width:100px" value="Create Entry"/> 
<%}%>
</td></tr> 
		</table>
		<br> 
		         <input type ="hidden" name="mode" id="mode" value="<%=mode%>" >				
            	<input type ="hidden" name="sessionID" id="sessionID" value= "" >
				<input type ="hidden" name="sessionID" id="sessID" value="'<%=sessionId%>'" >
				<input type ="hidden" name="payeeMob" id="payeeMob" >
				<input type ="hidden" name="IFSCcode" id="IFSCcode" >
				<input type ="hidden" name="tDate" id="tDate" value="<%=date%>" >
				<input type ="hidden" name="fundkid" id="fundkid" >
<% if(!(aPendingListarr!=null)) { %>
		<script>
         	        document.getElementById("btntable").style.display = 'none';
	      </script>
<%}%>
<div id = "cbrespdiv">
</div>	


					</body>
					</html:form>

				

					<script>
					
					function setUserIdOld(id)
					{
						document.getElementById("fundkid").value=id;
					} 

function fill(){
	<%if(openFor.equals("A")){%>
				document.getElementById("acctbl").style.display = "none";  //accDiv
				
			<%} else {%>
				 document.getElementById("accDiv").style.display = "block";
				 <% if(!(mode.equals("P2P") || mode.equals("P2A"))) {%> 
				 document.getElementById("schTime_hr").value="<%=time[0]%>";
				 document.getElementById("schTime_min").value="<%=time[1]%>";
				// document.getElementById("schTime_sec").value="<%=time[2]%>";
		         document.getElementById("isSchedule").value="N";
		         
			<%} 
			} %>
}

	document.body.addEventListener('DOMContentLoaded', fill());
</script>

