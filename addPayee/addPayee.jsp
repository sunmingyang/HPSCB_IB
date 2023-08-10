<!-- 
/*
 *	This content is generated from the PSD File Info.
 *	(Alt+Shift+Ctrl+I).
 *
 *	@desc 		
 *	@file 		09_2_add___manage_beneficiary
 *	@date 		Thursday 27th of April 2023 08:36:13 AM
 *	@title 		Page 1
 *	@author 	
 *	@keywords 	
 *	@generator 	Export Kit v1.3.figma
 *
*/
 -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" >
	<head>
		<meta http-equiv="content-type" content="text/html" charset="utf-8" />
		<title>09_2_add___manage_beneficiary</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="" >
		<link rel="StyleSheet" href="09_2_add___manage_beneficiary.css" />
		<script src="https://secure.exportkit.com/cdn/js/ek_googlefonts.js?v=6"></script>
		<%@ include file="/common/Include.jsp" %>  
		<script language="JavaScript" src= "/scripts/MD5.js"></script>   
    <script language="JavaScript" src="/fundtransfer/scripts/addpayee.js"></script> 
	<link rel = "stylesheet" href="/styles/table.css"  type = "text/css">
	<%@ page import="easycbs.bancmateib.fundtransfer.actionform.AddpayeeForm"%>
	<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

		<!-- Add your custom HEAD content here -->

	</head>
	<body>
		<html:form action="/fundtransfer/fund.do">

		<div id="content-container" >
			<a id="__bg___09_2_add___manage_beneficiary_link" href="10_quick_transfer__without_adding_beneficiary__within_hpscb" >
			<div id="__bg___09_2_add___manage_beneficiary"  ></div>
			</a>
			<div id="rectangle_270"  ></div>
            <div id="group_110"  >
			<select name = "dropdown" id="" >
			<option >---Select---</option>
				<option value = "SB">own bank account</option>
				
				<option value = "OB">non HPSCB Account</option>
			 </select>
			</div>     

			<div id="group_111"  >
				<!--<div id="rectangle_258"  ></div>-->
				 <label for="">
                        Beneficiary Name
                     </label>
			
				 <html:text property="payeeName" styleId="payeeName" styleClass="rectangle_258" /> 
				  
				

			</div>

		

			<div id="group_119"  >
			
			  <html:text  property="sPayeeAcc" styleId="sPayeeAcc" styleClass="rectangle_258_ek1" onchange="return fetchAccType()" />
				
				

			</div>

			<div id="group_117"  >
				
				
				<html:select property="sAccountType" styleId="sAccountType"  styleClass="rectangle_258_ek2" >
					<html:option  value=''>--select--</html:option>
					<html:option  value='S'>Saving</html:option>
					<html:option  value='A'>Current</html:option>
					<html:option  value='C'>Cash Credit/Overdraft</html:option>
					<html:option  value='E'>RD Account</html:option>
     				<html:option  value='T'>Loan Account</html:option>
			</html:select>
				<div id="account_type" >
					Account Type
				</div>

			</div>

			<div id="group_120"  >
				<div id="rectangle_258_ek3"  ></div>
				<div id="ifsc_code" >
					IFSC Code
				</div>

			</div>

			<div id="group_118"  >
			
				 <html:text property="sNickName" styleId="sNickName" styleClass="rectangle_258_ek4" />

			</div>

			<div id="group_121"  >
		
				 <html:text property="confirmPayeeAccNo" styleId="rectangle_258_ek5" styleClass="rectangle_258_ek5" />

			</div>
			<img src="/styles/images/arrow_down_2.png" id="arrow_down_2" />
			<div id="rectangle_397"  ></div>
			<div id="branch_name__hpscb_bank" >
				Branch Name:    HPSCB Bank
			</div>
			<div id="branch_code__hpscb001122" >
				Branch Code:      HPSCB001122
			</div>
			<div id="address__the_mall__ridge__shimla" >
				Address:               The Mall, Ridge, Shimla
			</div>

			<div id="____icon__search_"  >
				<img src="/styles/images/vector.png" id="vector" />
				<img src="/styles/images/vector_ek1.png" id="vector_ek1" />

			</div>
			<div id="rectangle_232"  ></div>
			<div id="get_otp" >
				GET OTP
			</div>
			<img src="/styles/images/next_2.png" id="next_2" />
			<div id="rectangle_375"  ></div>
			<div id="rectangle_271"  ></div>

			<div id="add_user_account_icon_1"  >
				<img src="/styles/images/vector_ek2.png" id="vector_ek2" />

			</div>
			<div id="add_and_manage_beneficiary" >
				Add And Manage Beneficiary
			</div>

			<a id="group_16_cls_a"  _par="" href="/dashBoard/dashboard.jsp" >
				<div id="rectangle_262"  ></div>
				<div id="back" >
					BACK
				</div>

				<div id="login_icon__1__1"  >

					<div id="group"  >
						<img src="/styles/images/vector_ek3.png" id="vector_ek3" />

					</div>

				</div>

			</a>

			<div id="group_104"  >

				<div id="group_102"  >
					<div id="rectangle_262_ek1"  ></div>
					<div id="home" >
						HOME
					</div>

				</div>

				<div id="group_103"  >
					<img src="/styles/images/vector_ek4.png" id="vector_ek4" />
					<img src="/styles/images/vector_ek5.png" id="vector_ek5" />

				</div>

			</div>

			<div id="group_45"  >

			<div class="bottom-footer">
            <div class="container">
               <div class="row">
                  <class class="col-md-12">
                     <p>Copyright &#169;  2023, Himachal Pradesh State Co-operative Bank Ltd. All Rights Reserved.</p>
                  </div>
               </div>
            </div>
         </div>
		<script>var specialChars = document.querySelectorAll("span.char"); for(var c=0; c<specialChars.length; c++){ specialChars[c].innerHTML = decodeURIComponent(specialChars[c].innerHTML); }</script>
		<style>
		
</style>
		</html:form>
	</body>
</html>