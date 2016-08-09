<%--
  Created by IntelliJ IDEA.
  User: anubhav
  Date: 5/8/16
  Time: 1:25 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Upload Topics</title>
    <meta name="layout" content="header"/>

</head>


<body>


<div style="text-align: center">
<h5>You can Upload Your topic from here</h5>
</div>


<g:form method="POST" controller="topic" action="insert">
<table>
<tr>
<td> Topic Name</td>
<td><input type="text" name="name" placeholder="Enter Topic Name" value="" required/></td>
</tr>
<tr>
<td>Select Visiblity</td>
<td><g:select name="topicVisible" from="${com.fintech.enums.TopicVisibleEnum.Visiblity}"/>
</td>
</tr>
<tr>
<td colspan="2">
<table>
<tr>
<td><g:actionSubmit value="Insert"/></td>
<td><input type="reset" value="Cancel"></td>
</tr>
</table>
</td>
</tr>
</table>
</g:form>

Choose Topic name For Updation
<g:form controller="topic" action="edit" method="post">
<table>
<tr><td colspan="3">
<g:if test="${flash.message}">
${flash.message}
</g:if>
</td>
</tr>
<tr>
<td>
Topic Name:
</td>
<td>
<g:select name="name" from="${topics.name}"/>
</td>
<td>
<g:actionSubmit value="Edit"/>
</td>
</tr>
</table>
</g:form>
<table cellspacing="10">
<tr>
<td><g:link controller="topic" action="show">Show Topics</g:link></td>
</tr>
</table>
</body>
</html>