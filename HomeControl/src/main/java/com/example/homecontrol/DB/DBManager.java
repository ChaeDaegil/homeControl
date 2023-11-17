package com.example.homecontrol.DB;

import java.sql.*;

public class DBManager{
    private static DBManager Instance = null;
    private static Connection conn = null;
    private static String url = "jdbc:mysql://redcan.iptime.org:4322/home";
    private static String user = "root";
    private static String pw = "1234";
    private static DBMachine dbMachine = null;
    private static DBUserMail dbUserMail = null;
    private static DBUser dbUser = null;
    public DBManager() {}
    public static void newInstance(){
        if(Instance==null){
            try{
                Instance = new DBManager();
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, pw);
                dbMachine = new DBMachine(conn);
                dbUserMail = new DBUserMail(conn);
                dbUser = new DBUser(conn);
            }catch (Exception e){
                System.out.println(e);
            }
        }
    }
    public static DBManager getInstance() {
        return Instance;
    }

    public DBMachine getDbMachine() {
        return dbMachine;
    }
    public DBUserMail getDBUserMail() {return dbUserMail;}
    public DBUser getDBUser() {return dbUser;}
}
