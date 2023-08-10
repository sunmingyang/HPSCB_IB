<%@ include file='/common/Include.jsp' %>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<script language="javascript">

<%String usrName = (String)session.getAttribute("user");
%>
function tran_pass_check()
{
	var cardType=document.getElementById("cardType").value;
	if(cardType=="-1")
	{
	 alert("Select card Type");
	 return false;
	}

	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="/request/reqchk.do?action=executeSetSession&cardType="+cardType;
	document.forms[0].submit();
}
</script>

<script language="JavaScript">

	function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=Ibdebit","child", bar);
}
function hello(yy)
{
	if (yy!=null)
	{

	disabledControlsOnAction(document.forms[0],"ibreq");
	}
}

</script>


<style>
	.normalHeadText{
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 8pt;
font-weight: bold;
}
.box-sec{
-webkit-box-shadow: 0px 0px 12px -5px rgba(0,0,0,0.75);
-moz-box-shadow: 0px 0px 12px -5px rgba(0,0,0,0.75);
box-shadow: 0px 0px 12px -5px rgba(0,0,0,0.75);

}
</style>


<body onLoad="hello(<%=request.getParameter("row")%>)">

<html:form action="/request/reqchk.do" >
<table class="wrapperDataTable"  style="width: 100%;">
	<!-- <tr>
		<td class="wrapperDataTableTR" align="center"> Apply for Debit Card</td>
	</tr> -->
	<div class="container text-center">
		<h2 class="wrapperDataTableTR  badge bg-primary p-2 fs-6s"> Apply for Debit Card</h2>
	</div>
	<tr>
		<td>

<%  if(request.getParameter("success")!=null )
{
%>
<bean:message bundle='<%=lang %>' key='7220'/>
<% 
} 
%>

<%  if(request.getParameter("error")!=null )
{
%>
<bean:message bundle='<%=lang %>' key='626'/>
<% 
} 
%>

						
					

						<div class="container justify-content-center d-flex   mb-3 p-4 "  >
							<div  class="row justify-content-center align-items-center box-sec   mt-5 p-4" style="width: 100%;">
							  
								<h6 class="text-left text-primary text-decoration-underline">
								  <bean:message bundle='<%=lang%>' key='7185'/>
								</h6>
						
						
						  
							
							  <div class="col-md-6">
								<label class=" normalHeadText">Card Type:</label>
								<select id="cardType" class="form-select">
								  <option value='-1'>Select Type</option>
								  <option value='C'>Credit Card</option>
								  <option value='D'>Debit Card</option>
								</select>
							  </div>
						
						  
						
							  <div class="col-md-6 mt-2">
								<p class="normalHeadText">
								  <bean:message bundle='<%=lang%>' key='1027'/>:
								  <%
								  String usrInfo[][]=(String[][])session.getAttribute("userInfo");
								  HashMap req_detail=(HashMap)session.getAttribute("req_detail");
								  int len=0;
								  if(usrInfo != null)
								  {
									len = usrInfo.length;
								  }
								  if(req_detail==null){%>
						  
								  <select class="form-select" name="sAccList">
									<%
									if(len != 0)
									{
									  String accNo = "";
									  for(int i=0; i<len; i++)
									  {
										accNo = usrInfo[i][1]+"-"+usrInfo[i][0];%>
										<option value='<%=accNo%>'><%=accNo%></option>
										<%
									  }
									}%>
								  </select>
								  <%
								  }
								  else
								  {
									ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
									int k=acc_nums.size();
									if(k!=0)
									{%>
									  <input type="text" class="form-control" readonly="true" value="<%= (String)acc_nums.get(Integer.parseInt((String)request.getParameter("row"
									)))%>">
									<% 
									} 
								  }%>
								</p>
							  </div>
							
						  
						
							  <div class="row justify-content-center ">
								<div class="col-md-12 text-center">
								  <button type="button" onclick="return tran_pass_check()" class="btn btn-primary">
									<bean:message bundle='<%=lang%>' key='7119'/>
								  </button>
								  <html:hidden property="sPrev_page" styleId="sPrev_page" value='debCard'/>
								</div>
							  </div>

							  </div>
							</div>
						  
						  
					
		</td>
	</tr>
</table>
</html:form>
</body>
