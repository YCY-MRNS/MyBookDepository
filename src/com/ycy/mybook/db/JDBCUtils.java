package com.ycy.mybook.db;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-01-27 19:48
 */
public class JDBCUtils {


    public static void releaseRource(Connection c, PreparedStatement ps, ResultSet rs) {
        try {
            if (c != null) {
                c.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (ps != null) {
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private static DataSource dataSource = null;

    static {
        dataSource = new ComboPooledDataSource("mybooks");
    }

    /**
     * 从C3P0连接池中拿到Connection
     *
     * @return
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

}
