<%@ include file="/common/Include.jsp" %>
<% 
	String Arr= null, usrName="";
	String userInfo[][] = null;
	int j; 
	 usrName = (String)session.getAttribute("user");
	userInfo = (String [][])session.getAttribute("userInfo");
	String brnCode=userInfo[0][1];
//out.writeln(""+request.setAttribute("brnCode",brnCode));
	System.out.println("Branch Code is this -->"+brnCode +usrName+" "+ userInfo);
	String loginTime = (String)request.getAttribute("lastLoginTime");
    String totallogin = (String)request.getAttribute("totallogin");
   String custMobile = (String)session.getAttribute("customerMobile") ; 
   
   String custRole ="C" ; 
   if (session.getAttribute("custRole") != null ) {
   		custRole = (String)session.getAttribute("custRole") ; 
   }
   String userId="" ;
   if (session.getAttribute("userid") != null ) {
    userId = (String)session.getAttribute("userid") ;
   }
%>

<!DOCTYPE html>
<html>
<head>
  <title>mBanking</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

   <link rel="stylesheet" href="/mobile/bootstrap/css/bootstrap.min.css">
	<script src="/mobile/js/jquery.min.js"></script>
   <script src="/mobile/mbanking_js/mbanking.js"></script >
   <script src="/mobile/mbanking_js/URI.min.js"></script>
	<link rel="stylesheet" href="/mobile/mbanking_css/style.css">

<style>

/*
#my-div {
  position: absolute;
  top: 25%;
  bottom: 0;
  height: 68%;
  width: 100%;
  overflow-y: auto;
  border-top: 0px solid #2E2E2E;
}


margin-left: auto;
    margin-right: auto;

*/
#my-div {
  position: absolute;
  top: 23%;
  bottom: 0;
  height: 61%;  //90%; for 3.x
  width: 100%;
  overflow-y: auto;
  border-top: 0px solid #2E2E2E;
 

}
section {
       /* background: black; */
        border-radius: 1em;
        padding: 1em;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-right: -50%;
        transform: translate(-50%, -50%) }

</style>

<script type="text/javascript">

	sessionStorage.customerID = '<%=userInfo[0][8]%>';
	sessionStorage.sessionID = '<%=session.getId()%>';
	sessionStorage.customerName =  '<%=usrName%>';
	sessionStorage.lastLogin = '<%=loginTime%>';
	sessionStorage.mobileNo = '<%=custMobile%>';
	sessionStorage.from= '<%=userInfo[0][0]%>';
	sessionStorage.custRole = '<%=custRole%>' ; 
	sessionStorage.userID = '<%=userId%>' ; 

		jQuery(document).ready( function(){
		if(typeof(Storage) !== "undefined") {

			var userID = sessionStorage.userID;
			var password = sessionStorage.password ;
			var imeiNumber = sessionStorage.imeiNumber;
			var simNumber = sessionStorage.simNumber;
			Android.alert(userID +"\n"+password+"\n"+imeiNumber+"\n"+simNumber);
			Android.alert(sessionStorage.customerName+"\n"+ sessionStorage.customerID);
			$("#customerName").text("Welcome "+sessionStorage.customerName);
           	$("#lastLogin").text("Last Logged in on "+sessionStorage.lastLogin);    

			if( !sessionStorage.accounts ){
				getData("accounts",sessionStorage.customerID);//custID
			}
						
		} 
		if(sessionStorage.custRole=="A")
		{
				//alert(sessionStorage.custRole);
				document.getElementById("pactrn").display ="block";
				document.getElementById("pacFPS").display ="block";
				document.getElementById("agent").display ="block";
				
		 } else {
		     	//alert("else"+sessionStorage.custRole);
				document.getElementById("pactrn").display ="none";
				document.getElementById("pacFPS").display ="none";
				document.getElementById("agent").display ="none";
		 }
			
			


		});



		</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script>
        $(document).ready(function() {
                $menuLeft = $('.pushmenu-left');
                $nav_list = $('#nav_list');

                $nav_list.click(function() {
                        $(this).toggleClass('active');
                        $('.pushmenu-push').toggleClass('pushmenu-push-toright');
                        $menuLeft.toggleClass('pushmenu-open');
                });
        });
</script>
</head>
<script> 
var user ="";
</script>

