<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head><title>Submit example</title></head>
<body>

<h3>Example Submit Page</h3>

<html:errors/>

<html:form action="/fundtransfer/fund.do?action=performSubmit">
Last Name: <html:text property="lastName"/><br>
Address:   <html:textarea property="address"/><br>
Sex:       <html:radio property="sex" value="M"/>Male 
           <html:radio property="sex" value="F"/>Female<br>
Married:   <html:checkbox property="married"/><br>
Age:       <html:select property="age">
             <html:option value="a">0-19</html:option>
             <html:option value="b">20-49</html:option>
             <html:option value="c">50-</html:option>
           </html:select><br>
           <html:submit/>
</html:form>

</body>
</html>
