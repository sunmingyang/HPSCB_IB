	<%@ include file="/common/Include.jsp" %>
	<%
		String accountList="" ; 
		String [] AccListArr= null ; 
		if (session.getAttribute("allAccountlist") != null ) { 
		   accountList=(String)session.getAttribute("allAccountlist");
		   AccListArr =accountList.split(",");
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
			System.out.println("snxw--------------------------"+login_id);
		}
		
	%>
	<script>

	function fillData()
	{
			
	}
	

	</script>



	<script>
	function getName(id)
	{
				
				var acnumber=document.getElementById(id).value;
				 var ran=parseInt(Math.random()*9999);
				 
			 var url ="/AccountInfoAction.do?action=fetchAccountAadhar&accNo="+acnumber+"&ran="+ran; 
					//alert(url);
					http.open("POST",url,false);
					http.onreadystatechange= function (){processdata2(id)};
					http.send(null);	
				
	}
				
	function processdata2(id1){
	if (http.readyState == 4)
	{
			// Check that a successful server response was received
			if (http.status == 200)
		   {
				var resArray=http.responseText;
				var jsonData = JSON.parse(resArray);
				if (jsonData.accFlag=="C") {
				 	alert("Account has been closed");
				 	return false ;
				}
				if(id1=="accNumber")
	   			{
					document.getElementById('bank_from_name').value=jsonData.customerName;
		        	document.getElementById('bank_from_mobno').value=jsonData.mobileNo;
			  		document.getElementById('cust_nic').value=jsonData.nicno;
	   			}	
	
						  
			}
		}

	}

		function bacck(){
			window.location.href = "/fundtransfer/CustomerAadharUpdate.jsp"
		}

	function saveAadharDetails(){
				var accnumber=document.getElementById(id).value;
				var aadharNumber=document.getElementById("adharNo").value;
				if(aadharNumber==""){
					alert("Enter aadhar card number");
					document.getElementById("adharNo").focus();
					return false;
				}
				
				var url="<%=request.getContextPath()%>/AccountInfoAction.do?action=updateAccountAdhar&accNo="+accnumber+"&aadharNumber="+aadharNumber;
				
				http.open("post",url,false);
				http.onreadystatechange= function (){ message() };
				http.send(null);	
			}
			function message(){
				if(http.readyState==4 && http.status==200){
					var res=http.responseText;
					if(res=="Y"){
						alert("Details updated successfully");
						
					}
					else{
						alert("Details not updated successfully");
					}
					back();
				}
			}
		
	</script>
	<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
	<!-- <html:form action="/jsp/login.do"> -->
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=agentfund"/>
	<tiles:put name="menu" value="/common/user_left.jsp?src=agentfund"/>
	<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
	&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
	</tiles:put>
	<html:form action="/request/DDRequest">
	<body style="margin:0 0 0 0;" onload="fillData()"><br>

   <table border="1">
		   <tr><td>A/c Number</td> 
		   		<td><input type=text  id="accNumber" style="margin-left:20px;" onblur="getName(this.id)" size="50" />
		   </td></tr>
		   <tr><td>Name</td> 
		   		<td><input type=text  id="bank_from_name" style="margin-left:20px;" readonly  size="50"  />
		   </td></tr>
		   <tr><td>Mobile Number</td> 
		   		<td><input type=text  id="bank_from_mobno" style="margin-left:20px;" readonly size="50" />
		   </td></tr>
		   <tr><td>Aadhar Number</td> 
		   <td><input type=text  id="cust_nic" style="margin-left:20px;"  size="50"  maxlength = "12" />
		   </td></tr>
		 
		   <tr> <tr>
		  <tr>
		  <td> </td> <td>
		  		<input type="button" id="update_btn" onClick="return saveAadharDetails()" value="<bean:message bundle='<%=lang%>' key='2353'/>" class="button" style="height:35px;width:80px;border:none;font-size:12pt;">
		  </td></tr>

		   </table>
			
	</body>
	</html:form>

	</tiles:put>
	</html:form>


	</tiles:insert>



		 
