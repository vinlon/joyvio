/*
=====JsLibString=====
扩展JS中string对象的方法
=====================



未实现的函数：
Compare
Format
------
CompareTo
CopyTo


┏━━━━━━━━━━
┃增加的方法
┣━━━━━━━━━━
┃静态方法：
┃IsString
┃Concat
┃ConcatArray
┃Join
┃JoinArray
┣━━━━━━━━━━
┃实例化方法：
┃Contains
┃EndsWith
┃IndexOfAny
┃Insert
┃LastInsert
┃LastRemove
┃LastRemoveIndex
┃LastIndexOfAny
┃PadHelper
┃PadLeft
┃PadRight
┃Remove
┃RemoveIndex
┃StartsWith
┃ToCharArray
┃Trim
┃TrimEnd
┃TrimHelper
┃TrimStart
┃IndexOfAny
┃LastIndexOfAny
┣━━━━━━━━━━
┃自定义方法：
┃
┗━━━━━━━━━━

*/








/*=============================================新增静态方法=============================================*/

//判断指定变量是否为string类型
String.IsString = function (val) {
    var type = typeof (val);
    return (type == "string") ? true : false;
}



//连接若干个String对象成一个新的String对象。（可传任意数量参数）
//
// 参数:
//   valuesArgs:
//     多个 String 实例的数组。
//
// 返回结果:
//     values 的连接元素。
String.Concat = function (valuesArgs) {
    var reStr = "";
    if (arguments.length == 0) return reStr;
    for (var i in arguments) {
        if (String.IsString(arguments[i]))
            reStr += arguments[i];
    }
    return reStr;
}



//连接一个 String 数组
//
// 参数:
//   valuesArray:
//     一个 String 数组。如果省略则为空数组
//
// 返回结果:
//     values 的连接元素。
String.ConcatArray = function (valuesArray) {
    return String.JoinArray("", valuesArray);
}



//在指定 String 数组的每个元素之间串联指定的分隔符，从而产生单个串联的字符串。
//
// 参数:
//   separator:
//     分隔符，如果省略则默认为空字符串
//
//   valuesArgs:
//     多个String对象（可传任意数量）
//
// 返回结果:
//     String 对象，由通过 separator 联接的 valuesArgs 中的字符串组成。
String.Join = function (separator, valuesArgs) {
    var reStr = "";
    var arr = new Array();
    if (arguments.length <= 1) return reStr;
    for (var i = 1; i < arguments.length; i++) {
        arr.push(arguments[i]);
    }
    return String.JoinArray(separator, arr);
}



//在指定 String 数组的每个元素之间串联指定的分隔符，从而产生单个串联的字符串。
//
// 参数:
//   separator:
//     分隔符，如果省略则默认为空字符串
//
//   valuesArray:
//     一个 String 数组。如果省略则为空数组
//
// 返回结果:
//     String 对象，由通过 separator 联接的 valuesArray 中的字符串组成。
String.JoinArray = function (separator, valuesArray) {
    if (!String.IsString(separator)) separator = "";
    if (typeof (valuesArray) != "object") valuesArray = [];
    return valuesArray.join(separator);
}








//将指定 String 中的格式项替换为指定数组中相应 arguments 实例的值的文本等效项。
//
// 参数:
//   format:
//     复合格式字符串。
//
//   args:
//     包含零个或多个要格式化的对象的 String 数组。
//
// 返回结果:
//     format 的一个副本，其中格式项已替换为 args 中相应 String 实例的 String 等效项。
//String.Format = function (format, args) {
//    args = arguments;
//}









/*=============================================新增实例化方法=============================================*/


//返回一个值，该值指示指定的 String 对象是否出现在此字符串中。
//
// 参数:
//   value:
//     要查找的 String 对象。
//
// 返回结果:
//     如果 value 参数出现在此字符串中，则为 true；否则为 false。
String.prototype.Contains = function (value) {
    return (this.indexOf(value, 0) == -1) ? false : true;
}




//确定此字符串的开头是否与指定的字符串匹配。
//
// 参数:
//   value:
//     要比较的 String 对象。
//
//   ignoreCase:
//     若要在对此字符串与 value 进行比较时忽略大小写，则为 true；否则为 false。
//
// 返回结果:
//     如果 value 参数与此字符串的开头匹配，则为 true；否则为 false。
String.prototype.StartsWith = function (value, ignoreCase) {
    var str = this;
    if (!String.IsString(value)) return false;
    if (value.length == 0) return true;
    if (value.length > str.length) return false;
    if (!!ignoreCase) {//使用！！强制转换为布尔型判断是否为忽略大小写
        str = str.toLowerCase(); //使用全部转换为小写的方法实现忽略大小写比较
        value = value.toLowerCase();
    }

    for (var i = 0; i < value.length; i++) {
        if (str.charAt(i) != value.charAt(i))
            return false;
           
    }
    return true;
}



