	<%@ include file="/common/Include.jsp" %>
		<%@ page import="easycbs.bancmateib.fundtransfer.actionform.AddpayeeForm"%>
			<script language="JavaScript" src="/scripts/MD5.js"></script> 
		<%
		String Error="",openFor="";
		AddpayeeForm addpayeeform=new AddpayeeForm();
	if(request.getSession().getAttribute("AddpayeeForm")!=null)
	  {
		addpayeeform=(AddpayeeForm)request.getSession().getAttribute("AddpayeeForm");
		 Error=addpayeeform.getsErrorcode();
		System.out.println(" errorcode on jsp is "+ Error);
	}
			addpayeeform.setsErrorcode("");
   		 String custRole=(String)session.getAttribute("custRole");
		 String userid=(String)session.getAttribute("userid");
		 System.out.println("custRole----------------"+custRole); 
		 String sPendingListJson=(String)session.getAttribute("sVoucherData");
		 String aPendingListarr[][] =(String[][])session.getAttribute("aVoucherData");
		 session.removeAttribute("sVoucherData");
		 session.removeAttribute("aVoucherData");
		 System.out.println("sPendingListJson----------------"+sPendingListJson);
		 if(request.getParameter("openFor")!=null){
            openFor=(String)request.getParameter("openFor");
			System.out.println("openFor----------------"+openFor);
            }
			String sMode="";
			if(request.getParameter("sMode")!=null){
            sMode=(String)request.getParameter("sMode");
			System.out.println("sMode----------------"+sMode);
            }
		 String mob=(String)session.getAttribute("customerMobile");
		 String purp = (String)request.getParameter("purpose"); 
		%>
		 <script> 
		  var sMode = '<%=sMode%>';
		 var custrole='<%=custRole%>';
		 var jspOpenFor = '<%=openFor%>'; 
		 var pur =  '<%=purp%>'; 
		 if(custrole ==='F' || custrole ==='C' || custrole ==='A') //  copr main ACS, indivisual , agent
		 {	
			sMode = "directentry";
		 }  else {
		 sMode = 'entry';
		 }
		 	var mytotalJsonString;
			 function fill()
		  {
			   <% if(!Error.equals(""))  
				  { %>
		   
				alert("<bean:message bundle="error" key='<%=Error%>'/> ");
				 <% }%>
		  }
			 </script>
		 <script language="JavaScript" src="/fundtransfer/scripts/addotherBankpayee.js"></script>

		
		<tiles:insert page="../common/siteLayout.jsp" flush="true">
		<tiles:put name="title" value="Login Page"/>
		<tiles:put name="menu" value="../common/user_left.jsp"/>
		<tiles:put name="line" value="../common/line.html"/>
		<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=fundtr"/>
	<%if(openFor.equals("A")) {%>
		<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking"/>
			<%} else {%>
		<tiles:put name="menu" value="/common/user_left.jsp?src=fundtr"/>
				<%}%>
		<tiles:put name="header" value="../common/header.jsp"/>
		<tiles:put name="content" type="String">
		<tiles:put name="page_header" type="String">
				<bean:message bundle="hindi" key= "7022"/> 
		</tiles:put>
		
	<BODY onLoad="fill()" >
		<html:form action="/fundtransfer/fund.do">

			<!--Authorization Code Block-->  
<% 
if (aPendingListarr != null) { %>
 <div>
  	  	<center>		<p class = "tableHeader" align="center"><u> 
						Corporate Banking Payee Authorization  </u> 
					</p></center>
				
 </div>
<div style="height:130px;overflow:auto">
	<table border="1" bordercolor="#ffffff" align="center" style="table-layout: fixed;" cellpadding="0" cellspacing="0" id="table">

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
<%
						for(int i=0;i<aPendingListarr.length;i++) {
							%> 

<tr> 

								<td class="dataTableTD">
                    <% if(sMode.equals("CIBAuth")){
					if(userid.equals(aPendingListarr[i][8])) {%>
								<input  name="sOut_req" type="checkbox" id="checkbox<%=i%>" value="screen"  name="1" disabled > 
								<%} else {%>
							<input style="background-color:#BFBFBF;" name="sOut_req" type="checkbox" value="screen"  name="1" onclick="setUserId(this)" >
								<%} }%>
							
					<% if(sMode.equals("CIBEdit")){
					if(userid.equals(aPendingListarr[i][8])) {%>
							<input style="background-color:#BFBFBF;" name="sOut_req" type="checkbox" value="screen"  name="1" onclick="setUserId(this)" > 
								<%} else {%>
								<input  name="sOut_req" type="checkbox" id="checkbox<%=i%>" value="screen"  name="1" disabled>
								<%} }%>		
								
								
								</td>
								<td  class="dataTableTD"><%=i+1%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][0]%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][1]%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][2]%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][3]%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][6]%></td>
								<td  class="dataTableTD"><%=aPendingListarr[i][8]%></td> 
						    	<td style = "display:none"><%=aPendingListarr[i][7]%>
								<td style="dataTableTD">
			<% if(sMode.equals("CIBAuth")){
					if(userid.equals(aPendingListarr[i][8])) {%>
									<img src="/images/editButton.png" alt="Edit" disabled/>
								<%} else {%>
								<img src="/images/editButton.png" alt="Edit" onclick = "editform(this);"/>
								<%} }%>
							
					<% if(sMode.equals("CIBEdit")){
					if(userid.equals(aPendingListarr[i][8])) {%>
							<img src="/images/editButton.png" alt="Edit" onclick = "editform(this);"/>
								<%} else {%>
											<img src="/images/editButton.png" alt="Edit" disabled/>
								<%} }%>		
								

							
								</td> 
							</tr>
													
							
							<%} %> </table> </div> 
				
	

		<!--EDit tble -->
