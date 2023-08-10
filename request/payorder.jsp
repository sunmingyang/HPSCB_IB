<%@ include file="/common/header.jsp" %>

<%   int i=0;
     String[][] document1=null;
	 String[][] state1=null;
	 String[][] city1=null;
	 String[][] curr1=null;
	 String stat=new String();
   if(request.getSession().getAttribute("document")!=null)
	 {
	   document1=(String[][])request.getSession().getAttribute("document");
	   System.out.println(" no of documents "+document1.length);
	 }
   if(request.getSession().getAttribute("state")!=null)
	 {
	   state1=(String[][])request.getSession().getAttribute("state");
	   System.out.println(" no of states "+state1.length);
	 }
	 if(request.getSession().getAttribute("curr")!=null)
	 {
	   curr1=(String[][])request.getSession().getAttribute("curr");
	   System.out.println(" no of currencyes "+curr1.length);
	 }
	 if(request.getSession().getAttribute("city")!=null)
	 {
	   city1=(String[][])request.getSession().getAttribute("city");
	   System.out.println(" no of cityes "+city1.length);
	 }
	 if(request.getSession().getAttribute("state1")!=null)
	 {
	   stat=(String)request.getSession().getAttribute("state1");
	   System.out.println(" state is is "+stat);
	 }
	 
	 
	 %>
	 
<script>
  	function onload(yy)
	{
//	alert("on body load");
	if (yy!=null)
	{ 
		disabledControlsOnAction(document.forms[0],"ibreq");
	}
	else
	{
		fill();
		fill2();
		fill3();
	}
	
	} 

function fill()
	{
//		alert("call for doc")
	  document.getElementById("sDoc").options.length=0;
				
<% if(document1!=null)
{
		for( i=0;i<document1.length;i++)
		{
			System.out.println("document1[i][0] "+document1[i][0]);
	%>
				newOpt = document.createElement("OPTION");
				newOpt.text='<%=document1[i][0]%>'+ ' '+'<%=document1[i][1]%>' ;
				newOpt.value='<%=document1[i][0]%>';
				document.getElementById("sDoc").options.add(newOpt);
	<%
		} 
		}
	%>
	}
	function fill2()
	{
		document.getElementById("sCurr").options.length=0;
						
<% if(curr1!=null)
{
			for( i=0;i<curr1.length;i++)
			{
				System.out.println("currency[i][0] "+curr1[i][0]);
	%>
				newOpt = document.createElement("OPTION");
				newOpt.text='<%=curr1[i][0]%>'+ ' '+'<%=curr1[i][1]%>' ;
				newOpt.value='<%=curr1[i][0]%>';
				document.getElementById("sCurr").options.add(newOpt);
	<%
			} 
}
	%>
	}
	
	
	 function fill3()
	{
	document.getElementById("sCity").options.length=0;
				
   <%          if(city1!=null){
			for( i=0;i<city1.length;i++)
		{
	   System.out.println("currency[i][0] "+city1[i][0]);
	%>
				newOpt = document.createElement("OPTION");
				newOpt.text='<%=city1[i][0]%>'+ ' '+'<%=city1[i][1]%>' ;
				newOpt.value='<%=city1[i][0]%>';
				document.getElementById("sCity").options.add(newOpt);
	<%
		} }
	%>
		
	}
     function showMessage(code,type)
		{
			if(type=="hindi")
			{
				switch(code)
				{
					case 7064:
						alert("<bean:message bundle='<%=lang%>' key= '7167'/>");
						break;
					case 7065:
						alert("<bean:message bundle='<%=lang%>' key= '7273'/>");
						break;
                    case 7066:
						alert("<bean:message bundle='<%=lang%>' key= '7274'/>");
					    break;
					case 7067:
						alert("<bean:message bundle='<%=lang%>' key= '7275'/>");
					    break;
					case 7068:
						alert("<bean:message bundle='<%=lang%>' key= '7276'/>");
				}
			}
		}

</script>

<script language="JavaScript" src="/request/scripts/reqChk.js"></script> 


<body onLoad="onload(<%=request.getParameter("row")%>)">

