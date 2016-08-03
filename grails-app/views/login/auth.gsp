<%--
  Created by IntelliJ IDEA.
  User: surbhi
  Date: 2/8/16
  Time: 12:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="${resource(dir: "css",file: "bootstrap.css")}"/>
    <link rel="stylesheet" href="${resource(dir: "css",file: "bootstrap-theme.css")}"/>
    <g:javascript src="bootstrap.js"/>
</head>

<body>
<div class="container">
    <g:if test='${flash.message}'>
        <div class='login_message'>${flash.message}</div>
    </g:if>
    <form action='${resource('file': 'j_spring_security_check')}' method='POST' id='loginForm' class="form-horizontal" autocomplete='off'>
        <div class="form-group">

            <label for="inputEmail3" class="col-sm-2 control-label">User Name</label>
            <div class="col-sm-4">
                <input type="text" name="j_username" class="form-control" id="inputEmail3" placeholder="User Name">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
            <div class="col-sm-4">
                <input type="password" name="j_password" class="form-control" id="inputPassword3" placeholder="Password">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Remember me
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <g:link controller="CreateAccount" action="signup">
                            Click Here for Sign up
                        </g:link>
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Sign in</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>