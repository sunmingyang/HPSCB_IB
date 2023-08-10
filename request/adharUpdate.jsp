<%@ include file='/common/Include.jsp' %>
<%@ page import="java.util.Date"%>

<% String usrType=(String)session.getAttribute("validToken");
	String usrName = (String)session.getAttribute("user");
	String userInfo[][]=(String[][])session.getAttribute("userInfo");
	System.out.println("user Id"+userInfo[0][8]);
	String isUpdate=(String)session.getAttribute("isUpdate");
	session.removeAttribute("isUpdate");
	if(isUpdate==null)
		isUpdate="1";
	String aadharDetails=(String)session.getAttribute("aadharDetails");
	session.removeAttribute("aadharDetails");
	Date d=new Date();
	String  date="";
	if(d.getDate()<=9)
		date="0"+d.getDate();
	else
		date=d.getDate()+"";
	if((d.getMonth()+1)<=9)
		date=date+"/0"+(d.getMonth()+1)+"/"+d.toString().substring(d.toString().length()-4);
	else
		date=date+"/0"+(d.getMonth()+1)+"/"+d.toString().substring(d.toString().length()-4);

%><html>
	<head>
	</head>
	<tiles:insert page="/common/siteLayout.jsp" flush="true">
		<tiles:put name="title" value="Aadhar Card Update"/>
		<% if(!usrType.equals("admin")){%>
			<tiles:put name="menu" value="/common/user_left.jsp?mode=adharUpdate&src=adharUpdate"/>
		<%}%>
		<tiles:put name="header" value="/common/header.jsp"/>
		<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
		<tiles:put name="menu_tab" value="/common/menu_tab.jsp?mode=adharUpdate&src=adharUpdate"/>
		<tiles:put name="line" value="/common/line.html"/>
		<tiles:put name="page_header" type="String" >
		&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
					Aadhar update 
		</tiles:put>
		
		<tiles:put name="content" type="String">
			<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/common.js"></script>
		<script type="text/javascript">
			function saveAadharDetails(){
				var aadharNumber=document.getElementById("adharNo").value;
				var issueDate=document.getElementById("issueDt").value;
				if(aadharNumber==""){
					alert("Enter aadhar card number");
					document.getElementById("adharNo").focus();
					return false;
				}
				if(issueDate==""){
					alert("Enter aadhar card issue date");
					document.getElementById("issueDt").focus();
					return false;
				}
				else if(isValidDateFormat("issueDt")==false)
				{
					alert("Enter valid issue date");
					document.getElementById("issueDt").value="";
					document.getElementById("issueDt").focus();
					return false;
				}
				else if(!dateComparision("issueDt","tDate") )
			    {
				     alert("Issue date must be lesser than today's date");
				     document.getElementById("issueDt").value="";
				     document.getElementById("issueDt").focus();
				     return false;
			    }
			    else if(dateComparision("minDate","issueDt"))
			    {
				     alert("Issue date must be greater than " +minDate.value);
				     document.getElementById("issueDt").value="";
				     document.getElementById("issueDt").focus();
				     return false;
			    }
				else{
					issueDate=issueDate.substring(3,5)+"-"+issueDate.substring(0,2)+"-"+issueDate.substring(6,10);
				}
				var url="<%=request.getContextPath()%>/AccountInfoAction.do?action=fetchAdharDetails&isUpdate=1&aadharNumber="+aadharNumber+"&issueDate="+issueDate;
				
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
			function fill(){
			 <% if(aadharDetails!=null){
					%>
					var resArray='<%=aadharDetails%>';
					var jsonData=JSON.parse(resArray);
					var no=jsonData.aadharNo;
					var name=jsonData.name
					var date=jsonData.issDate;
					if((no!="-" && date!='1900-01-01 00:00:00.0' && date!="-")){
						document.getElementById("adharNo").value=jsonData.aadharNo;
						document.getElementById("adharNo").readOnly="true";
						document.getElementById("name_tr1").style.display="block";
						document.getElementById("name").value=jsonData.name;
						document.getElementById("name").readOnly="true";
						date=date.split(' ')[0];
						date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);
						document.getElementById("issueDt").value=date;
						document.getElementById("issueDt").readOnly="true";

						document.getElementById("update_btn").style.display="none";
						document.getElementById("back_btn").style.display="block";
						
					}
					else
					{	
						document.getElementById("adharNo").focus();
						<% isUpdate="1"; %>
					}
					
				 <%}else{%>
     			document.getElementById("name_tr1").style.display="none";
     			document.getElementById("name").style.display="none";
    			<%}%>

			}
			function back(){
				window.location.href="<%=request.getContextPath()%>/jsp/main_page.jsp";
			}
			function isValidNumber(evt){
				 var charCode = (evt.which) ? evt.which : event.keyCode; 
				 if (charCode != 46 && charCode != 45 && charCode > 31 && (charCode < 48 || charCode > 57))
				   return false;
				 return true;
			}
		</script>
	<body onload="fill()">
				<form>
					<table  align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0" style="width:100%;height:200px;">
						
				<tr>
					<td class="tableHeader" align="center" style="font-size:medium;">
						<br /><u> 
							Aadhar Card Update 
						</u>
						<br /><br /><br />
					</td>
				</tr>
				<tr>
					<td align="center">
						<table style="width:65%;" border="1">
							<tr style="/*height:50px;*/">
								<td  style="font-size:12pt;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									Aadhar Card Number&nbsp;&nbsp; :
								</td>
								<td  style="font-size:12pt;">
									<input type="text" id="adharNo" name="adharNo" maxlength="12" style="width:190px;height:25px;font-size:12pt;" onkeypress="return isValidNumber(event)">
								</td>
							</tr>
							<tr>
								<td  style="font-size:12pt;"  id="name_tr1" >
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									Customer Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
								</td>
								<td  style="font-size:12pt;">
									<input type="text" id="name" name="name" style="width:190px;height:25px;font-size:12pt;">
								</td>
							</tr>
							<tr style="/*height:50px;*/">
								<td  style="font-size:12pt;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									Aadhar Issue Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
								</td>
								<td  style="font-size:12pt;">
									<input type="text" id="issueDt" name="issueDt" maxlength="10" dateformat="dd/mm/yyyy" style="width:190px;height:25px;font-size:12pt;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									(DD/MM/YYYY)
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>	
					<td align="center">
						<br /><br /><br />
						<input type="button" id="update_btn" onClick="return saveAadharDetails()" value="<bean:message bundle='<%=lang%>' key='2353'/>" class="button" style="height:35px;width:80px;border:none;font-size:12pt;">
						<input type="button" id="back_btn" onClick="return back()" value="Back" class="button" style="height:35px;width:80px;border:none;font-size:12pt;display:none;">
						<input type="hidden" value="<%=date%>" id="tDate" />
						<input type="hidden" value="01/01/2000" id="minDate" />
					</td>
				</tr>
			</table>
				<form>
			</body>
		</tiles:put>
		<tiles:put name="add" value="/Advertisement/add.jsp"/>
		<tiles:put name="footer" value="/common/footer.jsp"/>
	</tiles:insert >
</html>