<%-- 
    Document   : showEmployee
    Created on : 31-Jan-2024, 11:20:31 AM
    Author     : user
--%>

<%@page import="com.qt.practice.beans.EmployeeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.practice.models.EmployeeModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    EmployeeModel emp = new EmployeeModel();
    EmployeeBean bean = emp.selectById(request.getParameter("id"));

%>
 <!-- Modal -->
 
 <div class="table-responsive">
    <table class="table table-hover table-striped ">
        <thead>
           
        </thead>
        <tbody>
            
            <tr>
                <th class="text-center" scope="row">First Name</th>
                <td class="text-center" scope="row"><%= bean.getFirst_name()%> </td>
            </tr>
            <tr>

                <th class="text-center" scope="row">Last Name</th>
                <td class="text-center" scope="row"><%= bean.getLast_name() %></td>

            </tr>
            <tr>
                <th class="text-center" scope="row">Designation</th>
                <td class="text-center" scope="row"><%= bean.getDesignation() %> </td>
            </tr>
            <tr>
                <th class="text-center" scope="row">Department</th>
                <td class="text-center" scope="row"><%= bean.getDept() %> </td>
            </tr>
            
             <tr>
                <th class="text-center" scope="row">Salary</th>
                <td class="text-center" scope="row"><%= bean.getSalary() %> </td>
            </tr>
            
            <tr>
                <th class="text-center" scope="row">Email</th>
                <td class="text-center" scope="row"><%= bean.getEmail() %> </td>
            </tr>
            
             <tr>
                <th class="text-center" scope="row">Mobile No.</th>
                <td class="text-center" scope="row"><%= bean.getMobile_no() %> </td>
            </tr>
        </tbody>


    </table>

</div>