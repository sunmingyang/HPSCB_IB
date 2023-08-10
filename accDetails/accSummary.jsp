<!-- 
/*
 *	This content is generated from the PSD File Info.
 *	(Alt+Shift+Ctrl+I).
 *
 *	@desc 		
 *	@file 		06_account_view_details
 *	@date 		Tuesday 04th of April 2023 09:13:35 AM
 *	@title 		Page 1
 *	@author 	
 *	@keywords 	
 *	@generator 	Export Kit v1.3.figma
 *
*/
 -->
  <%@ page import="java.util.*" %>
 <% 
	String Arr= null, usrName="";
	String  custID="";
	String userInfo[][] = null;
	int j; 
	usrName = (String)session.getAttribute("user");
	custID= (String)session.getAttribute("custid");
	userInfo = (String [][])session.getAttribute("userInfo");
	String accountInfo=(String )session.getAttribute("AccountInfo");
	System.out.println("accountInfo is----"+accountInfo);
	
	
	String brnCode=userInfo[0][1];
//out.writeln(""+request.setAttribute("brnCode",brnCode));
	
	String loginTime = (String)session.getAttribute("lastLoginTime");
    String totallogin = (String)request.getAttribute("totallogin");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" >
	<head>
		<meta http-equiv="content-type" content="text/html" charset="utf-8" />
		<title>06_account_view_details</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="" >
		<link rel="StyleSheet" href="/allNewCSS/accSummary.css" />
		<script src="https://secure.exportkit.com/cdn/js/ek_googlefonts.js?v=6"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<!-- Add your custom HEAD content here -->

	</head>
	<script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
	<script language="JavaScript" src="/scripts/common.js" type="text/javascript"></script>
	<script>
	
	function savingAjax(){
	    var ran=parseInt(Math.random()*9999);
        var URL ="/AccountInfoAction.do?action=fetchCustomerAccounts&custID="+<%=userInfo[0][8]%>+"&ran="+ran; 
	    http.open("POST",URL,false);
		http.onreadystatechange= function (){processAccount()};
		http.send(null);
}
	function processAccount()
{
	if((http.readyState == 4) && (http.status == 200)){
		var resArray=http.responseText;
	//alert(resArray);
		var counter;
		var loanDiv2;
		var cat2;
		var category ='<table border="1" bordercolor="#ffffff" align="center"  width=200 cellpadding="0" cellspacing="0" id="table" >' ;	
     category+='<tr>';
	 category+='<td width="110" class="dataTableTH"><bean:message bundle="hindi" key= "89"/></td>'; 
	 category+='<td width="120" class="dataTableTH"> <bean:message bundle="hindi" key= "1027"/></td>';
	 category+='<td class="dataTableTH"> <bean:message bundle="hindi" key= "717"/></td>';
	 category+='<td class="dataTableTH"><bean:message bundle="hindi" key= "718"/></td>';
	 category+='<td class="dataTableTH"><bean:message bundle="hindi" key= "1180"/></td>';
	 category+='<td class="dataTableTH"><bean:message bundle="hindi" key= "217"/></td>';
	 category+='<td class="dataTableTH">Select</td>';
	 category+='</tr>';
	   var jsonData = JSON.parse(resArray);
       for (var i = 0; i < jsonData.accountInformation.length; i++) {
        counter = jsonData.accountInformation[i];
		 // alert(counter.customerName);
		category+='<tr><td class="dataTableTD">';
		category+=counter.customerName;
        category+='</td>'
		category+='<td class="dataTableTD1">';
		category+=counter.accountNo;
		category+='</td>';
		category+='<td class="dataTableTD1">';
		category+=counter.clearBalance;
		category+='</td>';
		category+='<td class="dataTableTD1">';
		category+=counter.underClgBalance;
		category+='</td>';
		category+='<td class="dataTableTD">';
		category+=counter.actEname;
		//alert(counter.actEname)
		category+='</td>';
		category+='<td class="dataTableTD">';
		category+='Rupees';
		category+='</td>';
		category+='<td class="dataTableTD">';
  		if(counter.accountType=="S"){
  			
			document.getElementById("_1234567891234567").innerHTML = counter.accountNo;
			
				document.getElementById("__xxxxxxx_show").innerHTML = counter.clearBalance;
				
				document.getElementById("mi_road__jaipur").innerHTML = counter.address;
  		}
		if(counter.accountType=="T"){
  			loanDiv2+='<div class="accNo">'+ counter.accountNo+'</div>'+
			'<div class="accBalance">'+counter.clearBalance+'</div>'+
			'<div class="accBranch">'+counter.address+'</div>';
			cat2+='<tr>'+'<td>'+counter.accountNo+'</td>'
			+'<td>'+counter.clearBalance+'</td>'+'<td>'+counter.address+'</td>'+'</tr>'
			
  		}
  		category+='</td></tr>';
	
  
		
	   }
	   }
	 category+='</table>';
	
				//document.getElementById("loanDiv2").innerHTML = loanDiv2;
				document.getElementById("exampleid").innerHTML = cat2;
	
     }  
	function getdetail(ptaddr){
		var pttable=document.getElementById("table");
		var s=ptaddr.parentNode.parentNode;
		var t=s.rowIndex;
		var ptRowCount=pttable.rows.length;
		var accountNO = pttable.rows[t].childNodes[1].innerHTML;
		window.open("FdDetail.jsp?accountNO="+accountNO,"_self");
	}
	$(document).ready(function(){
  $("#rectangle_271").click(function(){
    $("#account_number").toggle();
  });
});
    
