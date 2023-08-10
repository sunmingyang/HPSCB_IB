			<%@ include file='/common/Include.jsp' %>
			<%
			
		 int errorcount=0;
		 String usrName1 = "";
		 String AccINFO[][] = (String[][])session.getAttribute("AccINFO"); 
		 System.out.println(AccINFO);
		if(session.getAttribute("user") != null)
			usrName1 = (String)session.getAttribute("user");
		
		String login_id="";
		if(session.getAttribute("userid")!=null){
			login_id = (String)session.getAttribute("userid");
		}
			%>
			<%
			
				String usrInfo[][]=null;
				String curr[][]=null;
				String data[];
				if(session.getAttribute("userInfo")!=null) {
				   usrInfo  = (String[][])session.getAttribute("userInfo");
			}
				if(session.getAttribute("currency")!=null) {
				   curr= (String[][])session.getAttribute("currency");
				}
			int len=0,len1=0;
			String usrType=(String)session.getAttribute("validToken");
			if(usrInfo != null)
				{
						len = usrInfo.length;
				}
			if(curr !=null)
			{
			len1=curr.length;
			}
				String usrName = (String)session.getAttribute("user");
				HashMap req_detail=(HashMap)session.getAttribute("req_detail");   
				String accno="";
				String sAmt="";
				String nameOfBen="";
				String curCode="";
				String payableAt="";
				String req_type="";
				if(req_detail!=null)
				{
					ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
					ArrayList req_amt=(ArrayList)req_detail.get("req_amt");
					ArrayList req_NameBen=(ArrayList)req_detail.get("req_NameBen");
					ArrayList  req_curcode=(ArrayList)req_detail.get("req_curcode");
					ArrayList  req_payable=(ArrayList)req_detail.get("req_payable");
					ArrayList chk_type=(ArrayList)req_detail.get("req_type");
			//		String desc=(String)chk_desc.get(Integer.parseInt((String)request.getParameter("row"))) ;
					accno=(String)acc_nums.get(Integer.parseInt((String)request.getParameter("row"))) ;
					sAmt=(String)req_amt.get(Integer.parseInt((String)request.getParameter("row")));
					nameOfBen=(String)req_NameBen.get(Integer.parseInt((String)request.getParameter("row"))) ;
					req_type=(String)chk_type.get(Integer.parseInt((String)request.getParameter("row"))) ;
				System.out.println("!!!!!!!!!NAME IN JSP IS   "+nameOfBen);
			curCode=(String)req_curcode.get(Integer.parseInt((String)request.getParameter("row"))) ;
			payableAt=(String)req_payable.get(Integer.parseInt((String)request.getParameter("row"))) ;

				}

			%>


			<script>

			function BranchInfo()
			{
			  var ran=parseInt(Math.random()*9999);
			  var bankCode= document.getElementById('bankCode').value;
			  var branchCode= document.getElementById('branchCode').value;
			 var url="/request/DDRequest.do?action=getDependentMasterName&masterType=BankBranch&Code="+branchCode+"&Criteria1="+bankCode;
					//alert(url);
					http.open("POST",url,false);
					http.onreadystatechange= function (){process()};
					http.send(null)
				
			}               
			 function process (){
				// alert("dd");
					 if (http.readyState == 4)
					{
						// Check that a successful server response was received
						if (http.status == 200)
						{
							   var resArray=http.responseText;
							   var jsonData = JSON.parse(resArray);
							   //alert(jsonData);
					 document.getElementById('isBranchName').value=jsonData[1];   
						}
					}

			}

			function BankInfo()
			{
			  var ran=parseInt(Math.random()*9999);
			 
			var url="/request/DDRequest.do?action=getMaster&masterType=RespondingBankYes";
					alert(url);
					http.open("POST",url,false);
					http.onreadystatechange= function (){processdataInfo()};
					http.send(null);	
				
			}
							 var bankCode='';
							 var brName='';
					 function processdataInfo()
			{
					 if (http.readyState == 4)
					{
						// Check that a successful server response was received
						if (http.status == 200)
						{
							   var resArray=http.responseText;
							   var jsonData = JSON.parse(resArray);
							   //alert(jsonData);
							   bankCode=jsonData[0];
								brName=jsonData[2];
								for(var i=0;i<bankCode.length;i++)
							{
								 select = document.getElementById('bankCode');
								  var opt = document.createElement('option');
								  opt.value = bankCode[i];
								  opt.innerHTML = bankCode[i];
								  select.appendChild(opt);
							}
						
						}
					}

			}

			function setName1(){
				var data=document.getElementById('bankCode').value;
				for(var i=0;i<bankCode.length;i++){
					 if(data==bankCode[i])
								{
						 document.getElementById('isBankName').value=brName[i];
								}
				}
				
				
			}

			function DocumentType()
			{
				 var ran=parseInt(Math.random()*9999);
				 
					var url="/request/DDRequest.do?action=getMaster&masterType=DocType";
					//alert(url);
					http.open("POST",url,false);
					http.onreadystatechange= function (){processdata()};
					http.send(null);	
				
			}
							var data2='';
							var data3='';
							function processdata(){
							if (http.readyState == 4)
			   {
						// Check that a successful server response was received
						if (http.status == 200)
			   {

							var resArray=http.responseText;
							var jsonData = JSON.parse(resArray);
							//alert(jsonData);
							data2=jsonData[0];
							data3=jsonData[2];
							for(var i=0;i<data2.length;i++)
							{
								  select = document.getElementById('DocType');
								  var opt = document.createElement('option');
								  opt.value = data2[i];
								  opt.innerHTML = data2[i];
								  select.appendChild(opt);
								  
						   }
						  
						}
					}

			}

			function onSet()
			{
				
				var rr= document.getElementById('DocType').value;
				
						for(var i=0;i<data2.length;i++)
							{
						 if(rr==data2[i])
								{
						 document.getElementById('isDocType').value=data3[i];
								}
							}
			}
			function saveData()
			{
			 
				var amount=parseFloat(document.getElementById("amount").value);
				if(document.getElementById("amount").value=="")
				{
					alert("Please Enter Valid Amount");
					document.getElementById("amount").focus();
					return false;
				}
				if(amount<15)
				{
					alert("Entered Amount is Less Than Min Amount");
					document.getElementById("amount").focus();
					return false;
				}
				if(amount>100000)
				{
					alert("Entered Amount is Greater Than Max Amount");
					document.getElementById("amount").focus();
					return false;
				}
				//var obj=new obj();
				  var purpose='DDREQ';
				var userid= document.getElementById("userid").value;
				var payableAt=document.getElementById("payableAt").value;
				var docType=document.getElementById("DocType").value;
				var accno=document.getElementById("accNo").value;
				var commission=document.getElementById("commission").value;
				var branchCode=document.getElementById("branchCode").value;
				var nameOfBen=document.getElementById("nameOfBen").value;
				var bankCode=document.getElementById("bankCode").value;
				var obj=  {"amount" :amount ,"payableAt" : payableAt,"docType" :docType,"accno" :accno,"commission" :commission,"branchCode" : branchCode,"nameOfBen" :nameOfBen,"bankCode" :bankCode};
				
				var jsonStr = JSON.stringify(obj);
				alert(jsonStr);
				
				var ran=parseInt(Math.random()*9999);
				var url="/request/DDRequest.do?action=SaveDocumentMobile&JSONString="+jsonStr+"&userId="+userid+"&accountNo="+accno+"&purpose="+purpose;
				alert(url);
				http.open("POST",url,false);
				http.onreadystatechange= function (){processAlldata()};
				http.send(null);
	}
	function processAlldata(){
		if (http.readyState == 4)
			{
				if (http.status == 200)
				{
					   var resArray=http.responseText;
					   var jsonData = JSON.parse(resArray);    
					  
					
				}
			}

	}


			</script>

				<html>
				<tiles:insert page="/common/siteLayout.jsp" flush="true">
				<tiles:put name="title" value="Request"/>
			<% if(!usrType.equals("admin")){%>
				<tiles:put name="menu" value="/common/user_left.jsp?src=request"/>
				<%}%>
				<tiles:put name="header" value="/common/header.jsp"/>
				<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
				<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=req"/>
				<tiles:put name="line" value="/common/line.html"/>
				<tiles:put name="page_header" type="String" >
				&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
				Request >>Demand Draft Request
				</tiles:put>
				<tiles:put name="content" type="String">
				<br>
				<br>
			<body onload="loadfun();DocumentType();BankInfo()">
			<html:form action="/request/DDRequest">

			<table>
				<tr>
					<td class="simple">	
						Account No
					</td>
					<td class="simple">	
					<%if(req_detail==null){%>
					<html:select property="accList" >
					<%	if(len != 0)
						{ 
							String accNo = "";
							for(int i=0; i<len; i++)
							{
								
								accNo = usrInfo[i][1]+"-"+usrInfo[i][0];
								%>
								<html:option value='<%=accNo%>' styleId="accNo"><%=accNo%></html:option>
								<%
							}
						}	%>
					</html:select >
							<%}
						else
							{%>
							<html:select property="accList" disabled="true">
									<html:option value="accno"><%=accno%></html:option>
							</html:select>
							<%}%>
					</td>
				</tr>
				<tr>
					<td class="simple">
					Name of Beneficiary
					</td>
					<td class="simple" colspan="4">
					<%if(req_detail==null){%>
							<html:text property="nameOfBen" size="40" maxlength="70" styleId="nameOfBen" />
							(Max Length 70 Char)
							<%}else{%>
							<html:text property="nameOfBen" size="40" maxlength="70" value="<%=nameOfBen%>" />
							<%}%>
					</td>
				</tr>
				<tr>
				<td class="simple">
				Document Type
				</td>
				<td>
					  
						<html:select property="docType" styleId="DocType" onchange="onSet()">
						
							<html:option value="DocType" >Select</html:option>	
									
						</html:select>
						<input type="text" name="isDocTypeLabel" size="50" tabindex="-1" value=""  class="LabelText" id="isDocType" > 
				</td>
				</tr>
				<tr>
				<td class="simple">
				Bank Name
				</td>
				<td>
						  <html:select property="bankCode" styleId="bankCode" onchange="setName1()">
						
							<html:option value="bankCode" >Select</html:option>	
									
						</html:select>
							
						<input type="text" name="isBankName" size="50" tabindex="-1" value=""  class="LabelText" id="isBankName" readonly="readonly"> 
				</td>
				</tr>
				<tr>
				<td class="simple">
				Branch Name	
				</td>
				<td>
					  
						<html:text property="branchCode" maxlength="15" tabindex="2" value="" onchange="BranchInfo()" styleId="branchCode"/>	
						<input type="text" name="isBranchName" size="50" tabindex="-1" value=""  class="LabelText" id="isBranchName" readonly="readonly">
				</td>
				</tr>
				<tr>
				<td class="simple">
				Commission	
				</td>
				<td>
				
						<html:text property="commission"  styleId="commission"  size="20" styleId="commission" maxlength="15"  tabindex="2" value=".00" />
						 
				</td>
				</tr>
				<tr>
					<td class="simple">
					Demand Draft Amount
					</td>
					<td>
						<%if(req_detail==null){%>
							<html:text property="amount"  size="20" styleId="amount" maxlength="15" onkeypress="javascript:isValidAmount(event,amount)" />
						<%}else{%>
							<html:text property="amount" size="20" styleId="amount" value="<%=sAmt%>" maxlength="15" readonly="true"/>
						<%}%>
					</td>
					<td class="simple">
					Currency
					</td>
					<td>


					<%if(req_detail==null){%>
							<html:text property="curCode" size="20" styleId="curCode" maxlength="15" readonly="true" value="<%=usrInfo[0][5]%>" />
						<%}else{%>
							<html:text property="curCode" size="20" styleId="curCode" value="<%=curCode%>" maxlength="15" readonly="true"/>
						<%}%>

						</td>
				</tr>
				<tr>
					<td class="simple">
						&nbsp;&nbsp;&nbsp;Maximum Amount :<b> 100000.00 Rs</b>
					</td>
				</tr>
				<tr>
					<td class="simple">
					Payable At
					</td>
					<td class="simple">
					<%if(req_detail==null){%>
							<html:text property="payableAt" styleId="payableAt" size="20" maxlength="35"  />
					<%}else{%>
							<html:text property="payableAt" size="20" styleId="payableAt" maxlength="35" disabled="true" value="<%=payableAt%>"/>				
						<%}%>
					</td>
				</tr>
				<!-- <tr>
					<%if(req_detail==null){%>
					<td class="simple">
					Enter Transaction Password
					</td>
					<td>
							<html:password property="tranPass" styleId="tranPass"   maxlength="20"/>
					</td>
					<%}%>
				</tr> -->
				<tr>
					
					<td>
					<%if(req_detail==null){%>
						<input type="button" name="save" value="Save" onclick="saveData()" class="button"/ >
					<%}else{%>
						<input type="button" name="save" value="Save" disabled class="button"/ >
					<%}%>
					</td>
				</tr>
				 <tr>
				<td>
					<input type="hidden"  style="margin-left: px;" maxlength="35"  value="<%=login_id%>" size="40" id="userid">
				</td>
				</tr>
			</table>
					<div id="diverrmessage">
						<logic:messagesPresent property="NoServer">
						<html:errors property="NoServer"/>
						</logic:messagesPresent>
						<logic:messagesPresent property="FatalError">
						<html:errors property="FatalError"/>
						</logic:messagesPresent>
					<!-- 	<logic:messagesPresent property="InvalidTranPass">
						<html:errors property="InvalidTranPass"/> -->
						</logic:messagesPresent>
					</div>
			</html:form>
			</body>
			</html>
			</tiles:put>
			<tiles:put name="add" value="/Advertisement/add.jsp"/>
			<tiles:put name="footer" value="/common/footer.jsp"/>
			</tiles:insert >