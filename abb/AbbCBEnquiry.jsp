<%@ include file="/common/Include.jsp" %>
<%
String branchlist[][]=null;
if(session.getAttribute("sBranchInfo")!=null)
	{
     branchlist=(String[][])session.getAttribute("sBranchInfo");
	}	

else
{
	System.out.println("sBranchInfo is null");
}
%>

<%
String strData[][]=null;
String name="";
if(session.getAttribute("chkBookInfo")!=null)
	{
     strData=(String[][])session.getAttribute("chkBookInfo");
	 name=strData[0][6];
	}	
%>
<script language="JavaScript"src="/accsum/scripts/accSum.js"></script>


<HTML>
<body onLoad="fill()"> 
<html:form action= "/abb/enquiry" >


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


 </table>


<br>
<table border="0" width="50%" cellpadding="0" cellspacing="0" bgcolor="#FDE4E3" align='center'>                
	
	<thead>  
	   <th align="center" rowspan="2" colspan="2" >
		  <b><bean:message bundle="hindi" key='7442'/></b>
	   </th>
	  </tr>
	</thead>
	
	
	 <tr>			
		 <td  style="padding-left:10px" width="100" class="simple"> 
			 <bean:message bundle="<%=lang%>" key= "425"/> 
		</td>
		<td align="left">
		 <html:select property="sBranchInfo"  style="width:100px;"  style="background-color:activeborder;" tabindex="1">
		 <%if(branchlist!=null)
			{
			 for(int i=0;i<branchlist.length;i++)
				{%>
				 <html:option value="<%=branchlist[i][1] %>"> 
				 <%=branchlist[i][1] %>
				</html:option>
				<%}
			}%>
		 </html:select>
		</td>					
	</tr>
		<!--Second row-->	
		<tr>
			<td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "1027"/> 
			</td>
			<td align="center" colspan="3">
			<html:text   property="sAccno" styleId="sAccno"size="60" maxlength="19" onkeypress="javascript:isValidNumber()" tabindex="2"/>
			</td>
		</tr><!--end of sec row-->
	
		<tr>
			<td  style="padding-left:10px" width="450" class="simple"> A/c Holder Name
			</td>
			<td align="left" id="textName">
			<html:text  property="name" readonly="true"  size="60" value="<%=name%>"/>
			</td>
		</tr><!--end of third row-->
		

			</table><!--end of inner table--->
		</tr>
	</td>
</table>
<br>
<%
		if(strData!=null)		
		{
			
	
			System.out.println("SDFA-----"+strData.length);
			
			String status ="";
			String statusAbove50 ="";	
			String statusBelow50 ="";	
			%>
<table border="1" align="center" cellpadding="-1" cellspacing="-1" id="enquiryChqBookTable"
style = "BORDER-COLLAPSE: collapse;" width = "80%" font="courier new" size="2pt">	
	<thead>
		 <TR bgcolor="brown"> 
			<TH width="1%" ></TH>
			<TH width="5%" ></TH>
			<TH width="5%" ></TH>
			<TH width="5%"></TH>
			<TH align = "left" nowrap style="font-family:courier new;FONT-SIZE: 8pt;" >
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
			<tr>
			<TH width="1%" ><font color="#FFFFFF"> <bean:message bundle="hindi" key= "259"/></font></TH>
			<TH width="5%" ><font color="#FFFFFF"> From No</font></TH>
			<TH width="5%" ><font color="#FFFFFF"> To No</font></TH>
			<TH width="5%"><font color="#FFFFFF"> Series</font></TH>
			<TH align = "left" nowrap style="font-family:courier new;FONT-SIZE: 8pt;">
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
			</tr>
	</thead>
<tbody>


		<%
			for (int i=0;i<strData.length;i++) 
			{	
					System.out.println("strData is  before "+strData[i][4]);
					strData[i][4] = strData[i][4].replace(",", " ");
					System.out.println("String after replace  "+strData[i][4]);
					status = strData[i][4].replace(",", " ");
					System.out.println("Length is status  "+status.length());
					status=status.substring(0,status.length()-1);
					if(status.length() > 100)
					{
						statusAbove50 = status.substring(100,status.length());
						System.out.println("length of statusAbove     "+statusAbove50);
						statusBelow50 = status.substring(0,100);
					}
					else
					{statusBelow50 = status;}
				
			int k=0;
			%>	


	<tr <%out.println(i%2==0?"class=trforReportRowl":"class=trforReportRow2");%> >
						<!-------SERIAL NUMBER----------------->
						<td align="center" id="text<%=i%><%=k++%>"><%=i+1%>
						</td>

						<!-------start------------------>
					<td align="center" id="text<%=i%><%=k++%>"><%=strData[i][1]%>
					</td>
				
									<!------ end ---------------->
	
				<td align="center" id="text<%=i%><%=k++%>"><%=strData[i][2]%>
					</td>
			
						<!------series-------------------->
			

			<td align="center" id="text<%=i%><%=k++%>"><%=strData[i][5]%>
					</td>

					<!------------status---------------->
			

			<td align="left" id="text<%=i%><%=k++%>"><font nowrap style="font-family:courier new;FONT-SIZE: 8pt;"><%=statusBelow50%></font>
					</td>


			</tr>
<tr <%out.println(i%2==0?"class=trforReportRowl":"class=trforReportRow2");%> >

				<td></td>
				<td></td>
				<td></td>
				<td></td>

				
					<%	if(statusAbove50 != null && !statusAbove50.equals(""))
					{
					
					%>		
									<!------STATUS--------------->
					
					
					<td align="left" id="text<%=i%><%=k++%>"><font nowrap style="font-family:courier new;FONT-SIZE: 8pt;"><%=statusAbove50%></font>
					</td>
						
					

					<% }
					
					%>
			
				</tr>
					
			
<%			
			statusAbove50="";
			statusBelow50="";
			status="";
			
				}
			
		}
			