//确定此实例的末尾是否与指定的字符串匹配。
//
// 参数：
//   ignoreCase
//     若要在对此字符串与 value 进行比较时忽略大小写，则为 true；否则为 false（默认为false）
//
// 返回结果:
//    布尔值
String.prototype.EndsWith = function (value, ignoreCase) {
    var str = this;
    if (!String.IsString(value)) return false;
    if (value.length == 0) return true;
    if (value.length > str.length) return false;
    if (!!ignoreCase) {
        str = str.toLowerCase();
        value = value.toLowerCase();
    }

    for (var i = 0; i < value.length; i++) {
        if (str[str.length - 1 - i] != value[value.length - 1 - i]) return false;
    }
    return true;
}



//在此实例中的指定正索引位置插入一个指定的 String 实例。(也可接受负值，会调用LastInsert函数)
//
// 参数:
//   startIndex:
//     此插入的索引位置。接受范围(0~原字符串长度)
//   value:
//     要插入的 String。
//
// 返回结果:
//    此实例的一个新 String 等效项，但在位置 startIndex 处插入 value。
String.prototype.Insert = function (startIndex, value) {
    var str = this;
    if (typeof (startIndex) != "number") startIndex = 0;
    if (startIndex > str.length) startIndex = str.length;
    if (startIndex < 0) return str.LastInsert(startIndex, value);
    if (!String.IsString(value)) return str;
    for (var i = 0; i <= str.length; i++) {
        if (i == startIndex) {
            return str.substring(0, i) + value + str.substring(i);
        }
    }
}



//在此实例中的指定负索引位置插入一个指定的 String 实例。(也可接受正值，会调用LastInsert函数)
//
// 参数:
//   startIndex:
//     此插入的倒数索引位置。接受范围(-1~负的字符串长度)
//   value:
//     要插入的 String。
//
// 返回结果:
//    此实例的一个新 String 等效项，但在倒数位置 startIndex 处插入 value。
String.prototype.LastInsert = function (startIndex, value) {
    var str = this;
    if (typeof (startIndex) != "number") startIndex = -1;
    if (startIndex > -1) return str.Insert(startIndex, value);
    if (startIndex < (str.length * -1)) startIndex = str.length * -1;
    if (!String.IsString(value)) return str;

    startIndex = str.length - Math.abs(startIndex); //将负值index转换为正值
    for (var i = 0; i <= str.length; i++) {
        if (i == startIndex) {
            return str.substring(0, i) + value + str.substring(i);
        }
    }
}



//右对齐此实例中的字符，在左边用指定的字符填充以达到指定的总长度。
//
// 参数:
//   totalWidth:
//     结果字符串中的字符数，等于原始字符数加上任何其他填充字符。
//
//   paddingChar:
//     填充字符。
//
// 返回结果:
//     等效于此实例的一个新 String，但它是右对齐的，并在左边用达到 totalWidth 长度所需数目的 paddingChar 字符进行填充。如果
//     totalWidth 小于此实例的长度，则为与此实例相同的新 String。
String.prototype.PadLeft = function (totalWidth, paddingChar) {
    return this.PadHelper(totalWidth, paddingChar, false);
}




//左对齐此字符串中的字符，在右边用指定的字符填充以达到指定的总长度。
//
// 参数:
//   totalWidth:
//     结果字符串中的字符数，等于原始字符数加上任何其他填充字符。
//
//   paddingChar:
//     填充字符。
//
// 返回结果:
//     等效于此实例的一个新 String，但它是左对齐的，并在右边用达到 totalWidth 长度所需数目的 paddingChar 字符进行填充。如果
//     totalWidth 小于此实例的长度，则为与此实例相同的新 String。
String.prototype.PadRight = function (totalWidth, paddingChar) {
    return this.PadHelper(totalWidth, paddingChar, true);
}



//向指定方向对齐此字符串中的字符，在相对的另一边用指定的字符填充以达到指定的总长度。
//
// 参数:
//   totalWidth:
//     结果字符串中的字符数，等于原始字符数加上任何其他填充字符。
//
//   paddingChar:
//     填充字符。
//
//   isRightPadded:
//     布尔值，是否填充右侧（填充左侧则为False，填充右侧则为True）。
//
String.prototype.PadHelper = function (totalWidth, paddingChar, isRightPadded) {
    var str = this;
    if (typeof (totalWidth) != "number") return str;
    if (totalWidth <= str.length) return str;
    if (!String.IsString(paddingChar)) paddingChar = " ";

    var padLen = totalWidth - str.length;
    var padstr = "";
    while (padLen-- != 0)
        padstr += paddingChar;
    if (isRightPadded)
        return str.concat(padstr);
    else
        return padstr.concat(str);
}



