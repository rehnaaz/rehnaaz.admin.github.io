/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qt.practice.models;

import com.qt.practice.beans.AdminBean;
import com.qt.practice.common.PracticeDB;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.qt.practice.models.Admin;
/**
 *
 * @author user
 */
public class Admin {
    Connection con = PracticeDB.connectDb();
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;

    // Login VAr
    Statement st = null;
    HttpSession session = null;
    PreparedStatement ps = null;


    // DO LOGIN BEGINS
    public String doLogin(AdminBean beans, HttpServletRequest request, HttpServletResponse response) throws IOException {
        int authStatus = doCheckAuthentication(beans.getEmail());
        System.out.println("authStatus" + authStatus);
        Connection conn = PracticeDB.connectDb();
        try {
            if (authStatus == 0) {
                // redirect to login pg with msg contact support team
                response.sendRedirect("index.jsp?message=You are blocked Please contact support team");
                message = "You are blocked Please contact support team";
            } else if (authStatus == 1) {
                // perform login
                int verifyStatus = doVerifyCredentials(beans.getEmail(), beans.getPassword(), request);

                if (verifyStatus == 0) {
                    // wrong password try again
                    response.sendRedirect("index.jsp?message=You entered wrong password");
                     message = "You entered wrong password";
                } else if (verifyStatus == 1) {
                    response.sendRedirect("admin/adminDash.jsp?p=home&message=Welcome");
                } 
            } 
        } catch (IOException e) {
            response.sendRedirect("index.jsp?message=Exception_" + e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return message;
    }

     public int doCheckAuthentication(String email) {
        Connection conn = PracticeDB.connectDb();
        int status = 0;
        sql = "select authentication from admin where email = '" + email + "'";

        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                status = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Exception : " + e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return status;
    }

    public int doVerifyCredentials(String email, String password, HttpServletRequest req) {
        Connection conn = PracticeDB.connectDb();
        int status = 0;
        session = req.getSession();
        sql = "select id, name, email, password from admin where email = '" + email + "'";
        System.out.println("set === " + sql);
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {

                    if (email.equals(rs.getString("email")) && password.equals(rs.getString("password"))) {
                        status = 1;
                        session.setAttribute("AdminId", rs.getString("id"));
                        session.setAttribute("AdminName", rs.getString("name"));
                        // doUpdateLoginDetails(rs.getString(3));
                        resetLoginCount(rs.getInt("Id"));
                    } 
            }
        }catch (SQLException e) {
            System.out.println("Exception while login : " + e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        System.out.println("status" + status);
        return status;
    }

    public void resetLoginCount(int id) {
        Connection conn = PracticeDB.connectDb();
        sql = "update admin set attempts = 0 where id = " + id;
        try {
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage() + " com.qt.practice.model.Admin.resetLoginCount()");
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }

    }

}