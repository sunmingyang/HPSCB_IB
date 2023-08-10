<%@ include file='/common/Include.jsp' %>
<%@ page import="java.util.Date"%>

<%  String usrType=(String)session.getAttribute("validToken");
	String usrName = (String)session.getAttribute("user");
	String userInfo[][]=(String[][])session.getAttribute("userInfo");
	String accNo=null;
	String brnCode=null;
	String userid=(String)session.getAttribute("userid");

	String mobileNumber=(String)session.getAttribute("customerMobile");
	if(mobileNumber!=null && mobileNumber.equals(""))
		mobileNumber="0000000000";
	if(mobileNumber==null)
		mobileNumber="0000000000";
	if(mobileNumber.length()>10)
		mobileNumber=mobileNumber.substring(2);
	//System.out.println("mobileNumber"+mobileNumber);
	//System.out.println("Time:"+DateTimeFunction.PresentTime());
	Date d=new Date();
	String  date="";
	if(d.getDate()<=9)
		date="0"+d.getDate();
	else
		date=d.getDate()+"";
	if((d.getMonth()+1)<=9)
		date=date+"/0"+(d.getMonth()+1)+"/"+d.toString().substring(d.toString().length()-4);
	else
		date=date+"/"+(d.getMonth()+1)+"/"+d.toString().substring(d.toString().length()-4);
	
	String custRole=(String)session.getAttribute("custRole");
	//custRole="G";
	if(custRole!=null && custRole.equalsIgnoreCase("G"))
	{
		userid=(String)session.getAttribute("userid");
		brnCode="0000";
		accNo="";
	}
	else 
	{
			accNo=userInfo[0][0];
			brnCode=userInfo[0][1];
			userid=userInfo[0][8];
	}
	
	System.out.println("custRole="+custRole+"    accNo="+accNo+"     userid="+userid);
	

