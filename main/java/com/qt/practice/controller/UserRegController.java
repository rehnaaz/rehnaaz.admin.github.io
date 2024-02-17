/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.qt.practice.controller;

import com.qt.practice.beans.RegisterUser;
import com.qt.practice.models.UserRegModel;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author user
 * 
 * 
 */

@MultipartConfig(fileSizeThreshold=1024*1024*2, 
maxFileSize=1024*1024*10, 
maxRequestSize=1024*1024*50)

@WebServlet(name = "UserRegController", urlPatterns = {"/UserRegController"})
public class UserRegController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    RegisterUser bean = new RegisterUser();
    UserRegModel userModel = new UserRegModel();
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
            Logger.getLogger(UserRegController.class.getName()).log(Level.SEVERE, null, ex);
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
//    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        try {
            processRequest(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(UserRegController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(UserRegController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserRegController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

    /* Insert user */
//    private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        
//        
//        Part filePart = request.getPart("proflie_img");
//        String fileName = extractFileName(filePart);
//        InputStream fileContent = filePart.getInputStream(); 
//        String filePath = "C:\\Users\\user\\Documents\\NetBeansProjects\\Practice\\src\\main\\webapp\\images" + File.separator+ fileName;
//                
//        bean.setFirst_name(request.getParameter("fName"));
//        bean.setLast_name(request.getParameter("lName"));
//        bean.setEmail(request.getParameter("email"));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
//        bean.setMobile_number(request.getParameter("mNumber"));
//       bean.setImage_path(fileName);
//
////        System.out.println("fNamefff" + request.getParameter("fName"));
////        System.out.println("lName" + request.getParameter("lName"));
////        System.out.println("email" + request.getParameter("email"));
////        System.out.println("mNumber" + request.getParameter("mNumber"));
//
//
//        try {
//            
//            message = userModel.insert(bean, fileContent);
//            response.sendRedirect("userData.jsp?message=" + message);
//        } catch (IOException e) {
//            System.out.println("com.qt.practice.controller.UserRegController.insert()" + e.getMessage());
//        }
//    }
//    
    
  private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
     try {
           
            Part imgPart = request.getPart("profile_img");
            String bgUploaded = imgPart.getSubmittedFileName();
            String imgName = bgUploaded;
            
            String path = "C:\\Users\\user\\Desktop\\PracticeImages\\Images\\"+ imgName;
            // String path = "C:\\Users\\user\\Documents\\NetBeansProjects\\Practice\\src\\main\\webapp\\images\\"+imgName;
            if (imgName != null) {
                    InputStream is = imgPart.getInputStream();
                    byte[] data = new byte[is.available()];
                    is.read(data);

                    FileOutputStream fos = new FileOutputStream(path + imgName);
                    fos.write(data);
                    fos.close();
                    System.out.println("path : " + path + imgName);
                    File file = new File(path + bgUploaded);
                    File rename = new File(path + imgName);
                    file.renameTo(rename);
            }
                  
            bean.setFirst_name(request.getParameter("fName"));
            bean.setLast_name(request.getParameter("lName"));
            bean.setEmail(request.getParameter("email"));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
            bean.setMobile_number(request.getParameter("mNumber"));
            bean.setImage_name(imgName);
            bean.setImage_path(path);

            System.out.println("in insert");
            message = userModel.insert(bean, imgName, imgPart);
        } catch (Exception e) {
            message = e.getMessage();
        } finally {
            response.sendRedirect("admin/userData.jsp?message=" + message);
        }
    }

    
    /* Delete User */
    private void deleteUser(HttpServletRequest request, HttpServletResponse response)  throws SQLException, IOException {
         if(request.getParameter("id") == null || request.getParameter("id").equals("")){
            System.out.println("id" + request.getParameter("id"));
                     
        message = "Id should not be empty ";
        }else{
        bean.setId(Integer.parseInt(request.getParameter("id")));
        message = userModel.delete(bean);
        }
        response.sendRedirect("admin/userData.jsp?message=" + message);
        
    
    }
       
    /* Update User */
     private void updateData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        bean.setId(Integer.parseInt(request.getParameter("id")));
        bean.setFirst_name(request.getParameter("fName"));
        bean.setLast_name(request.getParameter("lName"));
        bean.setEmail(request.getParameter("email"));
        bean.setMobile_number(request.getParameter("mNumber"));
        
        System.out.println("fNamefff" + request.getParameter("fName"));
        System.out.println("lName" + request.getParameter("lName"));
        System.out.println("fEmail" + request.getParameter("email"));
        System.out.println("mNumber" + request.getParameter("mNumber"));

        message = userModel.update(bean);
        response.sendRedirect("admin/userData.jsp?message=" + message);

    }

     
}
