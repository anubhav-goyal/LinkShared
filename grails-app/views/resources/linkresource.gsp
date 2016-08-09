<%--
  Created by IntelliJ IDEA.
  User: anubhav
  Date: 8/8/16
  Time: 2:15 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="layout" content="header">
    <title>

    </title>
    <r:layoutResources/>
</head>

<body>
<g:form method="post" controller="linkResource" action="create" role="form" class="form-group">
<div class="form-group">
    <div class="col-md-4">
        URL Link:
    </div>
    <div class="col-md-8" style="align-content: inherit">
        <input type="text" id="url" name="url" required>
    </div>
    <div class="col-md-4">
        Description:
    </div>
    <div class="col-md-8" style="align-content: inherit; margin-top: inherit">
        <textarea id="description" name="description" required></textarea>
    </div>
    <div class="col-md-4">
        Topic:
    </div>
    <div class="col-md-8" style="align-content: inherit; margin-top: inherit">
        %{--<g:select name="topic" from="${topic}"/>--}%
        <linktopics:topics/>
    </div>
    <div class="form-group" style="align-items: center">
        <div class="col-md-6">
            <g:actionSubmit value="Create"/>
        </div>
    </div>
    <div class="form-group" style="align-items: center">
        <div class="col-md-6">
            <input type="reset" value="Reset">
        </div>
    </div>

</div>
</g:form>
<r:layoutResources/>
</body>
</html>