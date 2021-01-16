package com.igeek.web.servlet;

import com.igeek.web.entity.User;
import com.igeek.web.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Description TODO
 * @Author JackSonWu
 * @Date 2021-01-15 15:35
 */
@WebServlet(name = "UserServlet",urlPatterns = "/user")
public class UserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求中编码集
        request.setCharacterEncoding("UTF-8");

        //获得请求参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserService service = new UserService();

        if (username!=null && password!=null){
            User user = service.login(username, password);
            if (user!=null){
                String state = user.getState();
                switch (state){
                    case "0":
                        request.setAttribute("msg","当前账户未审核，请耐心等待");
                        request.getRequestDispatcher("login.jsp").forward(request,response);
                        break;
                    case "1":
                        request.getRequestDispatcher("success.jsp").forward(request,response);
                        break;
                    case "2":
                        request.setAttribute("msg","当前账户审核失败，请重新提交信息");
                        request.getRequestDispatcher("login.jsp").forward(request,response);
                        break;
                }
            }else {
                request.setAttribute("msg","姓名和密码不匹配，登录失败");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        }else {
            //请求属性
            request.setAttribute("msg","姓名或密码有误，登录失败");
            request.getRequestDispatcher("fail.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
