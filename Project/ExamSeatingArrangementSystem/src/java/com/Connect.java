/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Aman
 */
public class Connect {

    public static PreparedStatement pstmt;
    public static Connection connection;
    public static Statement statement;
    public static ResultSet rs;

    public Connect() {
    }

    public static void connect_mysql() {
        String envHost = System.getenv("DB_HOST");
        String envPort = System.getenv("DB_PORT");
        String envName = System.getenv("DB_NAME");
        String envUser = System.getenv("DB_USER");
        String envPass = System.getenv("DB_PASSWORD");
        String databaseUrl = System.getenv("DATABASE_URL");
        String mysqlUrl = System.getenv("MYSQL_URL");

        String host = (envHost != null && !envHost.isEmpty()) ? envHost : "localhost";
        String port = (envPort != null && !envPort.isEmpty()) ? envPort : "3306";
        String dbName = (envName != null && !envName.isEmpty()) ? envName : "esas";
        String uname = (envUser != null && !envUser.isEmpty()) ? envUser : "root";
        String pwd = (envPass != null) ? envPass : "root";

        String url;
        if (databaseUrl != null && !databaseUrl.isEmpty()) {
            url = databaseUrl.startsWith("jdbc:") ? databaseUrl : "jdbc:" + databaseUrl;
        } else if (mysqlUrl != null && !mysqlUrl.isEmpty()) {
            url = mysqlUrl.startsWith("jdbc:") ? mysqlUrl : "jdbc:" + mysqlUrl;
        } else {
            url = "jdbc:mysql://" + host + ":" + port + "/" + dbName + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
        }

        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Class.forName("com.mysql.jdbc.Driver");
            }
            if (connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection(url, uname, pwd);
            }
        } catch (Exception e) {
            System.out.println("Database Connection Error: " + e.getMessage());
        }
    }

    public static String getOptionList(String tablename, String Id, String name, String s4, int selectedID, String s5) {
        String retString = "";
        try {
            if (connection == null || connection.isClosed()) {
                connect_mysql();
            }
            String SQL = "SELECT " + s4 + " FROM " + tablename;
            pstmt = connection.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String idVal = rs.getString(Id);
                String nameVal = rs.getString(name);
                String selected = (selectedID != 0 && String.valueOf(selectedID).equals(idVal)) ? " selected" : "";
                retString += "<option value ='" + idVal + "'" + selected + ">" + nameVal + "</option>";
            }
        } catch (Exception e) {
            System.out.println("Error in getOptionList: " + e);
        }
        return retString;
    }



}
