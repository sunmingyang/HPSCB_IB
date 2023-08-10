	<%@ include file='/common/Include.jsp' %>

		 
	<%
	String fdAccList=(String)session.getAttribute("fdAccountList");
	if(fdAccList==null)
  	fdAccList="";
 	String[] fdAcc=fdAccList.split(",");
	 String usrInfo[][]=null;
	 if(session.getAttribute("userInfo")!=null){
		 usrInfo = (String[][])session.getAttribute("userInfo");
	}
	int len=0;
	 String usrType="";
	 if(session.getAttribute("validToken")!=null){
		usrType=(String)session.getAttribute("validToken");
	 }
	if(usrInfo != null)
		{
				len = usrInfo.length;
		}
		String usrName="";
		if(session.getAttribute("user")!=null){
		   usrName = (String)session.getAttribute("user");
		}
		HashMap req_detail=null;
		if(session.getAttribute("req_detail")!=null){
		   req_detail=(HashMap)session.getAttribute("req_detail");   
		}
		String accno="";
		String fdScheme="";
		String sAmt="";
		String matInst="";
		String month="";
		String day="";
		String payable="";
		String intrstAcc="";
		if(req_detail!=null)
		{
			ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
			ArrayList req_fdScheme=(ArrayList)req_detail.get("req_fdScheme");
			ArrayList req_amt=(ArrayList)req_detail.get("req_amt");
			ArrayList req_month=(ArrayList)req_detail.get("req_month");
			ArrayList req_day=(ArrayList)req_detail.get("req_day");
			ArrayList req_maturInst=(ArrayList)req_detail.get("req_maturInst");
			ArrayList req_payable=(ArrayList)req_detail.get("req_payable");
			ArrayList req_intrstAcc=(ArrayList)req_detail.get("req_intrstAcc");
			accno=(String)acc_nums.get(Integer.parseInt((String)request.getParameter("row"))) ;
			fdScheme=(String)req_fdScheme.get(Integer.parseInt((String)request.getParameter("row"))) ;
			sAmt=(String)req_amt.get(Integer.parseInt((String)request.getParameter("row"))) ;
			month=(String)req_month.get(Integer.parseInt((String)request.getParameter("row"))) ;
			day=(String)req_day.get(Integer.parseInt((String)request.getParameter("row"))) ;
			matInst=(String)req_maturInst.get(Integer.parseInt((String)request.getParameter("row"))) ;
			payable=(String)req_payable.get(Integer.parseInt((String)request.getParameter("row"))) ;
			intrstAcc=(String)req_intrstAcc.get(Integer.parseInt((String)request.getParameter("row"))) ;
		}
		
	%>
	<script>
	function DocType()
	{
		 var ran=parseInt(Math.random()*9999);
		 
			var url="/request/DDRequest.do?action=getMaster&masterType=FDSchemeMaster";
			http.open("POST",url,false);
			http.onreadystatechange= function (){processdata()};
			http.send(null);	
		
	}
			var data2='';
			var fdKid='';
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
			fdKid=jsonData[3];		
			for(var i=0;i<data3.length;i++)
	{
			select = document.getElementById('fdscheme');
			var opt = document.createElement('option');
			opt.value = data3[i];
			opt.innerHTML = data3[i];
			select.appendChild(opt);
	}
						  
	}
	}

	}

	function onSet()
	{
		var rr= document.getElementById('fdscheme').value;
		for(var i=0;i<data3.length;i++)
	{
	if(rr==data3[i])
	{	
	 document.getElementById('isDocType').value=data2[i];
	 document.getElementById('fdSchemeKid').value=fdKid[i];
	// alert(document.getElementById('isDocType').value);
	}
	}
	}


	function saveData()
	{ 
		
			var fdsch=document.getElementById("fdscheme").value;
			var amount=parseFloat(document.getElementById("SAmt").value);
			var month=parseInt(document.getElementById("SMonth").value);
			var day=parseFloat(document.getElementById("SDay").value);
			if(fdsch=="fdscheme")
			{
				alert("Please select FD Scheme");
				document.getElementById("fdscheme").focus();
				return false;
			}
			if(document.getElementById("SAmt").value=="")
			{
				alert("Please Enter Valid Amount");
				document.getElementById("SAmt").focus();
				return false;
			}
			if(amount<999)
			{
				alert("Entered Amount is Less Than Min Amount");
				document.getElementById("SAmt").focus();
				return false;
			}
			if(amount>2500000)
			{
				alert("Entered Amount is Greater Than Max Amount");
				document.getElementById("SAmt").focus();
				return false;
			}
			if(month>60)
			{
				alert("Entered Period is Greater Than Max Period");
				document.getElementById("SMonth").focus();
				return false;
			}else if(month==60 && day>0)
			{
				alert("Entered Period is Greater Than Max Period");
				document.getElementById("SMonth").focus();
				return false;
			}
			
			if(day<15 && month<1)
			{
				alert("Entered Period is Less Than Min Period");
				document.getElementById("SDay").focus();
				return false;
			}
			var FdScheme=document.getElementById("isDocType").value;
			var maturityInst=document.getElementById("maturInst").value;
			var accno=document.getElementById("accList").value;
			var instPayable=document.getElementById("instPayable").value;
			var IntAcc=document.getElementById("instAcc").value;
			var fdCode=document.getElementById("isDocType").value;
			var fdKid=document.getElementById("fdSchemeKid").value;
			amount*=1.0;
			var obj=  {"amount" :amount ,"FdScheme" : FdScheme,"maturityInst" :maturityInst,"month" :month,"accno" :accno,"instPayable" : instPayable,"day" :day,"IntAcc" :IntAcc,"fdCode":fdCode,"fdKid":fdKid,"brnCode":'<%=usrInfo[0][1]%>'};
			var jsonStr = JSON.stringify(obj);
			var url="/request/DDRequest.do?action=SaveFDMobile&JSONString="+jsonStr;
			//alert(url);
			http.open("POST",url,false);
			http.onreadystatechange= function (){ message(http) };
				
			http.send(null);
		}
