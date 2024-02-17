/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qt.practice.beans;

/**
 *
 * @author user
 */
public class EmployeeByUserId {
    private String user_name;
    private int user_id;
    private String emp_name;
    private String emp_email;
    private String emp_phone;
    private String emp_dept;
    
   
    
    public EmployeeByUserId(int user_id, String user_name, String emp_name , String emp_email, String emp_phone, String emp_dept) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.emp_name = emp_name;
        this.emp_email = emp_email;
        this.emp_phone = emp_phone;
        this.emp_dept = emp_dept;
    }
    
 

    public EmployeeByUserId(int i, String name, String message) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
     public int getUserId() {
        return user_id;
    }

    public void setUserId(int user_id) {
        this.user_id = user_id;
    }
    
     public String getUserName() {
        return user_name;
    }

    public void setUserName(String user_name) {
        this.user_name = user_name;
    }
    
    public String getUserName1() {
        return user_name;
    }

    public void setUserName1(String user_name) {
        this.user_name = user_name;
    }
    
    public String getEmpName() {
        return emp_name;
    }

    public void setEmpName(String emp_name) {
        this.emp_name = emp_name;
    }
    
    public String getEmpEmail() {
        return  emp_email;
    }

    public void setEmpEmail(String  emp_email) {
        this. emp_email =  emp_email;
    }
    
     public String getEmpPhone() {
        return  emp_phone;
    }

    public void setEmpPhone(String  emp_phone) {
        this. emp_phone =  emp_phone;
    } 
    
    public String getEmpDept() {
        return  emp_dept;
    }

    public void setEmpdept(String  emp_dept) {
        this. emp_dept =  emp_dept;
    }
    
}
