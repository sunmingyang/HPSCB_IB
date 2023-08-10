<%@ include file="/common/Include.jsp" %>  
	
	<script language="JavaScript" src= "/scripts/MD5.js"></script>   
    <script language="JavaScript" src="/fundtransfer/scripts/addpayee.js"></script> 
	<link rel = "stylesheet" href="/styles/table.css"  type = "text/css">
	<%@ page import="easycbs.bancmateib.fundtransfer.actionform.AddpayeeForm"%>
		
		<%
		String Error="",openFor="",sMode="";
		AddpayeeForm addpayeeform=new AddpayeeForm();
	if(request.getSession().getAttribute("AddpayeeForm")!=null)
	  {
		addpayeeform=(AddpayeeForm)request.getSession().getAttribute("AddpayeeForm");
		 Error=addpayeeform.getsErrorcode();
		System.out.println(" errorcode on jsp is "+ Error);
	}
			addpayeeform.setsErrorcode(""); 
			
			//session.removeAttribute("AddpayeeForm");
			//addpayeeform.setMob("");
		 String userid=(String)session.getAttribute("userid");
         String custRole=(String)session.getAttribute("custRole");
		 System.out.println("custRole----------------"+custRole); 
		 String sPendingListJson=(String)session.getAttribute("sVoucherData");
		 String aPendingListarr[][] =(String[][])session.getAttribute("aVoucherData");
		 System.out.println("sPendingListJson----------------"+sPendingListJson);
		  session.removeAttribute("sVoucherData");
		 session.removeAttribute("aVoucherData");
		 if(request.getParameter("openFor")!=null){
            openFor=(String)request.getParameter("openFor");
			System.out.println("openFor----------------"+openFor);
            }
   
			 if(request.getParameter("sMode")!=null){
            sMode=(String)request.getParameter("sMode");
			System.out.println("sMode----------------"+openFor);
            }
		 String mob=(String)session.getAttribute("customerMobile");
		 System.out.println("Mobile Number----------------"+mob);
          String purp = (String)request.getParameter("purpose");
		%>
		<script> 
		   var sMode = '<%=sMode%>';
		   var custrole='<%=custRole%>';
		  var jspOpenFor = '<%=openFor%>'; 
		  var myJsonString;
		  var pur = '<%=purp%>';

		function fill()
		{
			   <% if(!Error.equals(""))  
				  { %>
		   
				alert("<bean:message bundle="error" key='<%=Error%>'/> ");
				 <% }%>
		}
	
		 </script>
			
		<tiles:insert page="../common/siteLayout.jsp" flush="true"> 
		<tiles:put name="title" value="Login Page"/>
		<tiles:put name="menu" value="../common/user_left.jsp"/>
		<tiles:put name="line" value="../common/line.html"/>
		<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=fundtr"/>
		<%if(openFor!=null && openFor.equals("A")) {%>
		<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking"/>
			<%} else {%>
		<tiles:put name="menu" value="/common/user_left.jsp?src=fundtr"/>
				<%}%>
		<tiles:put name="header" value="../common/header.jsp"/>
		<tiles:put name="content" type="String">
		<tiles:put name="page_header" type="String">
				<bean:message bundle="hindi" key= "7022"/> 
		</tiles:put>
		
	<body onLoad="fill()" >
		<html:form action="/fundtransfer/fund.do">
<!--Authorization Code Block-->
<% 

