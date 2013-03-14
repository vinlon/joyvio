<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CMS.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登录-网站后台管理系统</title>
    <link href="/!css/login.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //保证登录页不是子页，即不会显示在frameset中
        if (self != top) {
            top.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="login_top_bg">
        &nbsp;</div>
    <div class="login_bg">
        <div class="b_left">
            &nbsp;
        </div>
        <div class="b_right">
            <p class="login_txt_bt">
                登录</p>
            <table>
                <tr>
                    <td class="table_left">
                        管理员
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server" class="login_txt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_left">
                        密&nbsp;&nbsp;&nbsp;码
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" name="password"
                            class="login_psw"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_left">
                        验证码
                    </td>
                    <td valign="middle">
                        <asp:TextBox ID="txtVerifyCode" runat="server" MaxLength="4" size="10" class="login_code"></asp:TextBox>
                        <img src="/handler/ValidateImage.ashx" alt="验证码加载失败" class="login_code" onclick="this.src=this.src+'?r='+Math.random();"
                            title="点击刷新验证码" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="登录" class="button" OnClick="btnLogin_Click" />
                        &raquo;<a href="">忘记密码？</a>
                        <asp:Button Text="使用系统管理员登录" OnClick="Test_Login" runat="server" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Label Text="" ID="lbMessage" runat="server" class="error" />
                    </td>
                </tr>
            </table>
            <div class="welcome">
                <img src="/!images/login-wel.gif" alt="" /></div>
        </div>
    </div>
    </form>
</body>
</html>
