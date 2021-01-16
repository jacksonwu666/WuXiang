package com.igeek.web.services;


import com.igeek.web.dao.UserDao;
import com.igeek.web.entity.User;
import com.igeek.web.utils.JDBCUtils;

import java.sql.SQLException;

/**
 * @Description TODO
 * @Author JackSonWu
 * @Date 2021-01-15 15:33
 */
public class UserService {
    private UserDao dao = new UserDao();

    public User login(String username, String password) {
        User user = null;
        try {
            user = dao.selectOne(username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            JDBCUtils.closeConn();
        }
        return user;
    }

}
