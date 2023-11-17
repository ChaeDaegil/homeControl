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
    public ResultSet SelectDBUser(String user_id) throws SQLException {
        String sql = String.format(
                "select * from user where id_num = '%s'"
                ,user_id
        );
        return stmt.executeQuery(sql);
    }
}