<script>
function fillData()
{
 user='<%=usrName%>';	
 alert("Welcome Mr."+user);
 document.getElementById("customerName").value='<%=usrName%>';
}
</script>
 <body onload="fillData();" >
		 <!--  content centering -->
 <div style="text-align: center;">
 	<div id="spinner" class="spinner" style="display:none;">
    	<img id="img-spinner" src="img/Preloader_2.gif" alt="Loading"/>
	</div>
 
 	<div style="position:fixed; width:100%; background-color: #d9534f;  padding:0px; top:0px;min-height: 30px; "></div>
        
    <div style="margin-top:60px;" ><img src="/mobile/img/logo.png" alt="..." class="img-responsive" style="margin:0px auto;display:block"  /></div>
  
   	<h4 style="margin-left:25px;color:#d9534f;margin-top:20px;" id="customerName"></h4>
	
	<h5 style="margin-left:25px;color:#e89795;" id="lastLogin"></h5> 
	 <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="./forgot_password.html">Change Password</a></div>
	<!--<div style="float:left; font-size: 80%; position: relative; top:-10px">
	 <a href="./setting.html"><img src="./img/setting.png" alt="..." class="img-rounded"></a>
	</div> -->
    <div  id="my-div" style="margin-top:50px;top:30%;left:8%;"  > <!--  Table centering -->

  		<table style="bg-color:#ccc;" class="table " border="0px" >
    		<tbody >
      			<tr>
        			<td style="text-align: center;"><a href="/mobile/accounts.html" style="margin-left:0%;"><img src="/mobile/img/accounts.png" alt="..." class="img-rounded"></a></td>
                    <td style="text-align: center;"><a href="/mobile/accountsopen.html" style="margin-left:0%;"><img src="/mobile/img/OpenAccount.jpg" alt="..." class="img-rounded"></a></td>
        		</tr>

                <tr>
                    <td  style="text-align: center;"><a href="/mobile/Agent_fund_transfer.html" style="margin-left:0%;"><img src="/mobile/img/AgentfundTransfer.jpg" alt="..." class="img-rounded"></a></td>
                    <td  style="text-align: center;"><a href="/mobile/request.html" style="margin-left:0%;"><img src="/mobile/img/request.png" alt="..." class="img-rounded"></a></td>
                </tr>

                <tr>
           <td  style="text-align: center;"><a href="/mobile/fund_transfer.html" style="margin-left:0%;"><img src="/mobile/img/fund_transfer.png" alt="..." class="img-rounded"></a></td>
                    <td  style="text-align: center;"><a href="/mobile/setting.html" style="margin-left:0%;"><img src="/mobile/img/setting.png" alt="..." class="img-rounded"></a></td>
                </tr>
      			<tr>
      				
        				<td style="text-align: center;"><a href="/mobile/deposit.html" style="margin-left:0%;"><img src="/mobile/img/deposit.png" alt="..." class="img-rounded"></a></td>
        				<td style="text-align: center;"><a href="/mobile/cheque.html" style="margin-left:-0%;"><img src="/mobile/img/cheques.png" alt="..." class="img-rounded"></a></td>
				</tr>
				<tr>
					<td style="text-align: center;" ><img src="/mobile/img/pc4.png" alt="..." class="img-rounded" onclick="precise()"></td>
					<td style="text-align: center;"><img src="/mobile/img/promptmeLogo.png" alt="..." class="img-rounded" onclick="prompt()"></td>
				</tr>
				<tr>

				
				</tr>
				
					<tr>
					<td  style="text-align: center;"><a href="/mobile/knowyouragent.html" style="margin-left:0%;"><img src="/mobile/img/findagent.png" alt="..." class="img-rounded"></a></td>
					<td  style="text-align: center;"><a href="/mobile/deactivateATM.html" style="margin-left:0%;"><img src="/mobile/img/deactivate.png" alt="..." class="img-rounded"></a></td>
					</tr>
			<!--	<tr>
					<td style="text-align: center;">
					<a href="/mobile/map.html" style="margin-left:-0%;"><img src="/mobile/img/findlocation.png" alt="..." class="img-rounded" ></a>
					</td>
					</tr>
					-->
                <tr>
                    <td  style="text-align: center;">
                        <a id = "dynamicLink" href="http://fps.html?userID=&accno=&sessionID=&custName" style="margin-left:0%;"><img src="/mobile/img/finger.png" alt="..." class="img-rounded"></a>
                        <script>
							var l = document.getElementById('dynamicLink');
							// Use URI.js to work with the URI
							// http://medialize.github.io/URI.js/
							var uri = URI(l.href);
							// Get the query string as an object
							var qs = uri.query(true);
							// Change our value
							qs.userID = sessionStorage.userID
							qs.accno = sessionStorage.from
							qs.sessionID=sessionStorage.sessionID
							qs.custName=sessionStorage.customerName
							// Update the URI object
							uri.query(qs);
							// Set our new HREF on the <a> element
							l.href = uri;
                        </script>
                    </td>
                    <td  style="text-align: center;">
                        <a id ="dynamicLink2" href="http://transaction.html?userID=&accno=&sessionID=&custName" style="margin-left:0%;"><img src="/mobile/img/pos.png" alt="..." class="img-rounded"></a>
                        <script>
							var l = document.getElementById('dynamicLink2');
							// Use URI.js to work with the URI
							// http://medialize.github.io/URI.js/
							var uri = URI(l.href);
							// Get the query string as an object
							var qs = uri.query(true);
							// Change our value
							qs.userID = sessionStorage.userID
							qs.accno = sessionStorage.from
							qs.sessionID=sessionStorage.sessionID
							qs.custName=sessionStorage.customerName
							// Update the URI object
							uri.query(qs);
							// Set our new HREF on the <a> element
							l.href = uri;
                        </script>

                    </td>
                </tr>
					
    		</tbody>
  		</table>
  	
	</div>
 </div>


 </body>

<div align="center" style="position:fixed; width:100%;  padding:0px;background-color: #d9534f; bottom:0px;min-height: 30px; ">
	<a  href="javascript:close();">   <img src="/mobile/img/close.png" alt="..." class="img-responsive" ></a>

</div>
</html>
