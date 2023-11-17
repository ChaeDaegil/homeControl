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
    public ResultSet SelectDBMachine(String user_id) throws SQLException {
        String sql = String.format(
                "select * from machine where user_id='%s'"
                ,user_id
        );
        return stmt.executeQuery(sql);
    }
    public Boolean InsertDBMachine(String machine_name,String user_id) throws SQLException {
        String sql = String.format(
                "INSERT INTO machine (user_id,machine_name,machine_state) " +
                "VALUES ('%s','%s','0') "
                ,user_id
                ,machine_name
        );
        return stmt.execute(sql);
    }
    public Boolean deleteDBMachine(String machineId) throws SQLException {
        String sql = String.format(
                "DELETE FROM machine " +
                "WHERE id_num = '%s' "
                ,machineId
        );
        return stmt.execute(sql);
    }
    public Boolean updateNameDBMachine(String name,String machine_id) throws SQLException {
        String sql = String.format(
                "UPDATE machine " +
                "SET machine_name = '%s' " +
                "WHERE id_num = '%s' "
                ,name
                ,machine_id
        );
        return stmt.execute(sql);
    }
    public Boolean updateStateDBMachine(String state,String machine_id) throws SQLException {
        String sql = String.format(
                "UPDATE machine " +
                "SET machine_state = '%s' " +
                "WHERE id_num = '%s' "
                ,state
                ,machine_id
        );

        return stmt.execute(sql);
    }
}
