<Table>

<%
String userId = (String)session.getAttribute("userid");
%>

<tr><td><img src="/Advertisement/ib1.jpg" width="90px" ></td></tr>
<tr><td><img src="/Advertisement/logo.jpg" width="90px" ></td></tr>
<tr><td><img src="/Advertisement/HomeImg.jpg" width="90px" height="100px" ></td></tr>
<tr><td><img src="/Advertisement/ibanking2.jpg" width="90px" height="40px" ></td></tr>
<tr><td><input type="button" id="promptme" value="PromptMe" onclick="openPromptme('<%=userId%>')"></td></tr>
<tr><td><img src="/Advertisement/call.jpg" width="90px" height="80px"></td></tr>

</table>