<div id="diverrmessage">
<logic:messagesPresent property="NoServer">
<html:errors property="NoServer"/>
</logic:messagesPresent>
<logic:messagesPresent property="RecordSaved">
<script>
document.getElementById("")
</script>
<html:errors property="RecordSaved"/>
</logic:messagesPresent>
</div>


<html:form action="/request/reqchk.do">

<% 
//LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");   
String userInfo[][]=(String[][])session.getAttribute("userInfo");

if(userInfo!=null)
{ 
String[] acc_nums =new String[userInfo.length];
		for(int ii=0;ii<userInfo.length;ii++)
			acc_nums[ii]=userInfo[ii][0];
int j=acc_nums.length;
if(j!=0)
{%><table border="1" align="center">
<tr>
<td align="center" style="color:brown;"><b>Request for Demand Draft</b></td>
	<td>
</tr>
<tr>
<td>
	<table width="100%" border="0" align="center">
	
	<tr><td><bean:message bundle='<%=lang%>' key='1027'/></td><br>
<td>


<html:select  property="sAccList" styleId="sAccList" >
<% for(int l=0;l<j;l++) 
{%>
<html:option value='<%= (String)acc_nums[l] %>'><%= (String)acc_nums[l] %></html:option>
 <% } %>
</html:select>
 
	
	</td></tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key='7243'/></td>
		<td>
			<select name="sTrans" id="sTrans" style="WIDTH: 220px">
				 <option value="Transactiontype" >
				 <bean:message bundle="<%=lang%>" key='23'/></option>
			</select>
        </td>
    </tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key='284'/></td>
		<td>
		  <select  name="sDoc" id = "sDoc"  style="WIDTH: 220px"  >
		   <option value = "Select Document"></option>
		   </select>
	    </td>
    </tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "425"/> 
		</td>
	    <td>
		      <html:text property="sBrnCode" styleId="sBrnCode"  size="15"/>
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "39"/>* 
		</td>
	    <td>
		     <html:text property="sAmount" styleId="sAmount" onkeypress="isValidNumber()" size="15"/>
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "40"/>* 
		</td>
	    <td>
		    <html:text property="sEPayName" styleId="sEPayName" onkeypress="isValidAlpha()" size="15" onblur="JavaScript:sHPayName.value=region(sEPayName.value,'hindi')"/>
		</td>
		<td>
		    <html:text property="sHPayName" styleId="sHPayName" onkeypress="isValidAlpha()" size="15"/>
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "2488"/>1* 
		</td>
	    <td>
		    <html:text property="sEPayAdd1" styleId="sEPayAdd1" onkeypress="isValidAlpha()" size="15" onblur="JavaScript:sHPayAdd1.value=region(sEPayAdd1.value,'hindi')"/>
		</td>
		<td>
		    <html:text property="sHPayAdd1" styleId="sHPayAdd1" onkeypress="isValidAlpha()" size="15"/>
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "2488"/>2*
		</td>
	    <td>
		    <html:text property="sEPayAdd2" styleId="sEPayAdd2" onkeypress="isValidAlpha()" size="15" onblur="JavaScript:sHPayAdd2.value=region(sEPayAdd2.value,'hindi')"/>
		</td>
		<td>
		    <html:text property="sHPayAdd2" styleId="sHPayAdd2" onkeypress="isValidAlpha()" size="15"/>
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key='7245'/></td>
		<td>
		  <select  name="sState" id = "sState" style="WIDTH: 220px" onChange="selectState()" >
		 <option value ="Select State">select state</option> 
		 <%
			for( i=0;i<state1.length;i++)
			{
	     %>
		     <option value='<%=state1[i][0]%>'> 
			 <%=state1[i][0]%>  <%=state1[i][1]%> </option>
		<%}%>

		   </select> 
	    </td>
    </tr>
	<tr>
	    <td>
	       <input type="hidden" name="state" id="state"/>
	    </td>
		 <td>
	       <input type="hidden" name="countinue" id="countinue"/>
	    </td>
		<td>
	       <input type="hidden" name="back" id="back">
	    </td>
		<td>
	       <input type="hidden" name="reset" id="reset">
	    </td>
	 </tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key='7244'/></td>
		<td>
		  <select  name="sCity" id = "sCity" style="WIDTH: 220px"  >
		   <option value = "Select City"></option>
		   </select>
	    </td>
    </tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "1206"/>
		</td>
	    <td>
		    <html:text property="sPur" styleId="sPur" onkeypress="isValidAlpha()" size="15"/>
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "2970"/>*
		</td>
	    <td>
		    <html:text property="sPanNum" styleId="sPanNum" onkeypress="isValidNumber()" size="15"/>
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key='217'/></td>
		<td>
		  <select  name="sCurr" id = "sCurr" style="WIDTH: 220px"  >
		   <option value = "Select Currency"></option></select>
	    </td>
    </tr>
    <tr>
		  <td>
            <input type="button" name="countinue" class="Button" value="<bean:message bundle='<%=lang%>' key='7119'/>" onclick="Continue()">
		  </td>
		  <td >
               <input type="button" name="cancle" class="Button" value="<bean:message bundle='<%=lang%>' key='843'/>" onclick="back_req()">
		  </td>
		  <td >
               <input type="button" name="reset" class="Button" value="<bean:message bundle='<%=lang%>' key='7000'/>" onclick="Reset()">
			     </td>
    </tr>
	</table>
	</td>
	</tr>
	<% } %>
<script>
//alert("length   "+document.getElementById("sState").options.length);
//alert('<%=stat%>');
 for(var j=0;j<document.getElementById("sState").options.length;j++)
 {
	 if(document.getElementById("sState").options[j].value=='<%=stat%>')
	 {	
		
        document.getElementById("sState").options[j].selected=true;
	 }
 }
</script>
<%
 }
 HashMap req_detail=(HashMap)session.getAttribute("req_detail");   
	if(req_detail!=null)
	{ 
	ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
	ArrayList e_name=(ArrayList)req_detail.get("req_Names");

	ArrayList trn_type=(ArrayList)req_detail.get("trn_Type");
	ArrayList str_type=(ArrayList)req_detail.get("str_Type");
	ArrayList brn_code=(ArrayList)req_detail.get("brn_Code");
	
	ArrayList h_name=(ArrayList)req_detail.get("h_Name");
	
	ArrayList h_addr1=(ArrayList)req_detail.get("h_Addr1");
	
	ArrayList h_addr2=(ArrayList)req_detail.get("h_Addr2");
	ArrayList e_addr1=(ArrayList)req_detail.get("e_Addr1");
	ArrayList e_addr2=(ArrayList)req_detail.get("e_Addr2");
	ArrayList city_name=(ArrayList)req_detail.get("city_Name");

	ArrayList state_name=(ArrayList)req_detail.get("state_Name");
	ArrayList pan_num=(ArrayList)req_detail.get("pan_Num");
	ArrayList curr_name=(ArrayList)req_detail.get("curr_Name");
	
	ArrayList dd_pur=(ArrayList)req_detail.get("dd_Pur");
	ArrayList dd_amt=(ArrayList)req_detail.get("dd_Amt");
	int k=acc_nums.size();
	if(k!=0)
	{ 
	%>
 



<table border="1" align="center" style="border-color:brown">
<tr>
	<td align="center" style="color:brown;"><b>Request for Demand Draft</b></td>
	<td>
</tr>
<tr>
<td>
<table width="100%" border="0" align="center">
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td><bean:message bundle='<%=lang%>' key='1027'/></td>
	<td>
	<%= (String)acc_nums.get(Integer.parseInt((String)request.getParameter("row")))%></td></tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key='7243'/></td>
		<td>
			<select name="sTrans" id="sTrans" style="WIDTH: 220px">
			 <option value="Transactiontype" >
			 <%String trType= (String)trn_type.get(Integer.parseInt((String)request.getParameter("row")));
			if(trType.equals("T")){%>
				Transfer
				<%}else{%>
				Cash
				<%}%>	
			 </option>
			</select>
        </td>
    </tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key='284'/></td>
		<td>
		  <select  name="sDoc" id = "sDoc"  style="WIDTH: 220px"  >
		   <option><%=(String)str_type.get(Integer.parseInt((String)request.getParameter("row")))%></option>
		   </select>
	    </td>
    </tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "425"/> 
		</td>
	    <td>
		      <input type="text" name="sBrnCode" d="sBrnCode"  value="<%=(String)brn_code.get(Integer.parseInt((String)request.getParameter("row")))%>" size="15">
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "39"/>* 
		</td>
	    <td>		    <input type="text" name="sAmount" id="sAmount" size="15"  value="<%=(String)dd_amt.get(Integer.parseInt((String)request.getParameter("row")))%>">

		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "40"/>* 
		</td>
	    <td>
		    <input type="text" name="sEPayName" id="sEPayName"  size="15" value="<%=(String)e_name.get(Integer.parseInt((String)request.getParameter("row")))%>">
		</td>
		<td>
		    <input type="text" name="sHPayName" id="sHPayName" size="15" value="<%=(String)h_name.get(Integer.parseInt((String)request.getParameter("row")))%>">
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "2488"/>1* 
		</td>
	    <td>
		    <input type="text" name="sEPayAdd1" id="sEPayAdd1" size="15"  value="<%=(String)e_addr1.get(Integer.parseInt((String)request.getParameter("row")))%>">
		</td>
		<td>
		    <input type="text" name="sHPayAdd1" id="sHPayAdd1" value="<%=(String)h_addr1.get(Integer.parseInt((String)request.getParameter("row")))%>">
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "2488"/>2*
		</td>
	    <td>
		    <input type="text" name="sEPayAdd2" id="sEPayAdd2" size="15"  value="<%=(String)e_addr2.get(Integer.parseInt((String)request.getParameter("row")))%>">
		</td>
		<td>
		    <input type="text" name="sHPayAdd2" id="sHPayAdd2"  value="<%=(String)h_addr2.get(Integer.parseInt((String)request.getParameter("row")))%>">
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key='7245'/></td>
		<td>
		  <select  name="sState" id = "sState" style="WIDTH: 220px" onChange="selectState()" >
		 <option><%=(String)state_name.get(Integer.parseInt((String)request.getParameter("row")))%></option> 
		

		   </select> 
	    </td>
    </tr>
	<tr>
	    <td>
	       <input type="hidden" name="state" id="state"/>
	    </td>
		 <td>
	       <input type="hidden" name="countinue" id="countinue"/>
	    </td>
		<td>
	       <input type="hidden" name="back" id="back">
	    </td>
		<td>
	       <input type="hidden" name="reset" id="reset">
	    </td>
	 </tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key='7244'/></td>
		<td>
		  <select  name="sCity" id = "sCity" style="WIDTH: 220px"  >
		  <%if(city_name!=null){%> <option value = "Select City"><%=(String)city_name.get(Integer.parseInt((String)request.getParameter("row")))%></option><%}%>
		   </select>
	    </td>
    </tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "1206"/>
		</td>
	    <td>
		    <input type="text" name="sPur" value="<%=(String)dd_pur.get(Integer.parseInt((String)request.getParameter("row")))%>">
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key= "2970"/>*
		</td>
	    <td>
		    <input type="text" name="sPanNum" id="sPanNum" value="<%=(String)pan_num.get(Integer.parseInt((String)request.getParameter("row")))%>" maxlength="12">
		</td>
	</tr>
	<tr>
	    <td width="50%">
		    <bean:message bundle="hindi" key='217'/></td>
		<td>
		  <select  name="sCurr" id = "sCurr" style="WIDTH: 220px"  >
		   <option><%=(String)curr_name.get(Integer.parseInt((String)request.getParameter("row")))%></option></select>
	    </td>
    </tr>
    <tr>
		  <td>
            <input type="button" name="countinue" class="Button" value="<bean:message bundle='<%=lang%>' key='7119'/>" onclick="Continue()">
		  </td>
		  <td >
               <input type="button" name="back" class="Button" value="<bean:message bundle='<%=lang%>' key='843'/>" onclick="back_req('<%= request.getParameter("row")%>','DD')">
		  </td>
		  <td >
               <input type="button" name="reset" class="Button" value="<bean:message bundle='<%=lang%>' key='7000'/>" onclick="Reset()">
			     </td>
    </tr>
	</table>
	</td>
	</tr>
</table>
	<% }
	}
	%>
	 </html:form>
	 <script language="JavaScript">
	 function onLoad()
	{
<logic:messagesPresent property="RecordSaved">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>


<logic:messagesPresent property="NoServer">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

}


</script>
</body>

