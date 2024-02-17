<%@page import="com.qt.practice.beans.EmployeeBean"%>
<%@page import="com.qt.practice.models.EmployeeModel"%>
<%@page import="java.util.ArrayList"%>
<%
        EmployeeModel model = new EmployeeModel();
        ArrayList<EmployeeBean> Employees = model.selectByUser(request.getParameter("id"));
    %> 

<table class="table table-hover shadow">
                    <thead>
                        <tr>
                            <th scope="col">Sr. No.</th>
                            <th scope="col">Employee Name</th>
                            <th scope="col">Designation</th>
                            <th scope="col">Department</th>
                            <th scope="col">Salary</th>
                            <th scope="col">Mobile No</th>
                           
                            
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <%
                            if (Employees.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="8">No Data Found</td>
                        </tr>
                        <%
                        } else {
                            int j = 1;
                            for (EmployeeBean s : Employees) {
                           
                        %>
                        <tr> 
                            
                            <td><%= j++ %></td>
                            <td><%= s.getFirst_name()%></td>
                            <td><%= s.getDesignation()%></td>
                            <td><%= s.getDept()%></td>                            
                            <td><%= s.getSalary()%></td>
                            <td><%= s.getMobile_no()%></td>
                            
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table> 