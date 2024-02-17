/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qt.practice.beans;

/**
 *
 * @author user
 */
public class EmployeeBean {  
    private int id;
    private String first_name;
    private String last_name;
    private String designation;
    private String dept;
    private String user_Id;
    private String mobile_no;
    private String email;
    private String salary;
    private String city;

    

    public EmployeeBean() {
    }           // default 

    public EmployeeBean(int id, String first_name, String last_name, String designation, String dept, String mobile_no, String email,String city, String salary, String user_Id) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.mobile_no = mobile_no;
        this.designation = designation;
        this.dept = dept;
        this.mobile_no = mobile_no;
        this.salary = salary;
        this.city = city;
        this.user_Id = user_Id;
    }
    
    public EmployeeBean(int id, String first_name, String last_name, String designation, String dept, String mobile_no, String email,String city, String salary) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.mobile_no = mobile_no;
        this.designation = designation;
        this.dept = dept;
        this.salary = salary;
        this.city = city;
    }

     public EmployeeBean(int id, String first_name, String designation, String dept, String salary, String mobile_no) {
        this.id = id;
        this.first_name = first_name;
        this.designation = designation;        
        this.dept = dept;
        this.salary = salary;
        this.mobile_no = mobile_no;
        }
  
    
    public EmployeeBean(int i, String name, String no_data_found) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

 
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }


    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getMobile_no() {
        return mobile_no;
    }

    public void setMobile_no(String mobile_no) {
        this.mobile_no = mobile_no;
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }

     public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }
    
    public String getDept(){
        return dept;
    }
    
    public void setDept(String dept){
        this.dept = dept;
    }
    public String getSalary(){
        return salary;
    }
    
    public void setSalary(String salary){
        this.salary = salary;
    }
    
    public String getCity(){
        return city;
    }
    
    public void setCity(String city){
        this.city = city;
    }
    
     public String getUserId() {
        return user_Id;
    }

    public void setUserId(String user_Id) {
        this.user_Id = user_Id;
    }
    
    
   
    @Override
    public String toString() {
        return "EmployeeBean{" + "id=" + id + ", first_name=" + first_name + ",designation=" +designation+ ", dept=" +dept+ ", salary=" +salary+ ", email=" + email + " ,mobile_no=" +mobile_no+ " , city=" +city+ ", last_name=" + last_name + ", user_id=" + user_Id+'}';
    
    }
}
