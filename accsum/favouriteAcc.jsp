<%@ include file="/common/Include.jsp" %>
<% 
	String  usrName="";
	String  custID="";
	String userInfo[][] = null;
	if(session.getAttribute("user") != null)
	usrName = (String)session.getAttribute("user");
	custID= (String)session.getAttribute("custid");
	userInfo = (String [][])session.getAttribute("userInfo");	
	String brnCode=userInfo[0][1];


	String favAccount[][] = null;
	if(session.getAttribute("accWithInfo") != null)
	{
	favAccount = (String [][])session.getAttribute("accWithInfo");	
	}


%>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<!-- <html:form action="/jsp/login.do"> -->
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=acc"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=accSummary&src=acc"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
</tiles:put>
<script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
<body style="margin:0 0 0 0;" onload="show()"><br>

<style>

.tdformenu1 {
    background: transparent !important;
}

 .tdformenu {
		background-color: transparent !important;
		    border: transparent !important;
	}

</style>


			<div id="favAcc" style="" >	

			<table  width="527px">
			<tr>
			<td  class="wrapperDataTableTR" align="center" > Account Summary >> Favourite Account </td>	
			</tr>
			</table>
			<%if(favAccount!=null){%>
			<table  width="527"  >
			<tr bgcolor="#D3D3D3">
			<td width="255px" style="height:20px;padding-left: 5;font-size: 14;font-family: serif;">
			Account NO</td>
			<td style="height:20px;padding-left: 5;font-size: 14;font-family: serif;">Name</td>	
			</tr>
			</table>
			<div id="favAcc1" style="overflow-x:auto;height:100PX;width:527px;" >
			<table  width="510px">
            <% for( int i=0; favAccount.length>i; i++){%>
			 <tr >
			<td align="left">
			<input type="text" id="favAccnt" style="margin-left:0px;border: none;" value='<%=favAccount[i][0]%>'  />
			 </td>

			 <td>
			 <input type="text" id="favName" border="0" style="margin-left:0px;border: none;" value='<%=favAccount[i][1]%>' />
			</td>
			</tr>
			<%}%>
	
              </tr>
			</table> </div>
			<%}else{%>
			<div id="favAcc1" style="position:relative;">	<H2>You do not have any Account in favourites list<H2></div>
			
<%}%>
			<table>
			<tr>
			<td>
			<input type=button value="Add To Favourite Account" onclick="opnsearch();"/>
			</td>
			</tr>
			</table>
			</div>


	
						<div id="serAcc" style="">
						<table width="527px">
						<tr>
						<td  class="wrapperDataTableTR" align="center" > Account Summary >> Favourite Account </td>	
						</tr>
						</table>

						<table>
						<tr>
						<td align="center" style="height:20px;padding-left: 5;font-size: 14;font-family: serif;">
						Account NO. <input type=text id="acc" style="margin-left:99px;"/>
						</td>
						</tr>		
						<table>
						<tr><td align="center">
						<input type=button value="Search Account NO" onclick="accinfo();"/>
						<input type=button value="Cancel" onclick="bacck();" />
						</td>
						</tr>
						</table>
</table>
								
						</div>
									
							<div id="showInfo" style="margin-top:-250px; margin-right:-250px;">
							<table  width="527px" align="center">
							<tr>
							<td  class="wrapperDataTableTR" align="center" > Account Summary >> Favourite Account </td>	
							</tr>
							</table>

							<table  width="527px" align="center">
							
							<tr>
							<td style="height:20px;padding-left: 5;font-size: 14;font-family: serif;">
							Account NO. <input type=text id="accNo" style="margin-left:50px;border: none;"readonly/>
							</td>
							<td  style="height:20px;padding-left: 5;font-size: 14;font-family: serif;">
							Branch <input type=text id="brn" style="margin-left:50px;border: none;"readonly/>
							</td>
							</tr>


							<tr>
							<td  style="height:20px;padding-left: 5;font-size: 14;font-family: serif;">
							Nic Name <input type=text id="nic" style="margin-left:65px;border: none; " readonly/>
							</td>
							<td style="height:20px;padding-left: 5;font-size: 14;font-family: serif;">
							Ifsc <input type=text id="ifsc" style="margin-left:65px;border: none; "readonly/>
							</td>
							</tr>

							<tr>
							<td style="height:20px;padding-left: 5;font-size: 14;font-family: serif;">
							Account Type <input type=text id="accType" style="margin-left:44px;border: none;" readonly/>
							</td>
							<td style="height:20px;padding-left: 5;font-size: 14;font-family: serif;">
							Description <input type=text id="desc" style="margin-left:30px;border: none;"readonly/>
							<input type="hidden" id="payKid" />
							</td>
							</tr>
							
							

							<table align="center">
							<tr>
							<td><input type=button value="Add To Favourite Account" onclick="makfavAct();"/></td>
							<td><input type=button value="Cancel" onclick="bacck();" /></td>
							</tr>
							</table></table>	
							</div>		
		</body>

		
