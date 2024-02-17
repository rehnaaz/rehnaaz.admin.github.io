<%@page import="com.qt.practice.beans.EmployeeBean"%>
<%@page import="com.qt.practice.models.EmployeeModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qt.practice.models.UserRegModel"%>
<%@page import="com.qt.practice.beans.RegisterUser"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="../asset/style.css">

        <title>Users Data</title>
        
      <script>
          function UserKeyDetails(id) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 1) {
                        document.getElementById("dynamicModal").innerHTML = "Please Wait.....";
                    } else if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("user-details").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "Admin/UserDetails.jsp?id=" + id, true)
                xhttp.send();

            }
            
            function MoreModal(id) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 1) {
                        document.getElementById("dynamicModal").innerHTML = "Please Wait.....";
                    } else if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("dynamicModal").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "getEmpByUserId.jsp?id=" + id, true)
                xhttp.send();

            }
            // get all clients by user ID
            function ClientsByUser(id) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 1) {
                        document.getElementById("clientbyUser").innerHTML = "No Clients found of this User.....";
                    } else if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("clientbyUser").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "getClientByUser.jsp?id=" + id, true)
                xhttp.send();

            }
        </script>
        
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
        </div>
                
        <div class="container container1">
            <h3 class="text-center heading">All Users</h3>
            <br>
               <div class="addUser">
                <a href="addUser.jsp" style="color: inherit; text-decoration: none;">
                  <i class="fa-solid fa-user-plus fa-2xl" style="color: #498d5d;"></i>
                </a><h5>Add User</h5>
           </div>
                
             <%
                UserRegModel model = new UserRegModel();
                ArrayList<RegisterUser> Users = model.select();

            %>
            <div class="row">

            <div class="col-sm-1"></div>
            <div class="col-sm-10 text-center">
            <p>${param.msg}</p>
                <table class="table table-hover shadow">
                    
                    <thead>
                        <tr>
                            <th scope="col">Sr. No.</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Mobile Number</th>
                            <th scope="col">Email</th>
                            <th scope="col">Action</th>
                            <th scope="col">Details </th>
                            <th scope="col">Get All Employee of this user </th>
                            <th scope="col">Get All Clients of this user </th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (Users.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="8">No Data Found</td>
                        </tr>
                        <%
                        } else {
                            int i = 1;
                            for (RegisterUser us : Users) {
                        %>
                        <tr> 
                            <td><%= i++ %></td>
                            <td><%= us.getFirst_name()%></td>
                            <td><%= us.getLast_name()%></td>
                            <td><%= us.getMobile_number()%></td>
                            <td><%= us.getEmail()%></td>
                            <td> <a href="updateData.jsp?id=<%= us.getId()%>">
                                    <i class="fa-solid fa-pen-to-square fa-xl" style="color: #a1a3a5;"></i>
                                </a> 
                                <a href="UserRegController?action=delete&id=<%= us.getId()%>">
                                    <i class="fa-regular fa-trash-can fa-xl" style="color: #af0808;""></i>
                                </a>
                            </td>
                            <td>
                                <a href="#" data-toggle="modal" data-target=".bd-example-modal-lg2" onclick="UserKeyDetails('<%= us.getId()%>')"> 
                                    <i class="fa-solid fa-eye fa-xl"></i>
                                </a>
                            </td>
                             <td>
                                <a href="#" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="MoreModal('<%= us.getId()%>')"> 
                                    <i class="fa-solid fa-users fa-xl" style="color: #000000"></i>
                                </a>
                            </td>
                            <td>
                                <a href="#" data-toggle="modal" data-target=".bd-example-modal-lg1" onclick="ClientsByUser('<%= us.getId()%>')"> 
                                    <i class="fa-solid fa-users fa-xl" style="color: #660000"></i>
                                </a>
                            </td>
                        </tr>
                        <%
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
        <div class="modal-dialog modal-lg">
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
<%}%>
   
   <!-- modal Start  All clients by user Id-->
    <div class="modal fade bd-example-modal-lg1" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title text-center">Clients Details</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="clientbyUser"> 
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>
    
    
    <!-- user details modal-->
    <div class="modal fade bd-example-modal-lg2" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title text-center">User Details</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="user-details"> 
                        
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
    </body>
</html>
