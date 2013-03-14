var jchlib = {
    urlParam: {
        addParam: function () {

        },
        removeParam: function () {

        },
        replaceParam: function () {

        },


        //从GET参数列表中获取指定名称（name）的参数值（vale）
        //
        // 参数:
        //   name:
        //     必要参数。要获取值得GET参数名称。目前只接受string类型，其他类型返回空字符串("")
        //
        //   isMulti:
        //     可选参数。当有多个相同name值的GET参数时，是否返回多个值（之间用逗号分隔），目前只接受布尔型。默认True
        //
        // 返回结果:
        //     目前只返回string类型
        getParam: function (name, isMulti) {
            if (typeof (isMulti) == "undefined") isMulti = true;
            if (
                typeof (name) != "string" || //非字符串类型
                typeof (isMulti) != "boolean" || //非布尔类型
                name.length == 0 || //空参数
                location.search.length == 0 //空GET参数
            ) return "";

            //url末尾没有问号(?)和只有一个问号(?)的，search变量为空
            //url末尾有以问号开头的参数列表(?xxx)多个连续的问号(??..)，search变量为从第一个问号开始到url末尾
            //url参数中不会出现问号(?)等于号(=)和连接符(&)
            //url参数列表中出现多个相同name的参数时，返回结果为多个value以逗号(,)连接的字符串
            //  如：xxx.html?a=1&a=2,那么getParam('a')的返回值为"1,2"

            var param = location.search.TrimStart(['?']);
            var paramArr = param.split("&");
            var result = "";
            for (var i = 0; i < paramArr.length; i++) {
                if (paramArr[i] == "") continue; //split函数的返回结果会出现空元素，需要手动去除
                //运行到此行可能出现以下内容(a=1)(a=)(=1)(=)(a)
                var valArr = paramArr[i].split("=");
                if (valArr.length == 1) continue; //只有当切割前为(a)类型的会得到长度为1的结果，直接丢弃
                if (valArr[0] == name) {
                    result += valArr[1] + ",";
                    if (isMulti == false) break;
                }
            }
            return result.TrimEnd([","]);
        },

        //获取全部GET参数列表
        //目前返回值只有Array类型(typeof为object)
        getParamArr: function () {

        }
    }
}