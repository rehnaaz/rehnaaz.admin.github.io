<%@page import="com.qt.practice.beans.RegisterUser"%>
<%@page import="com.qt.practice.models.UserRegModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qt.practice.models.EmployeeModel"%>
<%@page import="com.qt.practice.beans.EmployeeBean"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        
        <link rel="stylesheet" href="../asset/style.css">
        <script>
            // view More Modal
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
                xhttp.open("GET", "EmpKeyDetails.jsp?id=" + id, true)
                xhttp.send();

            }
            
            function AllClientModal(id) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 1) {
                        document.getElementById("allClientModal").innerHTML = "No Client found for this User...";
                    } else if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("allClientModal").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "getClientByEmpId.jsp?id=" + id, true)
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
    <div class="container container1" style="margin-left: 135px;">
            <h3 class="text-center heading">All Employees</h3>
            <br>
               <div class="iq-card-body">
                   <div class="row" style="margin-top:30px; margin-left:100px;">
                       <div class="col-lg-10">
                           <form method="post" action="employeeData.jsp" name="frm">
                                <div class="row">
                                    <input class="form-control" name="r_btn" type="hidden" value="rbtn1" >
                                    <div class="col-sm-6">       
                                        <div class="form-group">
                                            <% if (request.getParameter("search") == null) { %>
                                            <span class="text-danger" style="font-weight: 500">Search Employee :</span><span> (name/department/designation) </span><input type="text" class="form-control" name="search" >
                                            <% } else {%>
                                            <span class="text-danger" style="font-weight: 500">Search Employee :</span><span> (name/department/designation) </span><input type="text" class="form-control" name="search"  value="<%= request.getParameter("search")%>">
                                            <% } %>
                                         </div>
                                    </div>

                                    <div class="col-sm-2">
                                        <div class="form-group"><br>
                                            <input type="submit" value="search" onclick="return searchValidateUser();" class="btn btn-primary" onclick="return searchValidate();">
                                        </div>
                                    </div>
                                </div>
                            </form> 
                        </div>
                        
                        <div class="col-lg-2" style="margin-top:18px;">
                            <form method="post" action="employeeData.jsp" name="frm">
                                 <div class="form-group">
                                     <input name="r_btn" value="rbtn2" type="hidden">
                                     <input type="submit" value="All Employees" class="btn btn-primary" onclick="return searchValidate();">
                                 </div>
                             </form>
                        </div>
                    </div>
                    <div class="iq-card-body" style="margin-left: 22px;">                     
                         <div class="col-lg-10">
                            <form method="post" action="employeeData.jsp" name="frm">

                                <div class="row ">
                                   <div class="col-md-1">

                                       <div class="form-group" style="margin-top:30px;  margin-left:50px;">
                                           <input class="form-control"  name="r_btn" type="radio" value="rbtn3" required checked>
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
                   </div>
               
            </div>
                  <%
                    EmployeeModel emp = new EmployeeModel();
                    ArrayList<EmployeeBean> Employees = new ArrayList<>();
                    String from = null;
                      if (request.getParameter("from") != null) {
                          from = request.getParameter("from");
                      }
                      String to = null;
                      if (request.getParameter("to") != null) {
                          to = request.getParameter("to");
                      }
                    
                      if (request.getParameter("r_btn") != null) {
                      String type = request.getParameter("r_btn");
                      if (type.equals("rbtn1")) {
                          Employees = emp.searchEmpBydetail(request.getParameter("search"));
                      } else if(type.equals("rbtn3")){
                          Employees = emp.empByDate(from, to);
                      }else {
                          Employees = emp.select();
                      }
                 %>
            <!-- Search end -->                     
            <div class="row" style="margin-left: 135px;">
                <div class="col-sm-1"></div>
                <div class="col-sm-11 text-center">
                <p>${param.msg}</p>
                    <table class="table table-hover ">
                        <thead>
                            <tr>
                                <th scope="col">Sr. No.</th>
                                <th scope="col"> Name</th>
                                <th scope="col">Designation</th>
                                <th scope="col">Email</th>
                                <th scope="col">Add Emp for this user</th>
                                <th scope="col">Details</th>
                                <th scope="col">Action</th>
                                <th scope="col">Get All Clients of this Emp</th>                   

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if (Employees.isEmpty()) {
                            %>
                            <tr>
                                <td colspan="8">No Data Found</td>
                            </tr>
                            <%
                            } else {
                                int i = 1;
                                for (EmployeeBean us : Employees) {

                            %>
                            <tr> 

                                <td><%= i++ %></td>
                                <td><%= us.getFirst_name()%></td>
                                <td><%= us.getDesignation()%></td>
                                <td><%= us.getEmail()%></td>
                                 <td>
                                     <a  href="addClient.jsp?id=<%= us.getId()%>"> 
                                        <i class="fa-solid fa-user-plus fa-xl"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="#" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="MoreModal('<%= us.getId()%>')"> 
                                        <i class="fa-solid fa-eye fa-xl"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="updateEmp.jsp?id=<%= us.getId()%>">
                                        <i class="fa-solid fa-pen-to-square fa-xl" style="color: #a1a3a5;"></i>
                                    </a> 
                                    <a href="EmployeeController?action=delete&id=<%= us.getId()%>">
                                        <i class="fa-regular fa-trash-can fa-xl" style="color: #af0808;"></i> 
                                    </a>
                                </td>
                                <td>
                                <a href="#" data-toggle="modal" data-target=".bd-example-modal-lg1" onclick="AllClientModal('<%= us.getId()%>')"> 
                                    <i class="fa-solid fa-users fa-xl"></i>
                                </a>
                            </td>
                            </tr>
                            <%
                                }
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

         <!-- modal Start All Clients By Emp -->
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
                    <div id="allClientModal"> 
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