//从此实例中的指定位置开始删除指定数目的字符。（startIndex支持负值，count不支持负值）
//
// 参数:
//   startIndex:
//     开始删除字符的从零开始的位置。范围（-原字符串长度 ~ +原字符串长度）
//
//   count:
//     要删除的字符数。正数，(范围，0~(原字符串长度-startIndex))
//
// 返回结果:
//     一个新的 String，它等于此实例减去 count 数目的字符。
String.prototype.Remove = function (startIndex, count) {
    var str = this;
    if (typeof (startIndex) != "number") return str;
    if (startIndex >= str.length) return str;
    if (startIndex < (str.length * -1)) startIndex = str.length * -1;
    if (startIndex < 0) startIndex = str.length - Math.abs(startIndex); //将负值index转换为正值
    if (typeof (count) != "number") {
        if (startIndex == 0) return "";
        else return str.substring(0, startIndex);
    }
    if (count <= 0) return str;
    if (count >= str.length - startIndex) {
        if (startIndex == 0) return "";
        else return str.substring(0, startIndex);
    }

    for (var i = 0; i < str.length; i++) {
        if (i == startIndex)
            return (str.substring(0, i) + str.substring(i + count));
    }
}



//与Remove功能一致,接受负数的Index
String.prototype.LastRemove = function (startIndex, count) {
    return this.Remove(startIndex, count);
}



//从此实例中的指定正位置开始删除到指定正位置为止的字符。（两参数都支持负值）
//
// 参数:
//   startIndex:
//     开始删除字符的位置（范围：-原字符串长度 ~ +原字符串长度）
//   endIndex:
//     删除截止至的字符的位置（范围：-原字符串长度 ~ +原字符串长度）
//
// 返回结果:
//     一个新的 String，它等于此实例减去从 startIndex到endIndex 之间字符的字符。
// ★如果startIndex的位置比endIndex靠后，将会自动调换位置
String.prototype.RemoveIndex = function (startIndex, endIndex) {
    var str = this;
    if (typeof (startIndex) != "number") return str;
    if (startIndex < (str.length * -1) || startIndex > str.length) return str; //超出范围直接返回
    if (startIndex < 0) startIndex = str.length - Math.abs(startIndex); //将负值index转换为正值
    if (typeof (endIndex) != "number") return str.Remove(startIndex); //如果无第二参数则直接调用Remove
    if (endIndex < (str.length * -1) || endIndex > str.length) return str;
    if (endIndex < 0) endIndex = str.length - Math.abs(endIndex);

    if (endIndex < startIndex) { var temp = startIndex; startIndex = endIndex; endIndex = temp; } //如前后index不符则对调
    return str.Remove(startIndex, endIndex - startIndex);
}



//与RemoveIndex功能一致，接受负数的Index
String.prototype.LastRemoveIndex = function (startIndex, endIndex) {
    return this.RemoveIndex(startIndex, endIndex);
}



//将此实例中的指定子字符串内的字符复制到 Unicode 字符数组。
//
// 参数:
//   startIndex:
//     此实例内子字符串的起始位置。
//
//   length:
//     此实例内子字符串的长度。
//
// 返回结果:
//     元素为此实例中从字符位置 startIndex 开始的 length 字符数的 Unicode 字符数组。
//
String.prototype.ToCharArray = function (startIndex, length) {
    var str = this;
    if (typeof (startIndex) != "number") startIndex = 0;
    if (startIndex < 0 || startIndex > str.length) startIndex = 0;
    if (typeof (length) != "number") length = str.length;
    if (length < 0 || length > str.length - startIndex) length = str.length;

    var arr = new Array();
    var pushLen = 0;
    for (var i = 0; i < str.length; i++) {
        if (i >= startIndex) {
            arr.push(str[i]);
            pushLen++;
            if (pushLen == length) break;
        }
    }
    return arr;
}



