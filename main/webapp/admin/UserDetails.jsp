<%-- 
    Document   : showEmployee
    Created on : 31-Jan-2024, 11:20:31 AM
    Author     : user
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
<%@page import="com.qt.practice.beans.RegisterUser"%>
<%@page import="com.qt.practice.models.UserRegModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
                UserRegModel user = new UserRegModel();
                RegisterUser bean = user.selectById(request.getParameter("id"));
                
                String imgName = bean.getImage_name();
               // String path = "https://media.geeksforgeeks.org/wp-content/uploads/geeksforgeeks-6.png";
                String url = "file:///C:/Users/user/Desktop/PracticeImages/Images/"+imgName;
                
            %>

 
 <div class="table-responsive">
    <table class="table table-hover table-striped">
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
                <th class="text-center" scope="row">Email</th>
                <td class="text-center" scope="row"><%= bean.getEmail() %> </td>
            </tr>
            <tr>
                <th class="text-center" scope="row">Mobile No.</th>
                <td class="text-center" scope="row"><%= bean.getMobile_number() %> </td>
            </tr>
          
            <tr>
                <th class="text-center" scope="row">Profile Image</th>
                <td class="text-center" scope="row"><img src="<%= url %>"></td>
            </tr>
        </tbody>

    </table>

</div>