/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qt.practice.beans;

/**
 *
 * @author user
 */
public class AdminBean {
     private int id;
    private String name;
    private String phone;
    private String email;
    private String password;
    private String address;
    private String city;
    private String state;
    private int authentication;
    private int attempts;
    private String UserType;

  
    private String createdAt;
    private String modifiedAt;



 public AdminBean() {
    }

//    public AdminBean(int serialNo, String location, String exception) {
//        this.serialNo = serialNo;
//        this.location = location;
//        this.exception = exception;
//    }
    
   

    public AdminBean(int id, String name, String phone,String email, String password, String address, String city, String state, int authentication, int attempts, String UserType, String createdAt, String modifiedAt) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.address = address;
        this.city = city;
        this.state = state;
        this.authentication = authentication;
        this.attempts = attempts;
        this.UserType = UserType;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
  public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


}