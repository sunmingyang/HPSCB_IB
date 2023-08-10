
<html>
<body >

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
<font color="red" size="4"><u>Internet Banking User Creation </u></font></td>
</tr>



<tr>
<td align="center" size="2"><font color="red" ><B>
This window create Userid to use Internet Banking for any Account Holder of the Bank.
</B></font></td>
</tr>


<tr>
<td align="center" size="2"><font color="red" >
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
</font></td>
</tr>

<tr>
<td align="left" size="2"><font color="red" >
Followin are the steps to create Userid.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
1. Enter the Branch Code of the Account Holder.</font></td>
</tr>

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
<td align="center" size="2"><font color="red" >
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
</font></td>
</tr>


<tr>
<td align="left" ><font color="red">
4. The following window shows the IB(Internet Banking) Status.
Here it shows that particular Account Holder has no IB Account.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
5. To create IB account select the check box of IB Status.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
6. lick on create button to create the IB Account.
</font></td>
</tr>


<tr>
<td >
<img src="../images/help/abUsrCr1.gif" >
</td>
</tr>
<tr>
<td align="center" size="2"><font color="red" >
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
7. The follwoing window shows that User is created is Successfully and UserId is also generated. 
</font></td>
</tr>
<tr>

<td align="left" ><font color="red">
8. To see the password click on the printer button.
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
<font color="red" size="4">Add UserId to Internet Banking </font></tr>
</td>


<tr>
<td align="left" ><font color="red"><B>
This window add a User(which is already created) to the Internet Banking.  </B></font></td>
</tr>


<tr>
<td align="left" ><font color="red">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
1. Enter the User Code. </font></td>
</tr>


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
<font color="red" size="4">User Activation/Deactivation Window. </font></tr>
</td>

<tr>
<td align="center" ><font color="red"><b>
 This window Activate or Deactivate any IB User.
 </b></font></td>
</tr>


<tr>
<td align="left" ><font color="red">
1. Enter the Branch code of the user.</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2. Enter the User Code. </font></td>
</tr>


<tr>
<td align="left" ><font color="red">
3. Click on Detail Button.
</font></td>
</tr> 

<tr>
<td >
<img src="../images/help/abUsrAct.gif" >
</tr>
</td>

<tr>
<td align="left" ><font color="red">
4. To make user IB Active/Deactive,select IB Status and then click on Activate/Deactivate Button.
</font></tr>
</td>
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

<%if(src.equals("StatusNew")){
	System.out.println("src is  "+src);%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User Status Change Screen. </font></tr>
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
<img src="../images/help/abUsrSt.gif" >
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
<img src="../images/help/abUsrSt1.gif" >
</td>
</tr>


</table>
	<%}%>
	<%}%>




<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("StatusChg")){
	System.out.println("src is  "+src);%>
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
<font color="red" size="4">User Transcation Report Screen. </font></tr>
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
7. Click on Edit/Create Button.</font></tr>
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

<%if(src.equals("AccountEnquiry")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">ABB ENQUIRY VIEW Screen. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. First Select Branch  </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
2. Enter the Account Number</font></tr>
</td>
 

<tr>
<td align="left" ><font color="red">
3. Click At View Button</font></tr>
</td>

</tr>
<tr>
<td >
<img src="../images/help/abAccEnq.gif" >
</td>
</tr>
</table>
	<%}%>
	<%}%>
<!------------------------MR. Prawin Kumar for Success Report Help-------------------------------->

<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>
<%if(src.equals("successReport")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">ABB TRANSACTION SUCCESS REPORT. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. First Enter From Date  </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
2. Enter the To Date </font></tr>
</td>
 

<tr>
<td align="left" ><font color="red">
3. Click At Show Button</font></tr>
</td>

</tr>
<tr>
<td >
<img src="../images/help/SuccessReport.gif" >
</td>
</tr>
</table>
	<%}%>
	<%}%>

<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>
<%if(src.equals("failureReport")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">ABB TRANSACTION FAILURE REPORT. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. First Enter From Date  </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
2. Enter the To Date </font></tr>
</td>
 

<tr>
<td align="left" ><font color="red">
3. Click At Show Button</font></tr>
</td>

</tr>
<tr>
<td >
<img src="../images/help/failureReport.gif" >
</td>
</tr>
</table>
	<%}%>
	<%}%>





<!------------------------------------------------------------------------------------------->

<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("cashTransaction")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">ABB Cash Voucher Screen. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. First Select Branch  </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
2. Enter the Account Number</font></tr>
</td>
 

<tr>
<td align="left" ><font color="red">
3. Select Debit or Credit</font></tr>
</td>

</tr>

