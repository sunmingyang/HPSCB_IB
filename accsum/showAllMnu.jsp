<%@ include file="/common/Include.jsp" %>
<%@ page import="java.util.HashMap"%>
<% 
	String  usrName="";
	String  custID="";
	String userInfo[][] = null;
	if(session.getAttribute("user") != null)
	usrName = (String)session.getAttribute("user");
	custID= (String)session.getAttribute("custid");
	userInfo = (String [][])session.getAttribute("userInfo");	
	String brnCode=userInfo[0][1];


	String mainMenu[][] = null;
	HashMap<Object,Object> allMnu =new HashMap<Object,Object>();
	HashMap<Object,Object> subMenu =new HashMap<Object,Object>();
	if(session.getAttribute("menuData") != null) {
		allMnu=(HashMap<Object,Object>)session.getAttribute("menuData");	
		if(allMnu !=null){
			mainMenu = (String[][]) allMnu.get("MainMenu");			
			subMenu = (HashMap<Object,Object>) allMnu.get("SubMenu");
		}
	}
%>
<script>
	



</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<!-- <html:form action="/jsp/login.do"> -->
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=acc"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=accSummary&src=acc"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
</tiles:put>
<script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
<body style="margin:0 0 0 0;"><br>


	

			<table  width="700px">
			<tr>
			<td  class="wrapperDataTableTR" align="center" style=" background-color: #ADD8E6;"> account summary >> Show menu </td>	
			</tr>
			</table>
			<%int count = 0;%>
			<table>
			<tr><td  valign="top"style="padding-top: 21px;">
			<div align="left" style="border-style:solid;border-width: 1px; border-color:#0000FF; width:230px;">
			<%if(mainMenu!= null){
				for(int i=0;i<mainMenu.length;i++){ count ++;
					if(count >19) { %>
						</td><td valign="top" style="padding-top: 21px;"> <div align="left" style="border-style:solid; border-width: 1px; border-color: #0000FF; width:230px; margin-top=0px">
					<% count =0; }%>
				
				<div style="background-color: 	#ADD8E6; font-family: Times New Roman, Georgia, Serif; width:230px;"> 
				<font size="3"><b>&#9661 <%=mainMenu[i][1]%></b></font></div>
				<%String [][] submnu= (String[][])subMenu.get(mainMenu[i][0]);
				if(submnu!= null){  %>
					<%for(int j=0;j<submnu.length;j++){ count ++;%>
<div align="left" style=" width:230px; font-family: Times New Roman, Georgia, Serif; border-bottom: thick dashed #0000FF;border-width: 1px;"> 
<font size="2"><ul style="list-style-type:square; align:left;"><li><%=submnu[j][2]%></li></ul></font>	
</div>
						<%}%>

				 <%}else{%>
						<div align="left" style=" width:230px;">
						<ul></ul>	
						</div>
				 <%}}%>
				<%}%>
			</div>		
			</table>
		</body>

		
</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp"/>
</tiles:insert>







<style>
.dataTableTH{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
		
        font-weight: bold;
        color: #092771;
        text-decoration: none;
		background-color:#BFBFBF;
		text-align:center;

}
.dataTableTD{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
        text-decoration: none;
		background-color:#EFEFEF;
		text-align:center;


}
.dataTableTD1{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
        text-decoration: none;
		background-color:#EFEFEF;
		text-align:right;


}
</style>
