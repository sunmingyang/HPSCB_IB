<%@ include file="/common/Include.jsp" %>	
		<%
		String accountList="" ; 
		String failaccNo = "";
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
		<script language="JavaScript" >	

        function bacck(){
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
		</tiles:put>   
		<html:form action="/BulkAccountFundTransferAction.do?action=bulkAccountFundTransfer"  enctype="multipart/form-data"> 
		<body style="margin:0 0 0 0;" onload="getResponse()"><br>
		<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
			<tr>
				<td  class="wrapperDataTableTR" align="center" > Fund Transfer >>Upload File****</td>
				
			</tr>
			<tr>
			<td align="center">
			<table width="627px">
			<tr>
                	<td align="center">
				No Payee Available</td>  
				
				</tr>
			
                 
				
				
				
				</table>
				
			</td>
</tr>
					</table>
					
				
		</body>
		</html:form>
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

			 
