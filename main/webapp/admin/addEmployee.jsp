<%-- 
    Document   : index
    Created on : 23-Jan-2024, 12:50:02 PM
    Author     : user
--%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.practice.models.UserRegModel"%>
<%@page import="com.qt.practice.beans.RegisterUser"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../asset/style.css">

    <title>New Employee</title>
           <%
             if (session.getAttribute("AdminName") == null || session.getAttribute("AdminName").equals("null")) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
                // response.sendRedirect("/distributor/index.jsp");
             } else {

        %>
</head> 
    <%
        UserRegModel usermodel = new UserRegModel();
        ArrayList<RegisterUser> Users = usermodel.select();
    %>
<body>
    <div class="wrapper wrapper-1 px-5">
            <a href="adminDash.jsp"><h3>Admin Dashboard</h3></a>
            <%@include file="adminHeader.jsp" %>
        </div>
    <div class="container">
        <div class="card sidebar">
                 
               <ul class="nav-bar">
                   <li class="nav-link"><a href="adminDash.jsp">Dashboard</a></li>
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
    <div class="container">

       <div class="row ">
         <div class="col-lg-7 mx-auto">
           <div class="card mx-auto bg-light shadow-lg">
               <div class="card-body userCard">
                 <div class = "container">
                     <div class="pb-5 ">
                           <h2>Add Employee</h2>
                      </div>
                   <form id="contact-form" role="form" action="../EmployeeController" method="get">
                       <input type="hidden" name="action" value="insert">


                     <div class="controls">
                       <div class="row">
                           <div class="col-md-3">
                               <div class="form-group">
                                   <label for="first_name">First Name</label>
                                   <input id="first_name" type="text" name="fName" class="form-control shadow" placeholder="Please enter your firstname"
                                          required="required" data-error="Firstname is required.">
                               </div>
                           </div>
                           <div class="col-md-3">
                               <div class="form-group">
                                   <label for="last_name">Last Name</label>
                                   <input id="last_name" type="text" name="lName" class="form-control shadow" placeholder="Please enter your lastname"
                                          required="required" data-error="Lastname is required.">
                               </div>
                           </div>
                       </div>
                         <div class="row">
                           <div class="col-md-3">
                               <div class="form-group">
                                   <label for="designation">Designation</label>
                                   <input id="designation" type="text" name="designation" class="form-control shadow" placeholder="Please enter your designation"
                                          required="required" data-error="designation is required.">
                               </div>
                           </div>
                           <div class="col-md-3">
                               <div class="form-group">
                                   <label for="dept">Department</label>
                                   <input id="dept" type="text" name="dept" class="form-control shadow" placeholder="Please enter your Department"
                                          required="required" data-error="Department is required.">
                               </div>
                           </div>
                       </div>

                       <div class="row">
                           <div class="col-md-3">
                               <div class="form-group">
                                   <label for="mobile_no">Mobile Number</label>
                                   <input id="mobile_no" type="text" name="mNumber" class="form-control shadow" placeholder="Please enter your mobile" 
                                          required="required" data-error="Valid email is required.">
                               </div>
                           </div>
                           <div class="col-md-3">
                               <div class="form-group">
                                   <label for="email">E-mail</label>
                                   <input id="email" type="email" name="email" class="form-control shadow" placeholder="Please enter your email" 
                                          required="required" data-error="Valid email is required.">
                               </div>
                           </div>
                       </div>

                         <div class="row">
                           <div class="col-md-3">
                               <div class="form-group">
                                   <label for="city">City</label>
                                   <input id="city" type="text" name="city" class="form-control shadow" placeholder="Please enter your city" 
                                          required="required" data-error="City is required.">
                               </div>
                           </div>
                          <div class="col-md-3">
                               <div class="form-group">
                                   <label for="salary">Salary</label>
                                   <input id="salary" type="text" name="salary" class="form-control shadow" placeholder="Please enter your salary" 
                                          required="required" data-error="Salary is required.">
                               </div>
                           </div>
                       </div>
                         <div class="row">
                         <div class="col-md-3">
                               <div class="form-group">
                                   <label for="users">Select User</label>
                                   <select name="userId" class="selectUser">
                                       <option value=" ">Select User Name</option>
                                           <% 
                                           for (RegisterUser user: Users) {
                                           %>
                                       <option name="userId" value="<%= user.getId()%>"><%= user.getFirst_name()%></option>
                                           <% 
                                               } 
                                           %>
                                    </select>

                               </div>
                               
                           </div>
                       </div>
                       <div class="row">

                           <div class="col-md-12">
                               <button type="submit" class="btn btn-success shadow"> Add Employee </button> 
                               <button type="button" class="btn btn-info shadow" style="color: #fff;float: right;">
                                   <a href="employeeData.jsp" style="color: inherit; text-decoration: none;">All Employees</a>
                               </button>
                           </div>
                       </div>

                     </div>
                        <p>${param.message}</p>
                   </form>
                 </div>
               </div>
             </div>
           <!-- /.8 -->
           </div>
       <!-- /.row-->
       </div>
       </div>
  </div>
<%
    }
%>
</body>
</html>