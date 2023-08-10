<!DOCTYPE HTML>
<html>
<head>
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">

<title>Internet Banking | HPSCB Bank</title>
<script
	src="<%=request.getContextPath()%>/new_ui/IB_UI/js/js-image-slider.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/new_ui/IB_UI/js/jquery.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new_ui/IB_UI/css/style-1.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new_ui/IB_UI/common.css" />
<link
	href="<%=request.getContextPath()%>/new_ui/IB_UI/css/js-image-slider.css"
	rel="stylesheet" type="text/css" />

<script>
	function showDiv() {
		if (document.getElementById("slide-in").style.display == "block") {
			document.getElementById("slide-in").style.display = "none";
			document.getElementById("rightDiv").innerHTML = '<a class="leftpanel-btn" title="Show "><i class="icon-angle-right"></i>< Show</a>';
		//	showChildDiv('IBLogin');
		} else {
			document.getElementById("slide-in").style.display = "block";
			document.getElementById("rightDiv").innerHTML = '<a class="leftpanel-btn" title="Hide "><i class="icon-angle-right"></i>> Hide</a>';
		
		}
	}
	function showChildDiv(link) {

		if (link == 'IBLogin') {
			document.getElementById('child-IBLogin').style.display='block';
			document.getElementById('child-IBLogin').style.float='right';
			document.getElementById('child-IBLogin').style.width='361.55px';
			document.getElementById('child-IBLogin').style.height='auto';
			document.getElementById('child-IBLogin').style.background='#f5821f';
			
			//document.getElementById('child-IBLogin').style = 'display:block;float:right;width:361.55px;height:auto;background:#f5821f;';
			document.getElementById('left-div').style.float = 'left';
		} else if (link == 'AppOnline') {
			//document.getElementById('child-IBLogin').style='display:none;';
			//document.getElementById('child-AppOnline').style = 'display:block;float:right;width:361.55px;height:280px;background:#053C6A;';
			document.getElementById('child-AppOnline').style.display='block';
			document.getElementById('child-AppOnline').style.float='right';
			document.getElementById('child-AppOnline').style.width='361.55px';
			document.getElementById('child-AppOnline').style.height='280px';
			document.getElementById('child-AppOnline').style.background='#053C6A';
			document.getElementById('left-div').style.float = 'left';

		} else if (link == 'Cust_Care') {
			//	document.getElementById('child-IBLogin').style='display:none;';
			//document.getElementById('child-Cust_Care').style = 'display:block;float:right;width:361.55px;height:280px;background:#053C6A;';
			document.getElementById('child-Cust_Care').style.display='block';
			document.getElementById('child-Cust_Care').style.float='right';
			document.getElementById('child-Cust_Care').style.width='361.55px';
			document.getElementById('child-Cust_Care').style.height='280px';
			document.getElementById('child-Cust_Care').style.background='#053C6A';
			document.getElementById('left-div').style.float = 'left';

		}
		var divArr = new Array('IBLogin', 'AppOnline', 'Cust_Care');
		for (var i = 0; i < divArr.length; i++) {
			if (link != divArr[i] && link!='' 
					&& document.getElementById('child-' + link).style.display == 'block')
				document.getElementById('child-' + divArr[i]).style.display='none';
		}
		if (link == '')
			document.getElementById('left-div').style.float = 'right ';
	}
	function showMenuDiv(link) {

		if(document.getElementById('slider').style.display!='block'){
		
			document.getElementById('slider').style.display='block';
			document.getElementById(link).style.display='none';
		}
		if (document.getElementById("slide-in").style.display == "block") {
			document.getElementById("slide-in").style.display = "none";
			document.getElementById("rightDiv").innerHTML = '<a class="leftpanel-btn" title="Show "><i class="icon-angle-right"></i>< Show</a>';
		//	showChildDiv('IBLogin');
		} 
		hideMenuDiv(link);
		
		if (document.getElementById('slider').style.display == 'block') {
			document.getElementById('slider').style.display = 'none';
			document.getElementById(link).style.display = 'block';
		} else {
			/*document.getElementById('slider').style='display:block;';
			document.getElementById(link).style.display='none';*/
	}
//document.getElementById('productDiv').style.display = 'block';
		
		//onmouseout=";
	}
	function hideMenuDiv(link) {

		//document.getElementById('productDiv').style.display = 'block';
		document.getElementById('slider').style.display = 'block';
		document.getElementById('productDiv').style.display = 'none';
		document.getElementById('AppOnlineDiv').style.display = 'none';
		document.getElementById('PaymentDiv').style.display = 'none';
		document.getElementById('Way2BankDiv').style.display = 'none';
	//	document.getElementById('AtmDiv').style.display = 'none';

	}
	function scrollToElement(ele) {
		<% if(request.getParameter("src")!=null){%>
			$(window).scrollTop(ele.offset().top).scrollLeft(ele.offset().left);
		<%}%>
	}
