<%--
  Created by IntelliJ IDEA.
  User: anubhav
  Date: 8/8/16
  Time: 12:15 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${resource(dir:"css",file: "bootstrap.css")}"/>
    <link rel="stylesheet" href="${resource(dir:"css",file: "bootstrap-theme.css")}"/>

    <g:javascript src="jquery-1.11.1.min.js"/>
    <g:javascript src="bootstrap.min.js"/>
    <g:layoutHead/>
</head>

<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
               <h4>Link Sharing</h4>
            </a>
        </div>

        <form class="navbar-form navbar-left">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="${g.createLink(controller: "linkResource",action: "create")}">
                    Create Resource</a></li>
            <li><a href="${g.createLink(controller: "user",action: "index")}">
                    Create Topic</a></li>
            <li><a href="#">Link</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><sec:loggedInUserInfo field="username"/> <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Users</a></li>
                    <li><a href="#">Posts</a></li>
                    <li><a href="${g.createLink(controller: "logout",action: "index")}">Logout</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
    <g:layoutBody/>

<footer>
    <div class="col-md-12" style="text-align: center">
        Fintech Pvt.Ltd. Noida-62
    </div>
</footer>
</body>
</html>