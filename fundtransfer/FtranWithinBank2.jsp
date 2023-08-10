<%@ include file="/common/Include.jsp" %> 
<script language="JavaScript" src="/scripts/MD5.js"></script> 
<link rel = "stylesheet" href="/scripts/table.css"  type = "text/css">
<script language="JavaScript" src="fundtransfer/scripts/fund.js"></script>    
<%
String accountList="" ; 
String [] AccListArr= null ; 
String openFor="",custRole="",userid="";
String allFavAcc[][]=null;
String login_id="";
String usrName = "";   
String fundinfo[][] = null ;

userid = (String)session.getAttribute("userid");
if (session.getAttribute("allAccountlist") != null ) { 
	accountList=(String)session.getAttribute("allAccountlist");
	System.out.println("FundAccountList----------------"+accountList);
	AccListArr =accountList.split(",");
}

String mode=(String)session.getAttribute("VALUE");

if(mode==null){
mode=request.getParameter("mode");
}

String  date=DateTimeFunction.getIbDateTime();
		String time[]=date.split(" ")[1].split(":");
		date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);

String mob=(String)session.getAttribute("customerMobile");
int errorcount=0; 

//by Geetika mam
if(request.getParameter("mode")!=null && request.getParameter("mode").equals("S")){
if(session.getAttribute("FUNDINFO_S")!=null){
	fundinfo = (String[][])session.getAttribute("FUNDINFO_S");   
}}
else if(request.getParameter("mode")!=null && request.getParameter("mode").equals("O")){
	if(session.getAttribute("FUNDINFO_O")!=null){
	fundinfo = (String[][])session.getAttribute("FUNDINFO_O");   }}
else 
{ 	if(session.getAttribute("FUNDINFO")!=null){
	fundinfo = (String[][])session.getAttribute("FUNDINFO");   
}}
//man
if(session.getAttribute("favAcc_s") != null){
	allFavAcc = (String[][])session.getAttribute("favAcc_s");
		System.out.println("favAcc----****------------"+allFavAcc.length);
		session.removeAttribute("favAcc_s"); 
}

if(session.getAttribute("user") != null)
	usrName = (String)session.getAttribute("user");
