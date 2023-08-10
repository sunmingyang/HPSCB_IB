<%@ include file="/common/Include.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import= "java.awt.*"%>
<%@ page import= "java.awt.event.*"%>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.ArrayList, javax.servlet.ServletOutputStream "%>

<%
	int l=0;
	if(request.getAttribute("FileDetails")!=null){}
	LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");  
	String[] acc_nums=null;
	String[] acc_curr=null;
	if(userInfo!=null) {
		acc_nums =userInfo.getsIbUsr_AccNums();
		l = acc_nums.length;
		acc_curr = userInfo.getsIbUsr_Currency();
		System.out.print("array length"+l);
	}
%>

<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="content" type="String">


<script language="JavaScript">
	function bn(){
		document.getElementById("sTran_type").value="a"
		alert(document.getElementById("sTran_type").value)
	}
	function accno_blur(){
		var accCurr =new Array();
		<%
		for(int i=0;i<acc_curr.length;i++){
		%>
			accCurr['<%=i%>']='<%=acc_curr[i]%>';
	<%	}	%>

		var accValue=document.getElementById("sAccnum").value;
	<%	for(int i=0;i<acc_curr.length;i++) {
		%>
			if(accValue=='<%=acc_nums[i]%>'){
				document.getElementById("accCurr").value=accCurr['<%=i%>'];
			}
	<%	}	%>
	}
</script>


<% 
	String acc_num = (String)session.getAttribute("AccNum");
	String sCurr = (String)session.getAttribute("sCurr");
%>
<html:form action="/accsum/acc_sum.do" >

<table width="100%" 			style="border-left-style:none;border-bottom-style:none;border-right-style:none;border-left-style:none" >
<tr>
	<td width="38%" class="heading"> <bean:message bundle='<%=lang %>' key='7103'/></td>
	<td colspan="4" align="right" style="padding-right:40px">
		<input type="button" value="<bean:message bundle='<%=lang %>' key='843'/>" class="Button" onClick="back1()" >
	</td>
</tr>
<tr>
	<td>
	</td>
</tr>
<tr>
	<td colspan="2" class="heading" >
		<bean:message bundle='hindi' key='1027'/>
	</td>
	<td colspan="3" class="heading">
		<html:select property="sAccnum" onblur="accno_blur()">
			<%
			if(l!=0){ 
				for(int i=0;i<l;i++){
				%>
					<html:option value="<%=acc_nums[i]%>"><%=acc_nums[i]%> </html:option>	
			<%	}
			}	%>
		</html:select>
	</td>
</tr>
<tr>
	<td colspan="2" ><font color="brown" ><b>
		Account Currency</font>
	</td>
	<td colspan="3"><font color="brown" ><b>
		<input type="text" id="accCurr" style="border:none" readonly>
		<!-- <% String curren=(String)session.getAttribute("sCurr"); %>
		<%=(String)session.getAttribute("sCurr")%> --></b></font>
	</td>
</tr><br>
<tr>
          <td  align="left" class="heading">
		  <bean:message bundle='<%=lang%>' key='7096'/></td>
			<td width="5%">:&nbsp;</td>
			<td width="23%">
			<html:text property="sDate1" styleId="sDate1" size="15" onkeypress="isValidDatechar()"/></td>
			<td width="4%">&nbsp; </td>
			<td width="30%">
			<html:text property="sDate2" styleId="sDate2" size="15" onkeypress="isValidDatechar()"/></td>
		   </tr>
		   
		   <tr>
		   <td colspan="2">&nbsp;</td>
		   
    <td class="simple">(dd/mm/yyyy)</td>
		   <td width="4%">&nbsp; </td>
		   
    <td class="simple">(dd/mm/yyyy)</td>
		   </tr>
		   
		   <tr>
		   
          <td class="heading">  <bean:message bundle='<%=lang%>' key='7097'/></td>
		   <td width="5%">:&nbsp;</td>
			<td width="23%">
			<html:text property="sTrans" styleId="sTrans" size="15" /></td>
			<td colspan="2">&nbsp; </td>
			
		   </tr>
		   
		   
		      <tr>
		   
          <td class="heading"> <bean:message bundle='<%=lang%>' key='117'/></td>
		  <td width="5%">:&nbsp;</td>
			<td width="23%" class="simple"><bean:message bundle='<%=lang%>' key='7098'/></td>
			
   
			<td colspan="2" class="simple">
			
			
			<input type="radio" name="sTran_type" id="sTran_type" value="a" checked="true" /><bean:message bundle='<%=lang%>' key='7100'/>
			<input type="radio" name="sTran_type" id="sTran_type" value="d"/><bean:message bundle='<%=lang%>' key='7101'/> </td>
			</tr>
		   
	<tr>
    <td colspan="5" class="tbl_heading">Select a format for statement and click on "statement" button</td>
  </tr>
	 
<tr>
<td class="simple">&nbsp; </td>
<td width="5%">:&nbsp;</td>
<td colspan="3" align="left"  class="simple">
<input type="radio" id="sOut_req" name="sOut_req" value="screen"><bean:message bundle='<%=lang %>' key='7102'/></td>
</tr>  


<tr>
<td class="simple">&nbsp; </td>
<td width="5%">:&nbsp;</td>
<td colspan="3" align="left"  class="simple">

<input type="radio" name="sOut_req" id="sOut_req" value="text">Display as a plain Text</td></tr>  

<tr>
<!-- <tr>
<td class="simple">&nbsp; </td>
<td width="5%">:&nbsp;</td>
<td colspan="3" align="left"  class="simple">

<input type="radio" name="sOut_req" id="sOut_req" value="pdf">Display in pdf File</td></tr>  
 -->
<tr>
<td>&nbsp;</td>    
<td>&nbsp;</td>    
<td><input type="button" onclick="return detail_statment('<%= acc_num %>','<%=curren %>');" class="button" value="<bean:message bundle='<%=lang %>' key='3627'/>"></td>
</tr>
<tr><td align="center" colspan="5">
<div id="diverrmessage" >
<font color="Red">
	<logic:messagesPresent property="NoRecord">
		<html:errors property="NoRecord"/>
	</logic:messagesPresent>
</font>

</div>
</td>
</tr>
</table>
<input type="hidden" name ="sCurrency" id ="sCurrency" value=<%=curren %>>
<script>accno_blur()</script>
</html:form>

</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>