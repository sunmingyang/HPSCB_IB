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
				window.location.href = "/mobile/Agent_fund_transfer.html"
		}

	</script>
	
	<body style="margin:0 0 0 0;" onload="fillData()"><br>

   <table>
		   <tr><td>
			A/c number
					<input type=text  id="bank_from_a/cno" style="margin-left:90px;" onblur="getName(this.id)" />
		   </td></tr>
		   <tr><td>
			Name
					<input type=text  id="bank_from_name" style="margin-left:120px;" readonly/>
		   
		   </td></tr>
		   <tr><td>
		   Mobile Number
					<input type=text  id="bank_from_mobno" style="margin-left:72px;" readonly/>
		   
		   </td></tr>
		    <tr><td>
		   Available balance
					<input type=text  id="bank_from_bal" style="margin-left:65px;" readonly/>
		   
		   </td></tr>
		  
		   </table>
		   </form>
			
	</body>
	
		 
