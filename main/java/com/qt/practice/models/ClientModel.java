/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qt.practice.models;

import com.qt.practice.beans.AddClient;
import com.qt.practice.common.PracticeDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

public class ClientModel {
    Connection conn = null;
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;

    // Login VAr
    Statement st = null;
    HttpSession session = null;
    PreparedStatement ps = null;


// public String insert(AddClient bean) {
//        conn = PracticeDB.connectDb();
//        System.out.println("Insert Block");
//        try {
//          //  System.out.println("in try");
//            sql = "insert into clients (f_name, dept, mobile_no, email, requirement, address, city, emp_id) values (?,?,?,?,?,?,?,?)";
//
//            cs = conn.prepareCall(sql);
//            cs.setString(1, bean.getF_name());
//            cs.setString(2, bean.getDept());
//            cs.setString(3, bean.getMobile_no());
//            cs.setString(4, bean.getEmail()); 
//            cs.setString(5, bean.getRequire());
//            cs.setString(6, bean.getAddress());
//            cs.setString(7, bean.getCity());
//            cs.setString(8, bean.getEmpId());
//
//            
//            int rows = cs.executeUpdate();
//            if (rows >= 1) {
//                message = "<span class=\" text-success font-bold\">Client Added Successfully</span>";
//            }
//            System.out.println("sql = " + sql);
//        } catch (SQLException e) {
//            message = " Unable to add because of : " + e.getMessage() + " | At : " + this.getClass().getName();
//        } finally {
//            try {
//                if (conn != null) {
//                    conn.close();
//                }
//            } catch (SQLException e) {
//                System.out.println("com.qt.practice.models.ClientModel.insert()" + e.getMessage());
//            }
//        }
//        return message;
//    }

    
 public String insert(AddClient bean) {
        conn = PracticeDB.connectDb();
        System.out.println("Insert Block");
        try {
          //  System.out.println("in try");
            sql = "CALL insertClient(?,?,?,?,?,?,?,?)";

            cs = conn.prepareCall(sql);
            cs.setString(1, bean.getF_name());
            cs.setString(2, bean.getDept());
            cs.setString(3, bean.getMobile_no());
            cs.setString(4, bean.getEmail()); 
            cs.setString(5, bean.getRequire());
            cs.setString(6, bean.getAddress());
            cs.setString(7, bean.getCity());
            cs.setString(8, bean.getEmpId());

            
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "<span class=\" text-success font-bold\">Client Added Successfully</span>";
            }
            System.out.println("sql = " + sql);
        } catch (SQLException e) {
            message = " Unable to add because of : " + e.getMessage() + " | At : " + this.getClass().getName();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println("com.qt.practice.models.ClientModel.insert()" + e.getMessage());
            }
        }
        return message;
    }

    public ArrayList<AddClient> select() {
        ArrayList<AddClient> arrayList = new ArrayList<>();
        conn = PracticeDB.connectDb();
        try {
           // System.out.println("Clients data");
            sql = "select * from clients where visibility = 1" ;
            cs = conn.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new AddClient(
                        rs.getInt("id"),
                        rs.getString("f_name"),
                        rs.getString("dept"),
                        rs.getString("mobile_no"),
                        rs.getString("email"),                        
                        rs.getString("requirement"),
                        rs.getString("address"),
                        rs.getString("city")                     
                )
                );
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new AddClient(0, this.getClass().getName(), "No data found"));
            }

        } catch (SQLException e) {
            arrayList.add(new AddClient(-1, this.getClass().getName(), e.getMessage()));
        }

        return arrayList;
    }
   
    /* Delete User */
    public String delete(AddClient beanS)throws SQLException{
     conn = PracticeDB.connectDb();
     try{
     sql = "update clients set visibility = ? where id = ?";
     cs = conn.prepareCall(sql);
     
     cs.setInt(1,0);
     cs.setLong(2, beanS.getId());
          int rows = cs.executeUpdate();
          
          if(rows>=1){
          message="Client Deleted Successuflly";
          }
     }catch(SQLException e){
     message="Unable to Delete because of : "+ e.getMessage()+"| At : " + this.getClass().getName();
     }finally{
     if(conn != null){
     conn.close();
     }
     }
     return message;
    }  
   
    // update data with store procedure //
    public String update(AddClient beanS) {
        conn = PracticeDB.connectDb();
            try {
            sql = "update clients set f_name=?, dept=?, mobile_no=?, email=?, requirement=?, address=?, city=? where id=?";
            cs = conn.prepareCall(sql);
           
            cs.setString(1, beanS.getF_name());
            cs.setString(2, beanS.getDept());
            cs.setString(3, beanS.getMobile_no());
            cs.setString(4, beanS.getEmail()); 
            cs.setString(5, beanS.getRequire());
            cs.setString(6, beanS.getAddress());
            cs.setString(7, beanS.getCity());
            cs.setInt(8, beanS.getId());

            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Client Updated Successfully";
            }
        } catch (SQLException e) {
            message = "Unable to Update because of : " + e.getMessage() + " | At : " + this.getClass().getName();

        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }

            } catch (SQLException e) {
                message = e.getMessage();
            }
        }
         return message;
    }
    
    
