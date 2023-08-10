<%@ include file="/common/Include.jsp" %>
<%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
<div class = "container">
<div class = "row">
<marquee align="right" behavior="alternate" class="header_marquee"   direction="left" hspace="10"  scrollamount="5">
<font color="black" face="Verdana, Arial, Helvetica, sans-serif">Welcome to <%=BMConfig.getProperty("WELCOMEMSGAPP","Net Banking")%>...     <%= cprContextObj.getSbankename() %>  Bank Welcomes You !!   </font></marquee>
</div>
</div>