<tr>
<td align="left" ><font color="red">
4. Fill Both Transaction Amount</font></tr>
</td>

</tr>

<tr>
<td align="left" ><font color="red">
5. Fill The Narration</font></tr>
</td>

</tr>

</tr>

<tr>
<td align="left" ><font color="red">
6. Click At validate Button </font></tr>
</td>

</tr>
</tr>

<tr>
<td align="left" ><font color="red">
7. Click At Ok Button</font></tr>
</td>

</tr>
<tr>
<td >
<img src="../images/help/casVou.gif" >
</td>
</tr>
</table>
	<%}%>
	<%}%>


<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("fundtransfer")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">ABB Fund Transfer Voucher Screen. </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. First Select Branch  </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
2. Enter the Account Number</font></tr>
</td>
 

<tr>
<td align="left" ><font color="red">
3. Select Debit or Credit</font></tr>
</td>

</tr>

<tr>
<td align="left" ><font color="red">
4. Fill Both Transaction Amount</font></tr>
</td>

</tr>

<tr>
<td align="left" ><font color="red">
5. Fill The Narration</font></tr>
</td>

</tr>

<tr>
<td align="left" ><font color="red">
6. Click At validate Button </font></tr>
</td>

</tr>
</tr>

<tr>
<td align="left" ><font color="red">
7. Click At Ok Button</font></tr>
</td>

</tr>
<tr>
<td >
<img src="../images/help/abbfundtran.gif" >
</td>
</tr>
</table>
	<%}%>
	<%}%>


<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("Ibaccsum")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User's Account Detail Window. </font></tr>
</td>

<tr>
<td align="center" ><font color="red">
This window show the deatiled information of the Account.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
If a user has muliple account then he/she can select his Account Number 
from the list.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
After selecting the Account Number click on the account Detail Button. </font></tr>
</td>
 

<tr>
<td align="left" ><font color="red">
 Account  Details will be shown.</font></tr>
</td>


<tr>
<td >
<img src="../images/help/ibaccsum.bmp.gif" >
</tr>
</td>
</table>
	<%}%>
	<%}%>



<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("Ibaccsum12")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User's Account12 Summary Window. </font></tr>
</td>

<tr>
<td align="center" ><font color="red">
This window just show the summary of the Account for the Logined User.
</font></tr>
</td>




<tr>
<td >
<img src="../images/help/ibaccsum.bmp.gif" >
</tr>
</td>
</table>
	<%}%>
	<%}%>


<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("minist")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User's Mini Statement . </font></tr>
</td>

<tr>
<td align="center" ><font color="red">
 The Logined User can see his last five transaction deatils through Mini Statement.
</font></td>
</tr>

<tr>
<td align="center" ><font color="red">
 The user select the Account Number, if he/she has multiple Account.
 </font></td>
</tr>

<tr>
<td align="center" ><font color="red">
 Then click on Mini statement Button.
 </font></td>
</tr>

<tr>
<td  align="center">
<img src="../images/help/ibmimi.bmp.gif" >
</tr>
</td>


<tr>
<td align="center" ><font color="red">
The window shows the Mini Statement Of the User</font></tr>
</td>

<tr>
<td >
<img src="../images/help/ibministate1.bmp.gif" >
</tr>
</td>
</table>
	<%}%>
	<%}%>



<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("detailst")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User's Account Detailed Statement . </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. If the User has multiple Account Number then select the account number form the list.    
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2. Then enter the dates from where user want his/her detailed statement. 
</font></td>

</tr>
<tr>
<td align="left" ><font color="red">
3.Then select number of detailed statement.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
4. Select the Ascending or Descending order.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
5. Then there is two option just select any one 
a) Display on screen
b) Display on Plain Text

</font></td>
</tr>



<tr>
<td >
<img src="../images/help/ibdetailstate.bmp.gif" >
</td>
</tr>
<tr>

<td align="left" ><font color="red">
6. If user has select the Display on screen, then his/her statement will be display. 
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/ibdetailstate3.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
7. If user has select the Display on plain, then user can save his/her statement in his on Computer. 
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
7. Click on Save Button, if wnat to save the statement.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/ibdetailstate2.bmp.gif" >
</td>
</tr>


<tr>
<td align="left" ><font color="red">
8. Then give the path and file name.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/ibdetailstate4.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
9. Now the file will download on the Computer.
</font></td>
</tr>


	<%}%>
	<%}%>


<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("Ibtrans")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Fund Transfer Window </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
This window only show when user has mulptiple account.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. Select the accounts from which user wants do transfer.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
2. Then enter the amount to transfer.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
3. If some description for the transfer.
</font></tr>
</td>
<tr>
<td align="left" ><font color="red">
4. Then enter the Transaction password.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
5. Then click on Pay button.
</font></tr>
</td>

