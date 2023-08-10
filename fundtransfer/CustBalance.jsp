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
				 
			 var url ="/AccountInfoAction.do?action=fetchAccountBalance&accNo="+acnumber+"&ran="+ran; 
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
				if(id1=="bank_from_a/cno")
	   			{
					document.getElementById('bank_from_name').value=jsonData.customerName;
		        	document.getElementById('bank_from_mobno').value=jsonData.mobileNo;
			  		document.getElementById('bank_from_bal').value=jsonData.accBalance;
	   			}	
	
						  
			}
		}

	}

		function bacck(){
			window.location.href = "/fundtransfer/CustBalance.jsp"
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

   <table>
		   <tr><td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>A/c number</B>
					<input type=text  id="bank_from_a/cno" style="margin-left:90px;" onblur="getName(this.id)" />
		   </td></tr>
		   <tr><td>
			<B>Name</B>
					<input type=text  id="bank_from_name" style="margin-left: 135px;width: 198px;" readonly/>
		   
		   </td></tr>
		   <tr><td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		   <B>Mobile Number</B>
					<input type=text  id="bank_from_mobno" style="margin-left:69px;" readonly/>
		   
		   </td></tr>
		    <tr><td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		   <B>Available Balance</B>
					<input type=text  id="bank_from_bal" style="margin-left:55px;" readonly/>
		   
		   </td></tr>
		  
		   </table>
			
	</body>
	</html:form>

	</tiles:put>
	</html:form>


	</tiles:insert>



		 
