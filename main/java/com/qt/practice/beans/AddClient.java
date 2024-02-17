/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qt.practice.beans;

/**
 *
 * @author user
 */
public class AddClient {
    
    private int id;
    private String name;
    private String dept;
    private String mobile_no;
    private String email;
    private String requirement;
    private String address;
    private String city;
    private String emp_id;
    private String user_name;
    private String user_email;
    private String employee_name;
    private String client_name;
    public AddClient() {
        //default
    }
    
    public AddClient(int id, String name, String dept, String mobile_no, String email,
            String requirement,String address, String city, String emp_id) {
        this.id = id;
        this.name = name;
        this.dept = dept;
        this.mobile_no = mobile_no;
        this.email = email;
        this.requirement = requirement;
        this.address = address;
        this.city = city;
        this.emp_id = emp_id;
    }
    
      public AddClient(int id, String name, String dept, String mobile_no, String email,
            String requirement,String address, String city) {
        this.id = id;
        this.name = name;
        this.dept = dept;
        this.mobile_no = mobile_no;
        this.email = email;
        this.requirement = requirement;
        this.address = address;
        this.city = city;
    }
      
      
       
        
        
    public AddClient(int i, String name, String no_data_found) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

    
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }
    
    public String getF_name(){
        return name;
    }
    public void setF_name(String name){
        this.name = name;
    }
    
    public String getDept(){
        return dept;
    }
    public void setDept(String dept){
        this.dept = dept;
    }
    
    public String getMobile_no(){
        return mobile_no;
    }
    public void setMobile_no(String mobile_no){
        this.mobile_no = mobile_no;
    }
    
     public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public String getRequire(){
        return requirement;
    }
    
    public void setRequire(String requirement){
        this.requirement = requirement;
    }
    
    public String getAddress(){
        return address;
    }
    
    public void setAddress(String address){
        this.address = address;
    }
    
    public String getCity(){
        return city;
    }
    
    public void setCity(String city){
        this.city = city;
    }
    
    public String getEmpId(){
        return emp_id;
    }
    
    public void setEmpId(String emp_id){
        this.emp_id = emp_id;
    }
    
    
    
}
