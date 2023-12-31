package com.example.homecontrol.DB;

import java.nio.file.ClosedFileSystemException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DBUserMail {
    private Connection conn = null;
    private Statement stmt = null;

    public DBUserMail(Connection conn) throws SQLException {
        stmt = conn.createStatement();
        this.conn = conn;
    }

    public ResultSet SelectDBAllMail() throws SQLException {
        String sql = String.format(
                "select * from user_mail" + " inner join user " +
                        "on user_mail.user_id = user.id_num "
        );
        return stmt.executeQuery(sql);
    }

    public ResultSet GetAllUserMailCount() throws SQLException {
        String sql = String.format(
                "select COUNT(*) as count from user_mail" + " inner join user " +
                        "on user_mail.user_id = user.id_num "
        );
        return stmt.executeQuery(sql);
    }

    public ResultSet GetSearchUserMailCount(String user) throws SQLException {
        String sql = String.format(
                "select COUNT(*) as count from user_mail " +"inner join user "
                        + "on user_mail.user_id = user.id_num "
                        + "where " + "INSTR(ID,'%s')>0 "
                ,user
        );
        return stmt.executeQuery(sql);
    }

    public ResultSet SelectDBUserMail(String mail_id) throws SQLException {
        String sql = String.format(
                "select * from user_mail where user_mail_id = '%s'"
                ,mail_id
        );
        return stmt.executeQuery(sql);
    }
    public ResultSet SelectDBUserAllMail(String user_id) throws SQLException {
        String sql = String.format(
                "select (select count(*) from user_mail where user_mail.user_id = '%s' ) as count,user.*,user_mail.* from user_mail " +
                "inner join user " +
                "on user_mail.user_id = user.id_num " +
                "where user_mail.user_id = '%s' LIMIT %d,%d "
                , user_id
                , user_id
                ,0
                ,12

        );
        return stmt.executeQuery(sql);
    }
    public ResultSet SelectDBUserAllMail(String user_id,String pageIndex) throws SQLException {
        String sql = String.format(
                "select (select count(*) from user_mail where user_mail.user_id = '%s' ) as count,user.*,user_mail.* from user_mail " +
                        "inner join user " +
                        "on user_mail.user_id = user.id_num " +
                        "where user_mail.user_id = '%s' LIMIT %d,%d "
                , user_id
                , user_id
                ,Integer.parseInt(pageIndex) * 12
                ,12

        );
        return stmt.executeQuery(sql);
    }

    public ResultSet wantPageMail(int start_num, int end_num) throws SQLException {
        String sql = String.format(
                "select * from user_mail " +
                        "inner join user " +
                        "on user_mail.user_id = user.id_num " +
                        "ORDER BY user_mail_id DESC " +
                        "LIMIT %d, %d ",
                start_num, end_num
        );
        System.out.println(start_num);
        System.out.println(end_num);
        return stmt.executeQuery(sql);
    }

    public ResultSet SelectDBUserSearchTitle(String user_id,String title) throws SQLException {
        String sql = String.format(
                "select (select count(*) from user_mail where user_mail.user_id = '%s' and INSTR(title,'%s')>0) as count,user.*, user_mail.* from user_mail " +
                "inner join user " +
                "on user_mail.user_id = user.id_num " +
                "where user_mail.user_id = '%s' and " +
                "INSTR(title,'%s')>0 LIMIT %d,%d "
                ,user_id
                ,title
                , user_id
                ,title
                ,0
                ,12
        );
        return stmt.executeQuery(sql);
    }
    public ResultSet SelectDBUserSearchTitle(String user_id,String title,String pageIndex) throws SQLException {
        String sql = String.format(
                "select (select count(*) from user_mail where user_mail.user_id = '%s' and INSTR(title,'%s')>0) as count,user.*, user_mail.* from user_mail " +
                        "inner join user " +
                        "on user_mail.user_id = user.id_num " +
                        "where user_mail.user_id = '%s' and " +
                        "INSTR(title,'%s')>0 LIMIT %d,%d "
                ,user_id
                ,title
                , user_id
                ,title
                ,Integer.parseInt(pageIndex) * 12
                ,12
        );
        return stmt.executeQuery(sql);
    }
    public ResultSet SelectDBUserSearchTitle(String title) throws SQLException {
        String sql = String.format(
                "select * from user_mail " +"inner join user "
                + "on user_mail.user_id = user.id_num "
                + "where " + "INSTR(title,'%s')>0 "
                ,title
        );
        return stmt.executeQuery(sql);
    }

    public ResultSet GetSearchTitleMailCount(String title) throws SQLException {
        String sql = String.format(
                "select COUNT(*) as count from user_mail " +"inner join user "
                        + "on user_mail.user_id = user.id_num "
                        + "where " + "INSTR(title,'%s')>0 "
                ,title
        );
        return stmt.executeQuery(sql);
    }

    public ResultSet SearchTitleWantPageMail(String title,int start_num, int end_num) throws SQLException {
        String sql = String.format(
                "select * from user_mail " +"inner join user "
                        + "on user_mail.user_id = user.id_num "
                        + "where " + "INSTR(title,'%s')>0 "
                        + "ORDER BY user_mail_id DESC LIMIT "
                        + "%d, %d "
                ,title, start_num, end_num
        );
        return stmt.executeQuery(sql);
    }

    public ResultSet SelectDBUserSearchUser(String user) throws SQLException {
        String sql = String.format(
                "select * from user_mail " +"inner join user "
                + "on user_mail.user_id = user.id_num "
                + "where " + "INSTR(ID,'%s')>0 "
                ,user
        );
        return stmt.executeQuery(sql);
    }

    public ResultSet SearchUserWantPageMail(String user,int start_num, int end_num) throws SQLException {
        String sql = String.format(
                "select * from user_mail " +"inner join user "
                        + "on user_mail.user_id = user.id_num "
                        + "where " + "INSTR(ID,'%s')>0 "
                        + "ORDER BY user_mail_id DESC LIMIT "
                        + "%d, %d "
                ,user , start_num, end_num
        );
        return stmt.executeQuery(sql);
    }

    public ResultSet SelectDBUserSearchContent(String user_id,String content) throws SQLException {
        String sql = String.format(
                "select (select count(*) from user_mail where user_mail.user_id = '%s' ) as count,user.*,user_mail.* from user_mail " +
                "inner join user " +
                "on user_mail.user_id = user.id_num " +
                "where user_mail.user_id = '%s' and " +
                "INSTR(user_content,'%s')>0 LIMIT %d,%d "
                , user_id
                , user_id
                ,content
                ,0
                ,12
        );
        return stmt.executeQuery(sql);
    }
    public ResultSet SelectDBUserSearchContent(String user_id,String content,String pageIndex) throws SQLException {
        String sql = String.format(
                "select (select count(*) from user_mail where user_mail.user_id = '%s' and INSTR(user_content,'%s')>0) as count,user.*,user_mail.* from user_mail " +
                        "inner join user " +
                        "on user_mail.user_id = user.id_num " +
                        "where user_mail.user_id = '%s' and " +
                        "INSTR(user_content,'%s')>0 LIMIT %d,%d "
                , user_id
                ,content
                , user_id
                ,content
                ,Integer.parseInt(pageIndex) * 12
                ,12
        );
        return stmt.executeQuery(sql);
    }
    public Boolean insertDBUserMail(String user_id,String title,String user_content) throws SQLException {
        String sql = String.format(
                "insert into user_mail (user_id,title,user_content,uc_date) " +
                "values ('%s','%s','%s','%s')"
                ,user_id
                ,title
                ,user_content
                ,LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"))
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
    public Boolean updateDBUserMailContent(String user_mail_id,String title,String user_content) throws SQLException {
        String sql = String.format(
                "update user_mail " +
                "set user_content = '%s', " +
                "title = '%s', " +
                "uc_date = '%s' " +
                "where user_mail_id = '%s' "
                ,user_content
                ,title
                ,LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"))
                , user_mail_id
        );
        return stmt.execute(sql);
    }
    public Boolean updateDBUserMailContent(String user_mail_id, String admin_content) throws SQLException {
        String sql = String.format(
                "update user_mail " +
                        "set uc_date = '%s', " +
                        "admin_content = '%s' " +
                        "where user_mail_id = '%s' "
                ,LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"))
                ,admin_content
                ,user_mail_id
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
