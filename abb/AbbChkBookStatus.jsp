<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.io.*" %>
<%
String chkbookStatus[][]=null;
if(session.getAttribute("chkBookInfo")!=null)
	{
     chkbookStatus=(String[][])session.getAttribute("chkBookInfo");
	}	
%>


<html>
<body onLoad="javascript:makeScrollableTable('table','false','auto'),onLoad1()"> 
	<html:form action="/abb/enquiry">
	<table border = "0" align="center" width="90%" height="12%" cellSpacing="0" cellPadding= "0" vspace="0" >
	<TR >
		<TD valign="top">
			<IMG  alt="Azizi Bank" height ="90" width = "99%" src="/images/azizi2.bmp"  border="0">			
		</td>			
 		<TD valign="bottom" align="left" bgcolor="#91203E">		  			
			<img src="/images/home.bmp" border="0">
	    </td>
   </tr>
   <TR >
		<TD valign="bottom" >
	   	  <IMG  alt="Azizi Bank" height ="20" width = "104%" src="/images/header_page.jpg"  border="0">
        </td>
		<td>&nbsp;</td>
   </tr>

<tr>

</tr>
 </table>

<br><br>
<table  width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td class="heading"></td>
		<td colspan="4" align="center">
		<font color="brown" size="4">CHECK BOOK ENQUIRY:</font>
		</td>
	</tr>
</table>

<br><br>

<table border="1" align="center" width="95%" cellpadding="-1" cellspacing="-1" id="table">
	<thead>
		 <TR bgcolor="brown"> 
			<TH width="1%" ></TH>
			
			<TH width="15%" ></TH>
			<TH width="10%" ></TH>
			<TH width="20%"></TH>
			<TH align = left nowrap style="font-family:courier new;FONT-SIZE: 8pt;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				1 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				2
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				3
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				4
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				5
					<br>	
						1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0
				</TH>			
			</tr>
			<TH width="1%" ><font color="#FFFFFF"> <bean:message bundle="hindi" key= "259"/></font></TH>
			
			<TH width="10%" ><font color="#FFFFFF"> From NO</font></TH>
			<TH width="10%" ><font color="#FFFFFF"> To No</font></TH>
			<TH width="5%"><font color="#FFFFFF"> Series</font></TH>
			<TH align = left nowrap style="font-family:courier new;FONT-SIZE: 8pt;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				6
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				7
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				8
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				9
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				10
					<br>	
						1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0
				</TH>	
			<tr>
			
			</tr>


	</thead>
<% 
	if(chkbookStatus!= null)
	{
		System.out.println("chkbookStatus not null");
		int j = chkbookStatus.length;

		String status ="";
		String statusAbove50 ="";	
		String statusBelow50 ="";	
		System.out.print("length of the array ::"+j);
		if(j!=0)
		{

		%>
			<tbody  class="scrolling" style="max-height:20px;">
			<%
			for(int i=0;i<j;i++)
			{
			chkbookStatus[i][4] = chkbookStatus[i][4].replace(",", " ");
					status = chkbookStatus[i][4].replace(",", " ");
					
					if(status.length() > 100)
					{
						statusAbove50 = status.substring(100,status.length());
						statusBelow50 = status.substring(0,100);
					System.out.println("Length is greater than 100 ===============");
					}
					else
						statusBelow50 = status;

			int k=0;
			%>
			<tr>
					<td  align="center" id="text<%=i%><%=k++%>" >No 1
					</td>
					
					<td align="center"  id="text<%=i%><%=k++%>">
						Accc
					</td>
					
					
					<td  align="center" id="text<%=i%><%=k++%>">Amount
					</td>
					
					<td  align="center" id="text<%=i%><%=k++%>" >Rupee
					</td>

					<td align="center" id="text<%=i%><%=k++%>">Hut
					</td>

					<td>
						<input  id ="etext<%=i%>" type="text" readonly="true" size="100"
								value='<%=statusBelow50%>' 
								class="TableTextChequeBook" >
					</td>
					
			</tr>
			

			<tr>

				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				
					<%	if(statusAbove50 != null && !statusAbove50.equals(""))
					{
					
						
					%>		
									
									
									<!------STATUS--------------->
					
					<td>
						
						<input  id ="etext<%=i%>" type="text" readonly="true" size="100"
								value='<%=statusAbove50%>' 
								class="TableTextChequeBook" >
					</td>
					
				
					<td align="center" id="text<%=i%><%=k++%>"><%= chkbookStatus[i][5] %>
					</td>

					</tr>

				<%}%>
				<%}%>
				</tbody>
				<%}%>


		
</table>

	<input type="button" value="Back" onclick="backmini()" style="width:100px" class="button"/>
		







</html:form>
</body>
</html>


<script >

function backmini()
{
document.forms[0].action="/CommonCancelAction.do?reqForm=EnqBack"
document.forms[0].method="post";
document.forms[0].submit();				
}
	</script>
	