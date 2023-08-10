<%@ include file="/common/Include.jsp" %>
<link rel = "stylesheet" href="/styles/table.css"  type = "text/css"/>
<script language="JavaScript" src= "/fundtransfer/scripts/neft.js"></script>  
<script language="JavaScript" src="/scripts/MD5.js"></script> 
<%
	String accountList="" ; 
	String [] AccListArr= null ; 
	if (session.getAttribute("allAccountlist") != null ) { 
	   accountList=(String)session.getAttribute("allAccountlist"); 
	   System.out.println("FundAccountList----------------"+accountList);
	   AccListArr =accountList.split(",");
	} 
String ChargeAmt=".00";
if (session.getAttribute("neftCharge") != null ) { 
	   ChargeAmt=(String)session.getAttribute("neftCharge");
	   System.out.println("neftCharge----------------"+ChargeAmt);
	}
String userInFo[][]=null;
if (session.getAttribute("userInfo") != null ) { 
	   userInFo=(String[][])session.getAttribute("userInfo");
	   System.out.println("userInFo----------------"+userInFo[0][2]);
	}

 int errorcount=0;
	String usrName = "";
	 String AccINFO[][] = (String[][])session.getAttribute("AccINFO"); 
	 System.out.println(AccINFO);
	if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
	
	String login_id="";
	if(session.getAttribute("userid")!=null){
		login_id = (String)session.getAttribute("userid");
	}
	String openFor = "",sMode = "";
	if(request.getParameter("neftopenFor")!=null){
    openFor=(String)request.getParameter("neftopenFor");
	System.out.println("neftopenFor----------------"+openFor);
            }
	if(request.getParameter("sMode")!=null){
    sMode=(String)request.getParameter("sMode");
	System.out.println("sMode----------------"+sMode); 
            }

String sPendingListJson=(String)session.getAttribute("sVoucherData");
String aPendingListarr[][] =(String[][])session.getAttribute("aVoucherData");
session.removeAttribute("sVoucherData");
session.removeAttribute("aVoucherData");
System.out.println("sPendingListJson----------------"+sPendingListJson);
String custRole=(String)session.getAttribute("custRole");
String custName = (String)session.getAttribute("custName");
%>
<script> 
var mytotalJsonString = '' ;
	     var jspOpenFor='<%=sMode%>'; // capital O
		 var jspopenFor = '<%=openFor%>';  
		 var custrole = '<%=custRole%>';  
		 var brnchcode = '<%=userInFo[0][1]%>'; 
		 var custname = '<%=custName%>'; 
         alert("NEFT Mode For:::"+custname);

</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<!-- <html:form action="/jsp/login.do"> -->
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=fundtr"/>
<%if(openFor.equals("A") || openFor.equals("E")) {%>
<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking"/>
<%} else {%>
<tiles:put name="menu" value="/common/user_left.jsp?src=fundtr"/>
<%}%>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String"> 
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
</tiles:put>
<html:form action="/request/DDRequest">
<body style="margin:0 0 0 0;" onload="fillData()"><br>
	<input type="hidden"  style="margin-left: px;" maxlength="35"  value="<%=login_id%>" size="40" id="userid"/>

	<table align="center" class="wrapperDataTable" cellpadding="0" cellspacing="0"  >
	<tr>
		<td  class="wrapperDataTableTR" align="center" width=950px > Fund Transfer >> With in Neft</td>
	</tr>
	<tr>
	<td>
	<table border="" align="center">
	<tr>
	<td align="center" >
	<p><input type="radio" name="trnType" id="neftrtgs1" value="neft"  onclick="selectValue()"/>NEFT &nbsp;&nbsp;&nbsp;&nbsp; 
	  <input type="radio"  name="trnType" id="neftrtgs2" value="rtgs" onclick="selectValue()"/>RTGS</p>	
	</td>
	</tr>
	<tr>
	<td align="center">
	 Acc No. From

				<select name="sUsrList1" list="AccountNoList" listkey="custId" listValue="accountNo" style="width:200" id="accList" onChange="mobileNo()"/>
				<%
				if (AccListArr != null)
				for(int i=0;i<AccListArr.length;i++){%>
				<option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
				<%}%>
				</select> 
	</td>
	</tr>
	<tr>
	<td  align="center">
	<p>Select the IFSCode option if you know the IFSCode. Else select location.</p>
	</td>
	</tr>
	<tr>
	<td align="center">
	  <p>  <input type="radio" name="group" id="location" value="location1" onclick="change()" >IFSC Code &nbsp;&nbsp;&nbsp;&nbsp; 
	    <input type="radio"  name="group" id="locationN" value="location2" onclick="change();bankName();cityName()"/>Location</p>
    </td>
	</tr>
	<tr>
	<td align="center">
	    <table id="detailsT" align="center" >
			<tr>
				<td>
				<label>
					<bean:message bundle= "hindi" key= "382"/>
				</label><label><font size="2" color="red">*</font></label>&nbsp;
				</td>
				<td >					 
					 <select property="isbankLabel" Id="isbankLabel" onchange="">
					 <option  value="SELECT">----select----</option> 
					 <input type="hidden" id="banKid">
					</select>
				</td>
			</tr>
				<tr>
				<td>
					<label>
					Districts
					<label><font size="2" color="red">*</font></label> </td>
				<td >
				     
				    <select property="ishCityLocal" name="ishCityLocal" id="ishCityLocal" onchange="getIFSCode()">
					 <option  value="SELECT">----select----</option> 
					 <input type="hidden" id="cityKid">
				      </select>
					</td>

			</tr>
	   <tr>
				<td><label>
					<bean:message bundle= "hindi" key= "3396"/>
					</label><label><font size="2" color="red">*</font></label>&nbsp;
				</td>
				<td>
                  <select property="isBranchEName" name="isBranchEName" id="isBranchEName" onchange="setIFSCode()">
					 <option  value='SELECT'>----select----</option> 
					 </select>
				</td>
			</tr>
			</table>
