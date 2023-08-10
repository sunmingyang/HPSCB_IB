<%@ include file="/common/Include.jsp" %>
<%
%>


<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=agentfund"/>
<tiles:put name="menu" value="/common/user_left.jsp?src=agentfund"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"></font>&nbsp;&nbsp;&nbsp;
</tiles:put>

<body style="margin:0 0 0 0;" ><br>

<div id="spinner" class="spinner" style="display:none;">
	</div>



	<div id="container-div" class="container" style="margin-left: 20px;margin-top:0px;overflow-y: auto; " >




		<br/><div style="display:none" id="alert-div" class="alert alert-danger col-sm-12"></div>

		<br/><div ><span style="font-size:24px;color:#d9534f;">*</span> <span style="font-size:18px;color:#666666;">Pin Code</span> </div>
		<input type=text  id="pincode" value="" />

		<br/><input type=button value="Search Agent" onclick="searchagent();" style="min-height:40px;background: #696969;color:#ffffff;min-width: 125px;font-size:18px;"/>
		<table id="agent_table" style="border-collapse: separate; border-spacing: 10px;" border="0">
			

		</table>

	</div>

	
</body>
</tiles:put>

</tiles:insert>

<script type="text/javascript"> 

function bacck(){
		window.location.href = "/fundtransfer/knowyouragent.jsp"
}

function showAlert(div_name, title, message)
		{
			$("#"+div_name).show();
			$("#"+div_name).html("<strong>"+title+"  </strong>"+message);
			
		}
		
		function cancel()
		{
			location.href="home.html";
		}
		function searchagent()
		{
			//document.getElementById("agent_table").empty();
		document.getElementById("agent_table").innerHTML = "";
		//	alert("fucction called" ) ;
		//alert(document.getElementById("pincode").value) ;
		if( document.getElementById("pincode").value == "" )
		{
			alert("Please Enter Pin Code");
			return false;
		}
		var pincode=document.getElementById("pincode").value;
		var ran=parseInt(Math.random()*9999);
	    var url="/AccountInfoAction.do?action=agentPincodeData&pinCode="+pincode+"&ran="+ran;
		//alert(url) ;
		http.open("POST",url,false);
		http.onreadystatechange= function (){searchagentresponse()};
		http.send(null);

		}
		function searchagentresponse()
		{
			if (http.readyState == 4)
            	{
                		// Check that a successful server response was received
                		if (http.status == 200)
                		{

                    		var objArray= http.responseText ;

							var jsonData = JSON.parse(objArray);
							var table = document.getElementById("agent_table");
    						for (var i=0; i < jsonData.length; i++)
    						{
								var row = table.insertRow(i);
								var rowName=row.insertCell(0);
								rowName.innerHTML=jsonData[i].acsName; 
				

    						}

    					}
    					else
    					{
    						// An HTTP problem has occurred
    						alert("HTTP error: " + http.status);
    					}
    					$('#spinner').hide();
                }
		}		
		

</script> 
</html>	 