function  message(http){
    if(http.readyState==4 && http.status==200){
	      var res=http.responseText;
	      var accNo="";
	      var flag=false;
	      if(res.indexOf("|")!=-1)
	      {
	       flag=true;
	       var data=res.split("|");
	       res=data[0];
	       accNo=data[1];
	      }
	      if(res=="~success" && flag)
	       alert("FD create success and FD account number is :"+accNo);
	      else if(res=="~success" )
	       alert("FD create success");
	      else if(res=="~failure")
	       alert("FD create failure");
	      else if(res=="~1D")
	       alert("Account closed");
	      else if(res=="~1C")
	       alert("FD Account closed");
	      else if(res=="~3D")
	       alert("Not have sufficient balance");
	      else if(res.substring(0,1)=="-")
	       alert(res.substring(1));
	      else if(res=="~~")
	       alert("Account pending for authorization");
	      else
	       alert("Error");
	      window.location.href="";

    	}
   	}
   		function loadfun()
		{
		//	alert("<%=req_detail%>");
		}
		function setInstAcc()
		{
			document.getElementById("instAcc").value=document.getElementById("accList").value;
		}
		function backPage()
		{
		 <% if(usrType.equals("admin")){%>
			window.location.href="/IBReqProcess/IbreqProcess.jsp";
			<%}
			else if(usrType.equals("ibUser")){%>
			window.location.href="/request/accOpen.jsp";
			<%}%>
		}
		</script>
		<html>
		<tiles:insert page="/common/siteLayout.jsp" flush="true">
		<tiles:put name="title" value="Request"/>
	<% if(!usrType.equals("admin")){%>
		<tiles:put name="menu" value="/common/user_left.jsp?src=accOpen"/>
		<%}%>
		<tiles:put name="header" value="/common/header.jsp"/>
		<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
		<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=accOpen"/>
		<tiles:put name="line" value="/common/line.html"/>
		<tiles:put name="page_header" type="String" >
		&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
		Request >>Demand Draft Request
		</tiles:put>
		<tiles:put name="content" type="String">
		<br>
		<br>
	<body onload="loadfun(); DocType()">
	<html:form action="/request/FdRequest.do" >
		<div class="container-fluid">
		<table class="table">
			<tr>
				<td class="simple">	
					Account No
				</td>
				<td class="simple">	
				<%if(req_detail==null){%>
				<html:select property="accList" styleId="accList" onblur="setInstAcc()" >
				<%	if(len != 0)
					{ 
						String accNo = "";
						for(int i=0; i<len; i++)
						{
							accNo = usrInfo[i][1]+"-"+usrInfo[i][0];
							%>
							<html:option value='<%=usrInfo[i][0]%>'><%=accNo%></html:option>
							<%
						}
					}	%>
				</html:select >
						<%}
					else
						{%>
						<html:select property="accList" disabled="true" >
								<html:option value="accno"><%=accno%></html:option>
						</html:select>
						<%}%>
				</td>
			</tr>
			<tr>
				<td class="simple">
				Nature of Deposit   
				</td>
				<td class="simple">
				<%if(req_detail==null){%>
						<html:select property="fdscheme" styleId="fdscheme" onchange="onSet()">
						<html:option value="fdscheme" >Select</html:option>
						<input type="hidden" name="isDocTypeLabel" size="50" tabindex="-1" value=""   id="isDocType" >
						<input type="hidden" name="fdSchemeKID" size="50" tabindex="-1" value=""   id="fdSchemeKid" >
								
					</html:select>

						<%}else{%>
						<html:select property="fdscheme" disabled="true">
							<html:option value="pay"><%=fdScheme%></html:option>
						</html:select>
						<%}%>
				</td>
			</tr>
			<tr>
				<td class="simple">
				Amount
				</td>
				<td>
					<%if(req_detail==null){%>
						<html:text property="SAmt" size="20" styleId="SAmt" maxlength="15" onkeypress="javascript:isValidAmount(event,SAmt)" />
					<%}else{%>
						<html:text property="SAmt" size="20" value="<%=sAmt%>" styleId="SAmt" maxlength="15" readonly="true"/>
					<%}%>
				</td>
			</tr>
			<tr>
				<td class="simple">
					Minimum Amount : <b>1000.00 Rs </b>
				</td>
				<td class="simple">
					&nbsp;&nbsp;&nbsp;Maximum Amount :<b> 2500000.00 Rs</b>
				</td>
			</tr>
			<tr>
				<td class="simple">
				Period
				</td>
				<td class="simple">
				<%if(req_detail==null){%>
						<html:text property="SMonth" size="20" maxlength="3" styleId="SMonth" onkeypress="javascript:isValidNumber()" /> Months
						<html:text property="SDay" size="20" maxlength="3"  styleId="SDay" onkeypress="javascript:isValidNumber()" />  Days
				<%}else{%>
						<html:text property="SMonth" size="20" maxlength="12" styleId="SMonth"  disabled="true" value="<%=month%>"/> Months
						<html:text property="SDay" size="20" maxlength="12" styleId="SDay"  disabled="true" value="<%=day%>"/>  Days
					<%}%>
				</td>
			</tr>
			<tr>
				<td class="simple">
					Minimum Period : <b>15 Days </b>
				</td>
				<td class="simple">
					&nbsp;&nbsp;&nbsp;Maximum Period :<b> 60 Months</b>
				</td>
			</tr>
			<tr>
				<td class="simple">
				Maturity Instructions
				</td>
				<td class="simple">
					<%if(req_detail==null){%>
						<html:select property="maturInst" styleId="maturInst">
							<html:option value="pay">Payment</html:option>
							<html:option value="AutoRenewal">AutoRenewal</html:option>
						</html:select>
					<%}else{%>
						<html:select property="maturInst"  disabled="true">
							<html:option value="<%=matInst%>"><%=matInst%></html:option>
						</html:select>
					<%}%>
				</td>
			</tr>
			<tr>
				<td class="simple">
				Interest Payable
				</td>
				<td class="simple">
					<%if(req_detail==null){%>
						<html:select property="instPayable" styleId="instPayable">
							<html:option value="M">Monthly</html:option>
							<html:option value="Q">quaterly</html:option>
							<html:option value="H">half-yearly</html:option>
							<html:option value="Y">Yearly</html:option>
						</html:select>
					<%}else{%>
						<html:select  property="instPayable"  disabled="true" >
							<html:option value="<%=payable%>"><%=payable%></html:option>
						</html:select>
					<%}%>
				</td>
			</tr>
			<% if(!fdAccList.equals("")){%>
       
		    <tr>
		     <td class="simple">
		     Interest Account
		     </td>
		     <td>
		      <%if(req_detail==null){%>
		       <html:select property="instAcc"  styleId="instAcc" >
		       <%for(int i=0;i<fdAcc.length;i++){%>
		        <html:option value="<%=fdAcc[0]%>"><%=fdAcc[i]%></html:option>
		       <%}%>
		       </html:select>
		       <!-- <html:text property="instAcc" size="20" styleId="instAcc"  maxlength="15" value="<%=usrInfo[0][0]%>" readonly="true"/> -->
		      <%}else{%>
		       <html:text property="instAcc" size="20" styleId="instAcc" value="<%=intrstAcc%>" maxlength="15" readonly="true"/>
		      <%}%>
		     </td>
		    </tr>
   			<%}%>
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
				<input type="button" value="Back To Menu"class="button" onclick="backPage()"/ >
				</td>
				<td>
				<%if(req_detail==null){%>
					<input type="button" name="save" value="Save" onclick="saveData()" class="button"/ >
				<%}else{%>
					<input type="button" name="save" value="Save" disabled class="button"/ >
				<%}%>
				</td>
			</tr>
		</table>
		</div>
				<div id="diverrmessage">
					<logic:messagesPresent property="NoServer">
					<html:errors property="NoServer"/>
					</logic:messagesPresent>
					<logic:messagesPresent property="FatalError">
					<html:errors property="FatalError"/>
					</logic:messagesPresent>
					<logic:messagesPresent property="InvalidTranPass">
					<html:errors property="InvalidTranPass"/>
					</logic:messagesPresent>
				</div>
	</html:form>
	</body>
	</html>
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>
	</tiles:insert >
