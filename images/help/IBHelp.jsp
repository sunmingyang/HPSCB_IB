
<html>
<body>

<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>


<%if(src.equals("CBEnquiry")){%>
<table align="center">
<tr>
<td align="left" >
<font color="red">Cheque Book Enquiry Window</font></tr>
</td>
<tr>
<td align="left" ><font color="red">
1. Select desired ABB connected branch.</font></tr>
</td>
<tr>
<td align="left" ><font color="red">
2. Enter the Account Number.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
3. Click on OK Button to see the Cheque Book Status.
</font></tr>
</td> 

<tr>
<td >
<img src="../images/help/abbCBEnq.gif" >
</tr>
</td>

<tr>
<td align="left" ><font color="red">
4. Window showing the Cheque Book Status of the Account.
</font></tr>
</td> 
<tr>
<td >
<img src="../images/help/abbCBEnq1.gif" >
</tr>
</td>
</table>
	<%}%>
	<%}%>


<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>
<% if(src.equals("CBSingle")){%>
<table align="center">
<tr>
<td align="left" >
<font color="red" >Cheque Book Enquiry Window</font></tr>
</td>
<tr>
<td align="left" ><font color="red">
1. Select desired ABB connected branch.</font></tr>
</td>
<tr>
<td align="left" ><font color="red">
2. Enter the Account Number.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
3. Enter the Cheque Book Leaf Number.
</font></tr>
</td> 

<tr>
<td align="left" ><font color="red">
4. Click on OK Button to see the Cheque Book Status.
</font></tr>
</td> 

<tr>
<td >
<img src="../images/help/abbCBSing.gif" >
</tr>
</td>

<tr>
<td align="left" ><font color="red">
4. Window showing the Cheque Book Status of the Account.
</font></tr>
</td> 
<tr>
<td >
<img src="../images/help/abbCBSing1.gif" >
</tr>
</td>


</table>

<%}%>
<%}%>


<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>


<%if(src.equals("UserCreate")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Internet Banking User Creation </font></tr>
</td>
<tr>
<td align="left" ><font color="red">
1. Enter the Branch Code</font></tr>
</td>
<tr>
<td align="left" ><font color="red">
2. Enter the Account Number.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
3. Click on Detail Button.
</font></tr>
</td> 

<tr>
<td >
<img src="../images/help/abUsrCr.gif" >
</tr>
</td>

<tr>
<td align="left" ><font color="red">
4. Now the IB status of the user is shown, if we want to create the user click on Create Button.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/abUsrCr1.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
5. User Id will generate to get the password click on Printer button.
</font></td>
</tr>

<td >
<img src="../images/help/abUsrCr2.gif" >
</td>
</tr>


</table>
	<%}%>
	<%}%>


	

<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>


<%if(src.equals("AddUser")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Add User to Internet Banking </font></tr>
</td>
<tr>
<td align="left" ><font color="red">
1. Enter the User Code. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
2. Enter the Branch code of the user.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
3. Enter the Account Number.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
4. Click on Detail Button.
</font></tr>
</td> 

<tr>
<td >
<img src="../images/help/abAddAccIb.gif" >
</tr>
</td>

<tr>
<td align="left" ><font color="red">
4. Now the IB status of the user is shown, if we want to create the user click on Create Button.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/abAddAccIb1.gif" >
</td>
</tr>


</table>
	<%}%>
	<%}%>




<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>


<%if(src.equals("UserActive")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User Activation. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. Enter the Branch code of the user.</font></tr>
</td>
<tr>
<td align="left" ><font color="red">
2. Enter the User Code. </font></tr>
</td>


<tr>
<td align="left" ><font color="red">
3. Click on Detail Button.
</font></tr>
</td> 

<tr>
<td >
<img src="../images/help/abUsrAct.gif" >
</tr>
</td>

<tr>
<td align="left" ><font color="red">
4. To make user IB Active/Deactive,select IB Status and then click on Activate/Deactivate Button.
</font></td>
</tr>
<tr>

<tr>
<td >
<img src="../images/help/abUsrAct1.gif" >
</td>
</tr>
</table>
	<%}%>
	<%}%>

<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("StatusChg")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User Status Change Screen. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. Enter the User Id OR Admin Id(both fields are optional). </font></tr>
</td>
<tr>
<td align="left" ><font color="red">
2. Enter the Dates .</font></tr>
</td>


<tr>
<td align="left" ><font color="red">
3. Select the user Status type from list box.
</font></tr>
</td> 

<tr>
<td align="left" ><font color="red">
3. Click on Detail Button.
</font></tr>
</td> 
<tr>
<td >
<img src="../images/help/abUsrStChg.gif" >
</tr>
</td>

<tr>
<td align="left" ><font color="red">
4. User Status Report now dispaly on the Screen.
</font></td>
</tr>
<tr>

<tr>
<td >
<img src="../images/help/abUsrStChg1.gif" >
</td>
</tr>


</table>
	<%}%>
	<%}%>


<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("TranRept")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User Transcation Report  Screen. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1.Select  any Category . </font></tr>
</td>
<tr>
<td align="left" ><font color="red">
2. Enter the Dates .</font></tr>
</td>
 

<tr>
<td align="left" ><font color="red">
3. Click on the Detail Button.
</font></tr>
</td> 
<tr>
<td >
<img src="../images/help/abUsrActlog.gif" >
</tr>
</td>

<tr>
<td align="left" ><font color="red">
4. User Transcation Report now dispaly on the Screen.
</font></td>
</tr>
<tr>

<tr>
<td >
<img src="../images/help/abUsrActlog1.gif" >
</td>
</tr>
</table>
	<%}%>
	<%}%>


<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("ActLogRept")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User Transcation Report  Screen. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1.Select  any Category . </font></tr>
</td>
<tr>
<td align="left" ><font color="red">
2. Enter the Dates .</font></tr>
</td>
 

<tr>
<td align="left" ><font color="red">
3. Click on the Detail Button.
</font></tr>
</td> 
<tr>
<td >
<img src="../images/help/abTrLog.gif" >
</tr>
</td>

<tr>
<td align="left" ><font color="red">
4. User Transcation Report now dispaly on the Screen.
</font></td>
</tr>
<tr>

<tr>
<td >
<img src="../images/help/abTrLog1.gif" >
</td>
</tr>


</table>
	<%}%>
	<%}%>



<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("AddBranch")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Branch Create/Edit Screen. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1.First Select Create new Branch OR Edit any Branch. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
2. Enter the Branch Code.</font></tr>
</td>
 

<tr>
<td align="left" ><font color="red">
3. Enter the Branch Name.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
4. Enter the Branch Address.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
5. Enter the Branch IP Address.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
6. Enter the Branch Port Number.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
6. Click on Edit/Create Button.</font></tr>
</td>
<tr>
<td >
<img src="../images/help/abAdBr.gif" >
</tr>
</td>


</table>
	<%}%>
	<%}%>

<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("AccEnquiry")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Branch Create/Edit Screen. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1.First Select Create new Branch OR Edit any Branch. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
2. Enter the Branch Code.</font></tr>
</td>
 

<tr>
<td align="left" ><font color="red">
3. Enter the Branch Name.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
4. Enter the Branch Address.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
5. Enter the Branch IP Address.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
6. Enter the Branch Port Number.</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
6. Click on Edit/Create Button.</font></tr>
</td>
<tr>
<td >
<img src="../images/help/abAdBr.gif" >
</tr>
</td>


</table>
	<%}%>
	<%}%>

</html>
</body >