if (aPendingListarr != null) { %>
  <div>
  	  	<center>		
		<p class = "tableHeader"  style= "display:none" id = "authlabel" align="center"><u> 
		<% if (openFor.equals("A") ) {  %>
					Payee Authorization </u>
		<% } else { %>				 
					Payee Edit </u>
		<% } %>			
					</p>
					<p class = "tableHeader" style = "display:none" id = "manageabel" align="center"><u> 
						Manage Payee  </u> 
					</p>
					</center>
					<script>
				
					if(sMode==='CIBAuth'){
					document.getElementById("authlabel").style.display = 'block';
					} else
					{
						document.getElementById("manageabel").style.display = 'block';
					} 
					
					</script>
					</div>
	<div style="height:120px;overflow:auto"> 
	<table border="1" bordercolor="#ffffff" align="center" id = "table"  style="table-layout: fixed;" cellpadding="0" cellspacing="0" id="table">
							<TR>    
							<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "357"/></TD>  
				<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "1710"/></TD>  
							<td class="dataTableTH" width="105px"><bean:message bundle="hindi" key= "7086"/></td>
							<td class="dataTableTH"> <bean:message bundle="hindi" key= "7088"/></td>
							<td class="dataTableTH"> <bean:message bundle="hindi" key= "7085"/></td>
							<td class="dataTableTH"> <bean:message bundle="hindi" key= "7453"/></td>
							<td class="dataTableTH"><bean:message bundle="hindi" key= "1180"/></td>
							<td class="dataTableTH"><bean:message bundle="hindi" key= "1013"/></td>  
							<td class="dataTableTH"><bean:message bundle="hindi" key= "216"/></td>
							</tr> 
				</thead> 
				<%for(int i=0;i<aPendingListarr.length;i++) {
							%> 
							<tr></tr> 

<tr> 
								<td class = "dataTableTD">
								<% if(sMode.equals("CIBAuth")){
								 if(userid.equals(aPendingListarr[i][8])) {%>
								<input style="background-color:#BFBFBF;" name="sOut_req" type="checkbox" id = "checkbox<%=i%>" value="screen"  name="1" disabled >
								<%} else {%>
								<input style="background-color:#BFBFBF;" name="sOut_req" type="checkbox" id = "checkbox<%=i%>" value="screen"  name="1" onclick="setUserId(this)" >
								<%}}%>

									<% if(sMode.equals("CIBEdit")){
								 if(userid.equals(aPendingListarr[i][8])) {%>
								<input style="background-color:#BFBFBF;" name="sOut_req" type="checkbox" id = "checkbox<%=i%>" value="screen"  name="1" onclick="setUserId(this)" >
								<%} else {%>
								<input style="background-color:#BFBFBF;" name="sOut_req" type="checkbox" id = "checkbox<%=i%>" value="screen"  name="1" disabled >
								<%}}%>
								</td>
								<td  class="dataTableTD"><%=i+1%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][0]%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][1]%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][2]%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][3]%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][4]%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][8]%></td> 
						    	<td style = "display:none"><%=aPendingListarr[i][7]%>
					<td style="dataTableTD">


	<% if(sMode.equals("CIBAuth")){
								 if(userid.equals(aPendingListarr[i][8])) {%>
								<img src="/images/editButton.png" alt="Edit" disabled />
								<%} else {%>
								<img src="/images/editButton.png" alt="Edit" onclick = "editform(this);"/>
								<%}}%>

									<% if(sMode.equals("CIBEdit")){
								 if(userid.equals(aPendingListarr[i][8])) {%>
									<img src="/images/editButton.png" alt="Edit" onclick = "editform(this);"/>
								<%} else {%>
								<img src="/images/editButton.png" alt="Edit" disabled />
								<%}}%>
					</td> 
</tr>
<%}%>
	</table>
	</div>
	<table id = "btntable"  style="margin-left: 340px;align : center">
		 <%if  (custRole.equals("S") || ((custRole.equals("F") && openFor.equals("A") ))) { %>	 <!--Txn password for entry user and authorizer-->
	<tr><td><B>Enter Transaction Password:</B> <input type ="password" name="txnpass" id="txnpass" value = ''/ >  </td></tr>
	<%}%>
	<tr>
		   <td colspan = "3">
		   	 <%if  (custRole.equals("S") || ((custRole.equals("F") && openFor.equals("A") ))) { %>
		   		<html:button property="continue"  styleId = "send" styleClass="Button" onclick="continueTransfer()" >
				<bean:message bundle="hindi" key='7089'/></html:button>
		
	<% if(sMode.equals("CIBAuth")){ %>
	<script>
	document.getElementById("send").style.display = 'none';
	</script>
	<input type=button value="Authorise" id = "authorise" class = "Button" onclick="authoriseentry();" /> 
	<%} %>
	<input type=button value="Reject Entry" id = "reject" class = "Button" onclick="rejectEntry();" /> 
		
		<html:button property="bck" styleClass="Button" styleId = "bck" onclick="bacck()" >
				<bean:message bundle="hindi" key='843'/></html:button>
		<%}%> </td>
		
		</tr>
		</table>	

							<!--EDit tble -->
