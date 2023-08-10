
<% 
String  sLoanDoc ="";
String sData[]=null;
	if(session.getAttribute("LoanDocArray")!=null){
		sLoanDoc=(String)session.getAttribute("LoanDocArray");
		  sData= sLoanDoc.split("~");
		}
	
%>

<html>
<img id=logo src="<%=request.getContextPath()%>/images/MWBLogo.JPEG" />
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <%if(sData!=null){%>
    <title>  <%=sData[4]%></title>
    <%}else{%>
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
            width: 100%;
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
        <h3 align="center">Receipt of Cash Deposit</h3>
        <table width="100%" id="fileData">
            
	<%  if(sData!=null){ %>
            <tbody>
			<TR>
			<TD>  Date</TD>
			<TD> <%=sData[0].substring(1, sData[0].length())%></TD>
			</TR>
                
			<TR>
			<TD>  TIME</TD>
			<TD> <%=sData[5]%></TD>
			</TR>

			<TR>
				<TD>  Deposit Transaction Number</TD>
				<TD>  <%=sData[4]%></TD>
			</TR>
			<TR>
				<TD>  Society Account Number</TD>
				<TD> <%=sData[1]%></TD>
			</TR>
			<TR>
			
				<TD>  Society Name</TD>
				<TD>  <%=sData[2]%></TD>
			</TR>

			<TR>
				<TD>  Cash Deposit Account Number</TD>
				<TD>  <%=sData[9].substring(0, sData[9].length()-1)%></TD>
			</TR>
			
			<TR>
				<TD>  Account Holder Name</TD>
				<TD>  <%=sData[7]%></TD>
			</TR>
			<TR>
				<TD>  Amount</TD>
				<TD>  <%=sData[3]%></TD>
			</TR>
			<TR>
				<TD>  Amount in words</TD>
				<TD>  <%=sData[8]%></TD>
			</TR>
<%}%>
                
            
            </tbody>
					
        </table>
		
		<table width ="100%">
		<tr>
			<td style="margin-left:90px;width: 324px;"><B>DMA Sign: </B></td>
			<TD align="left" ><B>Customer Sign:<B></TD>
		</TR>
		
        </table>
		<HR>
		<img id=logo src="<%=request.getContextPath()%>/images/MWBLogo.JPEG" align="center" />
		<Br></Br>
				
		<table width="100%" id="fileData">
             <thead>
                <tr>
                   
                </tr>
            
            </thead>
	<%  if(sData!=null){ %>
            <tbody>
			<TR>
			<TD>  Date</TD>
			<TD> <%=sData[0].substring(1, sData[0].length())%></TD>
			</TR>
                
			<TR>
			<TD>  TIME</TD>
			<TD> <%=sData[5]%></TD>
			</TR>

			<TR>
				<TD>  Deposit Transaction Number</TD>
				<TD>  <%=sData[4]%></TD>
			</TR>
			<TR>
				<TD>  Society Account Number</TD>
				<TD> <%=sData[1]%></TD>
			</TR>
			<TR>
			
				<TD>  Society Name</TD>
				<TD>  <%=sData[2]%></TD>
			</TR>

			<TR>
				<TD>  Cash Deposit Account Number</TD>
				<TD>  <%=sData[9].substring(0, sData[9].length()-1)%></TD>
			</TR>
			
			<TR>
				<TD>  Account Holder Name</TD>
				<TD>  <%=sData[7]%></TD>
			</TR>
			<TR>
				<TD>  Amount</TD>
				<TD>  <%=sData[3]%></TD>
			</TR>
			<TR>
				<TD>  Amount in words</TD>
				<TD>  <%=sData[8]%></TD>
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

