<%-- 
    Document   : RegitserClient
    Created on : 05-Feb-2024, 11:20:01 AM
    Author     : user
--%>

<%@page import="com.qt.practice.models.Admin"%>
<%@page import="com.qt.practice.models.UserRegModel"%>
<%@page import="com.qt.practice.models.EmployeeModel"%>
<%@page import="com.qt.practice.beans.EmployeeBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qt.practice.models.ClientModel"%>
<%@page import="com.qt.practice.beans.AddClient"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <link rel="stylesheet" href="../asset/style.css">

        <title>Dashboard</title>
        
        <script>
             function togglePasswordVisibility() {
            var passwordInput = document.getElementById("password");
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
            } else {
                passwordInput.type = "password";
            }
        }
        </script>
        
    </head>
    <% Admin modal = new Admin();
        %>
    <body>
        <div class="container" style="padding-top: 70px">
            <div class="box-form">
                <div class="right card shadow">
                    <div class="log-des">
                        <h2 class=" text-center" style="font-size: 25px; color: #000099;">Admin</h2>
                    </div><br>
                    <form action="../AdminController" method="post" name="frm">
                        <input type="hidden" name="action" value="login">
                        <p>Login your Account </p>
                        <div class="inputs">
                            <input type="text" placeholder="Number" name="txtEmail">
                            <br>
                            <input type="password" id="password" placeholder="Password" name="txtPassword">
                            <span style="cursor: pointer;position: absolute; margin-left: -30px;margin-top: 37px; " id="showPassword" onclick="togglePasswordVisibility()"> <i class="fa-solid fa-eye" ></i></span> 
                           
                        </div><br>  
                        <p class="text-danger">${param.message}</p>
                        <div class="submit-btn">                            
                            <button type="submit" onclick="return loginV();"style="margin-right: 80px">Login</button>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
        
    </body>
</html>
