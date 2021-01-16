package com.igeek.web.dao;


import com.igeek.web.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

/**
 * @Description 基础的CRUD
 * @Author JackSonWu
 * @Date 2021-01-15 15:28
 */
public class BaseDao<T> {
    private QueryRunner runner = new QueryRunner();

    //查询单个对象
    public T getBean(String sql,Class<T> clazz,Object...params) throws SQLException {
        T t = null;
        t = runner.query(JDBCUtils.getConn(), sql, new BeanHandler<>(clazz), params);
        return t;
    }
}
