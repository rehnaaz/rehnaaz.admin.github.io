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

        <link rel="stylesheet" href="../asset/style.css">

        <title>Add Client</title>
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
    <div class="container">
        <div class="card sidebar">
            <li class="nav-link"><a href="adminDash.jsp">Dashboard</a></li>
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
                           <h2>Add Client</h2>
                      </div>
                       <form id="contact-form" role="form" action="../ClientController" method="get">
                       <input type="hidden" name="action" value="insert">


                    <div class="controls">
                       <div class="row">
                           <div class="col-md-3">
                               <div class="form-group">
                                   <label for="f_name">Name</label>
                                   <input id="f_name" type="text" name="f_name" class="form-control shadow" placeholder="Please enter your name"
                                          required="required" data-error="Name is required.">
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
                                   <label for="requirement">Requirement</label>
                                    <input id="requirement" type="text" name="requirement" class="form-control shadow" placeholder="Please enter your requirement" 
                                          required="required" data-error="requirement is required.">
                               </div>
                           </div>
                             <div class="col-md-3">
                               <div class="form-group">
                                   <%
                                        EmployeeModel emp = new EmployeeModel();
                                        ArrayList<EmployeeBean> Employee = emp.select();
                                    %>
                                   <label for="users">Reference</label>
                                    <select name="empId" class="selectUser">
                                       <option value=" ">Select User Name</option>
                                           <% 
                                           for (EmployeeBean empData : Employee) {
                                           %>
                                       <option name="empId" value="<%= empData.getId()%>"><%= empData.getFirst_name()%></option>
                                           <% 
                                               } 
                                           %>
                                    </select>
                               </div>
                           </div>
                         </div>
                         <div class="row">
                                 
                           <div class="col-md-3">
                               <div class="form-group">
                                   <label for="address">Address</label>
                                   <textarea rows="3" id="address" type="text" name="address" class="form-control shadow" placeholder="Please enter your adsress"
                                          required="required" data-error="Address is required."></textarea>
                               </div>
                           </div>
                                 <div class="col-md-3">
                               <div class="form-group">
                                   <label for="city">City</label>
                                   <input id="city" type="text" name="city" class="form-control shadow" placeholder="Please enter your city" 
                                          required="required" data-error="City is required.">
                               </div>
                            </div>
                       </div>
                        
                       <div class="row">

                           <div class="col-md-12">
                               <button type="submit" class="btn btn-success shadow"> Add Client </button> 
                               <button type="button" class="btn btn-info shadow" style="color: #fff;float: right;">
                                   <a href="clientsData.jsp" style="color: inherit; text-decoration: none;">All Clients</a>
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
        <%
            }
%>

    </body>
</html>
