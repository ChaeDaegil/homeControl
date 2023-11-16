package com.example.homecontrol.DB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBMachine {
    private  Connection conn = null;
    private  Statement stmt = null;

    public DBMachine(Connection conn) throws SQLException {
        stmt = conn.createStatement();
        this.conn = conn;
    }
    public ResultSet SelectDBMachine() throws SQLException {

        return stmt.executeQuery("select * from machine");
    }
    public Boolean InsertDBMachine(String sql) throws SQLException {
        return stmt.execute(sql);
    }
    public Boolean deleteDBMachine(String sql) throws SQLException {
        return stmt.execute(sql);
    }
    public Boolean updateNameDBMachine(String name,String id) throws SQLException {
        return stmt.execute(
                " UPDATE machine" +
                        "SET machine_name = '" +name + "'" +
                        "WHERE id_num = '" + id +"'"
        );
    }
    public Boolean updateStateDBMachine(String state,String id) throws SQLException {
        return stmt.execute(
                " UPDATE machine " +
                        "SET machine_state = '" + state + "' " +
                        "WHERE id_num = '" + id +"'");
    }
}
