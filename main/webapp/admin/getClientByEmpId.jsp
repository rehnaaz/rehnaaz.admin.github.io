<%@page import="com.qt.practice.beans.AddClient"%>
<%@page import="com.qt.practice.models.ClientModel"%>
<%@page import="java.util.ArrayList"%>
<%
        ClientModel model = new ClientModel();
        ArrayList<AddClient> Clients = model.selectByEmp(request.getParameter("id"));
    %> 

<table class="table table-hover shadow">
                    <thead>
                        <tr>
                            <th scope="col">Sr. No.</th>
                            <th scope="col">Employee Name</th>
                             <th scope="col">Department</th>
                            <th scope="col">Mobile No</th>
                            <th scope="col">Email</th>
                            <th scope="col">Requirement</th>
                            <th scope="col">Address</th>

                            
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <%
                            if (Clients.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="8">No Data Found</td>
                        </tr>
                        <%
                        } else {
                            int j = 1;
                            for (AddClient s : Clients) {
                           
                        %>
                        <tr> 
                            
                            <td><%= j++ %></td>
                            <td><%= s.getF_name()%></td>
                            <td><%= s.getDept()%></td>
                            <td><%= s.getMobile_no()%></td>
                            <td><%= s.getEmail()%></td>
                            <td><%= s.getRequire()%></td>
                            <td><%= s.getAddress() +", "+s.getCity()%></td>                      
                            
                            
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table> 