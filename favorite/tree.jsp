<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<html>
<head>
<script language="JavaScript">
var favList=new Array(0);
</script>
<frameset FRAMEBORDER=no >

<frame src="<%=request.getContextPath()%>/favorite/menu.jsp" name="frame1" 
 >   
<!--<frame src="<%=request.getContextPath()%>/favorite/menu.jsp" name="frame2" SCROLLING="no">   -->
</frameset>

</head>
</html>