<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qt.practice.models.EmployeeModel"%>
<%@page import="com.qt.practice.beans.EmployeeBean"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="../asset/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Employees Data</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        
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
      </div>  
        
         <div class="container container1" style="margin-left: 220px;">
            <h3 class="text-center heading">All Employees</h3>
            <br>
            <div class="iq-card-body">
                <form method="post" action="searchFromTo.jsp" name="frm">

                     <div class="row ">
                        <div class="col-md-1">

                            <div class="form-group" style="margin-top:30px;  margin-left:50px;">
                                <input class="form-control" id="rbtn" name="r_btn" type="radio" value="rbtn" required checked>
                            </div>
                        </div>
                        <div class="col-sm-3">       
                            <div class="form-group">
                                <span class="text-primary">From :</span><input type="date" class="form-control" name="from" required >
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <span class="text-primary">To :</span>
                                <input type="date" class="form-control" name="to" required>
                            </div>

                        </div>
                        <div class="col-sm-2">
                            <div class="form-group"><br>
                                <input type="submit" value="search" class="btn btn-primary" onclick="return searchValidate();">
                            </div>

                        </div>
                    </div>
                    
                  
                </form> 
            </div>
          
           
            <!-- Search end -->
                         
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-8 text-center">
                <p>${param.msg}</p>
                    <table class="table table-hover shadow">
                        <thead>
                            <tr>
                                <th scope="col">Sr. No.</th>
                                <th scope="col">Employee Name</th>
                                <th scope="col">Designation</th>
                                <th scope="col">Department</th>
                                <th scope="col">Mobile No</th>
                                <th scope="col">Email</th>
                                <th scope="col">City</th>
                                <th scope="col">Salary</th>

                            </tr>
                        </thead>
                        <tbody>
                            
                             <% 
                                EmployeeModel emp = new EmployeeModel();
                                ArrayList<EmployeeBean> er = new ArrayList<>();
                                String from = null;
                                      if (request.getParameter("from") != null) {
                                          from = request.getParameter("from");
                                      }
                                      String to = null;
                                      if (request.getParameter("to") != null) {
                                          to = request.getParameter("to");
                                      }
                                      
                                if ("rbtn".equals(request.getParameter("r_btn"))) {
                                      er = emp.empByDate(from, to);
                                      if(er.isEmpty()){
                                        
                                    %>
                                    <tr>
                                        <td colspan="8">No Data Found</td>
                                    </tr>
                                    <% } else {
                                    int i = 1;
                                    for (EmployeeBean us : er) {
                                       
                                     %>
                            <tr> 
                                <td><%= i++ %></td>
                                <td><%= us.getFirst_name()%></td>
                                <td><%= us.getDesignation()%></td>
                                <td><%= us.getDept()%></td>
                                <td><%= us.getMobile_no()%></td>
                                <td><%= us.getEmail()%></td>
                                <td><%= us.getCity()%></td>
                                <td><%= us.getSalary()%></td>
                                
                            </tr>
                            <% }
                                }  
                                  }
                            %>
                        </tbody>
                    </table> 
                           
                </div>
                
                <div class="col-sm-1"></div>
            
        </div>
            
       <!-- modal Start  MORE DETAILS-->
        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"  aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title text-center">Employee Details</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div id="dynamicModal"> 
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--  modal end -->

    </div>
   <%}%>         
    </body>
</html>
