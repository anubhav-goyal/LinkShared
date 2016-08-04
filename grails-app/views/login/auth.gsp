<%--
  Created by IntelliJ IDEA.
  User: anubhav
  Date: 4/8/16
  Time: 1:01 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Login &amp; Register Templates</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"/>
    <link rel="stylesheet" href="${resource(dir: "bootstrap/css",file: "bootstrap.min.css")}"/>
    <link rel="stylesheet" href="${resource(dir: "font-awesome/css",file: "font-awesome.min.css")}"/>
    <link rel="stylesheet" href="${resource(dir: "css",file: "form-elements.css")}"/>
    <link rel="stylesheet" href="${resource(dir: "css",file: "style.css")}"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>

        <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="${resource(dir: "ico",file: "favicon.png")}"/>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${resource(dir: "ico",file: "apple-touch-icon-144-precomposed.png")}"/>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${resource(dir: "ico",file: "apple-touch-icon-114-precomposed.png")}"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${resource(dir: "ico",file: "apple-touch-icon-72-precomposed.png")}"/>
    <link rel="apple-touch-icon-precomposed"  href="${resource(dir: "ico",file: "apple-touch-icon-57-precomposed.png")}"/>

    <g:javascript>
        $(document).ready(function(){
            $('.registration-form input[type="text"], .registration-form input[type="password"], .registration-form textarea').on('focus', function() {
                $(this).removeClass('input-error');
            });

            $('.registration-form').on('submit', function(e) {

                $(this).find('input[type="text"], input[type="password"], textarea').each(function(){
                    if( $(this).val() == "" ) {
                        e.preventDefault();
                        $(this).addClass('input-error');
                    }
                    else {
                        $(this).removeClass('input-error');
                    }
                });

            });
        });
    </g:javascript>
</head>

<body>

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">

            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>Share Link</strong> Login &amp; Register Forms</h1>
                    <div class="description">
                        <p>
                            Hello you can do free  <strong>"Login and Register Here"</strong> and can grow your knowlege,
                            skills by sharing your topics and views.
                        </p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-5">

                    <div class="form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>Login</h3>
                                <p>Enter username and password to log on:</p>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-lock"></i>
                            </div>
                        </div>
                        <div class="form-bottom">
                            <form role="form" action="${resource('file': 'j_spring_security_check')}" method="post" class="login-form">
                                <div class="form-group text-warning">

                                    <g:if test='${flash.message}'>
                                        <div class='login_message'>${flash.message}</div>
                                    </g:if>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-username">Username</label>
                                    <input type="text" name="j_username" placeholder="Username..." class="form-username form-control" id="form-username">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-password">Password</label>
                                    <input type="password" name="j_password" placeholder="Password..." class="form-password form-control" id="form-password">
                                </div>
                                <div class="from-group">
                                    %{--<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>--}%
                                    %{--Remember Me--}%
                                </div>
                                <button type="submit" class="btn">Sign in!</button>
                            </form>
                        </div>
                    </div>

                    %{--<div class="social-login">--}%
                        %{--<h3>...or login with:</h3>--}%
                        %{--<div class="social-login-buttons">--}%
                            %{--<a class="btn btn-link-2" href="#">--}%
                                %{--<i class="fa fa-facebook"></i> Facebook--}%
                            %{--</a>--}%
                            %{--<a class="btn btn-link-2" href="#">--}%
                                %{--<i class="fa fa-twitter"></i> Twitter--}%
                            %{--</a>--}%
                            %{--<a class="btn btn-link-2" href="#">--}%
                                %{--<i class="fa fa-google-plus"></i> Google Plus--}%
                            %{--</a>--}%
                        %{--</div>--}%
                    %{--</div>--}%

                </div>

                <div class="col-sm-1 middle-border"></div>
                <div class="col-sm-1"></div>

                <div class="col-sm-5">

                    <div class="form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>Sign up now</h3>
                                <p>Fill in the form below to get instant access:</p>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-pencil"></i>
                            </div>
                        </div>
                        <div class="form-bottom">
                            <g:form role="form" controller="user" action="register" method="post" class="registration-form">
                                <div class="form-group">
                                    <g:if test="${flash.error}">
                                        <g:message code="${flash.error}"/>
                                    </g:if>
                                    <label class="sr-only" for="form-first-name">First name</label>
                                    <g:textField name="firstName" placeholder="First name..." class="form-first-name form-control" id="form-first-name"/>
                                    %{--<input type="text" name="firstname" placeholder="First name..." class="form-first-name form-control" id="form-first-name">--}%
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-last-name">Last name</label>
                                    <g:textField name="lastName" placeholder="last name..." class="form-last-name form-control" id="form-last-name"/>
                                    %{--<input type="text" name="lastname" placeholder="Last name..." class="form-last-name form-control" id="form-last-name">--}%
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-email">Email</label>
                                    <g:textField name="email" placeholder="Email..." class="form-email form-control" id="form-email"/>
                                    %{--<input type="text" name="email" placeholder="Email..." class="form-email form-control" id="form-email">--}%
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-username">User Name</label>
                                    <g:textField name="username" placeholder="User name..." class="form-user-name form-control" id="form-user-name"/>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-password">Password</label>
                                    <g:passwordField name="password" placeholder="Password..." class="form-password form-control" id="form-password-sign"/>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-username">Confirm Password</label>
                                    <g:passwordField name="confirmPassword" placeholder="Confirm Password..." class="form-password form-control" id="form-confirm-password-sign"/>
                                </div>
                                %{--<div class="form-group">--}%
                                    %{--<label class="sr-only" for="form-about-yourself">About yourself</label>--}%
                                    %{--<textarea name="form-about-yourself" placeholder="About yourself..."--}%
                                              %{--class="form-about-yourself form-control" id="form-about-yourself"></textarea>--}%
                                %{--</div>--}%
                                <button type="submit" class="btn">Sign me up!</button>
                            </g:form>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

</div>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">

            <div class="col-sm-8 col-sm-offset-2">
                <div class="footer-border"></div>
                <p> <a href="http://www.fintech.in" target="_blank"><strong>Fintech Lab Pvt. Sol. Ltd. </strong></a>
                     <i class="fa fa-smile-o"></i></p>
            </div>

        </div>
    </div>
</footer>

<!-- Javascript -->
<g:javascript src="jquery-1.11.1.min.js"/>
<g:javascript src="bootstrap.min.js"/>
<g:javascript src="jquery.backstretch.min.js"/>
<g:javascript src="scripts.js"/>
<g:javascript>
    function matchPass()
    {
        var pass = document.getElementById("form-password-sign");
        var conf_pass = document.getElementById("form-confirm-password-sign");
        alert("password :"+ pass.val() +" conf : "+conf_pass.val());
        //if(pass == " " || conf_pass = " ")
        //return false
        if(pass == conf_pass)
            return true;
        else
            alert("Wrong password");
        return false;
    }
</g:javascript>

<!--[if lt IE 10]>

        <![endif]-->

</body>

</html>