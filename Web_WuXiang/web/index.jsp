<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>如何通过submit提交表单</title>
    <script>
        // 登录
        function login(){
            var username = document.getElementsByClassName("username")[0].value;
            var password = document.getElementsByClassName("password")[0].value;
            if(validateName(username) & validatePwd(password)){
                return true;
            }else{
                return false;
            }
        }
        // 检验用户名是否为空
        function validateName(username){
            var namemsg = document.getElementsByClassName("namemsg")[0];
            if(username==null || username==""){
                namemsg.innerHTML="<span style='color: red;'>姓名不能为空</span>";
                return false;
            }else if(validateNameRegExp(username)){
                namemsg.innerHTML="<span style='color: green;'>姓名通过</span>"
                return true;
            }else{
                namemsg.innerHTML="<span style='color: red;'>姓名不合法</span>";
            }
        }
        // 检验密码是否为空
        function validatePwd(password){
            var pwdmsg = document.getElementsByClassName("pwdmsg")[0];
            if(password==null || password==""){
                pwdmsg.innerHTML="<span style='color: red;'>密码不能为空</span>";
                return false;
            }else if(validatePwdWeek(password)){
                pwdmsg.innerHTML="<span style='color: green;'>密码通过</span>"
                return true;
            }else{
                pwdmsg.innerHTML="<span style='color: red;'>密码太弱</span>"
                return false;
            }
        }
        //用户名正则表达式匹配
        function validateNameRegExp(username){
            var reg = new RegExp("^[A-Za-z0-9]+$")
            if(reg.test(username)){
                return true;
            }else{
                return false;
            }
        }
        // 密码强弱校验
        function validatePwdWeek(password){
            var ruoPwd = document.getElementById("ruo");
            var zhongPwd = document.getElementById("zhong");
            var qiangPwd = document.getElementById("qiang");
            var reg1 = new RegExp("^[0-9]*$");
            var reg2 = new RegExp("^[A-Za-z]+$");
            var reg3 = new RegExp("^[A-Za-z0-9]+$");
            if(reg1.test(password) || reg2.test(password)){
                //弱密码
                ruo.innerHTML="<font style='color:#EEEEEE;background-color: red;'>弱</font>";
                return false;
            }else if(reg3.test(password)){
                //中密码
                ruo.innerHTML="<font style='color:#EEEEEE;background-color: red;'>中</font>";
                zhong.innerHTML="<font style='color:#EEEEEE;background-color: green;'>中</font>";
                return true;
            }else{
                //强密码
                ruo.innerHTML="<span style='color:#EEEEEE;background-color: red;'>强</span>";
                zhong.innerHTML="<font style='color:#EEEEEE;background-color: green;'>强</font>";
                qiang.innerHTML="<font style='color:#EEEEEE;background-color: blue;'>强</font>";
                return true;
            }
        }
    </script>
</head>
<body>
<form action="first" method="get" id="loginForm" onsubmit="return login()">
    <table align="center" border="1px" cellspacing="0" cellpadding="8px">
        <tr>
            <th colspan="2">
                登录页面
            </th>
        </tr>
        <tr>
            <td>用户名:</td>
            <td><input type="text" name="username" class="username" placeholder="请输入用户名">
                <div class="namemsg"></div>
            </td>
        </tr>
        <tr>
            <td>密码:</td>
            <td>
                <input type="password" name="password" class="password" placeholder="请输入密码">
                <div class="pwdmsg"></div>
                <span id="ruo"></span>  <span id="zhong"></span>  <span id="qiang"></span>
            </td>
        </tr>
        <tr>
            <td>爱好：</td>
            <td colspan="2">
                <input type="checkbox" name="hobby" value="music">音乐
                <input type="checkbox" name="hobby" value="it">编程
                <input type="checkbox" name="hobby" value="篮球">篮球
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="登录" />&nbsp;
                <input type="reset" value="重置" />
            </td>
        </tr>
    </table>
</form>
</body>

</html>