</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp"/>
</tiles:insert>

<script>

	function show()
   	{
	
    	document.getElementById("showInfo").style.display="none";
    	document.getElementById("serAcc").style.display="none";

   	}




function opnsearch(){
	
document.getElementById("favAcc").style.display="none";
document.getElementById("favAcc1").style.display="none";
document.getElementById("serAcc").style.display="block";
}
	function bacck(){
		window.location.href = "/accsum/favouriteAcc.jsp"
	}

function accinfo()
	{						
	
	var accNO = document.getElementById("acc").value;
	if(accNO=="")
	{
	alert("Please enter acccount NO.");
	document.getElementById("acc").focus();
	return false;	
}
if(accNO.length>20)
	{
	alert("please enter Right Account NO");
	document.getElementById("acc").value="";
	document.getElementById("acc").focus();
	return false;
	}
	var ran=parseInt(Math.random()*9999);	
	var URL ="/accsum/acc_sum.do?action=fetchaccInfo&accNO="+accNO+"&ran="+ran;
	http.open("POST",URL,false);
	http.onreadystatechange= function (){processBranch()};
	http.send(null);
	}

	function processBranch()
   	{
		var accountType;
			debugger;
		if (http.readyState == 4)
    	{
	      	if (http.status == 200)
	      	{
	       		var resArray=http.responseText;
	       		var jsonData = JSON.parse(resArray);
						debugger;
				if((jsonData != null)&&(jsonData !=""))
				{
					if(jsonData[0][0]=="fav")
					{
						alert("This Acccount Number is Not available for make favourite account So first Make Beneficiary");
						return false;
					document.getElementById("accNo").focus();
					}
					else if(jsonData[0][0]=="confirm")
					{
					alert("Account no. Pending for Confirmation ");
					document.getElementById("accNo").focus();
					return false;
			
					}
			else{
						       		
									document.getElementById("serAcc").style.display="none";
									document.getElementById("favAcc").style.display="none";
									document.getElementById("favAcc1").style.display="none";
						       		document.getElementById("showInfo").style.display="block";


									var typeAcc = jsonData[0][5];
									if(typeAcc=='A'){
									accountType="Current"
									}
									else if(typeAcc=='S'){
									accountType="Saving"
									}
									else if(typeAcc=='C'){
									accountType="Cash Credit"
									}
									else if(typeAcc=='E'){
									accountType="Rd Account"
									}
									else if(typeAcc=='T'){
									accountType="Loan Account"
									}

									document.getElementById("payKid").value=jsonData[0][0];
									document.getElementById("accNo").value=jsonData[0][1];
									document.getElementById("brn").value=jsonData[0][6];
									document.getElementById("nic").value=jsonData[0][2];
									document.getElementById("ifsc").value=jsonData[0][3];
									
									document.getElementById("accType").value=accountType;
									document.getElementById("desc").value=jsonData[0][4];
	      				
				}
			}
			else
				{
			alert("account no. not Available for make favourite account");
				return false;
			}
			}
     	}
  	}


function makfavAct(){
	debugger;
var ran=parseInt(Math.random()*9999);
	var pkid =document.getElementById("payKid").value;
	var URL ="/accsum/acc_sum.do?action=makeFav&pkid="+pkid+"&ran="+ran;
	http.open("POST",URL,false);
	http.onreadystatechange= function (){processfav()};
	http.send(null);
}



function processfav()
   	{
			debugger;
		if (http.readyState == 4)
    	{
	      	if (http.status == 200)
	      	{
	       		var resArray=http.responseText;
	       		var jsonData = JSON.parse(resArray);
						debugger;
				if((jsonData != null)&&(jsonData !=""))
				{
					if(jsonData=="fav")
					{
					alert("This account no. allready make favourite Account");

									document.getElementById("favAcc").style.display="none";
									document.getElementById("favAcc1").style.display="none";
						       		document.getElementById("showInfo").style.display="none";
									document.getElementById("serAcc").style.display="block";
									document.getElementById("acc").value="";
									document.getElementById("acc").focus();

			
							
									
//						return false;
			
					}else{
						       		
	
								

									firstFun();

				}
			}
		
			}
     	}
  	}


function firstFun()
{
									alert("This Account No. Make Favourite Account");
	var ran=parseInt(Math.random()*9999);	
	document.forms[0].action= "<%=request.getContextPath()%>/accsum/acc_sum.do?action=favAccount&ran="+ran;;
							document.forms[0].method="post";
							document.forms[0].submit();

}


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
.dataTableTD1{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
        text-decoration: none;
		background-color:#EFEFEF;
		text-align:right;


}
</style>
