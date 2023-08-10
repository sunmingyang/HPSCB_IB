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
%>

<!DOCTYPE html>
<html>
<head>
  <title>mBanking</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

   <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<script src="js/jquery.min.js"></script>
   <script src="mbanking_js/mbanking.js"></script >
   <script src="mbanking_js/URI.min.js"></script>
	<link rel="stylesheet" href="mbanking_css/style.css">

<style>
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
 alert("fill data");
 user='<%=usrName%>';	
 alert("user");
 document.getElementById("customerName").value = user; 
}
</script>
 <body onload="getLocation();getPreference(); fillData();" >
		 <!--  content centering -->
 <div style="text-align: center;">
 	<div id="spinner" class="spinner" style="display:none;">
    	<img id="img-spinner" src="img/Preloader_2.gif" alt="Loading"/>
	</div>
 
 	<div style="position:fixed; width:100%; background-color: #d9534f;  padding:0px; top:0px;min-height: 30px; "></div>
        
    <div style="margin-top:60px;" ><img src="./img/logo.png" alt="..." class="img-responsive" style="margin:0px auto;display:block"  /></div>
  
   	<h4 style="margin-left:25px;color:#d9534f;margin-top:20px;" id="customerName"></h4>
	****
	<h5 style="margin-left:25px;color:#e89795;" id="lastLogin"></h5> 
	 <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="./forgot_password.html">Change Password</a></div>
	<div style="float:left; font-size: 80%; position: relative; top:-10px">
	 <a href="./setting.html"><img src="./img/setting.png" alt="..." class="img-rounded"></a>
	</div>
    <div  id="my-div" style="margin-top:50px;top:30%;left:8%;"  > <!--  Table centering -->

  		<table style="bg-color:#ccc;" class="table " border="0px" >
    		<tbody >
      			<tr>
        			<td style="text-align: center;"><a href="./accounts.html" style="margin-left:0%;"><img src="./img/accounts.png" alt="..." class="img-rounded"></a></td>
                    <td style="text-align: center;"><a href="./accountsopen.html" style="margin-left:0%;"><img src="./img/OpenAccount.jpg" alt="..." class="img-rounded"></a></td>
        		</tr>

                <tr>
                    <td  style="text-align: center;"><a href="./fund_transfer.html" style="margin-left:0%;"><img src="./img/fund_transfer.png" alt="..." class="img-rounded"></a></td>
                    <td  style="text-align: center;"><a href="./request.html" style="margin-left:0%;"><img src="./img/cheques.png" alt="..." class="img-rounded"></a></td>
                </tr>

                <tr>
           <td  style="text-align: center;"><img src="./img/fund_transfer.png" alt="..." class="img-rounded" onclick= "fundTransfer()"></td>
                    <td  style="text-align: center;"><a href="./setting.html" style="margin-left:0%;"><img src="./img/setting.png" alt="..." class="img-rounded"></a></td>
                </tr>
      			<tr>
      				<!-- <td style="text-align: center;"><a href="dth_recharge.html" style="margin-left:0%;"><img src="./img/dth_recharge.png" alt="..." class="img-rounded"></a></td> -->
				<!--	<td style="text-align: center;"><a href="./imps.html" style="margin-left:0%;"><img src="./img/imps.png" alt="..." class="img-rounded"></a></td>-->
        		<!--	<td style="text-align: center;"><a href="./dth_recharge.html" style="margin-left:0%;"><img src="./img/dth_recharge.png" alt="..." class="img-rounded"></a></td>-->
        		
        				<td style="text-align: center;"><a href="./deposit.html" style="margin-left:0%;"><img src="./img/deposit.png" alt="..." class="img-rounded"></a></td>
        				<td style="text-align: center;"><a href="./cheque.html" style="margin-left:-0%;"><img src="./img/cheques.png" alt="..." class="img-rounded"></a></td>
				</tr>
				<tr>
					<td style="text-align: center;" ><img src="./img/pc4.png" alt="..." class="img-rounded" onclick="precise()"></td>
					<td style="text-align: center;"><img src="./img/promptmeLogo.png" alt="..." class="img-rounded" onclick="prompt()"></td>
				</tr>
				<tr>

					<!--<td style="text-align:center;"><a href="TransactionCollection.html"> <img src="./img/transaction.jpg" ></a></td>-->

				<!--	<td style="text-align: center;" ><a href="http://www.snapdeal.com/" style="margin-left:0%;"><img src="./img/sd.png" alt="..." class="img-rounded"></a></td>-->
				</tr>
				<!--	<tr>
                        <td style="text-align: center;"><a href="#" style="margin-left:0%;"><img src="./img/bill_pay.png" alt="..." class="img-rounded"></a></td>
                        <td style="text-align: center;"><a href="#" style="margin-left:-0%;"><img src="./img/mobile_recharge.png" alt="..." class="img-rounded"></a></td>
                     </tr>
                    <tr>
                        <td style="text-align: center;"><a href="#" style="margin-left:0%;"><img src="./img/imps.png" alt="..." class="img-rounded"></a></td>
                        <td style="text-align: center;"><a href="#" style="margin-left:0%;"><img src="./img/credit_cards.png" alt="..." class="img-rounded"></a></td>
                      </tr>
                      -->
                    <!--
                      <tr>
                        <td style="text-align: center;"><a href="bill_payment.html" style="margin-left:0%;"><img src="./img/bill_pay.png" alt="..." class="img-rounded"></a></td>
                        <td style="text-align: center;"><a href="./mobile_recharge.html" style="margin-left:-0%;"><img src="./img/mobile_recharge.png" alt="..." class="img-rounded"></a></td>
                     </tr>
                    <tr>
                        <td style="text-align: center;"><a href="#" style="margin-left:0%;"><img src="./img/imps.png" alt="..." class="img-rounded"></a></td>
                        <td style="text-align: center;"><a href="#" style="margin-left:0%;"><img src="./img/credit_cards.png" alt="..." class="img-rounded"></a></td>
                      </tr> -->
                      <tr>
						<td style="text-align: center;"><a href="ac_open.html" style="margin-left:0%;"><img src="./img/newaccopen.png" alt="..." class="img-rounded"></a></td>
						<td  style="text-align: center;"><a href="http://192.168.1.128:8290/CobaSys/CustId/CMMCustomerIdPreAction.do?accNo=002010000148
													" style="margin-left:0%;"><img src="./img/custid.png" alt="..." class="img-rounded"></a></td>
					</tr>
					<tr>
						<td style="text-align: center;"><a href="agentTrn.html" style="margin-left:0%;"><img src="./img/newaccopen.png" alt="..." class="img-rounded"></a></td>
						<td  style="text-align: center;"><a href="cashpayment.html" style="margin-left:0%;"><img src="./img/custid.png" alt="..." class="img-rounded"></a></td>
					</tr>
					<tr>
					<td  style="text-align: center;"><a href="./knowyouragent.html" style="margin-left:0%;"><img src="./img/findagent.png" alt="..." class="img-rounded"></a></td>
					<td  style="text-align: center;"><a href="./deactivateATM.html" style="margin-left:0%;"><img src="./img/deactivate.png" alt="..." class="img-rounded"></a></td>
					</tr>
					<tr>
					<td style="text-align: center;">
					<a href="./map.html" style="margin-left:-0%;"><img src="./img/findlocation.png" alt="..." class="img-rounded" ></a>
					</td>
					</tr>
                <tr>
                    <td  style="text-align: center;">
                        <a id = "dynamicLink" href="http://fps.html?userID=&accno=&sessionID=&custName" style="margin-left:0%;"><img src="./img/finger.png" alt="..." class="img-rounded"></a>
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
                        <a id ="dynamicLink2" href="http://transaction.html?userID=&accno=&sessionID=&custName" style="margin-left:0%;"><img src="./img/pos.png" alt="..." class="img-rounded"></a>
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
	<a  href="javascript:close();">   <img src="./img/close.png" alt="..." class="img-responsive" ></a>

</div>
</html>
