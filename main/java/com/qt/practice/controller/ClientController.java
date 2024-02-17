/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.qt.practice.controller;

import com.qt.practice.beans.AddClient;
import com.qt.practice.models.ClientModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "ClientController", urlPatterns = {"/ClientController"})
public class ClientController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     AddClient bean = new AddClient();
    ClientModel model = new ClientModel();
    String message = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        switch (action) {
            case "insert":
                insert(request, response);
                break;
            case "delete":
                deleteClient(request, response);
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
    
//     @Override
//    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        if (request.getParameter("action").equals("update")) {
//
//            bean.setId(Integer.parseInt(request.getParameter("id")));
//
//            message = model.updateClient(bean);
//            String page = request.getParameter("page");
// 
//        }  
//
//    }


      private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        bean.setF_name(request.getParameter("f_name"));       
        bean.setDept(request.getParameter("dept"));
        bean.setMobile_no(request.getParameter("mNumber"));
        bean.setEmail(request.getParameter("email"));
        bean.setRequire(request.getParameter("requirement"));
        bean.setAddress(request.getParameter("address"));
        bean.setCity(request.getParameter("city"));
        bean.setEmpId(request.getParameter("empId"));

//        System.out.println("fNamefff" + request.getParameter("fName"));
//        System.out.println("lName" + request.getParameter("lName"));
//        System.out.println("email" + request.getParameter("email"));
//        System.out.println("mNumber" + request.getParameter("mNumber"));
//        System.out.println("designation" + request.getParameter("designation"));
//        System.out.println("dept" + request.getParameter("dept"));
//        System.out.println("salary" + request.getParameter("salary"));
//        System.out.println("city" + request.getParameter("city"));
//        System.out.println("userId" + request.getParameter("userId"));
        try {
            message = model.insert(bean);
            response.sendRedirect("admin/clientsData.jsp?msg=" + message);
        } catch (IOException e) {
            System.out.println("com.qt.practice.controller.ClientController.insert()" + e.getMessage());
        }
    }
      
          /* Delete User */
    private void deleteClient(HttpServletRequest request, HttpServletResponse response)  throws SQLException, IOException {
         if(request.getParameter("id") == null || request.getParameter("id").equals("")){
            System.out.println("id" + request.getParameter("id"));
                     
        message = "Id should not be empty ";
        }else{
        bean.setId(Integer.parseInt(request.getParameter("id")));
        message = model.delete(bean);
        }
        response.sendRedirect("admin/clientsData.jsp?msg=" + message);
        
    
    }
    
    /* Update User */
     private void updateData(HttpServletRequest request, HttpServletResponse response) throws IOException {
         bean.setF_name(request.getParameter("f_name"));       
        bean.setDept(request.getParameter("dept"));
        bean.setMobile_no(request.getParameter("mobile_no"));
        bean.setEmail(request.getParameter("email"));
        bean.setRequire(request.getParameter("requirement"));
        bean.setAddress(request.getParameter("address"));
        bean.setCity(request.getParameter("city"));
        
      
        
        System.out.println("fName" + request.getParameter("f_name"));
        System.out.println("dept" + request.getParameter("dept"));
        System.out.println("mobile_no" + request.getParameter("mobile_no"));
        System.out.println("email" + request.getParameter("email"));
        System.out.println("designation" + request.getParameter("requirement"));
        System.out.println("address" + request.getParameter("address"));
        System.out.println("city" + request.getParameter("city"));

        message = model.update(bean);
            response.sendRedirect("admin/clientsData.jsp?msg=" + message);

    }     
     
     

}
