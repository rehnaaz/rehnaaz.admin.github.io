package com.qt.practice.common;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class PracticeDB {
    
    private static final String DATABASE = "user";
    private static final String LOCAL_DB_USER = "root";
    private static final String LOCAL_DB_PASS = "1234";
    private static final String DBURL ="jdbc:mysql://localhost:3306/"+ DATABASE + "?"
            + "noAccessToProcedureBodies=true&"
            + "autoReconnect=true&"
            + "autoReconnectForPools=true&"
            + "useSSL=false&"
            + "max_allowed_packet=1024*1024*240&"
            + "maxPoolSize=10&"
            + "idleConnectionTestPeriod=3600&"
            + "testConnectionOnCheckIn=true";
    
    public static Connection connectDb(){
    Connection con=null;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(DBURL, LOCAL_DB_USER, LOCAL_DB_PASS);
       System.out.println("Done");
    }
    catch (ClassNotFoundException | SQLException e){
        System.out.println(e.getMessage());                
    }
    return con;
    }
    public static void main(String[] args) throws SQLException{
    connectDb();
    }

    public static Connection ConnectDB() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
        static class CLIENT_TYPE {

        public CLIENT_TYPE() {
        }

        static class equals {

            public equals() {
            }
        }
    }

}
