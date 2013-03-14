<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="AttachmentAdd.aspx.cs" Inherits="CMS.Information.AttachmentAdd" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/!css/info.css" rel="stylesheet" type="text/css" />
    <!--uploadify-->
    <link href="/!js/uploadify-v3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="/!js/uploadify-v3.1/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
    <!--uploadify-->
    <!--draggable-->
    <link href="/!js/jquery_ui/themes/base/jquery.ui.resizable.css" rel="stylesheet"
        type="text/css" />
    <script src="/!js/jquery_ui/jquery.ui.core.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.mouse.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.draggable.js" type="text/javascript"></script>
    <script src="/!js/jquery_ui/jquery.ui.resizable.js" type="text/javascript"></script>
    <!--draggable-->
    <script type="text/javascript">
        var input = '<input type="hidden" />'
        var drag_width_name = "drag_width"
        var show_width_name = "show_width";
        var cut_top_name = "cut_top";
        var cut_left_name = "cut_left";
        $(function () {
            //load
            loadImg();

            ///Jquery Uploadify
            $('#img_upload').uploadify({
                uploader: '/handler/fileupload.ashx',
                swf: '/!js/uploadify-v3.1/uploadify.swf',
                width: 100,
                height: 20,
                buttonText: '选择图片',
                queueSizeLimit: 1,
                removeTimeout: 1,
                queueID: 'fileQueue',
                fileTypeDesc: '请选择PNG或JPG文件',
                fileTypeExts: '*.png;*.jpg',
                formData: { '<%=Common.SESSION_PARAM_NAME %>': '<%=Session.SessionID %>' },

                onUploadSuccess: function (file, data, response) {
                    //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);

                    //uploader可同时处理多张图片，但事实上Uploadify每次只上传一张图片
                    var paths = eval('(' + data + ')');
                    if (paths.length > 0) {
                        var img_path = $('#img_path');
                        img_path.val(paths[0]); //将值保存到img_path中，刷新后加载内容
                        loadImg();
                    }
                },
                onUploadError: function (file, errorCode, errorMsg, errorString) {
                    //alert('The file ' + file.name + ' could not be uploaded: ' + errorString);
                    alert("upload error:" + errorString);
                }
            });
        });
        function loadImg() {
            var container = $('#container');
            var path = $('#img_path').val();
            if (path != '') {
                var img_cut = container.find('.img_cut');
                img_cut.show()
                .find('.drag').each(function () {
                    var drag = $(this);
                    var img = drag.prev('img');
                    img.attr('src', path).load();
                    updateInput(drag, show_width_name, img.width()); //保存原始图片的显示宽度,注意：页面刚上传时无法保存该数据

                    var width = '<%=drag_width %>';
                    //图片要求尺寸保存在drag的width和height属性中
                    var w = drag.attr('width');
                    var h = drag.attr('height');
                    drag.width(width);
                    drag.height(width * h / w);
                })
                .resizable({
                    aspectRatio: true,
                    stop: function (event, ui) {
                        var width = ui.size.width;
                        var img = $(this).prev('img');
                        updateInput(this, drag_width_name, parseInt(width));  //更新drag的width,不能宽于显示图，此处resizable有个小bug
                        updateInput(this, show_width_name, img.width()); //保存原始图片的显示宽度
                    }
                })
                .draggable({
                    stop: function (event, ui) {
                        var left = ui.position.left;
                        var top = ui.position.top;
                        var img = $(this).prev('img');
                        updateInput(this, cut_top_name, top); //保存截图的相对位移top
                        updateInput(this, cut_left_name, left); //保存截图的相对位移left
                        updateInput(this, show_width_name, img.width()); //保存原始图片的显示宽度
                    }
                });
            }
        }
        //更新值
        function updateInput(parent, name, value) {
            $(parent).find('[name=' + name + ']').val(value);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="pagetitle">
        添加图片
    </div>
    <div class="list_title">
        上传图片
        <%if (infoid == "")
          { 
        %>
        <label class="error">
            未指定任何信息</label>
        <%
            } %>
        <a href="AttachmentList.aspx?infoid=<%=infoid %>" class="button_add">返回</a>
    </div>
    <div class="info">
        <p>
            <span class="info_left">选择图片：</span> <span style="float: left;">
                <input type="file" name="img_upload" id="img_upload" value="" />上传完成后请填写图片描述信息</span>
        </p>
        <div class="clear">
            <span class="info_left">已上传图片： </span>
            <div id="container">
                <div id="fileQueue">
                </div>
                <div class="upload_desc">
                    <strong>图片描述：</strong>
                    <asp:TextBox runat="server" ID="txtDesc" class="txt_long" />
                </div>
                <input type="hidden" name="img_path" value="" id="img_path" />
                <div class="img_cut hide">
                    <%decimal ratio = (decimal)size.Width / (decimal)size.Height;//比例相同的尺寸只加载一个截图工具 %>
                    <%if (size.Width != 0)
                      { %>
                    <div class="content">
                        <img src="" alt="" />
                        <div class="ui-draggable drag" <%=string.Format("width={0} height={1}",size.Width,size.Height)%>>
                            <input type="hidden" name="drag_width" value="<%=drag_width %>" />
                            <input type="hidden" name="show_width" value="0" />
                            <input type="hidden" name="cut_top" value="0" />
                            <input type="hidden" name="cut_left" value="0" />
                        </div>
                    </div>
                    <%} %>
                    <%if (size.ThumbWidth != 0 && (decimal)size.ThumbWidth / (decimal)size.ThumbHeight != ratio)
                      { %>
                    <div class="content">
                        <img src="" alt="" />
                        <div class="drag" <%=string.Format("width={0} height={1}",size.ThumbWidth,size.ThumbHeight)%>>
                            <input type="hidden" name="drag_width" value="<%=drag_width %>" />
                            <input type="hidden" name="show_width" value="0" />
                            <input type="hidden" name="cut_top" value="0" />
                            <input type="hidden" name="cut_left" value="0" />
                        </div>
                    </div>
                    <%} %>
                    <%if (size.CoverWidth != 0 && (decimal)size.CoverWidth / (decimal)size.CoverHeight != ratio)
                      { 
                    %>
                    <div class="content">
                        <img src="" alt="" />
                        <div class="drag" <%=string.Format("width={0} height={1}",size.CoverWidth,size.CoverHeight)%>>
                            <input type="hidden" name="drag_width" value="<%=drag_width %>" />
                            <input type="hidden" name="show_width" value="0" />
                            <input type="hidden" name="cut_top" value="0" />
                            <input type="hidden" name="cut_left" value="0" />
                        </div>
                    </div>
                    <%
                        } %>
                </div>
            </div>
        </div>
        <p class="clear">
            <span class="info_left">&nbsp;</span>
            <asp:Button Text="提交" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        </p>
    </div>
</asp:Content>
