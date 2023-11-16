package com.example.homecontrol.DB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUserMail {
    private Connection conn = null;
    private Statement stmt = null;

    public DBUserMail(Connection conn) throws SQLException {
        stmt = conn.createStatement();
        this.conn = conn;
    }
    public ResultSet SelectDBUserMail() throws SQLException {

        return stmt.executeQuery("select * from user_mail");
    }
    public ResultSet SelectDBUserMail(String user_id) throws SQLException {
        String sql = String.format(
                "select ID,title,user_content,uc_date,admin_content,ac_date from user_mail " +
                "inner join user " +
                "on user_mail.user_id = user.id_num " +
                "where user_mail.user_id = '%s' ",
                user_id
        );
        return stmt.executeQuery(sql);
    }
    public Boolean insertDBUserMail(String user_id,String title,String user_content) throws SQLException {
        String sql = String.format(
                "insert into user_mail (user_id,title,user_content) " +
                "values ('%s','%s','%s')"
                ,user_id
                ,title
                , user_content
        );
        return stmt.execute(sql);
    }
    public Boolean deleteDBUserMail(String user_mail_id) throws SQLException {
        String sql = String.format(
                "delete from user_mail where user_mail_id = '%s' "
                , user_mail_id
        );
        return stmt.execute(sql);
    }
    public Boolean updateDBUserMailContent(String user_mail_id,String user_content) throws SQLException {
        String sql = String.format(
                "update user_mail " +
                "set user_content = '%s' " +
                "where user_mail_id = '%s' "
                ,user_content
                , user_mail_id
        );
        return stmt.execute(sql);
    }
    public Boolean updateDBUserMailAdminContent(String user_mail_id,String admin_content) throws SQLException {
        String sql = String.format(
                "update user_mail " +
                        "set admin_content = '%s' " +
                        "where user_mail_id = '%s' "
                ,admin_content
                , user_mail_id
        );
        return stmt.execute(sql);
    }
}
