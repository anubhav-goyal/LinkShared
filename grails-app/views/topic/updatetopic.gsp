<%--
  Created by IntelliJ IDEA.
  User: anubhav
  Date: 5/8/16
  Time: 6:27 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Update Record</title>
    <meta name="layout" content="main"/>
</head>

<body>
    <g:form controller="topic" action="update" method="post">
        <table>
            <tr>
                <td>ID</td>
                <td><input type="text" name="id" value="${records?records.id:""}" readonly></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="${records?records.name:""}" required></td>
            </tr>
            <tr>
                <td>user</td>
                <td><input type="text" name="user" value="${records?records.user.id:""}" readonly></td>
            </tr><tr>
                <td>Visiblity</td>
                <td><g:select name="topicVisible" from="${com.fintech.enums.TopicVisibleEnum.Visiblity}" value="${records?records.visiblity:""}"/></td>
            </tr>
            <tr>
                <td> <g:actionSubmit value="Update"/></td>
                <td><input type="reset" value="RESET"></td>
            </tr>

        </table>
    </g:form>
</body>
</html>