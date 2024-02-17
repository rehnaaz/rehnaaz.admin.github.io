<%-- 
    Document   : RegitserClient
    Created on : 05-Feb-2024, 11:20:01 AM
    Author     : user
--%>

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
        <%
             if (session.getAttribute("AdminName") == null || session.getAttribute("AdminName").equals("null")) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
                // response.sendRedirect("/distributor/index.jsp");
             } else {

        %>
    </head>
    
    <body>
        
        <div class="wrapper wrapper-1 px-5">
            <a href="adminDash.jsp"><h3>Admin Dashboard</h3></a>
            <%@include file="adminHeader.jsp" %>
        </div>
       
    <div class="container ">
        <div class="card sidebar">
               <ul class="nav-bar">
                   <li class="nav-link"> <a href="adminDash.jsp">Dashboard</a></li>
                 <hr>
                    <li class="nav-item">
                        <a class="nav-link collapsed" data-bs-target="#users-nav" data-bs-toggle="collapse" href="#">
                          <i class="bi bi-menu-button-wide"></i><span>Users</span><i class="bi bi-chevron-down ms-auto"></i>
                        </a>
                        <ul id="users-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                            <li class="nav-link"><a href="addUser.jsp">Add New User</a></li>
                            <li class="nav-link"><a href="userData.jsp">All Users</a></li>
                            <li class="nav-link"><a href="showEmployee.jsp">Show Employees</a></li>
                        </ul>
                   </li>
                   <hr>
                   
                   <li class="nav-item">
                        <a class="nav-link collapsed" data-bs-target="#employee-nav" data-bs-toggle="collapse" href="#">
                          <i class="bi bi-menu-button-wide"></i><span>Employees</span><i class="bi bi-chevron-down ms-auto"></i>
                        </a>
                        <ul id="employee-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                            <li class="nav-link"><a href="addEmployee.jsp">Add New Employee</a></li>
                            <li class="nav-link"><a href="employeeData.jsp">All Employees</a></li>
                        </ul>
                   </li>
                   <hr>
                   
                   <li class="nav-item">
                        <a class="nav-link collapsed" data-bs-target="#clients-nav" data-bs-toggle="collapse" href="#">
                          <i class="bi bi-menu-button-wide"></i><span>Clients</span><i class="bi bi-chevron-down ms-auto"></i>
                        </a>
                        <ul id="clients-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                            <li class="nav-link"><a href="addClient.jsp">Add New Client</a></li>
                            <li class="nav-link"><a href="clientsData.jsp">All Clients</a></li>
                        </ul>
                   </li>
                </ul>
        </div>
    </div>
        
    <div class="container dashboard">
        <%
            UserRegModel user = new UserRegModel();
            ArrayList<Integer> usersAll = user.countAllUsers();
        %>
        
       
            <div class="row" style="background:#1090fd69;border-radius: 20px; margin: 50px 200px;">
                <div class="col-md-4 my-5">
                    <div class="card shadow-lg" style="width: 180px;border-radius: 25px;">
                        <a href="userData.jsp" >
                            <div class="card-body text-center">
                                <i class="fa-solid fa-users fa-xl p-5 text-danger"></i>
                                <h5 class="text-dark" style="text-align:center;margin-top: -10px;font-size:19px">Users</h5>
                                <div class="text-center">
                                    <p><span class="text-danger" style="font-size: 20px;font-weight: 700"><%= usersAll.get(0)%></span><span></span></p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 my-5">
                    <div class="card shadow-lg" style="width: 180px;border-radius: 25px;">
                        <a href="employeeData.jsp" >
                            <div class="card-body text-center">
                                <i class="fa-solid fa-users fa-xl p-5"></i>
                                <h5 class="text-dark" style="text-align:center;margin-top: -10px;font-size:19px">Employees</h5>
                                <div class="text-center">
                                    <p><span class="" style="font-size: 20px;font-weight: 700"><%= usersAll.get(1)%></span><span></span></p>
                                    
                                </div>
                            </div>
                        </a>
                    </div>
                </div> 
                <div class="col-md-4 my-5 ">
                    <div class="card shadow-lg" style="width: 180px;border-radius: 25px;">
                        <a href="clientsData.jsp" >
                            <div class="card-body text-center ">
                                <i class="fa-solid fa-users fa-xl p-5 text-success"></i>
                                <h5 class="text-dark" style="text-align:center;margin-top: -10px;font-size:19px">Clients</h5>
                                <div class="text-center">
                                    <p><span class="text-success" style="font-size: 20px;font-weight: 700"><%= usersAll.get(2)%></span><span></span></p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
      <%}%>
    </body>
</html>
