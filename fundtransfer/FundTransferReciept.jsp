<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONException"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="easycbs.bancmateib.common.util.BMDouble"%>


 
<% 

String  responseStr ="";
String sData[]=null;
JSONArray ja_data=null;
double dDrAmt =0d;
double dCrAmt =0d;
	if(session.getAttribute("LoanDocArray")!=null){
		responseStr=(String)session.getAttribute("LoanDocArray");
		 org.codehaus.jettison.json.JSONObject obj12 = new org.codehaus.jettison.json.JSONObject() ; 
		obj12.put("data", responseStr) ; 
		JSONObject jsonObj = new JSONObject(obj12.toString());
	    ja_data =  new JSONArray(jsonObj.getString("data"));
			  for (int i = 0 ; i< ja_data.length() ; i++) { 
				  JSONObject inObj = ja_data.getJSONObject(i);
				  System.out.println(inObj.getString("date")); 
			  }
			  }
	
%>


<html>
<img id=logo src="<%=request.getContextPath()%>/images/MWBLogo.JPEG" align="center"/>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <% 
    if(ja_data!=null) {
    	for (int i = 0 ; i< ja_data.length() ; i++) { 
    		JSONObject inObj = ja_data.getJSONObject(i); 
    		%>
    		 <title><%=inObj.getString("txnNo")%></title>
    		<%
    	}
    }else{%>    
    <title>Download File</title>
    <%}%>
	
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <style>
        body{
            margin: 0 auto;
        }

        .wrapper{
            width: 80%;
            margin: 5px 10% 10px 10%;
        }

        table{
            width: 90%;
            border-spacing: 5px;
            margin-bottom: 20px;
        }

        table thead{
            background-color: white;
        }
        table, th, td {
            border: 1px solid black;
			font-size: small;
        }

        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 4px;
        }

        th {
            text-align: left;
        }
        table tbody tr:nth-child(even) {
            background-color: #eee;
        }
        table tbody tr:nth-child(odd) {
            background-color: #fff;
        }
    </style>
