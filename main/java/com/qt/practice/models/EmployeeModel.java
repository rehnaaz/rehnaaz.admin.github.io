 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qt.practice.models;

import com.qt.practice.beans.EmployeeByUserId;
import com.qt.practice.beans.EmployeeBean;
import com.qt.practice.common.PracticeDB;
import com.qt.practice.beans.RegisterUser;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class EmployeeModel {
    Connection con = null;
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;

    // Login VAr
    Statement st = null;
    HttpSession session = null;
    PreparedStatement ps = null;
    

 public String insert(EmployeeBean userBean) {
        con = PracticeDB.connectDb();
        System.out.println("Insert Block");
        try {
            System.out.println("in try");
            sql = "insert into employee (first_name, last_name, designation, dept, mobile_no, salary, email, city, user_id) values (?,?,?,?,?,?,?,?,?)";

            cs = con.prepareCall(sql);
            cs.setString(1, userBean.getFirst_name());
            cs.setString(2, userBean.getLast_name());
            cs.setString(3, userBean.getDesignation());
            cs.setString(4, userBean.getDept()); 
            cs.setString(5, userBean.getMobile_no());
            cs.setString(6, userBean.getSalary());
            cs.setString(7, userBean.getEmail());
            cs.setString(8, userBean.getCity());
            cs.setString(9, userBean.getUserId());

            
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "<span class=\" text-success font-bold\">Employee Added Successfully</span>";
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
                System.out.println("com.qt.practice.models.EmployeeModel.insert()" + e.getMessage());
            }
        }
        return message;

    }

    
    public ArrayList<EmployeeBean> select() {
        ArrayList<EmployeeBean> arrayList = new ArrayList<>();
        con = PracticeDB.connectDb();
        try {
           // System.out.println("Employee data");
            sql = "select * from employee where visibility = 1" ;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new EmployeeBean(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("designation"),
                        rs.getString("dept"),
                        rs.getString("salary"),
                        rs.getString("email"),
                        rs.getString("mobile_no"),
                        rs.getString("city")
                )
                );
            }
            if (arrayList.isEmpty()) {
                arrayList.add(new EmployeeBean(0, this.getClass().getName(), "No data found"));
            }

        } catch (SQLException e) {
            arrayList.add(new EmployeeBean(-1, this.getClass().getName(), e.getMessage()));
        }

        return arrayList;
    }
   
    
      
    /* Delete User */
//    public String delete(EmployeeBean beanS)throws SQLException{
//     con = PracticeDB.connectDb();
//     try{
//     sql = "update employee set visibility = ? where id = ?";
//     cs = con.prepareCall(sql);
//     
//     cs.setInt(1,0);
//     cs.setLong(2, beanS.getId());
//          int rows = cs.executeUpdate();
//          
//          if(rows>=1){
//          message="User Deleted Successuflly";
//          }
//     }catch(SQLException e){
//     message="Unable to Delete because of : "+ e.getMessage()+"| At : " + this.getClass().getName();
//     }finally{
//     if(con != null){
//     con.close();
//     }
//     }
//     return message;
//    }
    
    // deleteEmployee
    
    public String delete(EmployeeBean beanS)throws SQLException{
     con = PracticeDB.connectDb();
     try{
    // sql = "update employee set visibility = ? where id = ?";
        sql = "CALL deleteEmployee(?)";
        cs = con.prepareCall(sql);

        cs.setInt(1, beanS.getId());
            int rows = cs.executeUpdate();
            if(rows>=1){
                message="User Deleted Successuflly";
            }
            
         }  catch(SQLException e){
                message="Unable to Delete because of : "+ e.getMessage()+"| At : " + this.getClass().getName();
         }  finally
                {
                    if(con != null){
                    con.close();
                }
            }
        return message;
    }
   