//     public String update(AddClient bean) {
//        conn = PracticeDB.connectDb();
//        System.out.println("Update Block");
//        try {
//          //  System.out.println("in try");
//            sql = "CALL updateClient(?,?,?,?,?,?,?,?)";
//
//            cs = conn.prepareCall(sql);
//            cs.setString(1, bean.getF_name());
//            cs.setString(2, bean.getDept());
//            cs.setString(3, bean.getMobile_no());
//            cs.setString(4, bean.getEmail()); 
//            cs.setString(5, bean.getRequire());
//            cs.setString(6, bean.getAddress());
//            cs.setString(7, bean.getCity());
//            cs.setInt(8, bean.getId());
//
//            
//            int rows = cs.executeUpdate();
//            if (rows >= 1) {
//                message = "<span class=\" text-success font-bold\">Client updated Successfully</span>";
//            }
//            System.out.println("sql = " + sql);
//        } catch (SQLException e) {
//            message = " Unable to add because of : " + e.getMessage() + " | At : " + this.getClass().getName();
//        } finally {
//            try {
//                if (conn != null) {
//                    conn.close();
//                }
//            } catch (SQLException e) {
//                System.out.println("com.qt.practice.models.ClientModel.update()" + e.getMessage());
//            }
//        }
//        return message;
//    }
//
//    
      /*  Select by id */
    public AddClient selectById(String id) throws SQLException {
        AddClient beanE = null;
        conn = PracticeDB.connectDb();
        try {
           // System.out.println("in client ");
            sql = "select * from clients where Id = " + id;
            cs = conn.prepareCall(sql);
            rs = cs.executeQuery(sql);
            while (rs.next()) {
                beanE = new AddClient(
                        rs.getInt("id"),
                        rs.getString("f_name"),
                        rs.getString("dept"),
                        rs.getString("mobile_no"),
                        rs.getString("email"),                        
                        rs.getString("requirement"),
                        rs.getString("address"),
                        rs.getString("city")  

                );
            }
        } catch (SQLException e) {
            beanE = new AddClient(0, this.getClass().getName(), e.getMessage());
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return beanE;
    }
    
      
/*  Select client by emp ID */
        
       public ArrayList<AddClient> selectByEmp(String id) {
        ArrayList<AddClient> arrayList = new ArrayList<>();
        conn = PracticeDB.connectDb();
        try {
          //  System.out.println("select by emp id");
            sql = "select * from clients where visibility = 1 And emp_id = " + id  ;
            cs = conn.prepareCall(sql);
            rs = cs.executeQuery(sql);
             while (rs.next()) {
                arrayList.add( new AddClient(
                        rs.getInt("id"),
                        rs.getString("f_name"),
                        rs.getString("dept"),
                        rs.getString("mobile_no"),
                        rs.getString("email"),                        
                        rs.getString("requirement"),
                        rs.getString("address"),
                        rs.getString("city")                
                )
                );
            }
         if (arrayList.isEmpty()) {
                arrayList.add(new AddClient(0, this.getClass().getName(), "No data found"));
            }

        } catch (SQLException e) {
            arrayList.add(new AddClient(-1, this.getClass().getName(), e.getMessage()));
        }

        return arrayList;
    }
     
   /*  Select client by User ID */
    
    public ArrayList<AddClient> searchClientByUser(String id) {
        conn = PracticeDB.connectDb();
        ArrayList<AddClient> arrayList = new ArrayList<>();
        try {
            System.out.println("select by emp id");
            sql = "select c.id, c.f_name, c.dept, c.mobile_no, c.email, c.requirement, c.address, c.city, c.emp_id\n"
                    + "from clients c, employee e\n"
                    + "where e.id = c.emp_id \n"
                    + "AND c.visibility = 1\n"
                    + "AND e.user_id  = " +id;
                   
            cs = conn.prepareCall(sql);
            rs = cs.executeQuery(sql);
             while (rs.next()) {
                arrayList.add( new AddClient(
                        rs.getInt("id"),
                        rs.getString("f_name"),
                        rs.getString("dept"),
                        rs.getString("mobile_no"),
                        rs.getString("email"),                        
                        rs.getString("requirement"),
                        rs.getString("address"),
                        rs.getString("city")                
                )
                );
            }
            if (arrayList.isEmpty()) {
                System.out.println("arrayList  " + arrayList);
                arrayList.add(new AddClient(0, this.getClass().getName(), "No data found"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            arrayList.add(new AddClient(-1, this.getClass().getName(), e.getMessage()));
        }
        return arrayList;
    }
    
   
     public ArrayList<AddClient> searchClient(int eid, int uid) {
        conn = PracticeDB.connectDb();
        ArrayList<AddClient> arrayList = new ArrayList<>();
        try {
            System.out.println("select by emp id");
            sql = "select c.id, c.f_name, c.dept, c.mobile_no, c.email, c.requirement, c.address, c.city \n"
                    + "from clients c, employee e\n"
                    + "where e.id = c.emp_id \n"
                    + "AND c.emp_id = " + eid
                    + "AND c.visibility = 1\n"
                    + "AND e.user_id = " + uid;
                   
            cs = conn.prepareCall(sql);
            rs = cs.executeQuery(sql);
             while (rs.next()) {
                arrayList.add( new AddClient(
                        rs.getInt("id"),
                        rs.getString("f_name"),
                        rs.getString("dept"),
                        rs.getString("mobile_no"),
                        rs.getString("email"),                        
                        rs.getString("requirement"),
                        rs.getString("address"),
                        rs.getString("city")                
                )
                );
            }
            if (arrayList.isEmpty()) {
                System.out.println("arrayList  " + arrayList);
                arrayList.add(new AddClient(0, this.getClass().getName(), "No data found"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            arrayList.add(new AddClient(-1, this.getClass().getName(), e.getMessage()));
        }
        return arrayList;
    }

    
}