</script>
</head>
<body onload="scrollToElement($('#toptitle'))">
	<div class="clearfix">
		<div id="main-container">
			<div id="sub-container">
				<div class="top-bar">
					<img
						src="<%=request.getContextPath()%>/new_ui/IB_UI/images/animation_new.jpg"
						alt="bank_Logo" style="float: left;" /> The H.P. STATE
					CO-OPERATIVE BANK LTD.
				</div>
				<!-- <div id="content"></div>  -->
			</div>
			<!--class="clearfix" id="main" role="main"-->
			<div class="leftpanel">
				<div class="middleContainer secondNav clearfix">
					<ul class="menu clearfix">
						<li onmouseover="showMenuDiv('productDiv')"
							onmouseout="hideMenuDiv()"><a class="upperMenu"
							title="Products" onmouseover="showMenuDiv('productDiv')"> <span
								onmouseover="showMenuDiv('productDiv')">Products</span>
						</a> <span class="arrow-up" style="display: none;"></span>
							<div id="productDiv" class="nav-child"
								style="height: 480px; color: black; display: none;margin-top:18px;">
								<div class="blue-banner" style="float: right;">
									<p class="menu_p">
										<a onclick="" href=""><img class="lazy"	style="display: inline; margin-top: -18px;"				src="<%=request.getContextPath()%>/new_ui/my-money-finance-flyout.jpg" alt="My Money Finances">
										</a>
									</p>
								</div>
								<a class="close-modal " href="javascript:void(0);"
									style="float: right;"> <img src="<%=request.getContextPath()%>/new_ui/btn-close.png"
									onclick="hideMenuDiv('')" alt="Close Video">
								</a>
								<div class="sub-container" style="height: 480px;">
									<ul>
										<li class="clearfix">
											<div class="icon-holder">
												<a href="<%=request.getContextPath()%>/new_ui/product/account/account-nd-deposits.jsp">
													<img
													title="Accounts And Deposits" alt="Accounts And Deposits"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/investment.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href="<%=request.getContextPath()%>/new_ui/products/account-nd-deposits.jsp"
														target="" style="text-decoration:none;font-weight:normal;color:black;"> Accounts &amp; Deposits</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="<%=request.getContextPath()%>/new_ui/products/account/index.jsp?src=toptitle">Savings
															Account</a>, 
														<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">FD</a>,
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">RD</a>
														<br>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">iWish
															flexible RD</a>, 
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">Demat</a>
														<br/>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															href="">
															All...</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a												href="">
													<img
													title="Loans" alt="Loans"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/payments-icon.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;"> Loans</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Home Loan</a>, <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Personal Loan</a>,<br>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Car Loan</a>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Gold Loan</a>
													<br/>
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">All...</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Cards" alt="Cards"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/cards.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Cards</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Credit Card</a>, <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">PL on CC</a>,
															<br>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Debit Card</a>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Travel Card
															</a>
													<br/>
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">All...</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Insurance" alt="Insurance"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/insurance.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;text-align:left;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Insurance</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Life Insurance</a>,<br/> <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Car</a>,
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Health Insurance</a>
													<br/>
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">All...</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><br/>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title=" Pocket Wallets" alt=" Pocket Wallets"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wallet.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;"> Pocket Wallets</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">
															Create Wallet instantly on Android and Apple Phones</a><br/><br/>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><br/>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Agri & Rural" alt="Agri & Rural"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/agriculture.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;"> Agri & Rural</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Agri Corporates</a>,<br/> <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Micro Banking, Micro Finance</a>,
														
													<br/>
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">All...</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Investments" alt="Investments"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wealth.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Investments</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Tax Solutions</a>,<br/>
															<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">PPF</a>,
														<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Student Solutions</a>
															<br/>
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">All...</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Savings Rewards" alt="Savings Rewards"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/MSR.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;"> My Saving Rewards</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Calculate Your Rewards</a>,<br/> 
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">All...</a><br/> <br/> 
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="My Money" alt="My Money"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wallet.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">My Money</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Track Daily Expenses</a>, <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">How to<br/>Subscribe</a>,
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">Subscribe Now</a><br/>
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">All...</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
									</ul>
								</div>
							</div>
						
								
			</li>
			<!--  onmouseover="showMenuDiv('productDiv')" onmouseout="hideMenuDiv()"  -->
			<li onmouseover="showMenuDiv('AppOnlineDiv')"
				onmouseout="hideMenuDiv('')"><a class="upperMenu"
				title="Apply Online" onmouseover="showMenuDiv('AppOnlineDiv')">
					<span onmouseover="showMenuDiv('AppOnlineDiv')">Apply Online</span>
			</a>
				<div id="AppOnlineDiv" class="nav-child"
					style="margin-left: -415px; height: 480px; color: black; display: none;margin-top:18px;">
					<div class="blue-banner" style="float: right;">
									<p class="menu_p">
										<a onclick="" href=""><img class="lazy"
											style="display: inline; margin-top: -18px;"
											src="<%=request.getContextPath()%>/new_ui/my-money-finance-flyout.jpg" alt="My Money Finances"
											data-original="/managed-assets/images/flyout/personal/<%=request.getContextPath()%>/new_ui/my-money-finance-flyout.jpg"></a>
									</p>
								</div>
								<a class="close-modal " href="javascript:void(0);"
									style="float: right;"> <img src="<%=request.getContextPath()%>/new_ui/btn-close.png"
									onclick="hideMenuDiv('')" alt="Close Video">
								</a>
								<div class="sub-container" style="height: 480px;">
									<ul>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
									>
													<img
													title="Online Accounts" alt="Online Accounts"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/investment.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														target="" style="text-decoration:none;font-weight:normal;color:black;"> Accounts</a>
												</h2>
												<div align="left" style="color:#f5821f">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">Savings
															Account</a>, 
														<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">Pockets</a>
														<br>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">Wallets
															</a>+
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">savings account</a>, 
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">3-in-1</a>
														<br/>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															href="">
															account</a>,
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															href="">
															b2 saving account</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a												href="">
													<img
													title="Online Loans" alt="Online Loans"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/payments-icon.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;"> Loans</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Home Loan</a>, <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Personal Loan</a>,<br>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Car Loan</a>
														<br/><br/>
														
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Online Cards" alt="Online Cards"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/cards.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Cards</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Credit Card</a>, <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Upgrade Debit</a>,
															<br>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Debit Card</a>,
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Expressions Debit Card
															</a>
													<br/>
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">3D Secure - Credit/Debit Card</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Online Deposit" alt="Online Deposit"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/insurance.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;text-align:left;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Deposits</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Fixed Deposits</a>, <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Recurring</a>
															<br/>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href=""> Deposit</a>,
													
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">iWish flexible RD</a>
													</p>
													<br/>
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><br/>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Online Insurance" alt="Online Insurance"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wallet.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;"> Insurance</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Life Insurance</a>, <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Car</a>,
														<br><a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Health Insurance</a>
													<br/><br/>
															
													</p>
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><br/>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Online Investments" alt="Online Investments"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wealth.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Investments</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Mutual Funds</a>, <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">GOI Bonds</a>,
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">HPSCB</a>
															<br/> <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Pure Gold</a>
														
													<br/>
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">HPSCB Bank Pure Silver</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Forex" alt="Forex"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wealth.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Forex</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Buy Travel Card</a>/
															<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Currency</a>
															<br>
														<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Reload Online</a>
															<br/>
															<br/>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="PMY" alt="Savings Rewards"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/MSR.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Pradhan Mantri Yojana</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">PM Awas Yojana</a>,<br/> 
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">PM Jeevan Beema Yojna</a><br/> <br/> 
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Online Statements" alt="Online Statements"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wallet.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;"> Statements</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Savings Account</a>,<br> <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Credit Card</a>,
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">Home Loan</a><br/><br/>
															
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
									</ul>
								</div>
				</div>
				</li>
			<li onmouseover="showMenuDiv('PaymentDiv')"
				onmouseout="hideMenuDiv('')"><a class="upperMenu"
				title="Payments"> <span>Payments</span>
			</a>
				<div id="PaymentDiv" class="nav-child"
					style="margin-left: -600px; height: 480px; color: black; display: none;margin-top:18px;">
					<div class="blue-banner" style="float: right;">
									<p class="menu_p">
										<a onclick="" href=""><img class="lazy"
											style="display: inline; margin-top: -18px;"
											src="<%=request.getContextPath()%>/new_ui/my-money-finance-flyout.jpg" alt="My Money Finances"
											data-original="/managed-assets/images/flyout/personal/<%=request.getContextPath()%>/new_ui/my-money-finance-flyout.jpg"></a>
									</p>
								</div>
								<a class="close-modal " href="javascript:void(0);"
									style="float: right;"> <img src="<%=request.getContextPath()%>/new_ui/btn-close.png"
									onclick="hideMenuDiv('')" alt="Close Video">
								</a>
								<div class="sub-container" style="height: 480px;">
									<ul>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
									>
													<img
													title="Transfer Funds" alt="Transfer Funds"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/investment.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														target="" style="text-decoration:none;font-weight:normal;color:black;"> Transfer Funds</a>
												</h2>
												<div align="left" style="color:#f5821f">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">NEFT</a>, 
														<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">RTGS</a>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">IMPS
															</a>,
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">Fund Transfer 	<br>
														Abroad</a>, 
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">Cardless Cash</a>,
														<br/>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															href="">
															All...</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a												href="">
													<img
													title="Pay at Stores" alt="Pay at Stores"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/payments-icon.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Pay at Stores</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Touch &amp; Pay using NFC</a>,<BR/> <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Pay using mVISA QR code</a><br>
														
														<br/>
														
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Online Tax Payment" alt="Online Tax Payment"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/cards.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Online Tax Payment</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">View Your Tax</a>, <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Pay Your Tax</a>,
															<br>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">File Your Tax Returns</a>
														
													<br/><br/>
															
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Bill Pay" alt="Online Deposit"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/insurance.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;text-align:left;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Bill Pay</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Payments to registered billers</a><br/>
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Quick Pay - Pay bills instantly</a>
													</p>
													<br/>
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><br/>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="EazyPay" alt="EazyPay"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wallet.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;"> EazyPay</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Pay bills and invoices from any bank account or any card</a>
													<br/><br/>
															
													</p>
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><br/>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Click to Pay" alt="Click to Pay"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wealth.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Click to Pay</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">HPSCB Bank Credit Card</a>,<br> <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">HPSCB Bank Loan </a>,<br>
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Call to Pay</a>
															<br/> 
												
														
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Online Recharge" alt="Online Recharge"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wealth.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Online Recharge</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Prepaid Mobile</a><br/>
															<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">DTH</a>
															<br>
														<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Data Card Recharge</a>
														
															
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Traveling Shopping" alt="Traveling Shopping"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/MSR.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Traveling and Shopping</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">IRCTC Rail Ticket Booking</a>,<br/> 
															<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">Buy Flight and Bus tickets</a><br/>	<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;" class="top_more"
															onclick=""
															href="">Pay for Music</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Gifts" alt="Gifts"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wallet.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Gift Vouchers</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Amazon</a>,<br> <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">etc</a>.
															<br/><br/>
															
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
									</ul>
								</div>
				</div></li>
			<li onmouseover="showMenuDiv('Way2BankDiv')"
				onmouseout="hideMenuDiv('')"><a class="upperMenu"
				title="Ways To Bank"> <span>Ways To Bank</span>
			</a>
				<div id="Way2BankDiv" class="nav-child"
					style="margin-left: -785px; height: 480px; color: black; display: none;margin-top:18px;">
					<div class="blue-banner" style="float: right;">
									<p class="menu_p">
										<a onclick="" href=""><img class="lazy"
											style="display: inline; margin-top: -18px;"
											src="<%=request.getContextPath()%>/new_ui/my-money-finance-flyout.jpg" alt="My Money Finances"
											data-original="/managed-assets/images/flyout/personal/<%=request.getContextPath()%>/new_ui/my-money-finance-flyout.jpg"></a>
									</p>
								</div>
								<a class="close-modal " href="javascript:void(0);"
									style="float: right;"> <img src="<%=request.getContextPath()%>/new_ui/btn-close.png"
									onclick="hideMenuDiv('')" alt="Close Video">
								</a>
								<div class="sub-container" style="height: 480px;">
									<ul>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href="">
													<img
													title="Interact" alt="Interact"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/blog.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Interact</a>
												</h2>
												<div align="left" style="color:#f5821f">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">Blog</a>, 
														<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">HPSCB Bank Answers</a>
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															href="">Banking made easy, Play and learn.
															</a><br><br>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a												href="">
													<img
													title="Calculator" alt="Calculator"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/calculator.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Calculator</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Home Loan</a>,<BR/> <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Personal Loan</a>,<br>
															<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Car 
														</a>
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="IB" alt="IB"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/int-banking.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Internet Banking</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Know your User ID</a><br>
															<a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Generate your Password</a>
															<br>
														
													<br/>
															
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Insta Banking" alt="Insta Banking"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/24-HPSCB.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;text-align:left;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Insta Banking</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Initiate transactions anytime, <br>anywhere and get priority servicing at our branches.</a><br/>
														
													</p>
												
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><br/>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Find ATM" alt="Find ATM"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/atm-rupee.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;"> Find ATM/Branch</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Locate our branches and ATMs.<br>Connected: Update your contact details with us.</a>
													<br/>
															
													</p>
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><br/>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Mobile Banking" alt="Mobile Banking"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/wealth.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Mobile Banking</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Download iMobile</a><br> <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">
															Generate Mobile Money Identifier(MMID)</a>
															
															<br/> 
												
														
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
										<li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Touch Banking" alt="Touch Banking"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/24-HPSCB.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Touch Banking</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">At your service 365 days, with self-serviced automated devices.</a><br/><br/>
															
															
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="HPSCBbankpay" alt="HPSCBbankpay"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/twitter.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">HPSCBbankpay</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Now bank using your Twitter account.</a>
													</p><br>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li><li class="clearfix">
											<div class="icon-holder">
												<a
													href=""
													onclick="">
													<img
													title="Pockets by HPSCB Bank" alt="Pockets by HPSCB Bank"
													data-original="/managed-assets/images/flyout/personal/investment.png"
													src="<%=request.getContextPath()%>/new_ui/facebook.png" class="" style="display: inline;">
												</a>
											</div>
											 <div class="info-holder" style="float:right;">
												<h2 style="font-size:17px;"	>
													 <a
														href=""
														onclick=""
														target="" style="text-decoration:none;font-weight:normal;color:black;">Pockets by HPSCB Bank</a>
												</h2>
												<div align="left">
													<p class="menu_p">
														<a style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Pockets Digital Bank</a>,<br> <a  style="text-decoration:none;font-weight:normal;font-size:12px;color:#f5821f;"
															onclick=""
															href="">Pockets on Facebook</a>.
															<br/><br/>
															
													</p>
													
												</div>
												<div style="background:#9E9E9E;;height:1px;width: 122%;margin-left: -18px;"></div>
											</div>
											
										</li>
									</ul>
								</div>
				</div></li>
			<li><a
				class="upperMenu" title="Find ATM Branch" href=""> <span>Find ATM
						Branch</span>
			</a>
				</li>
			</ul>
		</div>
		<!-- -->

		<div class="LeftPanel" style="position: absolute; top: 130px;">
			<span id="rightDiv" class="span-hide" tabindex="1"
				onclick="showDiv()"> <a class="leftpanel-btn" title="Show ">
					<i class="icon-angle-right"></i>< Show
			</a>
			</span>
		</div>
		<div id="slide-in" class="slide-in"
			style="display: none; width: 500px; height: 300px;">
			<div id="left-div" style="float: right;">
				<ul class="slide-ul">
					<li onmouseover="showChildDiv('IBLogin')">
						<!--onmouseout=""> --> <!-- <a class="rightDivClass" href="<%=request.getContextPath()%>/new_ui/onlineBanking.jsp"  title="IB Login"> -->
						<a class="rightDivClass"
						href="<%=request.getContextPath()%>/new_ui/onlineBanking.jsp"
						title="IB Login"> <span>IB Login</span>
					</a>
					</li>
					<br>
					<li onmouseover="showChildDiv('AppOnline')"><a
						class="rightDivClass" title="Apply Online"> <span>Apply
								Online</span>
					</a></li>
					<br>
					<li onmouseover="showChildDiv('Cust_Care')"><a
						class="rightDivClass" title="Get In Touch"> <span>Get
								In Touch</span>
					</a></li>
				</ul>
			</div>
			<div id="child-IBLogin" class="slide-in1"
				style="display: none; float: right; width: 361.55px; height: auto; background: #f5821f">
				<h5 class="log-in">&nbsp;</h5>
				<center>
					<span class="divider">&nbsp;</span>
				</center>
				<ul>
					<li
						style="background: #f5821f; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" href=""
						style="font-size: 18px; color: white; background: none;">Personal,
							NRI and Young Stars</a><span> </span>
					</li>
					<li
						style="background: #f5821f; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" href=""
						style="font-size: 18px; color: white; background: none;">Corporate</a><span>
					</span>
					</li>
					<li
						style="background: #f5821f; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" href="" target="_blank"
						style="font-size: 18px; color: white; background: none;">Money2India</a><span>
					</span>
					</li>
					<li
						style="background: #f5821f; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" target="_blank"
						style="font-size: 18px; color: white; background: none;">Money2World</a><span>
					</span>
					</li>
					<li
						style="background: #f5821f; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" href="" target="_blank"
						style="font-size: 18px; color: white; background: none;">b2
							Digital Banking</a><span> </span>
					</li>
				</ul>
				<center>
					<span class="divider">&nbsp;</span>
				</center>
				<h5
					style="font-size: 21px; color: white; background: none; height: 20px; line-height: 10px;">Forgot
					Password? Get User ID?</h5>
				<ul>
					<li
						style="background: #f5821f; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" href=""
						style="font-size: 18px; color: white; background: none;">Personal,
							NRI and Young Stars</a><span> </span>
					</li>
					<li
						style="background: #f5821f; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" href=""
						style="font-size: 18px; color: white; background: none;">Corporate</a><span>
					</span>
					</li>
					<li
						style="background: #f5821f; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" href="" target="_blank"
						style="font-size: 18px; color: white; background: none;">Money2India</a><span>
					</span>
					</li>
					<li
						style="background: #f5821f; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" target="_blank"
						style="font-size: 18px; color: white; background: none;">Money2World</a><span>
					</span>
					</li>
					<li
						style="background: #f5821f; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" href="" target="_blank"
						style="font-size: 18px; color: white; background: none;">b2
							Digital Banking</a><span> </span>
					</li>
				</ul>
			</div>
			<div id="child-AppOnline" class="slide-in1"
				style="display: none; float: right; width: 361.55px; height: auto; background: blue">
				<h5 class="log-in">Apply Online</h5>
				<center>
					<span class="divider">&nbsp;</span>
				</center>
				<ul>
					<li
						style="background: #053C6A; height: 20px; line-height: 20px; text-align: left;">
						<a href="<%=request.getContextPath()%>/new_ui/onlineBanking.jsp"
						style="text-decoration: none; font-size: 18px; color: white; background: none;">Home
							Loans</a><span> </span>
					</li>
					<li
						style="background: #053C6A; height: 20px; line-height: 20px; text-align: left;">
						<a onclick=""
						style="text-decoration: none; font-size: 18px; color: white; background: none;">Personal
							Loans</a><span> </span>
					</li>
					<li
						style="text-decoration: none; background: #053C6A; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" target="_blank"
						style="font-size: 18px; color: white; background: none;">Credit
							Card</a><span> </span>
					</li>
					<li
						style="text-decoration: none; background: #053C6A; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" target="_blank"
						style="font-size: 18px; color: white; background: none;">Saving
							Account</a><span> </span>
					</li>
				</ul>
				<center>
					<span class="divider">&nbsp;</span>
				</center>
			</div>
			<div id="child-Cust_Care" class="slide-in1"
				style="display: none; float: right; width: 361.55px; height: auto; background: blue">
				<!-- <h5 class="log-in">Customer Care</h5> 
								<center> <span class="divider">&nbsp;</span> </center>
								<h5 class="log-in">Find ATM Branch</h5> 
								<center> <span class="divider">&nbsp;</span> </center>
								<h5 class="log-in">Complaints And Compliments</h5> 
								<center> <span class="divider">&nbsp;</span> </center> -->
				<ul>
					<li
						style="background: #053C6A; height: 20px; line-height: 20px; text-align: left;">
						<a href="<%=request.getContextPath()%>/new_ui/onlineBanking.jsp"
						style="text-decoration: none; font-size: 25px; color: white; background: none;">Customer
							Care</a><span> </span>
					</li>
					<center>
						<span class="divider">&nbsp;</span>
					</center>
					<li
						style="background: #053C6A; height: 20px; line-height: 20px; text-align: left;">
						<a onclick=""
						style="text-decoration: none; font-size: 25px; color: white; background: none;">Find
							ATM Branch</a><span> </span>
					</li>
					<center>
						<span class="divider">&nbsp;</span>
					</center>
					<li
						style="text-decoration: none; background: #053C6A; height: 20px; line-height: 20px; text-align: left;">
						<a onclick="" target="_blank"
						style="font-size: 25px; color: white; background: none;">Complaints
							And Compliments</a><span> </span>
					</li>
					<center>
						<span class="divider">&nbsp;</span>
					</center>

				</ul>
			</div>
		</div>
		<div id="sliderFrame" style="z-index: -9999; height: 480px;">
			<div id="slider"
				style="z-index: -9999; display: block; height: 480px;"
				onclick="window.location.href='/';">
				<a title="Provogue Watch Offer" href="https://infinity.HPSCBbank.com/corp/AuthenticationController?FORMSGROUP_ID__=AuthenticationFG&amp;__START_TRAN_FLAG__=Y&amp;FG_BUTTONS__=LOAD&amp;ACTION.LOAD=Y&amp;AuthenticationFG.LOGIN_FLAG=1&amp;BANK_ID=ICI" onclick="dataLayer.push({'event':'GAevent', 'gaEventCategory':'internet-banking-provogue-fashion', 'gaEventAction':'desktop-banner-click', 'gaEventLabel':'ib-index-banner'}) "><img alt="Provogue Watch Offer" data-original="/managed-assets/images/personal/internet-banking/desktop-banner/provogue-offer-for-ib-d.jpg" src="<%=request.getContextPath()%>/new_ui/IB_UI/images/slider/deposits1.jpg" class="desktop lazy"></a>
				<a title="Provogue Watch Offer" href="https://infinity.HPSCBbank.com/corp/AuthenticationController?FORMSGROUP_ID__=AuthenticationFG&amp;__START_TRAN_FLAG__=Y&amp;FG_BUTTONS__=LOAD&amp;ACTION.LOAD=Y&amp;AuthenticationFG.LOGIN_FLAG=1&amp;BANK_ID=ICI" onclick="dataLayer.push({'event':'GAevent', 'gaEventCategory':'internet-banking-provogue-fashion', 'gaEventAction':'desktop-banner-click', 'gaEventLabel':'ib-index-banner'}) "><img
					src="<%=request.getContextPath()%>/new_ui/IB_UI/images/slider/deposits2.jpg"
					style="z-index: -9999;"></a>
				<!-- <img
					src="<%=request.getContextPath()%>/new_ui/IB_UI/images/slider/slider_image-1.jpg"
					style="z-index: -9999;" /> <img
					src="<%=request.getContextPath()%>/new_ui/IB_UI/images/slider/slider_image-2.jpg"
					style="z-index: -9999;" /> -->
			</div>



		</div>
		<div class="middleContainer clearfix bggrey" style="margin-top:20px;">
					<div class="leftColumnContainer" data-content="See More">
						<ul data-content="See More" style="list-style: none;">
							<li><a href="<%=request.getContextPath()%>/new_ui/products/account-nd-deposits.jsp">Accounts<span>›</span></a></li>
							<li><a	class="selected" href="<%=request.getContextPath()%>/new_ui/products/deposits.jsp">Deposits<span>›</span></a></li>
						<!--<li><a
									href="http://www.HPSCBbank.com/Personal-Banking/insta-banking/internet-banking/online-banking-features.page?#toptitle">Online
										Banking Features<span>></span>
								</a></li>
								<li><a
									href="http://www.HPSCBbank.com/Personal-Banking/insta-banking/internet-banking/bank-mobile-site/mobile-web.page?#toptitle">Internet
										Banking on mobile<span>></span>
								</a></li>
								<li><a
									href="http://www.HPSCBbank.com/Personal-Banking/offers/offer-detail.page?id=offer-provogue-watch-offer-20140109165517607">Internet
										Banking Offers<span>></span>
								</a></li>
								<li><a
									href="http://www.HPSCBbank.com/online-demo/introduction.page?#toptitle">View
										Demo<span>></span>
								</a></li>
								<li><a
									href="http://www.HPSCBbank.com/Personal-Banking/faq/detail.page?identifier=faqs-internet-banking-20140103125335880">FAQs<span>></span></a>
								</li>
								<li><a
									href="http://www.HPSCBbank.com/Personal-Banking/faq/detail.page?identifier=faqs-help-20150601161556523">Help<span>></span></a>
								</li>
								<li><a
									href="http://www.HPSCBbank.com/Personal-Banking/insta-banking/internet-banking/twitter-banking/index.page?#toptitle">HPSCBbankpay<span>></span></a>
								</li>
								<li><a href="http://www.HPSCBbank.com/save-as-favourite.page?">Save
										as Favourite<span>></span>
								</a></li> -->
						</ul>
					</div>
					<div class="rightColumnContainer">
					<h1 id="toptitle">Deposits</h1>
		<div class="product-overview-content">
			<div class="product-overview-article">
				<p>HPSCB Bank has designed a gamut of accounts and deposits to
					cater to your unique banking needs.</p>
				<hr>
				<h3>
					<a
						href="">Fixed Deposit</a>
				</h3>
				<div>
					<p>Put your idle money in a fixed deposit and earn attractive
						returns.</p>
				</div>
				<hr>
				<h3>
					<a
						href="">Fixed
						Deposit (without premature withdrawal facility)</a>
				</h3>
				<div>
					<p></p>
					<p>Additional interest rates on select tenure and amount</p>
					<p></p>
				</div>
				<hr>
				<h3>
					<a
						href="">Recurring
						Deposit </a>
				</h3>
				<div>
					<p>Save bit-by-bit and watch your money grow.</p>
					<p>&nbsp;</p>
					<p></p>
				</div>
				<hr>
				<h3>
					<a
						href="">iWish
						flexible RD</a>
				</h3>
				<div class="product-overview-card">
					<p>Your goals are waiting! Save when you feel like while
						earning good interest rates.</p>
					<a
						href=""
						onclick=""
						class="apply-now-btn">Apply Now</a>
				</div>
				<hr>
				<h3>
					<a
						href="">Thomas
						Cook Holiday Recurring Deposit</a>
				</h3>
				<div>
					<p></p>
					<p>Now you can plan for your holiday in an easy and systematic
						way with our Holiday Recurring Deposit (RD) and reach your dream
						destinations. With this RD, you can start saving for next year’s
						holiday this year itself and book it at this year’s rates.</p>
					<p></p>
				</div>
				<hr>
				<h3>
					<a
						href="">Tax
						Saving FD (Fixed Deposit)</a>
				</h3>
				<div>
					<p>An ideal solution for your investment needs</p>
				</div>
				<hr>
				<h3>
					<a
						href="">Money
						Multiplier Fixed Deposit</a>
				</h3>
				<div>
					<p></p>
					<p>Earn interest of Fixed Deposit and enjoy liquidity of
						Savings Account.</p>
					<p></p>
				</div>
				<hr>
				<h3>
					<a
						href="">Security
						Deposits</a>
				</h3>
				<div>
					<p>A few Corporates stipulate to their new employees to provide
						Security Deposit to reduce attrition.</p>
				</div>
				<hr>
				<h3>
				
				</h3>
				<div>
					
				</div>
			</div>
		</div>
		<div class="page-aside">
			<a class="page-aside-header"
				href="" style="color:#053c6d;">iWish
				- Flexible RD<i class="icon-angle-right"></i>
			</a>
			<div class="page-aside-article">
				<a
					href=""><img
					data-original="/managed-assets/images/cross-sell/iwish-offer-cs.jpg"
					src="<%=request.getContextPath()%>/new_ui/IB_UI/images/iwish-offer-cs.jpg"
					class="" style="display: inline;"></a>
				<p></p>
				<p>
					Now save when you want and still earn same interest rate as an FD
					or RD. <a style="color: #f5821f"
						href="">Open
						iWish Deposit Now</a>.
				</p>
				<p></p>
			</div>
		</div>
	</div>
	</div>
	<footer>
		<div class="middleContainer"></div>
	</footer>
</body>
</html>