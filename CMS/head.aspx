<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="head.aspx.cs" Inherits="CMS.head" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>管理页面</title>
    <link href="/!css/frame.css" rel="stylesheet" type="text/css" />
</head>
<body leftmargin="0" topmargin="0">
    <table width="100%" height="64" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
        <tr>
            <td width="400px" height="64">
                <a target="_blank" href="<%=Common.SITE_URL %>" target="_parent">
                    <img src="/!images/logo.gif" width="340" height="64" alt="LOGO"></a>
            </td>
            <td style="min-width: 400px;" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="74%" height="38" class="admin_txt">
                            管理员：<b><%=Common.VerifiedUser.UserName %></b> 您好,感谢您使用！<a style="color: Olive" href="/User/ChangePassword.aspx"
                                target="main"><strong>修改密码</strong></a>
                        </td>
                        <td width="22%">
                            <a href="Logout.aspx" target="_self">
                                <img src="/!images/out.gif" alt="安全退出" width="46" height="20" border="0" /></a>
                        </td>
                        <td width="4%">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="19" colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
