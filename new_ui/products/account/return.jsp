<html>
	<head>
		<title>Internet Banking | HPSCB Bank</title>
		<script
			src="<%=request.getContextPath()%>/new_ui/IB_UI/js/js-image-slider.js"
			type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/new_ui/IB_UI/js/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/scripts/common.js"></script>

		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/new_ui/IB_UI/css/style-1.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/new_ui/IB_UI/css/app.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/new_ui/IB_UI/css/ApplyNow.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/new_ui/IB_UI/common.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/new_ui/products/account/newUser.css" />
		<link
			href="<%=request.getContextPath()%>/new_ui/IB_UI/css/js-image-slider.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body style="text-align:center" >
		<div style="margin:30px auto;border:1px solid #c4d6e0;height:200px;width:80%;text-align:center;">
		Your Application ID is: <b><%=request.getParameter("appId")%>.
		<input type="button" value="HOME" onclick="window.parent.location.href='/new_ui/products/account/index.jsp?src=toptitle'"/>
		</div>
	</body>
</html>