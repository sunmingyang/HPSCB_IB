<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>


<script language="JavaScript">
function hello(yy)
{
	if (yy!=null)
	{
	disabledControlsOnAction(document.forms[0],"ibreq");
	}
}
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" type="String">
<bean:message bundle='hindi' key='7190' />
</tiles:put>
<%if(request.getParameter("row")==null){ %>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<%}%>
 <tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="page_header" type="String" >
<bean:message bundle="hindi" key="7190" />
</tiles:put> 
<tiles:put name="content" type="String">


<% String acc_num=(String)request.getParameter("acc_no");
 String acc_num21=(String)request.getParameter("sAccnum");

%>
<body onLoad="hello(<%=request.getParameter("row")%>)">
<html:form action="/request/reqchk">


	  <table width="99%" >
        <tr> 
          
    <td width="15%" height="26" class="heading">&nbsp; </td>
          <td colspan="4" align="right" style="padding-right:40px"> 
		  <input type="button"  name="back"  value="<bean:message bundle='<%=lang %>' key='843'/>"
		   class="Button" onClick="back_req(<%=(String)request.getParameter("row")%>,'RD')" > 
          </td>
        </tr>
      </table>
	  
	  
<table width="80%" border="1" cellpadding="0" cellspacing="0" bordercolor="brown" style="border-left:none;border-right:none;border-top:none;border-bottom:none;" >
<tr>
<td  align="center">
<table  width="100%" cellpadding=0 cellspacing=0>
<%
LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");   
if(userInfo!=null)
{ 
String[] acc_nums =userInfo.getsIbUsr_AccNums();
	int j=acc_nums.length;

if(j!=0)
{ %> 
	 
	 
	  <tr> 
        <td colspan="5" class="tbl_heading"><bean:message bundle="hindi" key="7190" /></td>
       </tr>
       <tr><td colspan="5">&nbsp;</td></tr>
		<tr> 
          <td  colspan="2" class="heading" >  <bean:message bundle='<%=lang%>' key='7196' /></td>
		   <td width="3%" class="heading">:&nbsp;</td>
          <td colspan="2" class="heading"> 
		  <select class="formField" name="sAccList">
   <% for(int i=0;i<j;i++){ %>
              <option><%= acc_nums[i] %></option>
              <% } // for %>

            </select> </td>
        </tr>
      
        <tr> 
          <td colspan="5">&nbsp;</td>
        <tr> 
          <td colspan="2" align="left" class="heading">  <bean:message bundle='<%=lang%>' key='7193' /></td>
          <td width="3%" class="heading">:&nbsp;</td>
          <td  colspan="2"class="simple"><input type="text" class="formField" size="20" onKeyPress="isValidAmount(event,document.forms[0].sAmt)" name="sAmt">
		  <input type="hidden"  id="sPrev_page" name="sPrev_page" value='rdReq'></td>
        </tr>
        <tr> 
          <td colspan="5">&nbsp;</td>
        </tr>
        <tr> 
          <td class="heading" colspan="2">  <bean:message bundle='<%=lang%>' key='7195' /></td>
          <td width="3%" class="heading">:&nbsp;</td>
          <td width="16%"  class="simple"><select name="sYear" class="formField" id="sYear">
                    <option value="">Year</option>
			  <% for(int t=0;t<=50;t++)
			  { %>
			  
			   <option value="<%=t %>"><%=t %></option>
			   
			   
			   <% } %>
            </select>
           <bean:message bundle='<%=lang%>' key='5758' /> </td>
          <td width="23%"  class="simple"><select name="sMonth" class="formField" id="sMonth">
                    <option value="">Month</option>
			    <% for(int w=0;w<=11;w++)
			  { %>
			  
			   <option value="<%=w %>"><%=w %></option>
			   
			   
			   <% } %>
            </select>
            <bean:message bundle='<%=lang%>' key='5759' /></td>
        
        </tr>
        <tr> 
          <td colspan="5">&nbsp;</td>
        </tr>
		
		<% } 
 } // if ends  %>
 
 <% 	HashMap req_detail=(HashMap)session.getAttribute("req_detail");   
	if(req_detail!=null)
	{ 
	ArrayList acc_nums=(ArrayList)req_detail.get("req_AccNum");
	
	ArrayList req_Month=(ArrayList)req_detail.get("req_Month");
	ArrayList req_Year=(ArrayList)req_detail.get("req_Year");
	ArrayList req_Amount=(ArrayList)req_detail.get("req_Amount");
	int k=acc_nums.size();
	if(k!=0)
	{ 
	%>
	
	
	 
	  <tr> 
        <td colspan="5" class="tbl_heading"><bean:message bundle="hindi" key="7190" /></td>
       </tr>
       <tr><td colspan="5">&nbsp;</td></tr>
		<tr> 
          <td  colspan="2" class="heading" >  <bean:message bundle='<%=lang%>' key='7196' /></td>
		   <td width="3%" class="heading">:&nbsp;</td>
          <td colspan="2" class="heading"> 
		  <select class="formField" name="sAccList">
  
             	   <option ><%= (String)acc_nums.get(Integer.parseInt((String)request.getParameter("row")))%></option>

  

            </select> </td>
        </tr>
      
        <tr> 
          <td colspan="5">&nbsp;</td>
        <tr> 
          <td colspan="2" align="left" class="heading">  <bean:message bundle='<%=lang%>' key='7193' /></td>
          <td width="3%" class="heading">:&nbsp;</td>
          <td  colspan="2"class="simple">
		  
		  <input type="text" class="formField" size="20" value="<%= (String)req_Amount.get(Integer.parseInt((String)request.getParameter("row")))%>" readonly="true" name="sAmt">
		
		  <input type="hidden"  id="sPrev_page" name="sPrev_page" value='rdReq'></td>
        </tr>
        <tr> 
          <td colspan="5">&nbsp;</td>
        </tr>
        <tr> 
          <td class="heading" colspan="2">  <bean:message bundle='<%=lang%>' key='7195' /></td>
          <td width="3%" class="heading">:&nbsp;</td>
          <td width="16%"  class="simple">
		  <select name="sYear" class="formField" id="sYear" disabled>
		   <option ><%= (String)req_Year.get(Integer.parseInt((String)request.getParameter("row")))%></option>
          </select>
           <bean:message bundle='<%=lang%>' key='5758' /> </td>
          <td width="23%"  class="simple">
		  
		  <select name="sMonth" class="formField" id="sMonth">
                
		    <option ><%= (String)req_Month.get(Integer.parseInt((String)request.getParameter("row")))%></option>

           </select>
            <bean:message bundle='<%=lang%>' key='5759' /></td>
        
        </tr>
        <tr> 
          <td colspan="5">&nbsp;</td>
        </tr>
		
		<% } 
		} 
			
	%>
        <tr> 
          <td colspan="5">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="3" align="center">
		  <input type="button" class="button"  onclick="return rd_submit()" value="<bean:message bundle='<%= lang %>' key='7119'/>"></td>
          <td colspan="2" align="center"></td>
        </tr>
      </table>
</td></tr></table>
</html:form>
</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>