</head>
<body onload="javascript:this.src='/images/MWBLogo.JPEG'" >

    <div class="wrapper">
        <h3 align="center">Receipt of Fund Transfer</h3>
        <table width="100%" align= "left" id="fileData">
            <thead>
                <tr>
                    <th width="25%">Date </th>
					<th width="25%">Time </th>
					<th width="25%">A/C Number </th>
					<th width="25%">Name </th>
					<th width="25%">Txn No.</th>
					<th width="25%">Debit</th>
					<th width="25%">Credit</th>
					<th width="25%">Society A\C Number</th>
					<th width="25%">Society Name</th>
                </tr>
            
            </thead>
			 <tbody>
			 <% 
			 if(ja_data!=null) {
			 for (int i = 0 ; i< ja_data.length() ; i++) { 
				  JSONObject inObj = ja_data.getJSONObject(i); 
				  dDrAmt =dDrAmt+ BMDouble.parseDouble(inObj.getString("debit"));
				  dCrAmt =dCrAmt+ BMDouble.parseDouble(inObj.getString("credit"));
				  %>
			<TR>
				  
    		<TD> <%=inObj.getString("date")%>
			</TD>
			 <TD> <%=inObj.getString("time")%>
			</TD>
			<TD> <%=inObj.getString("accountno")%>
			</TD>
			 <TD> <%=inObj.getString("name")%>
			</TD>
			<TD> <%=inObj.getString("txnNo")%>
			</TD>
			 <TD> <%=inObj.getString("debit")%>
			</TD>
			<TD> <%=inObj.getString("credit")%>
			</TD>
			 <TD> <%=inObj.getString("socAccount")%>
			</TD>
			<TD> <%=inObj.getString("societyName")%>
			</TD>
			</TR>
			<%}%>
						
			<TR>
    		<TD> 
			</TD>
			 <TD> 
			</TD>
			<TD> 
			</TD>
			 <TD> 
			</TD>
			<TD> <H4>Total </H4>
			</TD>
			 <TD> <H4><%=dDrAmt%></H4>
			</TD>
			<TD><H4> <%=dCrAmt%></H4>
			</TD>
			 <TD> 
			</TD>
			<TD> 
			</TD>
			</TR>
			<%}%>
           
		
            </tbody>
			
        </table>
		<Br></Br>
		<table width ="100%">
		<tr>
			<td style="margin-left:90px;width: 324px;"><B>DMA Sign: </B></td>
			<TD align="left" ><B>Customer Sign:<B></TD>
		</TR>
		
        </table>
		<HR>
		<img id=logo src="<%=request.getContextPath()%>/images/MWBLogo.JPEG" align="center" />
		<Br></Br>
		<Br></Br>
		 <table width="100%" align= "left" id="fileData">
            <thead>
                <tr>
                    <th width="25%">Date </th>
					<th width="25%">Time </th>
					<th width="25%">A/C Number </th>
					<th width="25%">Name </th>
					<th width="25%">Txn No.</th>
					<th width="25%">Debit</th>
					<th width="25%">Credit</th>
					<th width="25%">Society A\C Number</th>
					<th width="25%">Society Name</th>
                </tr>
            
            </thead>
			 <tbody>
			 <% 
			 if(ja_data!=null) {
				 dDrAmt=0d;
				 dCrAmt=0d;
			 for (int i = 0 ; i< ja_data.length() ; i++) { 
				  JSONObject inObj = ja_data.getJSONObject(i); 
				  dDrAmt =dDrAmt+ BMDouble.parseDouble(inObj.getString("debit"));
				  dCrAmt =dCrAmt+ BMDouble.parseDouble(inObj.getString("credit"));
				  %>
			<TR>
				  
    		<TD> <%=inObj.getString("date")%>
			</TD>
			 <TD> <%=inObj.getString("time")%>
			</TD>
			<TD> <%=inObj.getString("accountno")%>
			</TD>
			 <TD> <%=inObj.getString("name")%>
			</TD>
			<TD> <%=inObj.getString("txnNo")%>
			</TD>
			 <TD> <%=inObj.getString("debit")%>
			</TD>
			<TD> <%=inObj.getString("credit")%>
			</TD>
			 <TD> <%=inObj.getString("socAccount")%>
			</TD>
			<TD> <%=inObj.getString("societyName")%>
			</TD>
			</TR>
			<%}%>
						
			<TR>
    		<TD> 
			</TD>
			 <TD> 
			</TD>
			<TD> 
			</TD>
			 <TD> 
			</TD>
			<TD> <H4>Total </H4>
			</TD>
			 <TD> <H4><%=dDrAmt%></H4>
			</TD>
			<TD><H4> <%=dCrAmt%></H4>
			</TD>
			 <TD> 
			</TD>
			<TD> 
			</TD>
			</TR>
			<%}%>
           
		
            </tbody>
        </table>
	<table>
		<tr>
			<td style="margin-left:90px;width: 324px;"><B>DMA Sign: </B></td>
			<TD align="left" ><B>Customer Sign:<B></TD>
		</TR>
		
        </table>
		
		
            <button id="downloadPDF">Download PDF</button>
			<button id="Close">Close</button>
    </div>
    <script src="js/jquery-3.3.1.slim.min.js"></script>
    <script src="js/jspdf.min.js"></script>
    <script src="js/jspdf.plugin.autotable.min.js"></script>
    <script src="js/tableHTMLExport.js"></script> 
    
    <script>


        $('#downloadPDF').on('click',function(){
			window.print();
            //$("#fileData").tableHTMLExport({type:'pdf',filename:'documnet_file.pdf'});
        })
		
		 $('#Close').on('click',function(){
			window.opener.location.reload();
        window.close();
        })
    </script>
	
	
</body>
</html>