<table border="2" bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0" id="edittable"  style="display: none;margin-left: 340px;">
	<tr class="dataTableTH" ><td colspan = "2"><bean:message bundle="hindi" key= "2075"/></td></tr>
	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "1027"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtaccno" onchange="return validateAcc(this.id)"  ></TD> <!--Name-->
   <tr>
   
	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7086"/></TD> <!--Name--> 
	<TD class="dataTableTH"><input type = "text" id = "edtname" maxlength = "5"  onchange = "checkWildcard(this.id)" ></TD> <!--Name-->
   <tr>

   	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7453"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtifcs" ></TD> <!--Name-->
   <tr>
   	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7088"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" maxlength = "10" id = "edtmob" onchange = "phonenumber(this.value,this.id)" ></TD> <!--Name-->
   <tr>

   	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "9"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtaccType" ></TD> <!--Name-->
   <tr>
     
	<input type = "hidden" id = "edtibreqkid" >
	<tr>
	<TD class="dataTableTH">Enter Transaction Password</TD>
	<TD class="dataTableTH"><input type = "password" id = "etxnpass" ></TD> 
   </tr>
   
	<tr>
	<TD class="dataTableTH" colspan = "2" ><input type = "button" class = "button" id = "editbtn" value = "Edit" onclick = "editInfo(pur);">
	<input type = "button" class = "button"  value = "Back" onclick = "editinfoback(pur);">  
	</TD>
	</tr> 
   
</table>
<!--EDit tble -->

		<% } else {%>  <B></B>   

<% 			if(!(openFor.equals("A"))) { %>
		<table>
		<tr><td>&nbsp;</td></tr>
		<tr class="heading">
			<bean:message bundle="hindi" key='7446' />
		</tr>
		<tr> <td> 
			   <html:hidden property="addpayee" styleId="addpayee"/>      
			</td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td>
			   <bean:message bundle="hindi" key='7448'/>
			   </td>  <td width="2">&nbsp;</td>
			<td>  
			  <html:text property="payeeName" styleId="payeeName" />
			</td>
	 </tr>
		<tr>
			<td>
			   <bean:message bundle="hindi" key='7086'/>
			   </td>  <td width="2">&nbsp;</td>
			<td>  
			  <html:text property="sNickName" styleId="sNickName" />
			</td>
	 </tr>
		<tr>
		   <td>
			  <bean:message bundle="hindi" key='7085'/>
		   </td>
	  <td width="2"></td>
			<td>

			  <html:text  property="sPayeeAcc" styleId="sPayeeAcc"  onchange="return fetchAccType()" />
			</td>
	 </tr>
		
	 
		<tr>
			<td><bean:message bundle="hindi" key='1180'/>  </td> 
			  <td width="2">&nbsp;</td>
			<td>
			<html:select property="sAccountType" styleId="sAccountType" >
					<html:option  value=''>--select--</html:option>
					<html:option  value='S'>Saving</html:option>
					<html:option  value='A'>Current</html:option>
					<html:option  value='C'>Cash Credit/Overdraft</html:option>
					<html:option  value='E'>RD Account</html:option>
     				<html:option  value='T'>Loan Account</html:option>
			</html:select>
			</td>
	 </tr>
	 <tr>
			<td colspan="3">
			   <b><u><bean:message bundle="hindi" key='7087'/>
			</td>
	</tr>
		 <tr>
			<td style="font-family:verdana">
			  Payee Mobile No.</td>
			   <td width="2"></td>
			   <td>     
				<html:text property="payeeMob"maxlength = "10" onchange = "phonenumber(this.value,this.id)" styleId="payeeMob" size="20" readonly="true"/>
			</td>
		</tr>
 
		<tr>
			<td style="font-family:verdana">
			    Customer Mobile No.</td>
			   <td width="2"></td>
			   <td>     
				<html:text property="mob"  styleId="mob" size="30" readonly="true"/>
			</td>
		<script>
		 document.getElementById("mob").value='<%=mob%>'; 
		</script>

		</tr>

	<%if( (custRole.equals("S") || custRole.equals("E"))) {%> <!--Txn password for entry user and authorizer-->
	<tr><td style="font-family:verdana">Enter Transaction Password: </td>
	<td width="2"></td> <td><input type ="password" name="txnpass" id="txnpass" value = ''/ >  </td></tr>
	<%}%>
 
		<tr><td>
		<html:button property="continue" styleClass="Button" onclick="continueTransfer()" >
				<bean:message bundle="hindi" key='7089'/></html:button>
			</td>
			<td>
			<html:button property="back" styleClass="Button" onclick="bacck()" >
			<bean:message bundle="hindi" key='843'/></html:button>
			</td></tr>
		</table>
		<%}%>
<%}%>
<div id = "cbrespdiv" style="height:80px;overflow:auto">
</div>
<!--END-->
 </html:form>
	   </body>

	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>

	</tiles:insert></em>