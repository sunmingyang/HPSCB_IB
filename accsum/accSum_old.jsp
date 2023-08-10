<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/accsum/scripts/accSum.js">
</script>
<%
	String usrName = "";
	String accinfo[][] = (String[][])session.getAttribute("ACCINFO");   
	String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
	if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
	
%>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>

<!-- <html:form action="/jsp/login.do"> -->

<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
<bean:message bundle='<%=lang%>' key='7213' />
</tiles:put>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
</tiles:put>
<html:form action="/accsum/acc_sum.do">
<br><br><br><br>
<body onLoad="makeScrollableTable('table','false','100'),onLoad()">
	<table width=527>
		<tr>
			<td>
				<div id="diverrmessage" style="display:none">
					<logic:messagesPresent property="NoServer">
					<html:errors property="NoServer"/>
					</logic:messagesPresent>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="5" align="right">
				<input type="button" onClick="back2()" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>">
				<!-- by Ramesh -->
				<input type="button" onClick="saveMiniStatementData()" class="button" value="Print">
				<!-- end -->
			</td>
		</tr>
	</table>
	<br>
	<table border="1" bordercolor="FFFFFF" align="center" width=527 cellpadding="-1" cellspacing="-1" id="table">
		<thead> 
			<TR> 
				<TH width="20"> <bean:message bundle="hindi" key= "2010"/></TH>
				<TH><bean:message bundle="hindi" key= "89"/></TH>
				<TH width="120"> <bean:message bundle="hindi" key= "1027"/></TH>
				<TH> <bean:message bundle="hindi" key= "717"/></TH>
				<TH><bean:message bundle="hindi" key= "718"/></TH>
				<TH><bean:message bundle="hindi" key= "1180"/></TH>
				<TH><bean:message bundle="hindi" key= "217"/></th> 
				<TH><bean:message bundle="hindi" key= "425"/></th>
				<TH><bean:message bundle="hindi" key= "7427"/></th>
			 <!-- <TH> Statement</TH> -->
			</tr>
		</thead>
	<%	if(accinfo != null){ 
			int j = accinfo.length;
			if(j != 0)
			{	%>
			<%	for(int i=0; i<j; i++)
				{	%>
					<tbody>
						<tr bgcolor="#EBDADC">
							<td width="73" align="center"><%=i+1%></td>
							<td nowrap>
								<%=accinfo[i][7]%> / <%=accinfo[i][6]%> <!--acc hol name-->
							</td>
							<td width="118">
								<input type="hidden" name="sAccnum" id="sAccnum">
								<input type="hidden" name ="sCurrency" id ="sCurrency" >
								<html:hidden property="sAccnum" styleId="sAccnum" />
								<%=usrInfo[i][1]%><%= usrInfo[i][0] %><!--acc no-->
							</td>
							<td nowrap  align="right"><%= accinfo[i][2] %></td><!--cur balance-->
							<td width="114" align="right" ><%= accinfo[i][3] %></td><!--clr balance-->
							<td nowrap> <%= accinfo[i][5] %> <%= accinfo[i][4] %></td><!--act name-->
			
							<td nowrap align="center"><%=accinfo[i][0]%></td><!--curr code-->
							<td nowrap align="center"><%=usrInfo[i][1]%></td><!--brn code-->
							<td nowrap align="center"><%=accinfo[i][8]%></td><!--brn status-->
					  
			<% } // fr ends
			}
		}  // if ends %>

					</tr>
				</tbody>
			</table>
		</body>
		<table>
			<tr>
				<td>
					<input type="button" onClick="refreshDetails()" class="button" value="REFRESH">
				</td>
			</tr>
		</table>
</html:form>

</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>


<script>

	function refreshDetails(){
		document.forms[1].action="/accsum/acc_sum.do?action=forFundTransfer";
		document.forms[1].submit();
	}

	function mini_statment(acc_num,currency){
		document.getElementById("sAccnum").value=acc_num;
		document.getElementById("sCurrency").value=currency;
		document.forms[1].action="/accsum/acc_sum.do?action=miniStmt";
		document.forms[1].submit();
	}
	//by Ramesh

	function saveAccountSummaryData(){	
		alert("in function saveAccountSummaryData");
		document.forms[1].action="/accsum/acc_sum.do?action=saveAccountSummaryData";
		document.forms[1].submit();
	}
	//end
	function onLoad(){
		<logic:messagesPresent property="NotAcc">
			document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>

		<logic:messagesPresent property="NotValidAcc">
			document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>

		<logic:messagesPresent property="RecordSaved">
			document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>


		<logic:messagesPresent property="FailureSaved">
			document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>

		<logic:messagesPresent property="NoServer">
			document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>

	}
</script>



</script>
