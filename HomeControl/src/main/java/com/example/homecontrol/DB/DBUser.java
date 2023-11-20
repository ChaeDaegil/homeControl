package com.example.homecontrol.DB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUser {
    private Connection conn = null;
    private Statement stmt = null;

    public DBUser(Connection conn) throws SQLException {
        stmt = conn.createStatement();
        this.conn = conn;
    }
    public ResultSet SelectDBUser( ) throws SQLException {
        String sql = String.format(
                "select * from user"
        );
        return stmt.executeQuery(sql);
    }

    public ResultSet CountDBUser( ) throws SQLException {
        String sql = String.format(
                "select COUNT(*) as count from user"
        );
        return stmt.executeQuery(sql);
    }
    public ResultSet SelectDBUser(String user_num) throws SQLException {
        String sql = String.format(
                "select * from user where id_num = '%s'"
                ,user_num
        );
        return stmt.executeQuery(sql);
    }

    public ResultSet SelectDBUserID(String user_id) throws SQLException {
        String sql = String.format(
                "select * from user where ID = '%s'"
                ,user_id
        );
        return stmt.executeQuery(sql);
    }
    public Boolean SelectDBUserIDCheck(String user_id) throws SQLException {
        String sql = String.format(
                "select * from user where ID = '%s'"
                ,user_id
        );
        return stmt.execute(sql);
    }
    public Boolean InsertDBUser(String user_id,String user_password) throws SQLException {
        String sql = String.format(
                "INSERT INTO `home`.`user` (`ID`,`PW`,`auth`)" +
                        "VALUES ('%s','%s','0') "
                ,user_id
                ,user_password
        );
        return stmt.execute(sql);
    }
}
