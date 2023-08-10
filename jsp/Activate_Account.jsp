	<%@ include file="/common/Include.jsp" %>
	<% String  custRole=(String)session.getAttribute("custRole"); %>
	<html>
	<head>
	<script language=JavaScript src="/scripts/MD5.js"> </script>
	<script language=JavaScript src="/scripts/Enc_Desc.js"> </script>
	<script language="JavaScript" >
	 var mobNo;
	 var custrole = '<%=custRole%>';
	 function cancel()
	 {
      window.location.href="/new_ui/corploginPage.jsp" ;
	 }
	function mobileNo()
	{
				
		var accNo=document.getElementById("bn_account_number").value;
		//alert(accNo);
		var ran=parseInt(Math.random()*9999);
		var url="/AccountInfoAction.do?action=fetchCustomerMobileNo&accountNo="+accNo+"&ran="+ran;
		http.open("POST",url,false);
		http.onreadystatechange= function (){processMob()};
		http.send(null);
					
	}
	function processMob(){
				
		if((http.readyState == 4) && (http.status == 200)){
			var resArray=http.responseText;
			var jsonData = JSON.parse(resArray);
				//  alert(jsonData.mobileNo);
			 mobNo=jsonData.mobileNo;
			
	 }
				
	 }      

	function sendOTP(){
		 var userId=document.getElementById("userId").value;
		 var accNo=document.getElementById("bn_account_number").value;
		 var sSessionId='<%=session.getId()%>';
		 var ran=parseInt(Math.random()*9999);
		 var purpose="Password Change";
		 var url="/TransactionAction.do?action=sendOTP&userID="+userId+"&beneficiaryAccNo="+accNo+"&mobile="+mobNo+"&purpose="+purpose+"&sessionID="+sSessionId+"&ran="+ran;
		http.open("POST",url,false);	
		http.onreadystatechange= function (){processResOTP()};
		http.send(null);
					
	}
	function processResOTP(){
		 if (http.readyState == 4)
		{
						// Check that a successful server response was received
			if (http.status == 200)
			{
				var resArray=http.responseText;
				var jsonData = JSON.parse(resArray);
				alert("Dear Customer your OTP has been sent on Mobile: "+jsonData.mobileNo);
			}
		}
			}
	function confirm()
			{
			 var otp=document.getElementById("otp").value;
			 var sSessionId='<%=session.getId()%>';
			 if (document.getElementById("npassword").value != document.getElementById("cpassword").value )
			 {
			 	alert("Password and Confirm Password do not Match") ; 
			 	return false ;
			 }
			 var userId=document.getElementById("userId").value;
			 var accNo=document.getElementById("bn_account_number").value;
			 var encPassword = calcMD5(document.getElementById("npassword").value);
			 var otherPassword = calcMD5(document.getElementById("cpassword").value);
			 var ran=parseInt(Math.random()*9999); 
			 var url="/AccountInfoAction.do?action=passWordChangeUrl&userID="+userId+"&beneficiaryAccNo="+accNo+"&OTP="+otp+"&encPassword="+encPassword+"&sessionID="+sSessionId+"&SIMNO=&otherPassword="+otherPassword+"&ran="+ran;

				http.open("POST",url,false);	
			   http.onreadystatechange= function (){processResponce()};
				http.send(null);	
				
			}
	function processResponce()
			{
			if (http.readyState == 4)
					{
						// Check that a successful server response was received
						if (http.status == 200)
						{
							var resArray=http.responseText;
							var jsonData = JSON.parse(resArray);
							if (jsonData.result=="success" ) {
								alert("Dear Customer Your Account has been activated");
								if(custrole==='F' || custrole==='E' || custrole==='S')
								{
								window.location.href="/new_ui/corploginPage.jsp" ;  
								} else { 
								window.location.href="/jsp/loginform.jsp" ;  
								}
							}else if(jsonData=="-2"){
								alert("Dear Customer your OTP do not match");
								return false ; 
							}else if(jsonData=="-3"){
								alert("Dear Customer your OTP has been expired ");
								return false ; 
							}
							
							//alert(jsonData);
						  //alert("Dear Customer your Password has been Change on Mobile: "+jsonData.result);
						}
					}
			}

				</script>

					</head>

					<body>
						<div style="position:fixed; width:100%;background-color: #d9534f;  padding:0px; top:0px;min-height: 17px;margin-top:45px ">
						</div> 
						<div align="center" style="position:fixed; width:100%; padding:0px;background-color: #d9534f; bottom:0px;min-height: 17px; margin-bottom:45px ">

						</div> 
						<!-- <div style="margin-top:60px;" ><img src="./img/logo.png" alt="..." class="img-responsive" style="margin:0px auto;display:block"  /></div> -->
					
						<div id="container-div" class="container" style="margin-left: 20px;margin-top:0px;overflow-y: auto; " >
						   

									<br/><div style="display:none" id="alert-div" class="alert alert-danger col-sm-12"></div>
									
									<br/><div ><span style="font-size:24px;color:#d9534f;">*</span> <span style="font-size:18px;color:#666666;">User Id</span> </div>
									<br/><input type=text  id="userId" value="" /><!-- 262054 -->

									<br/><div ><span style="font-size:24px;color:#d9534f;">*</span> <span style="font-size:18px;color:#666666;">Account No.</span> </div>
									
									<br/><input type=text  id="bn_account_number" onblur="mobileNo()" value=""/> <!-- 002010000165 -->

									<br/><br/><input type=button value="Send OTP" onclick="sendOTP();" style="min-height:30px;background: #696969;color:#ffffff;min-width: 125px;font-size:18px;"/>
									
									
									<br/><br/><div ><span style="font-size:24px;color:#d9534f;">*</span> <span style="font-size:18px;color:#666666;">New Password</span> </div>
									
									<br/><input type="password"  id="npassword" />
									<br/><div ><span style="font-size:24px;color:#d9534f;">*</span> <span style="font-size:18px;color:#666666;">Confirm Password</span> </div>
									
								
									<br/><input type="password"  id="cpassword" />
									<br/><div ><span style="font-size:24px;color:#d9534f;">*</span> <span style="font-size:18px;color:#666666;">OTP Code</span> </div>
									
									
									<br/><input type=text  id="otp" />
									<br/><br/><input type=button value="Submit" onclick="confirm();" style="min-height:30px;background: #696969;color:#ffffff;min-width: 125px;font-size:18px;"/>
									<input type=button value="Cancel" onclick="cancel();" style="min-height:30px;margin-left:20px;background: #bdbdbd;color:#ffffff;min-width: 125px;font-size:18px;"/>
						   
						   
					</div>
				
					</body>
				  
					  
				</html>

		<style>
				#container-div {
				  position: absolute;
				  top: 10%;
				  bottom: 0;
				  height: 75%;
				  width: 100%;
				  border-top: 0px solid #2E2E2E;
				 

				}
		</style>

