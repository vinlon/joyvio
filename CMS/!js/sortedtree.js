$(function () {
    //展开和关闭
    $('[name=expand]').click(function () {
        $(this).siblings('ul').hide();
        $(this).hide();
        $(this).siblings('[name=fold]').show();
    });
    $('[name=fold]').click(function () {
        $(this).siblings('ul').show();
        $(this).hide();
        $(this).siblings('[name=expand]').show();
    });

    initSortable($('.front_nav').find('ul'));

    //排序
    function initSortable(parentNode) {
        $(parentNode).find("li").addClass("ui-state-default");
        $(parentNode).disableSelection();
        $(parentNode).sortable(
                {
                    stop: function (event, ui) {
                        sort(ui.item);
                    }
                });
        var child = $(parentNode).find('ul');
        if (child.length > 0) {
            initSortable(child);
        }
    }

    //将排序结果提交到数据库
    function sort(node) {
        var sortedid = [];
        var hf_oldorder = $(node).parent().find('input[type=hidden]');
        var old_order = hf_oldorder.val();
        var children = $(node).parent().children(".ui-state-default");
        for (var i = 0; i < children.length; i++) {
            sortedid.push($(children[i]).attr("id"));
        }
        var new_order = sortedid.join(',');

        //如果顺序改变则执行ajax请求
        if (new_order != old_order) {
            $.ajax(
            {
                url: $('#sort_url').val(),
                type: "POST",
                data: { 'new_order': new_order, 'old_order': old_order },
                success: function (response) {
                    if (response == "1") {
                        //更新old_order
                        hf_oldorder.val(new_order);
                    }
                    else {
                        alert(response);
                    }
                }
            });
        }
    }

});