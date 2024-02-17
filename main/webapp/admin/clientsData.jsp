<%@page import="com.qt.practice.beans.EmployeeBean"%>
<%@page import="com.qt.practice.models.EmployeeModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qt.practice.models.ClientModel"%>
<%@page import="com.qt.practice.beans.AddClient"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="../asset/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Clients Data</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <script>
//             view More Modal
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
                xhttp.open("GET", "Admin/ClientDetails.jsp?id=" + id, true)
                xhttp.send();

            }
       
            function ClientByUser(id) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () 
                {
                    if (this.readyState === 1) {
                    

                        document.getElementById("dynamicModal").innerHTML = "Please Wait.....";
                        
                    } else if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("dynamicModal").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "Admin/getUserByClientId.jsp?id=" + id, true)
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
    
    <%
        ClientModel model = new ClientModel();
        ArrayList<AddClient> Clients = model.select();
    %>
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
                
        <div class="container container1" style="margin-left: 150px;">
            <h3 class="text-center heading">All Clients</h3>
            <br>
               <div class="addUser">
                <a href="addClient.jsp" style="color: inherit; text-decoration: none;">
                  <i class="fa-solid fa-user-plus fa-2xl" style="color: #498d5d;"></i>
                </a><h5>Add Client</h5>
           </div>
             
            
            <div class="row">

            <div class="col-sm-1"></div>
            <div class="col-sm-8 text-center">
            <p>${param.msg}</p>
                <table class="table table-hover shadow">
                    <thead>
                        <tr>
                            <th scope="col">Sr. No.</th>
                            <th scope="col"> Name</th>
                            <th scope="col">Department</th>
                            <th scope="col">Mobile No</th>
                            <th scope="col">Details</th>
                            <th scope="col">Action</th>
                          
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (Clients.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="8">No Data Found</td>
                        </tr>
                        <%
                        } else {
                            int i = 1;
                            for (AddClient us : Clients) {
                           
                        %>
                        <tr> 
                            
                            <td><%= i++ %></td>
                            <td><%= us.getF_name()%></td>
                            <td><%= us.getDept()%></td>
                            <td><%= us.getMobile_no()%></td>
                            <td>
                                <a href="#" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="MoreModal('<%= us.getId()%>')"> 
                                    <i class="fa-solid fa-eye fa-xl"></i>
                                </a>
                            </td>
                            <td>
                                <a href="updateClient.jsp?id=<%= us.getId()%>">
                                    <i class="fa-solid fa-pen-to-square fa-xl" style="color: #a1a3a5;"></i>
                                </a> 
                                <a href="ClientController?action=delete&id=<%= us.getId()%>">
                                    <i class="fa-regular fa-trash-can fa-xl" style="color: #af0808;"></i> 
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
                <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title text-center">Client Details</h3>
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
    <% } %>        
    </body>
</html>
