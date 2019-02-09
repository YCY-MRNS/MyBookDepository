package com.ycy.mybook.dao.impl;

import com.ycy.mybook.dao.DAO;
import com.ycy.mybook.db.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.*;
import java.util.List;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-01-27 14:10
 */
public class BaseDAO<T> implements DAO<T> {

    private QueryRunner queryRunner = new QueryRunner();
    private Class<T> clazz;

    BaseDAO() {
        Type genericSuperclass = getClass().getGenericSuperclass();
        if (genericSuperclass instanceof ParameterizedType) {
            ParameterizedType type = (ParameterizedType) genericSuperclass;
            Type[] actualTypeArguments = type.getActualTypeArguments();
            if (actualTypeArguments != null && actualTypeArguments.length > 0) {
                if (actualTypeArguments[0] instanceof Class) {
                    clazz = ((Class) actualTypeArguments[0]);
                }
            }
        }
    }

    @Override
    public long insert(String sql, Object... args) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        long id = 0;

        try {
            connection = JDBCUtils.getConnection();
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            if (args != null) {
                for (int i = 0; i < args.length; i++) {
                    statement.setObject(i + 1, args[i]);
                }
            }
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            while (resultSet.next()) {
                id = resultSet.getLong(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.releaseRource(connection, statement, resultSet);
        }
        return id;
    }

    @Override
    public void update(String sql, Object... args) {
        Connection connection = null;

        try {
            connection = JDBCUtils.getConnection();
            queryRunner.update(connection, sql, args);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.releaseRource(connection, null, null);
        }

    }

    @Override
    public T query(String sql, Object... args) {
        Connection connection = null;
        try {
            connection = JDBCUtils.getConnection();
            return queryRunner.query(connection, sql, new BeanHandler<>(clazz), args);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.releaseRource(connection, null, null);
        }
        return null;
    }

    @Override
    public List<T> queryForList(String sql, Object... args) {
        Connection connection = null;
        try {
            connection = JDBCUtils.getConnection();
            return queryRunner.query(connection, sql, new BeanListHandler<>(clazz), args);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.releaseRource(connection, null, null);
        }
        return null;
    }

    @Override
    public <V> V getSingleVal(String sql, Object... args) {
        Connection connection = null;
        try {
            connection = JDBCUtils.getConnection();
            return ((V) queryRunner.query(connection, sql, new ScalarHandler(), args));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.releaseRource(connection, null, null);
        }
        return null;
    }

    @Override
    public void Batch(String sql, Object[]... args) {
        Connection connection = null;
        try {
            connection = JDBCUtils.getConnection();
            queryRunner.batch(connection, sql, args);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.releaseRource(connection, null, null);
        }
    }
}
