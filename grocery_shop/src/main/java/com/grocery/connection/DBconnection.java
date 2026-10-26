package com.grocery.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {

    public static final String url =
            "jdbc:mysql://localhost:3306/grocerydb";

    public static final String username = "root";
    public static final String password = "Raju@1999";

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

           // System.out.println("MYSQL DRIVER LOADED");

            con = DriverManager.getConnection(url, username, password);

//            System.out.println("DATABASE CONNECTED");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}