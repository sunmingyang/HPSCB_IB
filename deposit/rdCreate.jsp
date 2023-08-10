<%@ page import="java.util.Calendar " %>

<%@ page import="java.io.*"%>
<%@ page import ="java.util.Date" %>

<%@ page import= "java.awt.*"%>
<%@ page import= "java.awt.event.*"%>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.ArrayList, javax.servlet.ServletOutputStream "%>
<%@ page import="org.json.JSONArray" %> 
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.List" %>
<%@ page import="org.json.*" %>


<% 
String acclistStr = "" ; 
String[] acclist = null ; 
String custid="" ; 
acclistStr = (String)request.getSession().getAttribute("allAccountlist") ; 
if (acclistStr != null ) { 
  acclist = acclistStr.split(",") ;
}
System.out.println("Customer List of Account :" + acclistStr) ;


String[][] userInfo =(String[][]) request.getSession().getAttribute("userInfo") ;

custid = userInfo[0][8] ; 
String brncode = userInfo[0][1] ; 
String paccno = userInfo[0][0] ; 
System.out.println("Customer ID :" + custid) ;
%>
  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HPSCB INTERNET BANKING</title>
    <script language="JavaScript" src="/scripts/jquery-1.3.1.min.js"></script>
    <link rel="stylesheet" href="/deposit/fdrd.css" type="text/css">
    <script src="/scripts/common.js"></script>
    <!-- String[][] userInfo =(String[][]) request.getSession().getAttribute("userInfo") ;
custid = userInfo[0][8] ; 
String brncode = userInfo[0][1] ; 
String paccno = userInfo[0][0] ;  -->

    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"> -->
   <!-- <link rel="stylesheet" href="/BTScss/mystyle.css">-->
</head>
<body onload="fillData();selectDuration(); nomRelation();" onsubmit="reloadpage()">
<form action="/accsum/acc_sum.do" style="text-align: center;"> 
  <br> 
  <!-- <form action="" style="text-align: center;">   -->
    <div style="font-weight:bold; font-size:larger; margin-left: -536px;"> Scheme </div></lable>
  <select name="TYPE" id="schcode" style="border-top: none;border-left: none;border-right: none;width: 40%; font-size: large;"  onchange="changebox()" class="form-select" aria-label="Default select example">
    <option value="select"><b> ---- Select Scheme ----- </b></option>
</select><br> <br>


<!--this is for Amount -->
<lable for="Amount">
    <div style="font-weight:bold; font-size:larger; margin-left: -533px;">
    Amount </div></lable>
<input type="text" name="Amount" id="Amount" maxlength="10" placeholder="Minimum Amount: 10.00" style="border-top: none;border-left: none;border-right: none;width: 40%; font-size: large; line-height: 1"  onkeyup="isValidAmount(event,this)"> <br>
<br>



<!--Intrest payout frequency with button-->
<lable for="intrest">
    <div style="font-weight:bold; font-size: larger; margin-left: -384px;">
        Interest Payout Frequency</lable><input type="hidden" id="instPayable" ></div>
        <!-- <input type="button" class="button1" value="Yearly" id="Yearly" onchange="interestPay(this)" >
        <input type="button" class="button1" value="Half_Yearly" id="Half_Yearly" onchange="interestPay(this)" >
        <input type="button" class="button1" value="Monthly" id="Monthly" onchange="interestPay(this)">               -->
        <input type="button" class="button1" value="Quarterly" id="Quarterly" onchange="interestPay(this)">
        <input type="button" class="button1" value="At_Maturity" id="At_Maturity" onchange="interestPay(this)" > 
      
<br>



<!--Deposit Period-->
<lable for="depositeperiod" id="Deposite_Period">
    <div style="font-weight:bold; font-size: larger;  margin-left: -472px;">
    Deposite Period </div></lable>
<input type="text" name="DepositeP"  id="myTextBox" value="" style="border-top: none;border-left: none;border-right: none;width: 40%; font-size: large; line-height: 10px" readonly>

<!--EDIT DIALOG BOX-->
<input type="button" onclick="openDialog()" style="margin-left: -69px; cursor: pointer; color: rgb(255, 112, 3); font-weight: bolder;border: none;" value="SELECT"> <br>
<div id="dialog" class="dialog" style="display: none; ">
    <div style="font-size: larger;"><h2>Dialog</h2></div>
    <label for="year" id="editInput" style="font-weight: bold;">Select Year:</label>
    <select id="Year" onchange="updateTextBox(this)" ></select>
        <br><br><br>
        <label for="Month" id="editInput" style="font-weight: bold;">Select Month:</label>
       <select id="Month" onchange="updateTextBox(this)" ></select>
       <br><br>
      <!-- // <label for="days" id="editInput" style="font-weight: bold;">Select Days</label>
       <select id="Days"  onchange="updateTextBox(this)" ></select> -->
<br><br>
    <input type="button" onclick="saveOptions()" value="SAVE" class="submitCloseButtons">
    <input type="button" onclick="closepopup()" value="CLOSE" class="submitCloseButtons" id="editDialog">
</div>

 
<!-- <input type="button" name="editB" value="EDIT"/> -->

<input type="button" class="button " class="loading" id="2Year"  onclick="updateTextBox(this);setyear(this, '<%=custid%>')" value="2 Years">
<input type="button" class="button" class="loading" id="3Year" onclick="updateTextBox(this);setyear(this,  '<%=custid%>')" value="3 Years">
<input type="button" class="button" class="loading" id="4Year"  onclick="updateTextBox(this);setyear(this,  '<%=custid%>')" value="5 Years">
<br><br>