<table border="2" bordercolor="#ffffff" align="center" width="90%" cellpadding="0" cellspacing="0" id="edittable"  style="display:none">
	<tr class="dataTableTH" ><td colspan = "2"><bean:message bundle="hindi" key= "2075"/></td></tr>
	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "1027"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtaccno" onchange = "checkAccFormat(this.value,this.id)" ></TD> <!--Name-->
   <tr>
   
	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7086"/></TD> <!--Name--> 
	<TD class="dataTableTH"><input type = "text" id = "edtname"  onchange = "checkWildcard(this.id)" maxlength = "5"></TD> <!--Name-->
   <tr>

   	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7453"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtifcs" ></TD> <!--Name-->
   <tr>
   	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7088"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" maxlength = "12" id = "edtmob" onchange = "phonenumber(this.value,this.id)"  ></TD> <!--Name-->
   <tr>

   	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "42"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtaccType" ></TD> <!--Name-->
   <tr>
     
	 <input type = "hidden" id = "edtibreqkid" >
	 <TD class="dataTableTH">Enter Transaction Password</TD>
	<TD class="dataTableTH"><input type = "password" id = "etxnpass" ></TD> 
   </tr>
	 
	<tr>
	<TD class="dataTableTH" colspan = "2" ><input type = "button" class = "button" id = "editbtn" value = "Edit" onclick = "editInfo(pur);">
	<input type = "button" class = "button" id = "back"  value = "Back" onclick = "editinfoback(pur);">  
	</TD>
	</tr> 
   
</table>

<table id = "btntable">
  <tr>
	<td colspan = "3">Enter Transaction Password: <input type ="password" name="txnpass" id="txnpass"/> </td>
	</tr>
    <tr> 
    <td colspan = "3">
   	<!--	<html:button property="continue"  styleId = "send" styleClass="Button" onclick="continuFund()" >
     	<bean:message bundle="hindi" key='7089'/></html:button> -->
				<% if(sMode.equals("CIBAuth")){ %>
			
				<input type=button value="Authorise" id = "authorise" class = "Button" onclick="authoriseentry();" /> 
										<%} %>
			<html:button property="back" styleId = "back"  styleClass="Button" onclick="editinfoback(pur);" >
			<bean:message bundle="hindi" key='843'/></html:button>
			
			<input type="button" value="Reject Entry" id = "reject" class = "Button" onclick="rejectEntry();" /> 
		</td>
		</tr>
							</table>	
<!--EDit tble -->

					
						<%	} else { %> <B>No entries  pending</B>
						<% 	if(!(openFor.equals("A"))) { %>
							<table>
		<tr><td>&nbsp;</td></tr>
		<tr class="heading">
			<bean:message bundle="hindi" key='7447' />
		</tr>
		<tr>
		  
			<td>
			   <html:hidden property="addpayee" styleId="addpayee"/>      
			</td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td>
			   <bean:message bundle="hindi" key='7448'/>
			   </td>  <td width="2">&nbsp;</td>
			<td>  
			   <html:text property="payeeName" styleId="payeeName" onchange = "checkWildcard(this.id)" />
			</td>
	 </tr>
		<tr>
			<td>
			   <bean:message bundle="hindi" key='7086'/>
			   </td>  <td width="2">&nbsp;</td>
			<td>  
			<html:text property="sNickName" onchange = "checkWildcard(this.id)" styleId="sNickName" />
			</td>
	 </tr>
		<tr>
		   <td>
			  <bean:message bundle="hindi" key='7085'/>
		   </td>
	  <td width="2"></td>
			<td>

			 <html:text  property="sPayeeAcc" styleId="sPayeeAcc" maxlength = "19" onchange =  "checkAccFormat(this.value,this.id)" />
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
			</html:select>
			</td>
	 </tr>
	 
	 
	 
		<tr>
			<td colspan="3">
			   <b><u><bean:message bundle="hindi" key='7087'/>
			</td>
	</tr>
	 <tr>
			<td>
			  Payee Mobile No.</td>
			   <td width="2"></td>
			   <td>     
				 <html:text property="payeeMob" styleId="payeemob" maxlength = "10" onchange = "phonenumber(this.value,this.id)" size="30" />
			</td>
		</tr>
			<tr>
			<td>
			   <bean:message bundle="hindi" key='7453'/></td>
			   <td width="2"></td>
			   <td>     
				<html:text property="IFSCcode" size="30" styleId="IFSCcode"  maxlength="11" />
			</td>
		</tr>
		 <tr>
		   <td>
		     MMID</td>
		      <td width="2"></td>
		      <td>     
		    <html:text property="mmid" styleId="mmid" size="30"/>
		   </td>
		  </tr>
		<tr>
			<td>
			   Customer Mobile No.</td>
			   <td width="2"></td>
			   <td>     
				<html:text property="mob" styleId="mob" size="30" readonly="true"/>
			</td>
		</tr>
	<%if( (custRole.equals("S") || custRole.equals("E")  || custRole.equals("F"))) {%>	 <!--Txn password for entry user and authorizer-->
	<tr><td>Enter Transaction Password: </td>
		<td width="2"></td><td><input type ="password" name="txnpass" id="txnpass" value = ''/ >  </td></tr>
	<%}%>
		<tr></tr>
		<tr>
			<td>
				<html:button property="continue" styleClass="Button" onclick="continuFund()" >
				<bean:message bundle="hindi" key='7089'/></html:button></td>
				
				<td width="2"></td>
			
			<td>
			<html:button property="back" styleClass="Button" onclick="bacck()" >
				<bean:message bundle="hindi" key='843'/></html:button>
				
			 </td>

			
		
		
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