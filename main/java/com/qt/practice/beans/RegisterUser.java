/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qt.practice.beans;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author user
 */
public class RegisterUser {
    
    private int id;
    private String first_name;
    private String last_name;
    private String mobile_number;
    private String email;
    private String img_name;
    private String img_path;
    

    public RegisterUser() {
    }           // default 

    public RegisterUser(int id, String first_name, String last_name, String email, String mobile_number, String img_name, String img_path ) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.mobile_number = mobile_number;
        this.img_name = img_name;
        this.img_path = img_path;

    }
    
    public RegisterUser(int id, String first_name, String last_name, String email, String mobile_number, String img_name) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.mobile_number = mobile_number;
        this.img_name = img_name;

    }
    
    public RegisterUser(int id, String first_name ) {
        this.id = id;
        this.first_name = first_name;
       
    }

    public RegisterUser(int i, String name, String no_data_found) {
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

    public String getMobile_number() {
        return mobile_number;
    }

    public void setMobile_number(String mobile_number) {
        this.mobile_number = mobile_number;
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
     public String getImage_name(){
        return img_name;
    }
    
    public void setImage_name(String img_name){
        this.img_name = img_name;
    }

    
    public String getImage_path(){
        return img_path;
    }
    
    public void setImage_path(String img_path){
        this.img_path = img_path;
    }
    
    

}
