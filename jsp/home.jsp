<%@ include file="/common/Include.jsp" %>
<%
String AdminName=(String)session.getAttribute("AdminName");
%>
<%
	String connected[][] = null;
	int connect=0,disconnect=0;
	if(session.getAttribute("BrStatus1") != null)
		{
			System.out.println("in brstatus1 on jsp");
		connected = (String[][])session.getAttribute("BrStatus1");
		for(int i = 0;i<connected.length;i++){
			if(connected[i][3].trim().equals("C"))
				{
				System.out.println("in connected");
				connect++;
			     }
			else if(connected[i][3].trim().equals("D"))
				{
				System.out.println("in disconnected");
				disconnect++;
			    }
		}
		
	}
	
%>

<script>
function startpoint()
{
 document.getElementById("RO").value="";
//alert("getting value for zo");

	<%
    
	if(session.getAttribute("count")=="c")
	{
		System.out.println("in jsp in conition");
	%>
		document.forms[0].action="/openaction.do?src=zoLoadforhome"
		document.forms[0].method="POST";
		document.forms[0].submit();
	<%
	}
    %>


}


function callrovalue()
{
	   //  alert("in call for ZO");
	    document.forms[0].action="/openaction.do?src=rovalueforhome"
		document.forms[0].method="POST";
		document.forms[0].submit();
}

function callforBranchonRo()
{
	alert("calling  branch for ro selected");
        document.forms[0].action="/openaction.do?src=getbranchROselected"
		document.forms[0].method="POST";
		document.forms[0].submit();

}

</script>

<%
String gotroro[][]=null;
if(session.getAttribute("szoloadmaster")!=null)
	{
	System.out.println("in session home attribute on adding szoloadmaster");
    gotroro=(String[][])session.getAttribute("szoloadmaster");
	//session.removeAttribute("szoloadmaster");
	}	

%>

<%
String gotro[][]=null;
if(session.getAttribute("sroload")!=null)
	{
	
	System.out.println("in session gget attribute on adding ro");
    gotro=(String[][])session.getAttribute("sroload");
	session.removeAttribute("sroload");
	}	

%>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="page_header" type="String">Welcome &nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</tiles:put>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su"/>
<tiles:put name="content" type="String">
<body onkeyDown="StopKeyHandler()" >
	<br><br>
	<table width="81%" align="left" border=1 bordercolor="#0270CF" cellspacing=0 cellpadding=0>
	<tr>
	<td style="border-right:0;width:235;height:180; background-image:url(/images/welcome2.jpg)">
		&nbsp;
	</td>
	<td style="padding-right:10;border-left:0;background-image:url(/images/welcomePart3.jpg);background-position:left" align="right" >
		Welcome <b><%if(AdminName!=null) out.print(AdminName.toUpperCase());%>&nbsp;!</b>
	
	</td>
</tr>
</table>
</body>

</tiles:put>

</tiles:insert>

<%
if(session.getAttribute("ZORO")!=null)
{%>

	<script>
		
		//alert("in get session zoro"+ '<%=(String)session.getAttribute("ZORO") %>');
    	document.getElementById("ZO").value ='<%=(String)session.getAttribute("ZORO") %>';

	</script>
		

	<% 
		session.removeAttribute("ZORO");
}

%>

<style>
.tableHeader{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: #92610E;
        text-decoration: none;

}
.tableRowText{
font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: #092771;
        text-decoration: none;

}
</style>