<tr>
<td >
<img src="../images/help/ibfundtran.bmp.gif" >
</tr>
</td>
</table>
	<%}%>
	<%}%>



<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("Ibdebit")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Fund Transfer Window </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
This window only show when user has mulptiple account.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. Select the accounts from which user wants do transfer.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
2. Then enter the amount to transfer.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
3. If some description for the transfer.
</font></tr>
</td>
<tr>
<td align="left" ><font color="red">
4. Then enter the Transaction password.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
5. Then click on Pay button.
</font></tr>
</td>

<tr>
<td >
<img src="../images/help/ibdebitreq.bmp.gif" >
</tr>
</td>
<tr>
<td align="left" ><font color="red">
6. Then enter the User Transcation password.
</font></tr>
</td>

<tr>
<td >
<img src="../images/help/ibdebitreq1.bmp.gif" >
</tr>
</td>
</table>
	<%}%>
	<%}%>

<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("cheque")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Cheque Request Window </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
This window help the user for the request to issue the new cheque book
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. Select the Account Number.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
2.Enter the number of leaf for the new Cheque Book.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
3. Then click on Submit Button.
</font></tr>
</td>

<tr>
<td >
<img src="../images/help/ibnewchq.bmp.gif" >
</tr>
</td>
<tr>
<td align="left" ><font color="red">
6. Then enter the User Transcation password and click Ok.
</font></tr>
</td>

<tr>
<td >
<img src="../images/help/ibnewchq1.bmp.gif" >
</td>
</tr>
</table>
	<%}%>
	<%}%>

<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("stopcheque")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Cheque Stop Request Window </font></tr>
</td>

<tr>
<td align="left" ><font color="red">
This window help the user for the request to stop the Cheque book.
</font></tr>
</td>

<tr>
<td align="left" ><font color="red">
1. Select the Account Number.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2.Enter the Cheque book number.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
3. Enter some remark reason to stop. 
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
4. Click on Stop Cheque Button.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/ibstopchq.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
5. Then enter the User Transcation password and click Ok.
</font></tr>
</td>

<tr>
<td >
<img src="../images/help/ibnewchq1.bmp.gif" >
</td>
</tr>
</table>
	<%}%>
	<%}%>





<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("stopatm")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Intimate For the Loss of ATM Window </font></tr>
</td>


<tr>
<td align="left" ><font color="red">
1. Select the Account Number.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2.Enter the Card number.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
3. Enter Name for ATM card is issued.
</font></td>
</tr>


<tr>
<td align="left" ><font color="red">
4. Click on Submit button.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/ibatmreq.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
5. Then enter the User Transcation password and click Ok.
</font></tr>
</td>

<tr>
<td >
<img src="../images/help/ibnewchq1.bmp.gif" >
</td>
</tr>
</table>
	<%}%>
	<%}%>



<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("usechange")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User Password Chnage Window </font></tr>
</td>


<tr>
<td align="left" ><font color="red">
1. Enter the userId
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2.Enter the new Login Password
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
3.Enter the same new Login Password  for confermation.
</font></td>
</tr>


<tr>
<td align="left" ><font color="red">
4. Apply above procedure to change the transaction Password.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/usrpass.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
5. Then enter the User Transcation password and click Ok.
</font></tr>
</td>


</table>
	<%}%>
	<%}%>


<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("usrlock")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User Unlock Window</font></tr>
</td>


<tr>
<td align="center" ><font color="red"><b>
This window Unlock any user is Locked due to some improper or illegal operation done in IB.
</b></font></td>
</tr>

<tr>
<td align="left" ><font color="red">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
</font></td>
</tr>


<tr>
<td align="left" ><font color="red">
1.Enter the locked userId .
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2.Click on Detail button.
</font></td>
</tr>



<tr>
<td >
<img src="../images/help/ibunlockusr.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
3.The screen shows the status of the user.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
4.If Administrator wants to unlock the user them select unlock.
</font></td>
</tr>


<tr>
<td >
<img src="../images/help/ibunlockusr1.bmp.gif" >
</td>
</tr>
<tr>
<td align="left" ><font color="red">
5.Now user is Unlocked.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/ibunlockusr2.bmp.gif" >
</td>
</tr>


</table>
	<%}%>
	<%}%>


<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("admincreate")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Administrator Creation Window</font></tr>
</td>

<tr>
<td align="center" ><font color="red"><b>
This window creates a new Administrator's LoginId for Internet Banking.
</b></font></td>
</tr>

