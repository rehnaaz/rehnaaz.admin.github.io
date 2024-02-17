/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qt.practice.controller;

import com.qt.practice.beans.EmployeeBean;
import com.qt.practice.models.EmployeeModel;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "EmployeeController", urlPatterns = {"/EmployeeController"})
public class EmployeeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    EmployeeBean bean = new EmployeeBean();
    EmployeeModel empModel = new EmployeeModel();
    String message = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        switch (action) {
            case "insert":
                insert(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "update":
                updateData(request, response);
                break;
            default:
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        try {
            processRequest(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /* Insert user */
    private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        bean.setFirst_name(request.getParameter("fName"));
        bean.setLast_name(request.getParameter("lName"));
        bean.setDesignation(request.getParameter("designation"));
        bean.setDept(request.getParameter("dept"));
        bean.setMobile_no(request.getParameter("mNumber"));
        bean.setSalary(request.getParameter("salary"));
        bean.setEmail(request.getParameter("email"));
        bean.setCity(request.getParameter("city"));
        bean.setUserId(request.getParameter("userId"));

        System.out.println("fNamefff" + request.getParameter("fName"));
        System.out.println("lName" + request.getParameter("lName"));
        System.out.println("email" + request.getParameter("email"));
        System.out.println("mNumber" + request.getParameter("mNumber"));
        System.out.println("designation" + request.getParameter("designation"));
        System.out.println("dept" + request.getParameter("dept"));
        System.out.println("salary" + request.getParameter("salary"));
        System.out.println("city" + request.getParameter("city"));
        System.out.println("userId" + request.getParameter("userId"));
        try {
            message = empModel.insert(bean);
            response.sendRedirect("admin/employeeData.jsp?msg=" + message);
        } catch (IOException e) {
            System.out.println("com.qt.practice.controller.EmployeeController.insert()" + e.getMessage());
        }
    }
    
    /* Delete User */
    private void deleteUser(HttpServletRequest request, HttpServletResponse response)  throws SQLException, IOException {
         if(request.getParameter("id") == null || request.getParameter("id").equals("")){
            System.out.println("id" + request.getParameter("id"));
                     
        message = "Id should not be empty ";
        }else{
        bean.setId(Integer.parseInt(request.getParameter("id")));
        message = empModel.delete(bean);
        }
        response.sendRedirect("admin/employeeData.jsp?msg=" + message);
        
    
    }
       
    /* Update User */
     private void updateData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        bean.setId(Integer.parseInt(request.getParameter("id")));
        bean.setFirst_name(request.getParameter("fName"));
        bean.setLast_name(request.getParameter("lName"));
        bean.setDesignation(request.getParameter("designation"));
        bean.setDept(request.getParameter("dept"));
        bean.setMobile_no(request.getParameter("mNumber"));
        bean.setSalary(request.getParameter("salary"));
        bean.setEmail(request.getParameter("email"));
        bean.setCity(request.getParameter("city"));
        
        System.out.println("fNamefff" + request.getParameter("fName"));
        System.out.println("lName" + request.getParameter("lName"));
        System.out.println("email" + request.getParameter("email"));
        System.out.println("mNumber" + request.getParameter("mNumber"));
        System.out.println("designation" + request.getParameter("designation"));
        System.out.println("dept" + request.getParameter("dept"));
        System.out.println("salary" + request.getParameter("salary"));
        System.out.println("city" + request.getParameter("city"));

        message = empModel.update(bean);
        response.sendRedirect("admin/employeeData.jsp?msg=" + message);

    }     
     
    
  
}