//    public String update(EmployeeBean beanS) {
//        con = PracticeDB.connectDb();
//        try {
//            sql = "update employee set first_name=?, last_name=?, designation=?, dept=?, mobile_no=?, email=?,city=?, salary=? where id=?";
//            cs = con.prepareCall(sql);
//           
//            cs.setString(1, beanS.getFirst_name());
//            cs.setString(2, beanS.getLast_name());
//            cs.setString(3, beanS.getDesignation());
//            cs.setString(4, beanS.getDept());
//            cs.setString(5, beanS.getMobile_no());            
//            cs.setString(6, beanS.getEmail());
//            cs.setString(7, beanS.getCity());
//            cs.setString(8, beanS.getSalary());
//            cs.setInt(9, beanS.getId());
//
//            int rows = cs.executeUpdate();
//            if (rows >= 1) {
//                message = "Employee Updated Successfully";
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
    
    
    // update employee with store procedure
    
     public String update(EmployeeBean beanS) {
        con = PracticeDB.connectDb();
        try {
            sql = "CALL updateEmployee(?,?,?,?,?,?,?,?,?)"; 
            cs = con.prepareCall(sql);
           
            cs.setString(1, beanS.getFirst_name());
            cs.setString(2, beanS.getLast_name());
            cs.setString(3, beanS.getDesignation());
            cs.setString(4, beanS.getDept());
            cs.setString(5, beanS.getMobile_no());            
            cs.setString(6, beanS.getEmail());
            cs.setString(7, beanS.getCity());
            cs.setString(8, beanS.getSalary());
            cs.setInt(9, beanS.getId());

            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Employee Updated Successfully";
            }
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
    
    public String display(EmployeeBean beanS) {
        con = PracticeDB.connectDb();
        try {
            sql = "select * from employee where id=?";
            cs = con.prepareCall(sql);
            cs.setString(1, beanS.getFirst_name());
            cs.setString(2, beanS.getLast_name());
            cs.setString(3, beanS.getDesignation());
            cs.setString(4, beanS.getDept());
            cs.setString(5, beanS.getMobile_no());            
            cs.setString(6, beanS.getEmail());
            cs.setString(7, beanS.getCity());
            cs.setString(8, beanS.getSalary());
            cs.setInt(9, beanS.getId());

            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "Employee details displayed Successfully";
            }
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
    
    
    
    /*  Select by id */
    public EmployeeBean selectById(String id) throws SQLException {
        EmployeeBean beanE = null;
        con = PracticeDB.connectDb();
        try {
          System.out.println("select by id");

            sql = "select * from employee where id = " + id;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery(sql);
            while (rs.next()) {
                beanE = new EmployeeBean(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("designation"),
                        rs.getString("dept"),                        
                        rs.getString("mobile_no"),
                        rs.getString("email"),
                        rs.getString("city"),                       
                        rs.getString("salary"),
                        rs.getString("user_Id")

                );
            }
        } catch (SQLException e) {
            beanE = new EmployeeBean(0, this.getClass().getName(), e.getMessage());
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return beanE;
    }
    
/*  Select employee by User ID */
        
       public ArrayList<EmployeeBean> selectByUser(String id) {
        ArrayList<EmployeeBean> arrayList = new ArrayList<>();
        con = PracticeDB.connectDb();
        try {
           // System.out.println("select emp by user id");
            sql = "select id, first_name, designation, dept,salary, mobile_no from employee where visibility = 1 AND user_id = " + id ;
            cs = con.prepareCall(sql);
            rs = cs.executeQuery(sql);
             while (rs.next()) {
                arrayList.add(new EmployeeBean(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("designation"),
                        rs.getString("dept"),
                        rs.getString("salary"),
                        rs.getString("mobile_no")               
                )
                );
            }
         if (arrayList.isEmpty()) {
                arrayList.add(new EmployeeBean(0, this.getClass().getName(), "No data found"));
            }

        } catch (SQLException e) {
            arrayList.add(new EmployeeBean(-1, this.getClass().getName(), e.getMessage()));
        }

        return arrayList;
    }
    
    
    
    // employee  search by any details (Like query)  (name/designaion/dept)
       
    public ArrayList<EmployeeBean> searchEmpBydetail(String data) {
        con = PracticeDB.connectDb();
        String keyword = "%" + data + "%";
        ArrayList<EmployeeBean> arrayList = new ArrayList<>();
        try {
            System.out.println("in try");
            sql = "SELECT * FROM employee WHERE visibility=1 AND first_name LIKE '%" + keyword + "%' or  visibility =1 AND designation LIKE '%" + keyword + "%' or  visibility =1 AND dept LIKE '%" + keyword + "%' ";
            cs = con.prepareCall(sql);
            //System.out.println("sql---"+ sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new EmployeeBean(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("designation"),
                        rs.getString("dept"),                        
                        rs.getString("mobile_no"),
                        rs.getString("email"),
                        rs.getString("city"),                       
                        rs.getString("salary")
                )
                );
            }
            if (arrayList.isEmpty()) {
                System.out.println("arrayList  " + arrayList);
                arrayList.add(new EmployeeBean(0, this.getClass().getName(), "No data found"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            arrayList.add(new EmployeeBean(-1, this.getClass().getName(), e.getMessage()));
        }
        return arrayList;
    }

//    Select Employee by Date
     public ArrayList<EmployeeBean> empByDate(String from, String to) {
        ArrayList<EmployeeBean> arrayList = new ArrayList<>();
        con = PracticeDB.connectDb();
        try {
            System.out.println("Employee by date");
            sql = "select * from employee WHERE created_on BETWEEN '" + from + " 00:00:00' AND '" + to + " 23:59:59' AND visibility = 1";
             cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
            System.out.println("in while");

                arrayList.add(new EmployeeBean(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("designation"),
                        rs.getString("dept"),                        
                        rs.getString("mobile_no"),
                        rs.getString("email"),
                        rs.getString("city"),                       
                        rs.getString("salary")
                )
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            arrayList.add(new EmployeeBean(-1, this.getClass().getName(), e.getMessage()));
        }
        return arrayList;
    }
     
      public ArrayList<EmployeeBean> searchEmpByUser(String id) {
        con = PracticeDB.connectDb();
        ArrayList<EmployeeBean> arrayList = new ArrayList<>();
        try {
            System.out.println("in try");
            sql = "select * from employee where visibility = 1 AND user_id = " +id;
             cs = con.prepareCall(sql);
            //System.out.println("sql---"+ sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                arrayList.add(new EmployeeBean(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("designation"),
                        rs.getString("dept"),                        
                        rs.getString("mobile_no"),
                        rs.getString("email"),
                        rs.getString("city"),                       
                        rs.getString("salary")
                )
                );
            }
            if (arrayList.isEmpty()) {
                System.out.println("arrayList  " + arrayList);
                arrayList.add(new EmployeeBean(0, this.getClass().getName(), "No data found"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            arrayList.add(new EmployeeBean(-1, this.getClass().getName(), e.getMessage()));
        }
        return arrayList;
    }

}

