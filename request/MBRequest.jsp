			<%@ include file='/common/Include.jsp' %>
			<% String usrName = (String)session.getAttribute("user");
				String usrType=(String)session.getAttribute("validToken");
			
			
		
			%>



		<html>
				<tiles:insert page="/common/siteLayout.jsp" flush="true">
				<tiles:put name="title" value="Request"/>
				<% if(!usrType.equals("admin")){%>
				<tiles:put name="menu" value="/common/user_left.jsp?src=request"/>
				<%}%>
				<tiles:put name="header" value="/common/header.jsp"/>
				<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
				<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=req"/>
				<tiles:put name="line" value="/common/line.html"/>
				<tiles:put name="page_header" type="String" >
				&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
				Request >>Mobile Banking Request
				</tiles:put>
				<tiles:put name="content" type="String">
				<br>
				<br>
			<body>
					<table>
				<tr>
					<td class="simple" style="font-weight:bold;font-size:large;">	
					<i>
				Download link will be send to your registered number
				</i>
				</td></tr></table>
			</body>
			</html>
			</tiles:put>
			<tiles:put name="add" value="/Advertisement/add.jsp"/>
			<tiles:put name="footer" value="/common/footer.jsp"/>
			</tiles:insert >