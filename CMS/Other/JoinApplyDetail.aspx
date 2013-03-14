<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JoinApplyDetail.aspx.cs"
    Inherits="CMS.Other.JoinApplyDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/!css/frame.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="list_title">
        加盟申请
    </div>
    <%if (apply != null)
      { 
    %><div class="info">
        <p>
            <span class="info_left">公司名称：</span><%=apply.CompanyName %>
        </p>
        <p>
            <span class="info_left">公司地址：</span><%=apply.Address %>
        </p>
        <p>
            <span class="info_left">联系方式：</span><%=apply.PhoneNo %>(<%=apply.LinkMan %>)
        </p>
        <p>
            <span class="info_left">邮件地址：</span><%=apply.Email %>
        </p>
        <p>
            <span class="info_left">公司类型：</span><%=apply.CompanyType %>
        </p>
        <p>
            <span class="info_left">种植品种：</span><%=apply.PlantingSpecies %>
        </p>
        <p>
            <span class="info_left">种植区域：</span><%=apply.PlantingRegion %>
        </p>
        <p>
            <span class="info_left">供应季节：</span><%=apply.SupplySeason %>
        </p>
        <p>
            <span class="info_left">注册资金：</span><%=apply.RegisteredFund %>
        </p>
        <p>
            <span class="info_left">合作意向：</span><%=apply.Intention %>
        </p>
        <p>
            <span class="info_left">种植时间：</span><%=apply.Duration %>
        </p>
        <p>
            <span class="info_left">现有年产量：</span><%=apply.CurrentAnnualOutput %>
        </p>
        <p>
            <span class="info_left">丰产年产量：</span><%=apply.BestAnnualOutput %>
        </p>
        <p>
            <span class="info_left">年销售收入：</span><%=apply.AnnualIncome %>
        </p>
        <p>
            <span class="info_left">种植面积：</span><%=apply.PlantingArea %>
        </p>
        <p>
            <span class="info_left">仓储能力：</span><%=apply.StorageCapicity %>
        </p>
        <p>
            <span class="info_left">提交时间：</span><%=apply.ApplyTime.ToString(Common.DATETIME_FORMAT_FULL) %>
        </p>
        <%if (!string.IsNullOrEmpty(apply.Remark))
          { 
        %>
        <p>
            <span class="info_left">备注信息：</span><%=apply.Remark %>
        </p>
        <%
            } %>
    </div>
    <%
        } %>
    </form>
</body>
</html>