//从当前 String 对象移除数组中指定的一组字符的所有前导匹配项和尾部匹配项。
//
// 参数:
//   trimCharsArray:
//     要移除的字符数组。格式为['a','b',' ']，不传此参数为移除空格[' ']
//
//   option:
//     移除选项，0为前后都移除，1为只移除首部，2为只移除尾部。不传此参数默认为0（前后都移除）
//
// 返回结果:
//     从当前 String 对象的开始和末尾移除 trimCharsArray 参数中字符的所有匹配项后保留的字符串。如果 trimCharsArray 为
//     null，则改为移除空白字符。
String.prototype.TrimHelper = function (trimCharsArray, option) {
    var str = this;
    var args = new Array();
    var isfind = true;
    if (typeof (trimCharsArray) != "object") trimCharsArray = [' ']; //不传参数则认定为移除左右空格
    if (typeof (option) != "number") option = 0;
    for (var i in trimCharsArray) {
        if (trimCharsArray[i].length > 0)//过滤掉空字符，否则会陷入死循环
            args.push(trimCharsArray[i]);
    }

    while (isfind) {
        isfind = false;
        for (i in args) {//循环查找字符串两侧是否符合指定字符
            if (option == 0 || option == 1) {//移除首部
                if (str.StartsWith(args[i], false)) {
                    str = str.Remove(0, 1);
                    isfind = true;
                }
            }
            if (option == 0 || option == 2) {//移除尾部
                if (str.EndsWith(args[i], false)) {
                    str = str.LastRemove(-1, 1);
                    isfind = true;
                }
            }
        }
    }
    return str;
}



//从当前 String 对象移除数组中指定的一组字符的所有前导匹配项和尾部匹配项。
//
// 参数:
//   trimCharsArray:
//     要移除的字符数组或 null。
String.prototype.Trim = function (trimCharsArray) {
    return this.TrimHelper(trimCharsArray, 0);
}



//从当前 String 对象移除数组中指定的一组字符的所有首部匹配项。
//
// 参数:
//   trimCharsArray:
//     要移除的字符数组或 null。
String.prototype.TrimStart = function (trimCharsArray) {
    return this.TrimHelper(trimCharsArray, 1);
}



//从当前 String 对象移除数组中指定的一组字符的所有尾部匹配项。
//
// 参数:
//   trimCharsArray:
//     要移除的字符数组或 null。
String.prototype.TrimEnd = function (trimCharsArray) {
    return this.TrimHelper(trimCharsArray, 2);
}





//报告指定字符数组中的任意字符在此实例中第一个匹配项的索引。
//
// 参数:
//   anyOfArray:
//     字符数组，包含一个或多个要查找的字符。
//
//   startIndex:
//     搜索启示位置，如省略则从0开始搜索。
//
// 返回结果:
//     此实例中第一个匹配项的从零开始的索引位置，在此处找到了 anyOfArray 中的任意字符；否则，如果未找到 anyOfArray 中的字符，则为 -1。
String.prototype.IndexOfAny = function (anyOfArray, startIndex) {
    var str = this;
    var minIndex = str.length; //初始化为一个indexof不可能取得的最大值
    if (typeof (anyOfArray) != "object") anyOfArray = [];
    if (typeof (startIndex) != "number") startIndex = 0; //只做类型合法性判断，不做值范围合法性判断

    for (var i in anyOfArray) {
        //if (anyOfArray[i].length == 0) continue;//忽略空字符，空字符搜索在JS下返回0
        var index = str.indexOf(anyOfArray[i], startIndex);
        if (index < minIndex && index != -1)//不等于-1是忽略部分字符串没有找到的错误
            minIndex = index;
    }
    if (minIndex == str.length) minIndex = -1; //整个for循环执行完成后如果还保持原始值则说明没有找到，返回-1
    return minIndex;
}



//报告在数组中指定的一个或多个字符在此实例中的最后一个匹配项的索引位置。
//
// 参数:
//   anyOfArray:
//     字符数组，包含一个或多个要查找的字符。
//
//   startIndex:
//     搜索起始位置。如省略则从最后一位开始搜索。
//
// 返回结果:
//     此实例中最后一个匹配项的索引位置，在此位置找到 anyOfArray 中的任意字符；否则，如果未找到 anyOfArray 中的字符，则为 -1。
String.prototype.LastIndexOfAny = function (anyOfArray, startIndex) {
    var str = this;
    var minIndex = -1; //初始化为一个indexof不可能取得的最小值
    if (typeof (anyOfArray) != "object") anyOfArray = [];
    if (typeof (startIndex) != "number") startIndex = str.length - 1;

    for (var i in anyOfArray) {
        //if (anyOfArray[i].length == 0) continue;
        var index = str.lastIndexOf(anyOfArray[i], startIndex);
        if (index > minIndex && index != -1)
            minIndex = index;
    }
    return minIndex;
}

