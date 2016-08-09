<%--
  Created by IntelliJ IDEA.
  User: anubhav
  Date: 5/8/16
  Time: 5:05 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Topics Record</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div style="text-align: center">
    Topics Data are Shown Here
</div>

<table cellspacing="5">
    <tr>
        <td colspan="6">
            <g:if test="${flash.message}">
                ${flash.message}
            </g:if>
        </td>
    </tr>
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>User</td>
        <td>Date Created</td>
        <td>Last Updated</td>
        <td>Delete?</td>
    </tr>
    <g:each in="${topics}" var="values">
            <tr>
                    <td>${values.id}</td>
                    <td>${values.name}</td>
                    <td>${values.user.id}</td>
                    <td>${values.dateCreated}</td>
                    <td>${values.lastUpdated}</td>
                    <td><a href="${g.createLink(controller: "topic",action: "delete", params: [name : values.name])}">Delete</a></td>
            </tr>
    </g:each>
    <tr>
        <td colspan="6">
            <a href="${g.createLink(controller: "user", action: "index")}">Click here To Go Back Home</a>
        </td>
    </tr>
</table>
</body>
</html>