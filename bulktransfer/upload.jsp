<%@ include file="/common/Include.jsp" %>	
		<%
		String accountList="" ; 
	String [] AccListArr= null ; 
	if (session.getAttribute("allAccountlist") != null ) { 
	   accountList=(String)session.getAttribute("allAccountlist");
	   System.out.println("FundAccountList----------------"+accountList);
	   AccListArr =accountList.split(",");
	}
          String mob=(String)session.getAttribute("customerMobile");
		 int errorcount=0;
			String usrName = "";
			String fundinfo[][] = (String[][])session.getAttribute("FUNDINFO");   
			if(session.getAttribute("user") != null)
				usrName = (String)session.getAttribute("user");
			
			String login_id="";
			if(session.getAttribute("userid")!=null){
				login_id = (String)session.getAttribute("userid");//New changes on 16/07/2008;
			
			}
			String sessionId= session.getId() ;

			String res="";
			if(session.getAttribute("response") != null)
			{
				res= (String)session.getAttribute("response");
			}
			String accNo="";
			if(session.getAttribute("beneaccountNo") != null)
			{
				accNo= (String)session.getAttribute("beneaccountNo");
			}
		
			
		%>

		<script language="JavaScript">	

        function upload(){
		document.forms[0].action="/BulkAccountFundTransferAction.do?action=bulkAccountFundTransfer";
		document.forms[0].method="Post";
		document.forms[0].submit();
		}

		function bacck()
	    {
		 window.location.href = "/fundtransfer/fund.jsp"
		}
	</script>
		<tiles:insert page="/common/siteLayout.jsp" flush="true">
		<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
		<tiles:put name="header" value="/common/header.jsp"/>
		<tiles:put name="line" value="/common/line.html"/>
		<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
		<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=corporatebanking"/>
		<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking"/>
		<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
		<tiles:put name="content" type="String">
		<tiles:put name="page_header" type="String">
		&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
		</tiles:put>

		<body style="margin:0 0 0 0;"><br>    

		<html:form action="/BulkAccountFundTransferAction" method="POST" enctype="multipart/form-data">
		<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
		<tr><td  class="wrapperDataTableTR" align="center" > Fund Transfer >>Upload Transfer Data</td>
		</tr>
			<tr>
			<td align="center">   
			<table width=527>
			<tr>
           	<td align="center">
		     Account No.</td>
				<td>
				<select name="account" id = "account"  list="AccountNoList" listkey="custId" listValue="accountNo" style="width:200; background-color:#EFEFEF;" id="accList"  tabindex="-1">
				<% 
				if (AccListArr != null)
				for(int i=0;i<AccListArr.length;i++){%>
				<option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
					<%}%>
					</select> 
				</td>
				<tr>
				<td align="center">   
				</td> 
				</tr>
			    <tr>
                <td align="center">
				Upload File </td>
				<td><input type="file" name="fileName" id="fileName" style="margin-left:0px;"/>
				</td>
				</tr>
			<tr>
			<td>
			<p>Click on the download to download it:<p>
			<a  href="/resource/bulkupload.xls" target="_same">Download the file</a>  Download this file	</a>
			</td>
			    
			    <td colspan=2>Note! Upload xls file must be in this manner-- A/c no, A/c Name, IFC code, Amount, Remark
			
				First column must be A/C No, second A/C Name, Third IFC code ,Fourth Amount,Fifth Remark</td>
			</tr>	 
				<tr>
				<td align="center" colspan=2>   
				<input type="button" value="Upload"  onclick="upload();"/>
				<input type="button" value="Cancel" onclick="bacck();" /></td>
				</tr>
				</table>
				<tr><td><input type="hidden" size="20" readonly="true" value="<%=mob%>" id="UserMobile"/>
			</td>
            </tr>
					</table>					
				</html:form>
</body>
	</tiles:put>
    </tiles:insert>
		<script type="text/javascript">
			<%if(session.getAttribute("error")!=null) {
				String result=(String)session.getAttribute("error");
				session.removeAttribute("error");
				if(result.equalsIgnoreCase("success")){%>
					alert('<bean:message bundle ="<%=lang%>" key="7455"/>');
				<%}
				else 
				{%>
					alert('<bean:message bundle ="<%=lang%>" key="7456"/>');
				<%}}%>
		</script>


		<style>
		.dataTableTH{
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 8pt;
				padding-left:3;
				padding-right:3;
				font-weight: bold;
				color: #092771;
				text-decoration: none;
				background-color:#BFBFBF;
				text-align:center;
		}
		.dataTableTD{
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 8pt;
				padding-left:3;
				padding-right:3;
				text-decoration: none;
				background-color:#EFEFEF;
				text-align:center;
		}
		</style>

			 