<!-- Ifsc code -->
	<table id="detailsF" align="left" >
	 <tr>
	  <tr>
		<td><label>
					<bean:message bundle= "hindi" key= "3396"/>
					</label><label><font size="2" color="red">*</font></label>&nbsp;
		</td>
				<td>
                  <input type="text" style="margin-left:3px;"  name="isBranchEName" id="BranchName" size="25"/>
					 
				</td>
			</tr>
			</table>
    </td>
	</tr>

		<tr>
	<td align="left">
	<label><bean:message bundle="hindi" key= "45054"/></label>
	<label><font size="2" color="red">*</font></label>&nbsp;
<input type="text" name="rifsc" style="margin-left:115px;" maxlength="19" size="16"  value=""  id="rIFSC" onblur="ifscTable()"/>
    </td>
	 </tr>

	<tr>
	<td align="left">
		<label><bean:message bundle= "hindi" key= "3054"/></label>
					<label><font size="2" color="red">*</font></label>
			 <input type="text" name="beneficiaryHName" maxlength="185"  style="margin-left:50px;" size="25" tabindex="-1" value=""  id="beneficiaryHName"/>
    </td>
	 </tr>

	  <tr>
	<td align="left">
		<LABEL><bean:message bundle="hindi" key= "1181"/></LABEL>
					</font>
					<label><font size="2" color="red">*</font></label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="racNo" style="margin-left:88px;" maxlength="20" size="25" value=""  id="racNo"/>
    </td>
	 </tr>

 <tr>
	<td align="left">
		<LABEL><bean:message bundle="hindi" key= "1026"/></LABEL>
			<select property="sAccountType" Id="sAccountType" style="margin-left:105px;" >
					<option  value=''>--select--</option>
					<option  value='S'>Saving</option>
					<option  value='A'>Current</option>
					<option  value='C'>Cash Credit/Overdraft</option>
			</select>
				
    </td>
	 </tr>

	 <tr>
	 <td align="left">
	Amount
			<input type="text" style="margin-left:115px;"  Id="amount"  size="20"  maxlength="15" value=".00" />
			 
	</td>
	</tr>
	
	 <tr>
	<td align="left">
		<LABEL><bean:message bundle="hindi" key= "1063"/></LABEL>
		<!-- <textarea row="2" style="margin-left: 108px;" id="address1"></textarea> -->
		<input type="text" style="margin-left: 107px;" name="address1" maxlength="35" size="40" tabindex="18" value=""  id="address1"/><br>
		<input type="text" style="margin-left: 155px;" name="address2" maxlength="35" size="40" tabindex="19" value=""  id="address2"/> <br>
		<input type="text" style="margin-left: 155px;" name="address2" maxlength="35" size="40" tabindex="19" value=""  id="address3"/> 
    </td>
	 </tr>

	
	<tr>
	<td align="left">
	<LABEL>Sender to Receiver Information</LABEL>
	<label><font size="2" color="red">*</font></label>&nbsp;
		<input type="text"  style="margin-left: px;" maxlength="35" size="40" id="remark"/>
    </td>
	</tr>
	 

	 <tr> <td align="left">
	Charge
			<input type="text" style="margin-left:115px;"  Id="charge"  size="20"  maxlength="15" value="<%=ChargeAmt%>" />
			 
	</td>
	</tr>
	


<tr>
											<td align = "left">
												<B>Schedule Start Date:</B>
												<input type="text" id="schDate"  onkeypress="isValidDatechar('')"  maxlength="10" placeholder="dd/mm/yyyy" value="" />
												<b>
													(dd/mm/yyyy)
												</b>
											</td>
										</tr>


	 <tr>
	 <%if(custRole.equals("S") || custRole.equals("E")) {%>  
	<td align= "left">Enter Transaction Password:	<input type ="password" name="txnpass"  maxlength ="16" id="txnpass" value="" > 
	<%}%>
	</td></tr>
<tr>
<td align="center">
		<input type="button" class = "Button" name="ok" tabindex="22" value="OK" onclick="saveData()" class="Button" id="ok"/>
		<input type="button" class = "Button" name="cancel" tabindex="23" value="Cancel" onclick="bacck()" class="Button" id="cancel"/></td>
    </td> 
	 </tr>
             </td>
	
</table>


<div id = "cbrespdiv" style="height:150px;overflow:auto">
</div>
</body>
</html:form>
</tiles:put>
</html:form>
</tiles:insert>


<script type="text/javascript">

			<%if(session.getAttribute("error")!=null) {
				String result=(String)session.getAttribute("error");
				session.removeAttribute("error");
				if(result.equalsIgnoreCase("success")){%>
						alert('<bean:message bundle ="<%=lang%>" key="7455"/>');
					<%}
					else 
					{%>
					alert('<bean:message bundle ="<%=lang%>" key="7456"/>');
					<%}}%>

				</script>




	 