<!-- Debit Account-->
<lable for="debit">
    <div style="font-weight:bold; font-size: larger; margin-left: -480px;">
    Debit Account </div></lable>
<select  id="input" name="dr_account" style="border-top: none;border-left: none;border-right: none;width: 40%; font-size: large; line-height: 1" onchange="accbal(this); checkBal(this)"> 
  <option value="select"><b> ---- Select Account ----- </b></option>
 <% if (acclist!= null) { for (int i =0 ; i < acclist.length ; i++) { %>
  <option value="<%=acclist[i]%>" > <%=acclist[i]%> </option>
<% } } %>         

  </select> <br>
  <!--Available Balance-->
  <div style=" margin-left: 220px;">
    <div style="margin-left: -444px; display:inline-block;">Available Balance:Rs. </div>
    <div style="display:inline-block;"><input type="text" name="Balance"  id="Balance"style="border-top: none;border-left: none;border-right: none;border-bottom:none; width: 100%; height=20px; font-size: large;  " readonly></div>
  </div><br>
<!--Maturity Value-->
<lable for="Maturity">
    <div style="font-weight:bold; font-size: larger; margin-left: -477px;" id="result">
    Maturity Value </div></lable>
<input type="text" name="dr_account"  id="maturityDate"style="border-top: none;border-left: none;border-right: none;  width: 40%; font-size: large; line-height: 1" readonly> <br><br>

<!--Intrest rate and Total Interest-->


<div class="container-fluid">
  <div class="col-sm-3">

<label style="font-weight:bold; font-size: larger; margin-left: 297px;" id="result" >
  Total Interest</label> 
  

 <lable style=" font-weight:bold; font-size: larger; margin-left: -608px; margin-right: 294px;" id="result">Interest Rate</lable>
</div></div>


<!-- <div style=" margin-left: 220px;">
  <div style="margin-left: -398px; display:inline-block;"><input type="text" name="IntrestRate"  id="Intrest_rates"style="border-top: none;border-left: none;border-right: none;width: 34%; font-size: large; line-height: 1; margin-left:311px; border-bottom:none;" readonly> <br> </div>
  <div style="display:inline-block;"><input type="text" name="TotalInterest"  id="TotalInterest"style="border-top: none;border-left: none;border-right: none;width: 37%; font-size: large; line-height: 1; margin-left:179px; margin-right:158px; border-bottom:none; text-align:right; " readonly></div>
</div> -->

<div style="width: 40%;display: flex;margin-left: auto;margin-right: auto;">
  <div style="display:inline-block;width: 50%;">
    <input type="text" name="IntrestRate"  id="Intrest_rates"style="border-top: none;border-left: none;border-right: none;width: 100%;font-size: large;line-height: 1; text-align:left; outline:none; " readonly > <br> </div>
  <div style="display:inline-block;width: 50%;">
    <input type="text" name="TotalInterest"  id="TotalInterest"style="border-top: none;border-left: none;border-right: none;width: 100%;font-size: large;line-height: 1; text-align:right; outline:none;" readonly></div>
</div>
<br>

<!--Maturity Instruction-->
<lable for="debit">
  <div style="font-weight:bold; font-size: larger; margin-left: -424px;">
    Maturity Instruction </div></lable>
<select  id="input" name="Maturity_Instruction" style="border-top: none;border-left: none;border-right: none;width: 40%; font-size: large; line-height: 1"> 
  <option value="select"><b> ---- Select Maturity Instruction ----- </b></option>
<option value="Pay" >Pay</option>
<option value="Auto-Renew" >Auto-Renew</option></select><br>
<div style="color:#ff8800; margin-left: 476px;" onclick="openpage()"> Check Interest rates</div>

<!--Submit Button-->
<input type ="button" class="submit_button" onclick="submitDetails('<%=custid%>','<%=brncode%>')" value="Submit" >


<!--GAURDIAN INFORMATION-->
<input type="button" onclick="showDialog()" value="Nominee" id="NomineeDetail">

  <div id="myDialog" class="dialog" style="display: none;">
    <h2>Nominee Details</h2>
    <input type="text" id="nameInput" placeholder="Nominee Name" class="details">
    <br>
    <input type="date" id="dobInput" placeholder="Nominee DOB" class="details" onblur="checkgaurdian()">
    <br>
    <!--<input type="text" id="ageInput" placeholder="Nominee Age" class="details">
    <br>-->
    <input type="text" id="add1Input" placeholder="Address Line 1" class="details">
    <br>
    <input type="text" id="add2Input" placeholder="Address Line 2" class="details">
    <br>
    <input type="text" id="add3Input" placeholder="City" class="details">
    <br>

    <select id="relInput" placeholder="Nominee Relation" class="details" >
      <option value="select"><b> ----Relation of Nominee ----- </b></option>
    </select><br>
    
    <div class="guardian-details" id="additionalField" style="display: none;">
      <input type="text" id="guardianNameInput" placeholder="Guardian Name" class="details">
      <select id="guardianRelInput" placeholder="Guardian Relation" class="details" >
        <option value="select"><b> ----Relation of Gaurdian ----- </b></option></select>
    </div><br><br>

    <input type="button" onclick="submitNominee(this); calculateAge()" value="Submit" class="submitCloseButtons">
    <input type= "button" onclick="closeDialogs()" value="Close" class="submitCloseButtons">
  </div>
    <div class="loader" id="loading" style="display: block;"> </div>
</form>



<script language="JavaScript" src="/deposit/rdCreate.js"></script>
</body>
</html>