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
                debugger;
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
				debugger;
            
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
			<jsp:include page="/dashBoard/dashboardNew.jsp" />
			<body onload="loadfun();DocumentType();BankInfo()">
			<html:form action="/request/DDRequest">

            
           
                <div class="breadcrumb-container">
                    <div class="row">
                        <div class="col">
                            <div class="breadcrumb">
                                <div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
                               
                                <div class="breadcrumb-item"><a >Request</a></div>
                                
                                <div class="breadcrumb-item"><a> Demand Draft Request</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <h5 class="justify-content-center  badge bg-primary p-2 fs-6  ">Demand Draft Request</h5>
                </div>
                <div class="container-fluid box-sec p-4">
                    <div class="row">
                        <div class="col-md-3">
                          
                                <label class="simple" for="accList">Account No</label>
                                <% if (req_detail == null) { %>
                                    <select class="form-control" id="accList" name="accList">
                                        <% if (len != 0) {
                                            String accNo = "";
                                            for (int i = 0; i < len; i++) {
                                                accNo = usrInfo[i][1] + "-" + usrInfo[i][0];
                                        %>
                                                <option value='<%= accNo %>'><%= accNo %></option>
                                        <% }
                                        } %>
                                    </select>
                                <% } else { %>
                                    <select class="form-control" id="accList" name="accList" disabled>
                                        <option value="accno"><%= accno %></option>
                                    </select>
                                <% } %>
                          
                        </div>
                        <div class="col-md-3">
                          
                                <label class="simple" for="nameOfBen">Name of Beneficiary</label>
                                <% if (req_detail == null) { %>
                                    <input type="text" class="form-control" id="nameOfBen" name="nameOfBen" size="40" maxlength="70">
                                    <p class="small">(Max Length 70 Char)</p>
                                <% } else { %>
                                    <input type="text" class="form-control" id="nameOfBen" name="nameOfBen" size="40" maxlength="70" value="<%= nameOfBen %>">
                                <% } %>
                          
                        </div>
                  
                  
                        <div class="col-md-3">
                          
                                <label class="simple">Document Type</label>
                                <select class="form-control" id="docType" name="docType" onchange="onSet()">
                                    <option value="DocType">Select</option>
                                </select>
                                <input type="text"  class="form-control" name="isDocTypeLabel" size="50" tabindex="-1" value="" class="LabelText" id="isDocType">
                           
                        </div>
                        <div class="col-md-3">
                          
                                <label class="simple">Bank Name</label>
                                <select class="form-control" id="bankCode" name="bankCode" onchange="setName1()">
                                    <option value="bankCode">Select</option>
                                </select>
                                <input type="text" name="isBankName" class="form-control" size="50" tabindex="-1" value="" class="LabelText" id="isBankName" readonly>
                          
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="simple">Branch Name</label>
                                <input type="text" class="form-control" id="branchCode" name="branchCode" maxlength="15" tabindex="2" value="" onchange="BranchInfo()">
                                <input type="text" class="form-control" name="isBranchName" size="50" tabindex="-1" value="" class="LabelText" id="isBranchName" readonly>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="simple">Commission</label>
                                <input type="text" class="form-control" id="commission" name="commission" size="20" maxlength="15" tabindex="2" value=".00">
                            </div>
                        </div>
                   
                  
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="simple">Demand Draft Amount</label>
                                <% if (req_detail == null) { %>
                                    <input type="text" class="form-control" id="amount" name="amount" size="20" maxlength="15" onkeypress="javascript:isValidAmount(event,amount)">
                                <% } else { %>
                                    <input type="text" class="form-control" id="amount" name="amount" size="20" maxlength="15" value="<%= sAmt %>" readonly>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="simple">Currency</label>
                                <% if (req_detail == null) { %>
                                    <input type="text" class="form-control" id="curCode" name="curCode" size="20" maxlength="15" readonly value="<%= usrInfo[0][5] %>">
                                <% } else { %>
                                    <input type="text" class="form-control" id="curCode" name="curCode" size="20" maxlength="15" readonly value="<%= curCode %>">
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <p class="simple">Maximum Amount: <b>100000.00 Rs</b></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                        
                                <label class="simple">Payable At</label>
                                <% if (req_detail == null) { %>
                                    <input type="text" class="form-control" id="payableAt" name="payableAt" size="20" maxlength="35">
                                <% } else { %>
                                    <input type="text" class="form-control" id="payableAt" name="payableAt" size="20" maxlength="35" disabled value="<%= payableAt %>">
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <input type="hidden" maxlength="35" value="<%= login_id %>" size="40" id="userid">
                        </div>
                        <div class="row ">
                            <div class="form-group text-center">
                                <input type="button" class="btn-primary btn-sm" name="save" value="Save" <% if (req_detail == null) { %> onclick="saveData()" <% } %> class="button" <% if (req_detail != null) { %> disabled <% } %>>
                            </div>
                        </div>
                   
                    </div>
                    
                    
                     
                </div>
                
                
			
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
			