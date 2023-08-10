<%@ include file="/common/Include.jsp" %>
<%@ page import="javax.swing.ImageIcon"%>
<%@ page import="java.awt.Toolkit"%>
<%@ page import="java.awt.Image"%>
<%@ page import="easycbs.bancmateib.signPhoto.actionForm.SignPhotoForm"%>

<% 
	String curCode="",usrName="",workPath="",accno="",sign="",photo="";
	if(session.getAttribute("IMAGEACCNO") != null){
		accno = (String)session.getAttribute("IMAGEACCNO");
	}
		
	String sAbsPath = request.getRequestURL().toString();
//	System.out.println("sAbsPath JSP : "+sAbsPath);
	String sRelPAth = sAbsPath.substring(0, sAbsPath.lastIndexOf('/'));
	sRelPAth = sRelPAth.substring(0, sRelPAth.lastIndexOf('/'));
//	System.out.println("sRelPAth JSP : "+sRelPAth);
	
	workPath = sRelPAth+"/TempImages/";
	sign = accno+"sign.bmp";
	photo = accno+"image.bmp";
//	System.out.println("WORKPATHHHHHHHHH : "+workPath);
		
%>

<html:form action="/signPhoto/SignPhoto.do" >

	<table width="100%" border = "0" cellspacing ="10" cellpadding ="10">
		<tr> 
			<td align="right"> 
				<img src="<%=workPath%><%=photo%>" width="200px" height="200px" border="2" style = "border-color:#993300;"/>
			</td>

			<td > 
				<img  src="<%=workPath%><%=sign%>" width="200px" height="75px" border="2" style = "border-color:#993300;" />
			</td>	
		</tr>
	</table>
	<table width="100%" border = "0">
		<tr> 
			<td align="center"> 
				<input type="button" value="      <bean:message bundle='<%=lang%>'key='843'/>       " class="Button" onclick="removeSignPhoto()"> 
			</td>
		</tr>
	</table>

</html:form>
<script>
	function removeSignPhoto(){
/*	for(var i = 0; i<5;i++){		
		window.parent.document.getElementById(btnNameArr[i]).style.background = "brown";     
		window.parent.document.getElementById(btnNameArr[i]).disabled = false;		
	}*/

		document.forms[0].action="../signPhoto/SignPhotoDelete.do?accno="+'<%=accno%>';
		document.forms[0].method = "POST";
		document.forms[0].submit();
		window.close();
	}

</script>