</script>
<body onload="savingAjax()">
		<div id="content-container" >
			<div id="_bg___06_account_view_details"  ></div>
			<div id="rectangle_270"  ></div>
			<div id="rectangle_273"  ></div>
			<div id="rectangle_272"  ></div>
			<div id="account_number" >
				Account Number counter.accountNo;
			</div>
			<div id="available_balance" >
				Available Balance
			</div>
			<div id="branch" >
				Branch
			</div>
			<!--<div id="_1234567891234567" >
				1234567891234567
			</div>-->
			<!--<div id="view_nomination_and_pan_details" >
				View Nomination and PAN Details
			</div>
			<div id="view_all_balances" >
				View All Balances
			</div>
			<div id="last_10_transactions" >
				Last 10 Transactions
			</div> */-->
			<div id="_1234567891234567" >
				
			</div>
			<div id="__xxxxxxx_show" >
				<!--<span style="font-style:normal; font-weight:normal; id='balance' text-decoration:NONE; ">XXXXXXX    </span><span style="color:#0067B8; font-size:14; font-style:normal; font-weight:bold; text-decoration:NONE; ">  S</span>-->
			</div>
			<div id="mi_road__jaipur" >
				
			</div>
			<div id="rectangle_271"  ></div>

			<div id="icon_popularsaving_account_1"  >
				<img src="/allNewSkins/vector.png" id="vector" />
				<img src="/allNewSkins/vector_ek1.png" id="vector_ek1" />

			</div>
			<div id="savings_account" >
				Savings Account
			</div>
			
			<div id="line_82"  ></div>
				<div id="rectangle_271" style="top:420px;height:50px"  ></div>
				<div id="current_account" >
				Current Account
			</div>
			<div id="line_82"  ></div>
				<div id="rectangle_271" style="top:540px;height:50px"  ></div>
				<div id="loans_account" >
				Loan Account
			</div>
				<div id="loanDiv2" style="top:590px;height:50px;left:70px">
				 <table >
		                <thead>
		                <tr>
		                    <th id="account_number">Account Number</th>
		                    <th id="available_balance">Account Balance</th>
		                    <th id="branch">Branch</th>
		                </tr>
		                </thead>
						<tbody id="exampleid">
						</tbody>
		            </table>
				
				</div>
			<div id="line_83"  ></div>
							<div id="rectangle_271" style="top:6700px;height:50px"  ></div>
			<div id="line_84"  ></div>
			<a id="_line_85_link" href="06_account_statement.html" >
			<div id="_line_85"  ></div>
			</a>

			<div id="idea_bulb_icon_1"  >
				<img src="/allNewSkins/vector_ek2.png" id="vector_ek2" />
				<img src="/allNewSkins/vector_ek3.png" id="vector_ek3" />
				<img src="/allNewSkins/vector_ek4.png" id="vector_ek4" />
				<img src="/allNewSkins/vector_ek5.png" id="vector_ek5" />
				<img src="/allNewSkins/vector_ek6.png" id="vector_ek6" />
				<img src="/allNewSkins/vector_ek7.png" id="vector_ek7" />
				<img src="/allNewSkins/vector_ek8.png" id="vector_ek8" />

			</div>
			<div id="if_you_have_ant_hidden_accounts__please_unhide_through_the_tab_profile___manage_a_c_display___unhide_accounts_for_unhide_debit_accounts_" >
				If  you have ant hidden accounts, please unhide through the tab profile > manage A/C display  > unhide accounts for unhide debit accounts.
			</div>
			<div id="capitals_gains_plus_account_can_be_viewed_under_deposite_accounts" >
				Capitals gains plus account can be viewed under deposite accounts  
			</div>

			<div id="group_127" style="display:none" >

				<div id="group_105"  >
					<div id="last_10_transaction" >
						Last 10 Transaction
					</div>
					<div id="rectangle_226"  ></div>
					<div id="search_or_filter_payments" >
						Search or filter payments
					</div>
					<img src="/allNewSkins/filter_1.png" id="filter_1" />

					<div id="____icon__search_"  >
						<img src="/allNewSkins/vector_ek9.png" id="vector_ek9" />
						<img src="/allNewSkins/vector_ek10.png" id="vector_ek10" />

					</div>

				</div>
				<div id="line_93"  ></div>

				<div id="group_106"  >

					<div id="group_79"  >
						<div id="ellipse_50"  ></div>
						<div id="paid_to_mukesh_kumar" >
							Paid to MUKESH KUMAR
						</div>
						<div id="today_01_24_pm" >
							Today 01:24 PM 
						</div>

					</div>
					<div id="line_92"  ></div>
					<div id="___200" >
						<span class="char">%E2%82%B9-</span>-200
					</div>
					<div id="closing_balance__1300" >
						Closing Balance <span class="char">%E2%82%B91</span>1300
					</div>

				</div>

				<div id="group_107"  >

					<div id="group_79_ek1"  >
						<div id="ellipse_50_ek1"  ></div>
						<div id="paid_to_mukesh_kumar_ek1" >
							Paid to MUKESH KUMAR
						</div>
						<div id="_18_mar__10_26_am" >
							18 mar, 10:26 AM
						</div>

					</div>
					<div id="line_92_ek1"  ></div>
					<div id="___200_ek1" >
						<span class="char">%E2%82%B9-</span>-200
					</div>
					<div id="closing_balance__1400" >
						Closing Balance <span class="char">%E2%82%B91</span>1400
					</div>

				</div>

				<div id="group_108"  >

					<div id="group_79_ek2"  >
						<div id="ellipse_50_ek2"  ></div>
						<div id="paid_to_mukesh_kumar_ek2" >
							Paid to MUKESH KUMAR
						</div>
						<div id="_25_mar__05_54_pm" >
							25 mar, 05:54 PM
						</div>

					</div>
					<div id="line_92_ek2"  ></div>
					<div id="___200_ek2" >
						<span class="char">%E2%82%B9-</span>-200
					</div>
					<div id="closing_balance__1700" >
						Closing Balance <span class="char">%E2%82%B91</span>1700
					</div>

				</div>

				<div id="group_109"  >

					<div id="group_79_ek3"  >
						<div id="ellipse_50_ek3"  ></div>
						<div id="paid_to_mukesh_kumar_ek3" >
							Paid to MUKESH KUMAR
						</div>
						<div id="_18_mar__10_26_am_ek1" >
							18 mar, 10:26 AM
						</div>

					</div>
					<div id="line_92_ek3"  ></div>
					<div id="___200_ek3" >
						<span class="char">%E2%82%B9-</span>-200
					</div>
					<div id="closing_balance__1800" >
						Closing Balance <span class="char">%E2%82%B91</span>1800
					</div>

				</div>

				<div id="group_110"  >

					<div id="group_79_ek4"  >
						<div id="ellipse_50_ek4"  ></div>
						<div id="paid_to_mukesh_kumar_ek4" >
							Paid to MUKESH KUMAR
						</div>
						<div id="_26_feb__10_50_am" >
							26 feb, 10:50 AM
						</div>

					</div>
					<div id="line_92_ek4"  ></div>
					<div id="___200_ek4" >
						<span class="char">%E2%82%B9-</span>-200
					</div>
					<div id="closing_balance__1800_ek1" >
						Closing Balance <span class="char">%E2%82%B91</span>1800
					</div>

				</div>

				<div id="group_111"  >

					<div id="group_79_ek5"  >
						<div id="ellipse_50_ek5"  ></div>
						<div id="paid_to_mukesh_kumar_ek5" >
							Paid to MUKESH KUMAR
						</div>
						<div id="today_12_24_pm" >
							Today 12:24 PM 
						</div>

					</div>
					<div id="line_92_ek5"  ></div>
					<div id="___200_ek5" >
						<span class="char">%E2%82%B9-</span>-200
					</div>
					<div id="closing_balance__1500" >
						Closing Balance <span class="char">%E2%82%B91</span>1500
					</div>

				</div>

				<div id="group_112"  >

					<div id="group_79_ek6"  >
						<div id="ellipse_50_ek6"  ></div>
						<div id="paid_to_mukesh_kumar_ek6" >
							Paid to MUKESH KUMAR
						</div>
						<div id="_18_mar__10_26_am_ek2" >
							18 mar, 10:26 AM
						</div>

					</div>
					<div id="line_92_ek6"  ></div>
					<div id="___200_ek6" >
						<span class="char">%E2%82%B9-</span>-200
					</div>
					<div id="closing_balance__1600" >
						Closing Balance <span class="char">%E2%82%B91</span>1600
					</div>

				</div>

				<div id="group_113"  >

					<div id="group_79_ek7"  >
						<div id="ellipse_50_ek7"  ></div>
						<div id="receive_from_dinesh_kumar" >
							Receive From DINESH KUMAR
						</div>
						<div id="_22_mar__02_16_pm" >
							22 mar, 02:16 PM
						</div>

					</div>
					<div id="line_92_ek7"  ></div>
					<div id="___500" >
						<span class="char">%E2%82%B9+</span>+500
					</div>
					<div id="closing_balance__1900" >
						Closing Balance <span class="char">%E2%82%B91</span>1900
					</div>

				</div>

				<div id="group_114"  >

					<div id="group_79_ek8"  >
						<div id="ellipse_50_ek8"  ></div>
						<div id="receive_from_dinesh_kumar_ek1" >
							Receive From DINESH KUMAR
						</div>
						<div id="_18_mar__10_26_am_ek3" >
							18 mar, 10:26 AM
						</div>

					</div>
					<div id="line_92_ek8"  ></div>
					<div id="___200_ek7" >
						<span class="char">%E2%82%B9+</span>+200
					</div>
					<div id="closing_balance__2000" >
						Closing Balance <span class="char">%E2%82%B92</span>2000
					</div>

				</div>

				<div id="group_115"  >

					<div id="group_79_ek9"  >
						<div id="ellipse_50_ek9"  ></div>
						<div id="receive_from_dinesh_kumar_ek2" >
							Receive From DINESH KUMAR
						</div>
						<div id="_26_feb__10_50_am_ek1" >
							26 feb, 10:50 AM
						</div>

					</div>
					<div id="line_92_ek9"  ></div>
					<div id="___2000" >
						<span class="char">%E2%82%B9+</span>+2000
					</div>
					<div id="closing_balance__2000_ek1" >
						Closing Balance <span class="char">%E2%82%B92</span>2000
					</div>

				</div>
				<div id="rectangle_278"  ></div>
				<div id="rectangle_279"  ></div>
				<div id="march_2023" >
					March 2023
				</div>
				<div id="feb_2023" >
					Feb 2023
				</div>

				<div id="____icon__shop_alt_"  >
					<img src="/allNewSkins/vector_ek11.png" id="vector_ek11" />
					<img src="/allNewSkins/vector_ek12.png" id="vector_ek12" />
					<img src="/allNewSkins/vector_ek13.png" id="vector_ek13" />
					<img src="/allNewSkins/vector_ek14.png" id="vector_ek14" />
					<img src="/allNewSkins/vector_ek15.png" id="vector_ek15" />
					<img src="/allNewSkins/vector_ek16.png" id="vector_ek16" />

				</div>

				<div id="____icon__shop_alt__ek1"  >
					<img src="/allNewSkins/vector_ek17.png" id="vector_ek17" />
					<img src="/allNewSkins/vector_ek18.png" id="vector_ek18" />
					<img src="/allNewSkins/vector_ek19.png" id="vector_ek19" />
					<img src="/allNewSkins/vector_ek20.png" id="vector_ek20" />
					<img src="/allNewSkins/vector_ek21.png" id="vector_ek21" />
					<img src="/allNewSkins/vector_ek22.png" id="vector_ek22" />

				</div>

				<div id="____icon__shop_alt__ek2"  >
					<img src="/allNewSkins/vector_ek23.png" id="vector_ek23" />
					<img src="/allNewSkins/vector_ek24.png" id="vector_ek24" />
					<img src="/allNewSkins/vector_ek25.png" id="vector_ek25" />
					<img src="/allNewSkins/vector_ek26.png" id="vector_ek26" />
					<img src="/allNewSkins/vector_ek27.png" id="vector_ek27" />
					<img src="/allNewSkins/vector_ek28.png" id="vector_ek28" />

				</div>

				<div id="____icon__shop_alt__ek3"  >
					<img src="/allNewSkins/vector_ek29.png" id="vector_ek29" />
					<img src="/allNewSkins/vector_ek30.png" id="vector_ek30" />
					<img src="/allNewSkins/vector_ek31.png" id="vector_ek31" />
					<img src="/allNewSkins/vector_ek32.png" id="vector_ek32" />
					<img src="/allNewSkins/vector_ek33.png" id="vector_ek33" />
					<img src="/allNewSkins/vector_ek34.png" id="vector_ek34" />

				</div>

				<div id="____icon__shop_alt__ek4"  >
					<img src="/allNewSkins/vector_ek35.png" id="vector_ek35" />
					<img src="/allNewSkins/vector_ek36.png" id="vector_ek36" />
					<img src="/allNewSkins/vector_ek37.png" id="vector_ek37" />
					<img src="/allNewSkins/vector_ek38.png" id="vector_ek38" />
					<img src="/allNewSkins/vector_ek39.png" id="vector_ek39" />
					<img src="/allNewSkins/vector_ek40.png" id="vector_ek40" />

				</div>

				<div id="____icon__shop_alt__ek5"  >
					<img src="/allNewSkins/vector_ek41.png" id="vector_ek41" />
					<img src="/allNewSkins/vector_ek42.png" id="vector_ek42" />
					<img src="/allNewSkins/vector_ek43.png" id="vector_ek43" />
					<img src="/allNewSkins/vector_ek44.png" id="vector_ek44" />
					<img src="/allNewSkins/vector_ek45.png" id="vector_ek45" />
					<img src="/allNewSkins/vector_ek46.png" id="vector_ek46" />

				</div>

				<div id="____icon__shop_alt__ek6"  >
					<img src="/allNewSkins/vector_ek47.png" id="vector_ek47" />
					<img src="/allNewSkins/vector_ek48.png" id="vector_ek48" />
					<img src="/allNewSkins/vector_ek49.png" id="vector_ek49" />
					<img src="/allNewSkins/vector_ek50.png" id="vector_ek50" />
					<img src="/allNewSkins/vector_ek51.png" id="vector_ek51" />
					<img src="/allNewSkins/vector_ek52.png" id="vector_ek52" />

				</div>

				<div id="____icon__shop_alt__ek7"  >
					<img src="/allNewSkins/vector_ek53.png" id="vector_ek53" />
					<img src="/allNewSkins/vector_ek54.png" id="vector_ek54" />
					<img src="/allNewSkins/vector_ek55.png" id="vector_ek55" />
					<img src="/allNewSkins/vector_ek56.png" id="vector_ek56" />
					<img src="/allNewSkins/vector_ek57.png" id="vector_ek57" />
					<img src="/allNewSkins/vector_ek58.png" id="vector_ek58" />

				</div>

				<div id="____icon__shop_alt__ek8"  >
					<img src="/allNewSkins/vector_ek59.png" id="vector_ek59" />
					<img src="/allNewSkins/vector_ek60.png" id="vector_ek60" />
					<img src="/allNewSkins/vector_ek61.png" id="vector_ek61" />
					<img src="/allNewSkins/vector_ek62.png" id="vector_ek62" />
					<img src="/allNewSkins/vector_ek63.png" id="vector_ek63" />
					<img src="/allNewSkins/vector_ek64.png" id="vector_ek64" />

				</div>

				<div id="____icon__shop_alt__ek9"  >
					<img src="/allNewSkins/vector_ek65.png" id="vector_ek65" />
					<img src="/allNewSkins/vector_ek66.png" id="vector_ek66" />
					<img src="/allNewSkins/vector_ek67.png" id="vector_ek67" />
					<img src="/allNewSkins/vector_ek68.png" id="vector_ek68" />
					<img src="/allNewSkins/vector_ek69.png" id="vector_ek69" />
					<img src="/allNewSkins/vector_ek70.png" id="vector_ek70" />

				</div>

			</div>

			<div id="group_16"  >
				<div id="rectangle_262"  ></div>
				<div id="back" >
					BACK
				</div>

				<div id="login_icon__1__1"  >

					<div id="group"  >
						<img src="/allNewSkins/vector_ek71.png" id="vector_ek71" />

					</div>

				</div>

			</div>

			<div id="footer"  >
				<div id="rectangle_233"  ></div>
				<div id="rectangle_231"  ></div>
				<div id="copyright___2023_himachal_pradesh_state_co_operative_bank_ltd_all_rights_reserved_" >
					Copyright <span class="char">%C2%A9 </span> 2023 Himachal Pradesh State Co-operative Bank Ltd.All Rights Reserved.
				</div>
				<div id="line_10"  ></div>

				<div id="logo"  >
					<img src="/allNewSkins/logo__2__1.png" id="logo__2__1" />

				</div>
				<div id="the_himachal_pradesh_state_cooperative_bank_ltd__is_an_apex_bank_of_the_state_of_himachal_pradesh__and_is_listed_as_scheduled_bank_with_its_branches_spread_across_6_districts_of_the_state_and_one_branch_at_new_subzi_mandi__new_delhi_" >
					The Himachal Pradesh State Cooperative Bank Ltd. is an Apex bank of the State of Himachal Pradesh; and is listed as Scheduled Bank with its branches spread across 6 districts of the State and one branch at New Subzi Mandi, New Delhi.
				</div>
				<div id="rectangle_232"  ></div>
				<div id="follow___hpscblofficial" >
					Follow:  @hpscblofficial
				</div>
				<div id="hpscb" >
					HPSCB
				</div>
				<div id="loans" >
					Loans
				</div>
				<div id="deposits" >
					Deposits
				</div>
				<div id="acsti" >
					ACSTI
				</div>
				<div id="line_11"  ></div>
				<div id="line_12"  ></div>
				<div id="line_13"  ></div>
				<div id="line_14"  ></div>
				<div id="about_us_managing_committee_board_of_directors_branches_network_atm_network_contact_us_right_to_information_list_of_unclaimed_deposits_customer_grievance_redressal_policy" >
					About Us<br/>Managing Committee<br/>Board of Directors<br/>Branches Network<br/>ATM Network<br/>Contact Us<br/>Right To Information<br/>List of Unclaimed Deposits<br/>Customer grievance Redressal Policy
				</div>
				<div id="home_loan_car_loan_personal_loan_education_loan_hotel_motel_tiny_tourism_financing_of_hydel_projects_interest_rates_on_loans" >
					Home Loan<br/>Car Loan<br/>Personal Loan<br/>Education Loan<br/>Hotel/Motel/Tiny Tourism<br/>Financing of Hydel Projects<br/>Interest Rates on Loans
				</div>
				<div id="savings_account_current_account_recurring_deposit_fixed_deposit_himpurnivesh_deposit_sarvapriya_deposit_mahalaxmi_deposit_interest_rates_on_deposits" >
					Savings Account<br/>Current Account<br/>Recurring Deposit<br/>Fixed Deposit<br/>Himpurnivesh Deposit<br/>Sarvapriya Deposit<br/>Mahalaxmi Deposit<br/>Interest Rates on Deposits
				</div>
				<div id="about_acsti_facilities_faculty_courses_calendar_how_to_reach_contact_us" >
					About ACSTI<br/>Facilities<br/>Faculty<br/>Courses Calendar<br/>How to Reach<br/>Contact Us
				</div>

			</div>

			<div id="twitter_color_icon_1"  >
				<img src="/allNewSkins/vector_ek72.png" id="vector_ek72" />

			</div>

			<div id="group_104"  >

				<div id="group_102"  >
					<div id="rectangle_262_ek1"  ></div>
					<div id="home" >
						HOME
					</div>

				</div>

				<div id="group_103"  >
					<img src="/allNewSkins/vector_ek73.png" id="vector_ek73" />
					<img src="/allNewSkins/vector_ek74.png" id="vector_ek74" />

				</div>

			</div>

			<div id="group_126"  >

				<div id="header"  >
					<div id="rectangle_373"  ></div>
					<div id="rectangle_1"  ></div>

					<div id="logo_ek1"  >
						<img src="/allNewSkins/logo__2__1_ek1.png" id="logo__2__1_ek1" />

					</div>

				</div>
				<div id="hpscb_bank_home_about_us_customer_care_find_atm_branch_mobile_banking" >
					HPSCB Bank Home          About Us          Customer Care          Find ATM/Branch          Mobile Banking
				</div>
				<div id="line_19"  ></div>
				<div id="line_20"  ></div>
				<div id="line_21"  ></div>
				<div id="line_22"  ></div>

				<div id="mobile_usability_icon__1__1"  >
					<img src="/allNewSkins/vector_ek75.png" id="vector_ek75" />

				</div>

				<div id="caret_down_icon_10"  >

				</div>

				<div id="caret_down_icon_11"  >

				</div>

				<div id="caret_down_icon_12"  >

				</div>

				<div id="caret_down_icon_13"  >

				</div>

				<div id="group_14"  >
					<div id="overview_my_accounts_payments___transfer_investments___insurance_exclusive_offerings_customer_service" >
						OVERVIEW                     MY ACCOUNTS                       PAYMENTS &amp; TRANSFER                      INVESTMENTS &amp; INSURANCE                      EXCLUSIVE OFFERINGS                     CUSTOMER SERVICE
					</div>

					<div id="customer_service_icon_1"  >
						<img src="/allNewSkins/vector_ek76.png" id="vector_ek76" />

					</div>

					<div id="offer_icon_1"  >
						<img src="/allNewSkins/vector_ek77.png" id="vector_ek77" />

					</div>

					<div id="overview_icon_1"  >
						<img src="/allNewSkins/vector_ek78.png" id="vector_ek78" />

					</div>

					<div id="my_account_icon_1"  >
						<img src="/allNewSkins/vector_ek79.png" id="vector_ek79" />

					</div>

					<div id="caret_down_icon_8"  >
						<img src="/allNewSkins/vector_ek80.png" id="vector_ek80" />

					</div>

					<div id="caret_down_icon_9"  >
						<img src="/allNewSkins/vector_ek81.png" id="vector_ek81" />

					</div>
					<img src="/allNewSkins/vector_ek82.png" id="vector_ek82" />
					<img src="/allNewSkins/vector_ek83.png" id="vector_ek83" />
					<img src="/allNewSkins/vector_ek84.png" id="vector_ek84" />
					<img src="/allNewSkins/vector_ek85.png" id="vector_ek85" />

					<div id="wire_transfer_icon_1"  >
						<img src="/allNewSkins/vector_ek86.png" id="vector_ek86" />

					</div>

					<div id="investment_analysis_icon_1"  >
						<img src="/allNewSkins/vector_ek87.png" id="vector_ek87" />

					</div>

				</div>
				<img src="/allNewSkins/group_26.png" id="group_26" />
				<div id="line_41"  ></div>
				<div id="dashboard___account___account_summary" >
					<span style="font-style:normal; font-weight:normal; text-decoration:NONE; "><a href="/dashBoard/dashboard.jsp">Dashboard</a></span><span style="color:#000000; font-style:normal; font-weight:normal; text-decoration:NONE; ">  >  Account Summary</span>
				</div>
				<div id="_28_mar_2023____04_16_06_am_ist__" >
					<%= (new java.util.Date()).toLocaleString()%>
				</div>

				<div id="thin_chevron_arrow_right_icon_1"  >
					<img src="/allNewSkins/vector_ek88.png" id="vector_ek88" />

				</div>
				<div id="line_44"  ></div>

			</div>

		</div>
		<script>var specialChars = document.querySelectorAll("span.char"); for(var c=0; c<specialChars.length; c++){ specialChars[c].innerHTML = decodeURIComponent(specialChars[c].innerHTML); }</script>
	</body>
	<style>
.dataTableTH{
		font-family: Verdana, Arial, Helvetica, sans-;
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

</html>