%>
	</tbody>		

	</table>



<TABLE align="center" width="50%" border="0">

	<TR  valign="bottom">

		<TD align="center">		<!-- CLOSE -->
			<input value="   <bean:message bundle='<%=lang%>' key='86'/>    " class="Button" type="button" tabindex="3" style="width:100px" onclick="statement_submit()" > 
		
			<input type="button" value="Back" onclick="backmini()" style="width:100px" class="button" tabindex="4"/>
		
		
		<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " class="Button" type="button" tabindex="5" style="width:100px"
	onclick="helpopen()"/>

		
		</TD>

	</TR>
</TABLE>
<br>
<Table align="center">
	E-->Encashed  S-->Stopped  U-->Unpaied  L-->Lost  M-->Marked  C-->Cancel  R-->Returned  P-->Paid
	
</Table>


</html:form>
</body>
</html>

<script language="JavaScript">
	function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=CBEnquiry","child", bar);
}
function onLoad()
{
document.getElementById("sAccno").focus();
}

function backmini()
{
document.forms[0].action="/CommonCancelAction.do?reqForm=EnqBack"
document.forms[0].method="post";
document.forms[0].submit();				
}

function statement_submit()
{	
 if(document.getElementById("sAccno").value=="")
  {alert("Please insert Account Number");
   document.getElementById("sAccno").focus();	
   return false;
  }
	else
		{

		document.forms[0].action="/abb/enquiry.do?action=abbCheckStatus";
		document.forms[0].method="post";
		document.forms[0].submit();
		}
}

function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=CBEnquiry","child", bar);
}

function fill()
{
makeScrollableTable('enquiryChqBookTable','false','auto');
 document.getElementById("sBranchInfo").focus();
}

</script>
<script>
<%      
	String errorCode=""; 
    if(session.getAttribute("repterror") != null){
		 errorCode = (String)session.getAttribute("repterror");
 	 	 System.out.println("Removing Session Data....................111"); 	
		 session.removeAttribute("abbCashErrorCode");
   }

   if(errorCode!=null && (!errorCode.trim().equals("")))
   { %> 

			document.write("<br>");
			document.write("<TABLE width=\"100%\" id = \"ErrorTab\" >");
			document.write("<TR>");
			document.write("<TD style=\"background-color:brown;color:white;WIDTH:100%;\" align=top>");
			document.write("<strong>");
			document.write("'<%=errorCode%>' : "+"<bean:message bundle='errors' key='<%=errorCode%>'/>");	
			document.write("</strong>");
			document.write("</TD>");
			document.write("</TR>");
 		    document.write("</TABLE>");
   <%
	   errorCode = null;
   }
    

 %>	
</script>