<tr>
<td align="center" ><font color="red">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
1.Enter the new Administrator name to create.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2.Enter the password.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
3.Click on Save button to create the new Administartor
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/ibadmincrt.bmp.gif" >
</td>
</tr>

</table>
	<%}%>
	<%}%>

<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("rejectprint")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Password Printing Window</font></tr>
</td>

<tr>
<td align="center" ><font color="red"><b>
This window is help full when user forget his/her password or wants to change the old password.
</b></font></td>
</tr>

<tr>
<td align="left" ><font color="red">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
</font></td>
</tr>
<tr>
<td align="left" ><font color="red">
1.Enter the userId.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2.Click on the Reject Printing. 
</font></td>
</tr>


<tr>
<td >
<img src="../images/help/ibrejectprnt.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
3.Then two button will appear, it will ask to print Now or Later.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
4.If want to print now, click on Print Now Button.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/ibrejectprnt1.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
5.Now following screen will appear, now click on the printer button.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/ibrejectprnt2.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
6.In the following window click on print button.</font></td>
</tr>

<tr>
<td >
<img src="../images/help/ibrejectprnt3.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
7.Now give the path where want to save the file.
</tr>

<tr>
<td align="left" ><font color="red">
8.New password will generated in the file.
</tr>

<tr>
<td >
<img src="../images/help/ibrejectprnt4.bmp.gif" >
</td>
</tr>

</table>
	<%}%>
	<%}%>


<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("statusreq")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">User Request Window</font></tr>
</td>

<tr>
<td align="center" ><font color="red"><b>
This is for Request of any Debit Card,ATM Card etc.
</b></font></td>
</tr>
<tr>
<td align="left" ><font color="red">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
1.Select the any Request from the list.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2.Enter the dates of request.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
3.Select a Request Status.
</font></td>
</tr>


<tr>
<td >
<img src="../images/help/ibusrreqstat.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
3.Then two button will appear, it will ask to print Now or Later.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
4.Click on Show Request button. 
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/ibusrreqstat1.bmp.gif" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
5.The following window will show the status of the request.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
6.Select the row and click on Detailed button to see the detailed of the request. 
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
7.Click on Save button to save the request. 

</font></td>
</tr>


<tr>
<td >
<img src="../images/help/ibusrreqstat2.bmp.gif" >
</td>
</tr>

</table>
	<%}%>
	<%}%>



<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("brnstatus")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Branch Status Window</font></tr>
</td>


<tr>
<td align="left" ><font color="red">
1.This window shows that at present how many branches are connected to the Server
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2.The red circle shows the disconnected branche and green circle shows the connected branche.
</font></td> 
</tr>




<tr>
<td >
<img src="../images/help/ibbranchstatus.bmp.gif" >
</td>
</tr>


</table>
	<%}%>
	<%}%>

<%if(request.getParameter("src")!=null){
	String src=request.getParameter("src");%>

<%if(src.equals("CreateUserByAdminPage")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Create User By Admin</font></tr>
</td>

<tr>
<td align="center" ><font color="red"><b>
This is for Request of any Debit Card,ATM Card etc.
</b></font></td>
</tr>
<tr>
<td align="left" ><font color="red">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
1.Select the any Request from the list.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2.Enter the Admin id of request.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
3.Enter From date and To date of request.
</font></td>
</tr>
<tr>
<td align="left" ><font color="red">
4.Click on Detail button.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/CreateUserByAdmin.bmp" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
5.Create User report dispaly on Screen.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
Purpose : This window provide the informaton of Admin  how much user create .
</font></td>
</tr>





</table>
	<%}%>
	<%}%>

<%if(request.getParameter("src")!=null){
 String src=request.getParameter("src");%>

<%if(src.equals("DayWiseUserReport")){%>
<table align="center">
<tr>
<td align="Center" >
<font color="red" size="4">Day Wise User Report</font></tr>
</td>

<tr>
<td align="center" ><font color="red"><b>
         This window provide the informaton of brnach how many
   User and Admin are created and what is Status of
   Perticuler day create .
</b></font></td>
</tr>
<tr>
<td align="left" ><font color="red">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
1.Enter the Branch Code.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
2.select the Date Which day U want to show the staus of Branch.
</font></td>
</tr>

<tr>
<td align="left" ><font color="red">
3.Select the request from the list.
</font></td>
</tr>
<tr>
<td align="left" ><font color="red">
4.Click on Detail button.
</font></td>
</tr>

<tr>
<td >
<img src="../images/help/DayWiseUserReport.bmp" >
</td>
</tr>

<tr>
<td align="left" ><font color="red">
5.Create Day Wise User report dispaly on Screen.
</font></td>
</tr>
</table>
 <%}%>
 <%}%>

</html>
</body >




