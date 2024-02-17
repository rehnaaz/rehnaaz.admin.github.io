<%-- 
    Document   : checkdealerBysuper
    Created on : 01-Dec-2022, 1:17:22 PM
    Author     : Kanchan
--%>

<%@page import="com.qt.practice.beans.RegisterUser"%>
<%@page import="com.qt.practice.beans.EmployeeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qt.practice.models.EmployeeModel"%>

<%   EmployeeModel distMod = new EmployeeModel();
    ArrayList<EmployeeBean> Employees = distMod.selectByUser(request.getParameter("id"));
%>

<option name="empid">Select Employee</option>
<% for (EmployeeBean emp : Employees) {
       
%>

<option name="empid" value="<%= emp.getId()%>"><%= emp.getFirst_name()%></option>


<%
        

    }
%>