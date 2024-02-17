
<%@page import="com.qt.practice.beans.AddClient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.practice.models.ClientModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    ClientModel client = new ClientModel();
    AddClient bean = client.selectById(request.getParameter("id"));

%>
 <!-- Modal -->
 
 <div class="table-responsive">
    <table class="table table-hover table-striped ">
        <thead>
           
        </thead>
        <tbody>
            
            <tr>
                <th class="text-center" scope="row">First Name</th>
                <td class="text-center" scope="row"><%= bean.getF_name()%> </td>
            </tr>
                <th class="text-center" scope="row">Department</th>
                <td class="text-center" scope="row"><%= bean.getDept() %> </td>
            </tr>
            <tr>
                <th class="text-center" scope="row">Mobile No.</th>
                <td class="text-center" scope="row"><%= bean.getMobile_no() %> </td>
            </tr>
            
            <tr>
                <th class="text-center" scope="row">Email</th>
                <td class="text-center" scope="row"><%= bean.getEmail() %> </td>
            </tr>
            <tr>
                <th class="text-center" scope="row">Requirements</th>
                <td class="text-center" scope="row"><%= bean.getRequire() %> </td>
            </tr>
            
            <tr>
                <th class="text-center" scope="row">Address</th>
                <td class="text-center" scope="row"><%= bean.getAddress() %> </td>
            </tr>
            <tr>
                <th class="text-center" scope="row">City</th>
                <td class="text-center" scope="row"><%= bean.getCity() %> </td>
            </tr>
        </tbody>


    </table>

</div>