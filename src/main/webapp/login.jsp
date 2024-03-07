<%-- 
    Document   : login
    Created on : Feb 28, 2024, 10:48:58 AM
    Author     : QuocCu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
         <%@include file="./general/head_html.jsp" %>
    </head>
    <body>
        <div class="main-wrapper login-body">
            <div class="login-wrapper">
                <div class="container">
                    <div class="loginbox">
                        <div class="login-left" style="background: #ea7127;">
                            <img class="img-fluid" src="assets/img/login.png" alt="Logo">
                        </div>
                        <div class="login-right">
                            <div class="login-right-wrap">
                                <h1 style="text-align: center">Student Relation Office Management System</h1>
                                <p class="account-subtitle"></p>
                                <h2 style="text-align: center">Login</h2>
                                <form id="myFormID" action="login" method="post">
                                    <div class="form-group local-forms" style="margin-bottom:30px">
                                        <label>Select Your Role</label>
                                        <select id="selectRole" class="form-control select" name="userRoleLogin" onchange="chooseRole(event)">
                                            <%
                                                String role = (String) session.getAttribute("role");
                                                if (role == null) {
                                                    role = "";
                                                }
                                            %>
                                            <option value="0">Select Role</option>
                                            <option value="1" <%=role.equals("Admin") ? "selected" : ""%>>Admin</option>
                                            <option value="2" <%=role.equals("Event Manager") ? "selected" : ""%>>Event Manager</option>
                                            <option value="3" <%=role.equals("Club Manager") ? "selected" : ""%>>Club Manager</option>
                                            <option value="4" <%=role.equals("Student") ? "selected" : ""%>>Student</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <%
                                            String error = (String) request.getAttribute("errorLogin");
                                            if (error == null) {
                                                error = "";
                                            }
                                        %>
                                        <p id="errorLogin" style="text-align: center;color: red;"><%=error%></p>
                                        <p id="message" style="text-align: center;color: red;display:none">Please choose role before login</p>
                                        <a id="loginGoogle" onclick="submitLogin(event)" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/login&response_type=code&client_id=1093071600440-1m4qgqcjvkmerb6vomi3rmtsntn9eoth.apps.googleusercontent.com&approval_prompt=force" class="btn btn-primary btn-block"><i style="margin-right:15px;font-size: 18px" class="fab fa-google-plus-g"></i>Login With Google</a>
                                    </div>
                                    <div class="login-or">
                                        <span class="or-line"></span>
                                    </div>
                                    <input id="submit" type="submit" name="submitButton" value="Submit Form" style="visibility: hidden;">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <%@include file="./general/js.jsp" %>
        <script>
                                            function chooseRole(event) {
                                                document.getElementById("submit").click();
                                            }
                                            function submitLogin(event) {
                                                event.preventDefault();
                                                let roleValue = document.getElementById("selectRole").value
                                                if (roleValue != 0) {
                                                    document.getElementById("message").style.display = 'none';
                                                    window.location.href = document.getElementById("loginGoogle").getAttribute("href");
                                                } else {
                                                    document.getElementById("message").style.display = 'block';
                                                }
                                            }

        </script>
    </body>
</html>