if(session.getAttribute("userid")!=null){
//	login_id = (String)session.getAttribute("userid");//New changes on 16/07/2008;
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
session.removeAttribute("VALUE");
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
%>  
 


<style>
td
{
font-family: Calibri;
 font-size: 12pt; 
}
</style>

<html:form action="/TransactionAction.do">
<body onload = "fill()" style="margin:0 0 0 0;" ><br>
<input type = "hidden" id = "userid" value = "<%=userid%>">
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0"  >
		<tr>
			<td  class="wrapperDataTableTR" align="center" > Fund Transfer With in Bank</td>
		</tr>
		<tr >
			<td align="center"  >
					
					<table width="527" id = "accDiv" >
						<tr>
							<td style="width:60%;font-family: Arial;font-weight:bold">
								Acc No. From  
							</td>
							<td Style="font-family: Arial;">
								<select name="sUsrList1" list="AccountNoList" listkey="custId" listValue="accountNo" style="width:140" id="accList" onChange="mobileNo()">
								<%
									if (AccListArr != null)
										for(int i=0;i<AccListArr.length;i++){%>
										 <option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
										<%}%>
								</select>  
							</td> 
						</tr>

<!--manjeet-->
						<tr>
							<td style="width:60%;font-family: Arial;font-weight:bold">
							Search 
							</td>
							<td style="font-family: Arial;">
								<select name="search" id="search" style="width:140" id="search" onChange="withSearch()">
										 <option value="0">>-----Select------<</option>
							    	     <option value="AccountNumber">Account Number</option>
										 <option value="AdharCard">Adhar Card</option>
								         <option value="MobileNumber">Mobile Number</option>
										 <option value="VirtualAddress">Virtual Address</option>
								         <option value="ATMCardNumber">ATM Card Number</option>
										 <option value="LandlineNumber">Landline Number</option>	
								</select>  
							</td> 
						   </tr>
						<tr>
							<td style="width:60%;font-family: Arial;font-weight:bold">

								<label id="beneLabel"></label>  
								
							</td>
							
							<td>
								<input type="text" size="20"  id="searchVal" onchange="findInfo()"/>
							</td>
						</tr>

							<tr>
							<td style="width:60%;font-family: Arial;font-weight:bold">
								Amount: 
							</td>
							<td>
								<input type="text" name="amount" id="amount"  value=".00" style="text-align:right"> 
							</td>
						</tr>
						<tr>
							<td style="font-family: Arial;font-weight:bold">
								Remark:
							</td>
							<td>
								<input type="text" name="remark" id="remark"> 
							</td>
						</tr>

<!-- geetika -->

<% if(!(mode.equals("P2P") || mode.equals("P2A"))) {%>
						<tr>
								<td style="font-family: Arial;font-weight:bold" >
									Schedule Transfer :
								</td>
								<td >
									<select id="isSchedule" value="N" onchange="showDivSchedule()">
										<option value="Y">Yes</option>
										<option value="N">No</option>
									</select>
								</td>
						</tr>
						<tr id="hideScheduleRows">
								<td style="font-family: Arial;font-weight:bold" > Schedule Start Date:</td>
								<td  style="padding-left: 0px; ">
								<input type="text" id="schDate"  onkeypress="isValidDatechar('')"  maxlength="10" placeholder="dd/mm/yyyy" value="<%=date%>" />
								<input type="hidden" value="<%=date%>" id="tDate" /><b>(dd/mm/yyyy)</b>
								</td>
						</tr>
						<tr id="hideScheduleRows2">
								<td  style="font-family: Arial;font-weight:bold "> Time</td>
								<td style="font-family: Arial;font-weight:bold; padding-left: 0px;" colspan="3">
									<select id="schTime_hr" value="10" >
										<%for(int i=0;i<=23;i++){
											String t=i+"";
											if(i<=9) {
												t="0"+t;
											}%>
											<option value="<%=t%>"><%=t%></option>
									   <%}%>
									</select>Hrs.&emsp;&emsp;
									<select id="schTime_min" value="<%=time[1]%>" >
										<%for(int i=0;i<=59;i++){
										   String t=i+"";
											 if(i<=9) {
												t="0"+t;
											 }%>
											<option value="<%=t%>"><%=t%></option>
										<%}%>
									</select>Mins.&emsp;&emsp;
										
								</td>
						</tr>
						<tr id="hideScheduleRows3">
											<td>
											</td>
											<td align="left" ><font color="red" style="font-weight: normal;font-family: Arial; padding-left: 0px; ">
												(Trsnsaction will be processed after &emsp; &emsp; &emsp;  selected date and time)</font>
											</td>
										</tr>
								</td>
							</tr>
						<tr id="hideScheduleRows4">
							<td style="font-family: Arial;font-weight:bold" >
								Payment Type :
							 </td>
							<td >
								<select id="paymentType"  onchange="showPeriodicityDiv()" style="width:140px" >
									<option value="O">One Time</option>
									<option value="R">Recurring</option>
								</select>
							</td>
						</tr>
						<tr id="periodicityDiv" style="display:none;width:140px;" >
							<td  style="font-family: Arial;font-weight:bold" >
								Periodicity :
							</td>
							<td  style="font-family: Arial;" >
								<select id="periodicity" >
										<option value="-1">--Select Prediocity--</option>
										<option value="D">Daily</option>
										<option value="W">Weekly</option>
										<option value="F">FortNight</option>
										<option value="M">Monthly</option>
										<option value="B">Bi-Monthly</option>
										<option value="Q">Quaterly</option>
										<option value="H">Half-Yearly</option>
										<option value="Y">Yearly</option>
								</select>
							</td>
						</tr>
<%}%>
</table>
				<div id="hideBefTable"><table  border="1" bordercolor="#ffffff" align="center" id = "accData" style="width: 70%; table-layout: fixed;" cellpadding="0" cellspacing="0">	<tr>    
					<TD class="dataTableTH " width = "50px">Account No</TD>
					<TD class="dataTableTH" width = "50 px ">Mobile No</TD> 
					<td class="dataTableTH" width = "95px ">Name</td>
					<td  class="dataTableTH" width = "50px ">Make Favourite</td>
				</tr> 
				<tr>  
					<!-- yes -->
					<TD  width = "50px" style="font-family: Arial;" id="accnoTd"></TD>
					<TD  width = "50 px" style="font-family: Arial;" id="mobileTd"></TD> 
					<td  width = "95px " style="font-family: Arial;" id="nameTd"></td>
					<td  width = "50px " style="font-family: Arial;">
					<input type="checkbox" name="mkFav" id="mkFav"  >
					<input type ="hidden" name="custId" id="custId" >
					<input type ="hidden" name="sessionID" id="sessID" value="'<%=sessionId%>'" >
					<input type="hidden" size="20" readonly="true" value="<%=mob%>" id="UserMobile"/> 
     		         <input type ="hidden" name="mode" id="mode" value="<%=mode%>" >	
					</td>
				</tr>
				</table></div>


			<table width="527" id = "accDiv" >
				<tr>
						<td style="font-family: Arial;font-weight:bold">
							 Enter OTP: 
						</td>
						 <td>
						<input type="text" name="otp" id="otp">
						</td>
						<td>
						<input type="button" onClick='otp_numberWithInBank("<%=DateTimeFunction.getIbDateTime()%>")' class="button"  style="width:100px" value="Generate OTP"/>
						</td>
						</tr>
						<tr><td>
						<input type="button" class="button" id="confirm"  onClick='fundTrRetailWithInBank("<%=DateTimeFunction.getIbDateTime()%>")' style="width:100px" value="confirm"/> 
						</td>
						</tr>
			</table>
			</td></tr>
			
			<tr><td><h3 style="margin-left:170px;margin-bottom:5px;font-family: Arial;">Favourite List</h3></td></tr>
			<td align="center"  >

				<table  border="1" bordercolor="#ffffff" align="center" id = "favTabale" style="width: 790px; table-layout: fixed;" cellpadding="0" cellspacing="0">	
				<tr>    
				<TD class="dataTableTH" width = "50 px ">Select</TD> 
				<TD class="dataTableTH" width = "50 px ">Account Number</TD> 
				<td class="dataTableTH" width = "95px ">Mobile Number</td>
				<td  class="dataTableTH" width = "50px ">Account Type</td>

				<td  class="dataTableTH" width = "50px ">Remove From List</td>
				<td  class="dataTableTH" width = "50px ">Remove From Favourite</td>
				</tr> 
				</table>
				<div  style="overflow-x:auto;height:100PX;width:790px;">
				<table  border="1" bordercolor="#ffffff" align="center" id = "favTab" style="width: 100%; table-layout: fixed;" cellpadding="0" cellspacing="0">	
			
				<%if(fundinfo!=null){
  					int k=0;
     				for(int i=0;i<fundinfo.length;i++){
     					if(fundinfo[i][9].trim().equals("Y")){ 
     						%>
    						<tr>   
								<td  width = "50px" ><input type="checkbox" name="selectFav" id="selectFav" onchange="selectFromFav(this)"   ></td>
								<TD  width = "50 px" style="font-family: Arial;"><%=fundinfo[i][2]%></TD>
								<td  width = "95px " style="font-family: Arial;"><%=fundinfo[i][1]%></td>
								<td  width = "50px " style="font-family: Arial;"><%=fundinfo[i][6]%></td>
								<td  width = "50px " ><input type="checkbox" name="rmList" id="rmList"  onchange="rmfrmList(this)" ></td>
								<td  width = "50px "><input type="checkbox" name="rmFav" id="rmFav" onchange="rmfrmFav(this)"  >
								<input type="hidden" name="benName" id="benName" value='<%=fundinfo[i][5]%>'>
								</td>
							</tr> 
    						<%}}}%>
  				</div>
				</table>

				
				</td></tr>
				<tr><td><h3 style="margin-left:170px;margin-bottom:5px; font-family: Arial;">Banificiary List</h3></td></tr>
				<td align="center"  >


				<table  border="1" bordercolor="#ffffff" align="center"  id = "BenTab" style="width: 790px;  table-layout: fixed;" cellpadding="0" cellspacing="0">
				<tr>    
				<TD class="dataTableTH " width = "50px">Select</TD>
				<TD class="dataTableTH" width = "50 px ">Account Number</TD> 
				<td class="dataTableTH" width = "95px ">Mobile Number</td>
				<td  class="dataTableTH" width = "50px ">Account Type</td>
				<td  class="dataTableTH" width = "50px ">Remove </td>
				<td  class="dataTableTH" width = "50px ">Make Favourite</td>
				</tr> 
				</table>
				<div  style="overflow-x:auto;height:100PX;width:790px">
				<table  border="1" bordercolor="#ffffff" align="center"  id = "BenTable" style="width: 100%;  table-layout: fixed;" cellpadding="0" cellspacing="0">
				<%if(fundinfo!=null){
     				for(int i=0;i<fundinfo.length;i++){
						if(fundinfo[i][9].trim().equals("N")){ 
			     		%>
						<tr>   
						<td  width = "50px "><input type="checkbox" name="selectBen" id="selectBen" onchange="selectFromBen(this)" ></td>
						<TD  width = "50px "style="font-family: Arial; "><%=fundinfo[i][2]%> </TD>
						<td  width = "95px " style="font-family: Arial;"><%=fundinfo[i][1]%></td>
						<td  width = "50px " style="font-family: Arial;"><%=fundinfo[i][6]%></td>
						<td  width = "50px " ><input type="checkbox" name="rmBen" id="rmBen" onchange="rmFromBen(this)"  ></td>
						<td  width = "50px "><input type="checkbox" name="mkBen" id="mkBen" onchange="mkFavAcc(this)" >
						<input type="hidden" name="benName" id="benName" value='<%=fundinfo[i][5]%>'>

    
						</td>
						</tr>
					<%}}}%>
				</div>
				</table>

				<!--jai  -->
						
			</table>
			
		
		</body>
		</html:form>
		



<script>
					
function setUserIdOld(id)
{
document.getElementById("fundkid").value=id;
} 

function fill(){
document.getElementById("hideBefTable").style.visibility = "hidden";

	<%if(openFor.equals("A")){%>
				document.getElementById("acctbl").style.display = "none";  //accDiv
			<%} else {%>
				 document.getElementById("accDiv").style.display = "block"; 
				 document.getElementById("schTime_hr").value="<%=time[0]%>";
				 document.getElementById("schTime_min").value="<%=time[1]%>";
				// document.getElementById("schTime_sec").value="<%=time[2]%>";
		         document.getElementById("isSchedule").value="N";


			document.getElementById("hideScheduleRows").style.display="none";
			document.getElementById("hideScheduleRows2").style.display="none";
			document.getElementById("hideScheduleRows3").style.display="none";
			document.getElementById("hideScheduleRows4").style.display="none";


			<%}%>


}
			var  searchval='Benificiary ';
			function withSearch(){
			searchval='Benificiary ';
	        searchval += document.getElementById("search").value;
			document.getElementById("searchVal").value="";
			if(document.getElementById("search").value != '0'){
	    	 document.getElementById('beneLabel').innerText  =searchval;
			}
			 }
		    document.getElementById('beneLabel').innerText  =searchval;
	
</script>

