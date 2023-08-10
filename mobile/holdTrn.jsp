	<%@ include file="/common/Include.jsp" %>
	<%@ page import="java.util.GregorianCalendar" %>
<%
		String accountList="" ; 
		String [] AccListArr= null ; 
		if (session.getAttribute("allAccountlist") != null ) { 
		   accountList=(String)session.getAttribute("allAccountlist");
		   AccListArr =accountList.split(",");
		}
	    int errorcount=0;
		String usrName = "";
		 String AccINFO[][] = (String[][])session.getAttribute("AccINFO"); 
		 System.out.println(AccINFO);
		if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
		String login_id="";
		if(session.getAttribute("userid")!=null){
			login_id = (String)session.getAttribute("userid");
			System.out.println("snxw--------------------------"+login_id);
		}
		/*parameter to check whether there is any hold transaction*/
		String isHold="";
		String [][] sData=null;
		if(request.getParameter("holdTran")!=null){
			isHold = (String)request.getParameter("holdTran");
			sData=(String[][])session.getAttribute("holdTranData");
			
		}
		GregorianCalendar gc=new GregorianCalendar();
    	System.out.println(gc.getTime()+"   "+gc.DATE);
		
	%>	
	<script>

	
	
	function fillHoldData(){
			
		 var table = document.getElementById("HoldTrn");
		 var rowCount = table.rows.length;
		
		var f=false;
		for(var i=0;i<rowCount-1;i++){
			if(document.getElementById("viewTrn["+i+"]").checked==true)
			{
				f=true;
				window.location.href = "/fundtransfer/agentTrn.jsp?holdTran=true&tranid="+i;
			}
		}
		if(f==false)
		{
			alert("Please select a checkbox");
			return false;
		}
		//document.getElementById("HoldTrn").style.display="none";
		//window.location.href = "/fundtransfer/agentTrn.jsp?holdTran=true&tranid="+i;*/
		}
		function checkIfAlready(i)
		{
			var table = document.getElementById("HoldTrn");
			 var rowCount = table.rows.length;
			for(var j=0;j<rowCount-1;j++)
			{
				 if(document.getElementById("viewTrn["+j+"]").checked==true && i!=j)
					 document.getElementById("viewTrn["+j+"]").checked=false;
			}
		}

function deleteTran()
  {
   var table = document.getElementById("HoldTrn");
    var rowCount = table.rows.length;
   <% 
   	if(sData!=null){
	   for(int j=0;j<sData.length;j++){
    %>
     
    if(document.getElementById("viewTrn[<%=j%>]").checked==true)
    {
		
	var url="/TransactionAction.do?action=getHoldTransaction&isDelete=true&trankid=<%=sData[j][22]%>";
     
      http.open("post",url,false);
      http.onreadystatechange= function (){
          try{
           var resArray1=http.responseText;
           var jsonData1=JSON.parse(resArray1);
           if(jsonData1=="-D")
           {
                  message="Transaction deleted Successfully";
            alert("Transaction deleted Successfully");
            //return true;
           }
           else
           {
            message="Transaction not deleted Successfully";
            alert(message);
            //return true;
           }
          }
          catch(e)
          {}
          window.location.href="/TransactionAction.do?action=getHoldTransaction";

        };
         http.send(null);
        
    }<%}}%>
   }
  
	</script>
	
	<body style="margin:0 0 0 0;" onload="fillData()"><br>
	<% if((isHold.equals("true"))){%>
		<table id="HoldTrn" border="" style="width:100%;">
			<tr style="text-align:center;text-size:5px;font-weight:bold;">
				<td>&nbsp;&nbsp;</td>
				<td>Account No</td>
				<td>Activity</td>
				<td>Sender Name</td>
				<td>Sender Number</td>
				<td>Reciever Account Number</td>
				<td>Reciever Name</td>
				<td>Reciever Number</td>
				<td>Transaction Amount</td>
			</tr>
			<%
				for(int i=0;i<sData.length;i++){
					
			%>
				<tr>
				<td><input type="checkbox" id="viewTrn[<%=i%>]" name="viewTrn[<%=i%>]" onchange="checkIfAlready(<%=i%>)"/></td>
				<td><%=sData[i][0]%></td>
				<td><%=sData[i][1]%></td>
				<td><%=sData[i][2]%></td>
				<td><%=sData[i][7]%></td>
				<% if(sData[i][14].equals(""))
						sData[i][14]="-";
				%>
				<td style="text-align:center;"><%=sData[i][14]%></td>
				<td><%=sData[i][8]%></td>
				<td><%=sData[i][13]%></td>
				<td><%=sData[i][17]%></td>
				</tr>
			<%}%>
			
			</table><br><br><br>
			<input type="button" value="View Transaction" onclick="fillHoldData()" class="Button" />
			<input type="button" value="Delete Transaction" onclick="deleteTran()" class="Button" />
			
	<%}else{%>
			<font color="red" style="font-weight:bold;font-size:medium;">
				No Hold Transaction
			</font>
		<%}%>
		</form>
		
	</body>
	
