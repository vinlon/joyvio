<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttachmentEdit.aspx.cs"
    Inherits="CMS.Information.AttachmentEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>附件信息修改</title>
    <link href="/!css/frame.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="list_title">
        附件信息修改
    </div>
    <div class="info">
        <p>
            <span class="info_left">附件描述：</span>
            <asp:TextBox runat="server" ID="txtDesc" class="txt_long" />
        </p>
        <p>
            <span class="info_left">显示顺序：</span>
            <asp:TextBox runat="server" ID="txtSortIndex" class="txt_small" />
        </p>
        <p>
            <span class="info_left">&nbsp;</span>
            <asp:Button Text="修改" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
        </p>
    </div>
    </form>
</body>
</html>