%><html>
	<head>
	</head>
	<tiles:insert page="/common/siteLayout.jsp" flush="true">
		<tiles:put name="title" value="Recharge_Bill Payment"/>
		<% if(!usrType.equals("admin")){%>
			<tiles:put name="menu" value="/common/user_left.jsp?mode=recharge_billPayment&src=recharge_billPayment"/>
		<%}%>
		<tiles:put name="header" value="/common/header.jsp"/>
		<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
		<tiles:put name="menu_tab" value="/common/menu_tab.jsp?mode=recharge_billPayment&src=recharge_billPayment"/>
		<tiles:put name="line" value="/common/line.html"/>
		<tiles:put name="page_header" type="String" >
		&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
		</tiles:put>
		
		<tiles:put name="content" type="String">
			<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/common.js"></script>
		<script type="text/javascript">
			function showDiv(reqFrom){
				document.getElementById("reqFrom").value=reqFrom;
				if(document.getElementById("detailDiv").style.display=="block"){
					document.getElementById("detailDiv").innerHTML="";
					document.getElementById("detailDiv").style.display="none";
					
				}
				if(document.getElementById("dataDiv").style.display=="block"){
					document.getElementById("amount").value="";
					document.getElementById("email").value="";
					document.getElementById("dataDiv").style.display="none";

				}
				var obj='{"mode":'+reqFrom+'}';
				var req="Recharge";
				if(reqFrom=="billPayment")
					req="Bill Payment";
				var url="/TransactionAction.do?action=getServiceOperatorList&reqFrom="+obj;
				var xhttp = new XMLHttpRequest();
	
				xhttp.onreadystatechange = function() {
					if (xhttp.readyState == 4 && xhttp.status == 200) {
						var resArray=xhttp.responseText;
						if(resArray!=""){
							var data=resArray.split("|");
							var sHtml="";
							sHtml="Select "+req+" For <br>";
							for(var i=0;i<data.length-1;i++)
							{
								//var funName="checkIfAlready('"+i+"','"+reqFrom+"','"+(data.length-1)+"');showDetailDiv('"+reqFrom+"','"+data[i]+"')";
								var funName="checkIfAlready('"+i+"','"+reqFrom+"','"+(data.length-1)+"');";
								sHtml+='<input type="checkbox" id="'+reqFrom+i+'" value="'+data[i]+'" onchange="'+funName+'" />'+data[i]+"<br/>";
							}
							document.getElementById("reqFromLen").value=data.length-1;
							document.getElementById("detailDiv").style.display="block";
							document.getElementById("detailDiv").innerHTML=sHtml;
						}else{
							alert("Error");
							back();
						}
					}
			  };
			  xhttp.open("GET", url, true);
			  xhttp.send();
		}
		function checkIfAlready(i,arrName,length)
		{
			/*var table = document.getElementById("HoldTrn");
			 var rowCount = table.rows.length;
			*/for(var j=0;j<length;j++)
			{
				 if(document.getElementById(arrName+j).checked==true && i!=j)
					 document.getElementById(arrName+j).checked=false;
			}
		}
		function showDetailDiv(reqFrom,val){
			document.getElementById("reqCat").value=val;
			var obj='{"mode":'+reqFrom+',"category":'+val+'}';
			var req="Recharge";
				if(reqFrom=="billPayment")
					req="Bill Payment";
			var otpStr='{"key1":"<%=userid%>","key2":"<%=mobileNumber%>","mobile":"<%=mobileNumber%>","purpose":"'+reqFrom+'"}';
			var url="/TransactionAction.do?action=getServiceOperatorList&reqFrom="+obj+"&otpStr="+otpStr;
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					var resArray=xhttp.responseText;
					if(resArray!=null){
						var data=resArray.split("|");
						var sHtml="<center style='font-weight: bold;color: #92610e;'>"+req.toUpperCase()+"</center><br />";
						var funName="showDiv('billPayment')";
						sHtml+="<table><tr><td style='font-size:15px;font-weight:bold'>For:</td><td class='fldlabel'>"+val+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style='float:right;cursor:pointer;color:purple;text-decoration:underline;' onclick='showDiv(\""+reqFrom+"\")'>Change</span></td></tr>";
						sHtml+="<tr><td style='font-size:15px;font-weight:bold'>Select Operator&nbsp;</td><td><select id='operator' style='height:30px;' onchange='showDiv2()' class='fields'>";
							sHtml+="<option value='-1' >--Operator--</option>";
							for(var i=0;i<data.length-1;i++)
							{
								var data1=data[i].split("~");
								sHtml+="<option value='"+data1[1]+"' >"+data1[0]+"</option>";
							}
							sHtml+="</select></td></tr>";
							if(document.getElementById("detailDiv").style.display=="block"){
									document.getElementById("detailDiv").innerHTML="";
									document.getElementById("detailDiv").style.display="none";
									
							}
							document.getElementById("detailDiv").style.display="block";
							document.getElementById("detailDiv").innerHTML=sHtml;
					}
				
				}
		  };
		  xhttp.open("GET", url, true);
		  xhttp.send();
		 }
		function showDiv2(){
			if(document.getElementById("isOtpGen").value=="0" || document.getElementById("isOtpGen").value==""){
				var reqFrom=document.getElementById("reqFrom").value;
				var otpStr='{"key1":"<%=userid%>","key2":"<%=mobileNumber%>","mobile":"<%=mobileNumber%>","purpose":"'+reqFrom+'"}';
				var url="/TransactionAction.do?action=getServiceOperatorList&otpStr="+otpStr;
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (xhttp.readyState == 4 && xhttp.status == 200) {
						var resArray=xhttp.responseText;
						var mno="<%=mobileNumber%>";
						if(mno!="0000000000")
							alert("OTP send to:"+resArray);
						document.getElementById("isOtpGen").value="1";
						showDataDiv();
					}};
				 xhttp.open("GET", url, true);
			  xhttp.send();
			}
			else {
				showDataDiv();
			}
		}
		function showDataDiv(){
			var oper=document.getElementById("operator").value;
					/*document.getElementById("serviceNumber").value="";
					document.getElementById("mobile").value="";*/
					document.getElementById("amount").value="";
					document.getElementById("email").value="";
					if(oper=="-1"){
						document.getElementById("dataDiv").style.display="none";
					}
					else{
							document.getElementById("dataDiv").style.display="block";
							fetchMasterNumber();
							document.getElementById("serviceNumberSelect").focus();
							var mno="<%=mobileNumber%>";
							if(mno!="0000000000")
								document.getElementById("mobile").value=mno;
						/*	if('<%=custRole%>'=='G')
							{
								document.getElementById("mode").value="Net Banking";

							}*/
						

							
					}
		}
		function saveData(){
			var reqFrom=document.getElementById("reqFrom").value;
			var reqCat=document.getElementById("reqCat").value;
			var operator=document.getElementById("operator").value;
			var serviceNumber=document.getElementById("serviceNumber").value;
			var mobile=document.getElementById("mobile").value;
			var amount=document.getElementById("amount").value;
			var email=document.getElementById("email").value;
			var otp=document.getElementById("otp").value;
			var mode="Net Banking";
			if(document.getElementById("mode")!=null)
				mode=document.getElementById("mode").value;
			var custRole='<%=custRole%>';
			if(serviceNumber==""){
				alert("Enter service number");
				document.getElementById("serviceNumber").focus();
				return false;
			}
			if(amount==""){
				alert("Enter amount");
				document.getElementById("amount").focus();
				return false;
			}
			if(mobile==""){
				alert("Enter mobile number");
				document.getElementById("mobile").focus();
				return false;
			}
			if(email==""){
				alert("Enter email Id");
				document.getElementById("email").focus();
				return false;
			}
			if(otp==""){
				alert("Enter OTP");
				document.getElementById("otp").focus();
				return false;
			}
			if(mode=="-1"){
				alert("Select payment mode");
				document.getElementById("mode").focus();
				return false;
			}
		
			var date='<%=date%>';
			date=date.substring(3,5)+"-"+date.substring(0,2)+"-"+date.substring(6,10);
			var obj='{"type":"'+reqFrom+'","operator":"'+operator+'","serviceNo":"'+serviceNumber+'","mobile":"'+mobile+'","amount":"'+amount+'","email":"'+email+'","brnCode":"<%=brnCode%>","accNo":"<%=accNo%>","date":"'+date+'","activityId":"99","vendorId":"99","mode":"'+mode+'","custRole":"'+custRole+'"}';
			var otpStr='{"otp":"'+otp+'","key1":"<%=userid%>","key2":"<%=mobileNumber%>"}';
			var url="/TransactionAction.do?action=getServiceOperatorList&saveData="+obj+"&otpStr1="+otpStr+"&serviceNo="+serviceNumber+"&serviceType="+reqFrom+"_"+reqCat+"&mobile="+mobile+"&mode="+mode;
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					var resArray=xhttp.responseText;
					if(resArray=="-1")
					{
						alert("OTP didn't match");
						back();
					}else if(resArray=="-2")
					{
						alert("OTP expired");
						back();
					}else if(resArray=="~3")
					{
						alert("Transaction failed due to insufficient balance");
						back();
					}else if(resArray=="Dr_ACC_CLOSE")
					{
						alert("Your account is closed");
						back();
					}else if(resArray=="~~") {
						alert(reqFrom+" failed from API");
						back();
					}
					else if(resArray=="~1"||resArray==""){
						alert("Internal Error");
						back();
					}else if(mode=="IB"){
						alert("Transaction is successful.Your id is:"+resArray);
						back();
					}
					else{
						alert("Transaction is successful.Your id is:"+resArray);
					//	window.parent.location.href=resArray;
						back();
					}
					
				}
			};
			 xhttp.open("GET", url, true);
		  xhttp.send();
			
		}
		function back(){
			window.location.href="<%=request.getContextPath()%>/jsp/main_page.jsp";
		}
		function showSer_Num(){
			var a=document.getElementById("serviceNumberSelect").value;
			if(a=="O"){
				document.getElementById("serviceNoDiv").innerHTML='<input type="text" id="serviceNumber" maxlength="10" onkeypress="return isValidNum(event)" value="" class="fields"/>';
			}
			else
				document.getElementById("serviceNumber").value=a;
		}
		function isValidNum(evt){
			debugger;
			 var charCode = (evt.which) ? evt.which : event.keyCode; 
				 if (charCode != 46 && charCode != 45 && charCode > 31 && (charCode < 48 || charCode > 57))
				   return false;
				 return true;
		}
		function fetchMasterNumber(){
			var reqFrom=document.getElementById("reqFrom").value;
			var reqCat=document.getElementById("reqCat").value;
			var url="/TransactionAction.do?action=getServiceOperatorList&serviceType="+reqFrom+"_"+reqCat;
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					var resArray=xhttp.responseText;
					if(resArray!=""){
						var selectfld=document.getElementById("serviceNumberSelect");
						var data=resArray.split("|");
						var opt;
						var mno="<%=mobileNumber%>";
						if(mno!="0000000000"){
							opt= document.createElement('option');
							opt.value ="<%=mobileNumber%>";
							opt.innerHTML ="<%=mobileNumber%>";
							selectfld.appendChild(opt);
						}
						for(var i=0;i<data.length-1;i++)
						{
							opt = document.createElement('option');
							opt.value = data[i];
							opt.innerHTML =data[i];
							selectfld.appendChild(opt);
						}
						opt = document.createElement('option');
						opt.value = "O";
						opt.innerHTML ="Other";
						selectfld.appendChild(opt);
						if(mno!="0000000000")
							document.getElementById("serviceNumber").value="<%=mobileNumber%>";
						else
							showSer_Num();
					}
				}
			};
			 xhttp.open("GET", url, true);
		  xhttp.send();

		}
		function clickOper(){
			debugger;
			if(document.getElementById("dataDiv").style.display=="block")
			{
				saveData();
			}else{
				var reqFrom=document.getElementById("reqFrom").value;
				var length=document.getElementById("reqFromLen").value;
				var flag=false;
				for(var i=0;i<length;i++)
				{
					var opCheck=document.getElementById(reqFrom+i);
					if(opCheck!=null && opCheck.checked==true){
						showDetailDiv(reqFrom,opCheck.value);
						flag=true;
						return;
					}
				}
				if(!flag && reqFrom!="" && reqFromLen!="")
				{	alert("Select checkbox first");
					return false;
				}else{
					alert("Please select from Pay Bills or Recharge first");
					return false;
				}
			}
		}
		</script>
		<body >
				<form>
					<br /><u class="header" > 
					Recharge & Bill Payment
					</u>
					<div style="text-align:center;margin:auto;">
					<table  align="center" class="wrapperDataTable" cellpadding="0" cellspacing="0" style="margin:auto;width:80%;height:250px">
						<tr>
							<td align="center" style="font-size:8pt;font-style:italics;">
								<input type="button" class="image-btn" style="background:url(<%=request.getContextPath()%>/payment/billPay.png) no-repeat;" title="Bill Payment" onclick="showDiv('billPayment')" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" class="image-btn" style="background:url(<%=request.getContextPath()%>/payment/recharge.png) no-repeat;"  title="Recharge" onclick="showDiv('recharge')"/>
								<br />
								<span onclick="showDiv('billPayment')"  class="image-lbl">Pay Bills</span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span onclick="showDiv('recharge')"  class="image-lbl">Recharge</span>
							</td>
						</tr>
						<tr>
							<td align="center">
								<div id="detailDiv" style="font-size:15px;width:50%;margin:auto;text-align:left;display:none">
								</div>
							<td>
						</tr>
						<tr>
							<td id="dataDiv" align="center" style="display:none">
								<div style="width:50%;margin:auto;text-align:left;">
									<table>
									<tr>
										<td class="fldlabel">Service Number:</td>
										<td>
											<select id="serviceNumberSelect" onchange="showSer_Num()" class="fields">
											</select>
											<div id="serviceNoDiv">
												<input type="text" id="serviceNumber" maxlength="20" onkeypress="return isValidNum(event)" value="<%=mobileNumber%>" readonly class="fields"/>
											</div>
											
									</tr>
									<tr>
										<td class="fldlabel">Amount:</td>
										<td><input type="text" id="amount" maxlength="10" onkeypress="return isValidNum(event)" class="fields"/>
									</tr>
									<tr>
										<td class="fldlabel">Mobile:</td>
										<td><input type="text" id="mobile" maxlength="10" onkeypress="return isValidNum(event)" value="" class="fields"/>
									</tr>
									<tr>
										<td class="fldlabel">Email ID:</td>
										<td><input type="text" id="email" maxlength="50" class="fields" onchange="return isValidEMail('email')"/>
									</tr>
									<tr>
										<td class="fldlabel">OTP:</td>
										<td><input type="text" id="otp" maxlength="6" class="fields"/>
									</tr>
									<% if(!custRole.equals("G")){%>
										<tr>
											<td class="fldlabel">Payment Mode:</td>
											<td>
												<select id="mode"  class="fields">
													<option value="-1">--Payment Mode--</option>
													<option value="IB">HPSCB Payment</option>
													<option value="Net Banking">Payment Gateway</option>
												</select>
										</tr>
									<%}%>
								</table></div>
							</td>
						</tr>
					</table>
					<input type="hidden" value="" id="reqFrom"/>
					<input type="hidden" value="" id="reqFromLen"/>
					<input type="hidden"  id="reqCat"/>
					<input type="hidden"  id="isOtpGen" value="0"/>
					<input type="button" value="OK" class="button"  onclick="clickOper();" id="okBtn" style="cursor:pointer;height:35px;width:80px;border:none;font-size:12pt;"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="Cancel" onclick="back()" style="cursor:pointer;height:35px;width:80px;border:none;font-size:12pt;"/></div>
				<form>
		</body>
		</tiles:put>
		<tiles:put name="add" value="/Advertisement/add.jsp"/>
		<tiles:put name="footer" value="/common/footer.jsp"/>
	</tiles:insert >
</html>

<style>
.image-btn{
	height:50px;
	width:50px;
	cursor:pointer;
	border:none;
}
.image-btn:hover{
	border:1px solid blue;
}
.image-lbl{
	cursor:pointer;
	font-size:15px;
	color:orange;
	font-weight:bold;
}
.image-lbl:hover{
	text-decoration: underline;
}

.header{
	font-family: Verdana, Arial, Helvetica, sans-serif;
    font-size: medium;
    font-weight: bold;
    color: #92610E;
   
}
.fldlabel {
    font-size: 13px;
    font-weight: bold;
}
.fields {
    /* font-weight: bold; */
    /* color: #92610e; */
	font-size:12px;
    width: 150px;
    height: 25px;
}
</style>