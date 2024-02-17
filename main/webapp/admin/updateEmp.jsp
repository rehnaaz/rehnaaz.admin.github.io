<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qt.practice.models.EmployeeModel"%>
<%@page import="com.qt.practice.beans.EmployeeBean"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                <link rel="stylesheet" href="../asset/style.css">

        <title>Update Employee</title>
                <%
             if (session.getAttribute("AdminName") == null || session.getAttribute("AdminName").equals("null")) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
                // response.sendRedirect("/distributor/index.jsp");
             } else {

        %>
    </head>
    
    <%
        EmployeeModel empmodel = new EmployeeModel();
        EmployeeBean bean = empmodel.selectById(request.getParameter("id"));
    %>
    <body>
 
        <div class="wrapper wrapper-1 px-5">
            <a href="adminDash.jsp"><h3>Admin Dashboard</h3></a>
            <%@include file="adminHeader.jsp" %>
        </div>
        <div class="container">
            <div class="card sidebar">
                <li class="nav-link"> <a href="adminDash.jsp">Dashboard</a></li>
                 <hr>
               <ul class="nav-bar">
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
                                    <h2>Update Employee Details</h2>
                               </div>
                            <form id="contact-form" role="form" action="../EmployeeController" method="get">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="id" value="<%= request.getParameter("id")%>">

                              <div class="controls">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="first_name">First Name</label>
                                            <input id="first_name" type="text" name="fName" class="form-control shadow" 
                                                    value="<%= (bean != null) ? bean.getFirst_name() : "" %>">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="last_name">Last Name</label>
                                            <input id="last_name" type="text" name="lName" class="form-control shadow" 
                                                    value="<%= (bean != null) ? bean.getLast_name() : "" %>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="designation">Designation</label>
                                            <input id="designation" type="text" name="designation" class="form-control shadow" 
                                                   value="<%= (bean != null) ? bean.getDesignation() : "" %>">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="dept">Department</label>
                                            <input id="dept" type="text" name="dept" class="form-control shadow" 
                                                   value="<%= (bean != null) ? bean.getDept() : "" %>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="form_email">Mobile Number</label>
                                            <input id="email" type="text" name="mNumber" class="form-control shadow" 
                                                   value="<%= (bean != null) ? bean.getMobile_no() : "" %>">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="email">E-mail</label>
                                            <input id="mobile_number" type="email" name="email" class="form-control shadow" 
                                                   value="<%= (bean != null) ? bean.getEmail() : "" %>">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="city">City</label>
                                            <input id="city" type="text" name="city" class="form-control shadow" 
                                                   value="<%= (bean != null) ? bean.getCity() : "" %>">
                                        </div>
                                    </div>
                                   <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="salary">Salary</label>
                                            <input id="salary" type="text" name="salary" class="form-control shadow" 
                                                   value="<%= (bean != null) ? bean.getSalary() : "" %>">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                       <button type="submit" class="btn btn-success shadow"> Update </button> 
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
 <% } %>                            
    </body>
</html>
