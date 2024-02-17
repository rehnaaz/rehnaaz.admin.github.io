/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qt.practice.models;

import com.qt.practice.beans.AddClient;
import com.qt.practice.beans.EmployeeBean;
import com.qt.practice.beans.RegisterUser;
import com.qt.practice.common.PracticeDB;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author user
 */
public class UserRegModel {
    Connection con = null;
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;

    // Login VAr
    Statement st = null;
    HttpSession session = null;
    PreparedStatement ps = null;
    

 public String insert(RegisterUser userBean, String imgName, Part imgPath) {
        con = PracticeDB.connectDb();
        System.out.println("Insert Block");
        
        try {
            System.out.println("in try");
            sql = "insert into users (first_name, last_name, mobile_number, email, img_name, img_path) values (?,?,?,?,?,?)";

            cs = con.prepareCall(sql);
            cs.setString(1, userBean.getFirst_name());
            cs.setString(2, userBean.getLast_name());
            cs.setString(3, userBean.getMobile_number());
            cs.setString(4, userBean.getEmail());
            cs.setString(5, userBean.getImage_name());            
            cs.setString(6, userBean.getImage_path());

            
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "<span class=\" text-success font-bold\">User Added Successfully</span>";
            }
            System.out.println("sql = " + sql);
        } catch (SQLException e) {
            message = " Unable to add because of : " + e.getMessage() + " | At : " + this.getClass().getName();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                System.out.println("com.qt.practice.models.UserRegModel.insert()" + e.getMessage());
            }
        }
        return message;

    }
    
    public ArrayList<RegisterUser> select() {
        ArrayList<RegisterUser> arrayList = new ArrayList<>();
        con = PracticeDB.connectDb();
        try {
            sql = "select * from users where visibility = 1";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new RegisterUser(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name") ,
                        rs.getString("email"),
                        rs.getString("mobile_number"),
                        rs.getString("img_name"),
                        rs.getString("img_path")

                )
                );
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new RegisterUser(0, this.getClass().getName(), "No data found"));
            }

        } catch (SQLException e) {
            arrayList.add(new RegisterUser(-1, this.getClass().getName(), e.getMessage()));
        }

        return arrayList;
    }
   
    
    /* Delete User */
    public String delete(RegisterUser beanS)throws SQLException{
     con = PracticeDB.connectDb();
     try{
     sql="update users set visibility = ? where id = ?";
     cs = con.prepareCall(sql);
     cs.setInt(1, 0);               // set visibility = 0 "Soft Delete"
     cs.setLong(2, beanS.getId());
          int rows = cs.executeUpdate();
          
          if(rows>=1){
          message="User Deleted Successuflly";
          }
     }catch(SQLException e){
     message="Unable to Delete because of : "+ e.getMessage()+"| At : " + this.getClass().getName();
     }finally{
     if(con != null){
     con.close();
     }
     }
     return message;
    }
    
     /*  Select by id */
    public RegisterUser selectById(String id) throws SQLException, IOException {
        RegisterUser beanE = null;
        con = PracticeDB.connectDb();
        
        try {
            System.out.println("select by id");

            sql = "select * from users where id =" + id;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery(sql);

                
            while (rs.next()) {
                beanE = new RegisterUser(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),                      
                        rs.getString("mobile_number"),
                        rs.getString("img_name")
                    );    
                
            }
            System.out.println("sql==" +sql);
        } catch (SQLException e) {
            beanE = new RegisterUser(0, this.getClass().getName(), e.getMessage());
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return beanE;
    }
    
 
//    public String update(RegisterUser beanS) {
//        con = PracticeDB.connectDb();
//        try {
//            sql = "update users set first_name=?, last_name=?,email=?, mobile_number=? where id=?";
//            cs = con.prepareCall(sql);
//            cs.setString(1, beanS.getFirst_name());
//            cs.setString(2, beanS.getLast_name());
//            cs.setString(3, beanS.getEmail());
//            cs.setString(4, beanS.getMobile_number());;
//            cs.setInt(5, beanS.getId());
//
//            int rows = cs.executeUpdate();
//            if (rows >= 1) {
//                message = "User Updated Successfully";
//            }
//        } catch (SQLException e) {
//            message = "Unable to Update because of : " + e.getMessage() + " | At : " + this.getClass().getName();
//
//        } finally {
//            try {
//                if (con != null) {
//                    con.close();
//                }
//
//            } catch (SQLException e) {
//                message = e.getMessage();
//            }
//        }
//         return message;
//    }

    // updateUser with store procedure.
     public String update(RegisterUser beanS) {
        con = PracticeDB.connectDb();
        try {
            //sql = "update users set first_name=?, last_name=?,email=?, mobile_number=? where id=?"; 
            sql = "CALL updateUser(?,?,?,?,?)";
            cs = con.prepareCall(sql);
            cs.setString(1, beanS.getFirst_name());
            cs.setString(2, beanS.getLast_name());
            cs.setString(3, beanS.getEmail());
            cs.setString(4, beanS.getMobile_number());;
            cs.setInt(5, beanS.getId());

            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "User Updated Successfully";
            }
                        System.out.println("sql==" +sql);

        } catch (SQLException e) {
            message = "Unable to Update because of : " + e.getMessage() + " | At : " + this.getClass().getName();

        } finally {
            try {
                if (con != null) {
                    con.close();
                }

            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
         return message;
    }

     
   public ArrayList<RegisterUser> selectByname(String id) {
        ArrayList<RegisterUser> arrayList = new ArrayList<>();
        con = PracticeDB.connectDb();
        try {
            System.out.println("in try");
            sql = "select id, first_name from users where id=" + id;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                rs.getInt("id");
                rs.getString("first_name");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return arrayList;
    }
   
  //store procedure call for Users count for Admin
    public ArrayList<Integer> countAllUsers() {
        ArrayList<Integer> allUsers = new ArrayList();
        con = PracticeDB.connectDb();
        try {

            sql = "CALL allUsers()";
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            rs.next();
            //  System.out.println(rs.getInt(1));
            allUsers.add(rs.getInt(1));
            allUsers.add(rs.getInt(2));
            allUsers.add(rs.getInt(3));

        } catch (SQLException e) {
            System.out.println("EX " + e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
        return allUsers;
    }

    public String insert(RegisterUser bean, String fileName, InputStream inputStream) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

     
}
