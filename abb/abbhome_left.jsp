<html>
<head>

<script>

function getFocus(){

	//alert("_________");
	
}
</script>
</head>
<body style="background-color:white;" onload="getFocus()">

<table>
	
	<tr>
		<td><font color="maroon" size="3px">
			Transaction
		</font>
		</td>
	</tr>

	<tr>
		<td class=nav><font size="3px">
			 &nbsp &nbsp &nbsp<a href="/abb/abbCashTransfer.do?src=ByCash">Cash Transaction</a>
		</font>
		</td>
	</tr>
	
	<tr>
		<td class=nav>
		<font size="3px">
			 &nbsp &nbsp &nbsp<a href="/abb/abbCashTransfer.do?src=ByTransfer">Transfer Transaction</a>
		</font>
		</td>
	</tr>

<!--	<tr>
		<td class=nav>
		<font size="3px">
			 &nbsp &nbsp &nbsp<a href="/abb/enquiry.do?action=abbSuspectTrans">Reversal Transaction</a>
		</font>
		</td>
	</tr>-->
	<tr>
		<td><font color="maroon" size="3px">
			 Enquiry</font>
		</td>
	</tr>
	<tr>
		<td class=nav ><font size="3px">
			 &nbsp &nbsp &nbsp<a href="/openaction.do?src=abbchq" >CheckBook Enquiry</a></font>
		</td>
	</tr>
	<tr>
		<td class=nav ><font size="3px">
			  &nbsp &nbsp &nbsp<a href="/openaction.do?src=abbchqSingle" >SingleLeaf Enquiry </a></font>
		</td>
	</tr>
	<td class=nav ><font size="3px">
			  &nbsp &nbsp &nbsp<a href="/openaction.do?src=abbbranchinfo" >A/c Enquiry (Bal & Stmt)</a></font>
		</td>
	</tr>
	<tr>
		<td><font color="maroon" size="3px">
			 Reports</font>
		</td>
	</tr>

	<tr>
		<td class=nav><font size="3px">
			&nbsp &nbsp &nbsp<a href="/openaction.do?src=abbfailrept">Fail Trans Report</a>
			</font>
		</td>
	</tr>
	<tr>
		<td class=nav><font size="3px">
			&nbsp &nbsp &nbsp<a href="/openaction.do?src=abbsucessrept"">Success Trans Report</a>
			</font>
		</td>
	</tr>
	
	</table>
</body>
</html>