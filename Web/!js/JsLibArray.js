/*
=====JsLibArray=====
扩展JS中Array对象的方法
=====================



未实现的函数：

------



┏━━━━━━━━━━
┃增加的方法
┣━━━━━━━━━━
┃静态方法：
┃
┣━━━━━━━━━━
┃实例化方法：
┃
┣━━━━━━━━━━
┃自定义方法：
┃
┗━━━━━━━━━━

*/








/*=============================================新增静态方法=============================================*/







/*=============================================新增实例化方法=============================================*/



//将对象添加到 Array 的结尾处。(添加单一对象)
//
// 参数:
//   item:
//     要添加到 Array 的末尾处的对象。
Array.prototype.Add = function (item) {
    return this.push(item);
}



//将对象添加到 Array 的结尾处。(添加数组集合对象)
//
// 参数:
//   item:
//     要添加到 Array 的末尾处的对象。
Array.prototype.AddArray = function (itemArray) {
    for (var i = 0; i < itemArray.length; i++)
        this.push(itemArray[i]);
    return this;
}



//将指定集合的元素添加到 Array 的末尾。（添加多个参数对象）
//
// 参数:
//   itemArgs:
//     一个集合，其元素应被添加到 Array 的末尾。集合自身不能为 null，但它可以包含为
//     null 的元素
Array.prototype.AddRange = function (itemArgs) {
    for (var i in itemArgs) {
        this.push(itemArgs[i]);
    }
    return this;
}



//去除数组的重复项（会对原数组直接进行修改）
//
// 参数:
//   isNew:
//     是否将排序后的数组创建一个新数组，如果为true则不对原数组修改，返回新数组；如果为false则在原数组基础上修改（默认为false）
//
// 返回结果:
//     去除了重复项后的数组副本
Array.prototype.Unique = function (isNew) {
    if (!isNew) isNew = false;
    //★注意：array对象在进行赋值操作时会将原数组地址赋值给新对象，这将导致源对象和目标对象共用一个地址
    //      即对<源对象>或<目标对象>的任何操作结果都会将同步另一方。
    var temp = new Array();
    this.sort(); //将数组先进行排序
    for (i = 0; i < this.length; i++) {
        if (this[i] == this[i + 1]) {//之后对比元素和下一个元素是否相同，
            continue; //如果相同则跳过，如果不同则加入到新数组对象中
        }
        temp[temp.length] = this[i];
    }
    return temp;
}



//对数组中每一个元素作为上下文来执行一个函数。
//★1：自定义函数中的this关键字每次循环都指向一个不同的数组元素
//★2：此方法是直接修改原数组对象
//★3：自定义函数中若想修改数组内容需要使用this[0]，即this只可读取，this[0]可读可写（如果对this赋值会导致浏览器死住）
//
// 参数:
//   fn(n,i):
//     要对每个对象执行的函数。（此函数可带有两个参数，第一个n为当前遍历的对象，第二个i为当前遍历对象在数组中的Index值）
//
// 返回结果:
//     返回原始对象
Array.prototype.Each = function (fn) {
    if (typeof (fn) != "function") return this;
    var tmp;
    for (var i = 0; i < this.length; i++) {
        tmp = [this[i]]; //把组数元素值封装成object对象
        tmp.f = fn; //给数组元素值增加用户自定义方法
        tmp.f(tmp, i); //在元素对象上调用用户自定义方法（即可在用户自定义方法中就可以使用this来表示数组元素）
        this[i] = tmp; //手动把变更后的内容赋值回原数组(◆此方法不好，需要改进◆)
    }
    return this;
}


//与Array.Each用法相同，适应C#写法
Array.prototype.Select = function (fn) {
    return this.Each(fn);
}



//创建 Array 的副本。
//
// 返回结果:
//     Array 的副本。
Array.prototype.Clone = function () {
    var tmp = new Array();
    this.Each(function () {
        tmp.push(this);
    });
    return tmp;
}



//将当前一维 Array 的所有元素复制到指定的一维 Array 中（从指定的目标 Array 索引开始）。索引指定为整数。
//
// 参数:
//   dstArray:
//     一维 Array，它是从当前 Array 复制的元素的目标位置。
//
//   dstIndex:
//     一个 32 位整数，它表示 dstArray 中复制开始处的索引。
//
// 返回结果:
//     void无返回。但执行成功后返回true，执行失败返回false
Array.prototype.CopyTo = function (dstArray, dstIndex) {
    if (typeof (dstArray) != "object") return false; //array和object在typeof的结果都是object，所以需要使用try来捕获错误的object对象
    if (typeof (dstIndex) != "number") dstIndex = 0;
    try {
        for (var i = 0; i < this.length; i++) {
            if (!dstArray[dstIndex + i])
                dstArray.push(this[i]); //在C#中超出范围将报错，js中改为向后追加元素
            else
                dstArray[dstIndex + i] = this[i];
        }
    } catch (e) {
        return false; //如果this为object对象，而不是array对象则无法执行push操作，将报错返回false
    }
}



//获取一个整数，该整数表示 Array 的指定维中的元素数。
//
// 参数:
//   dimension:
//     Array 的从零开始的维度，其长度需要确定。(维度数从0开始)
//
// 返回结果:
//     一个整数，它表示指定维中的元素数。
Array.prototype.GetLength = function (dimension) {
    if (typeof (dimension) != "number") dimension = 0; //不指定维度默认获取第一维长度
    if (dimension == 0)
        return this.length;
    else {
        try {
            return this[0].GetLength(dimension - 1); //使用递归得到指定最内维数层长度
        } catch (err) {
            return 0; //指定维度不存在则返回0
        }
    }
}



//获取 Array 数组中指定位置的值。索引指定为整数。多维数组可传多个参数，最高三维
//
// 参数:
//   indexArgs:
//     一个整数，它表示要获取的 Array 元素的第一维索引。如果有第二个参数则为第二维索引
//
// 返回结果:
//     Array 中指定维数指定位置的值。
Array.prototype.GetValue = function (indexArgs) {
    var iargs = new Array();
    for (var i in arguments) {
        if (typeof (arguments[i]) == "number")//过滤掉非数字参数
            iargs.push(arguments[i]);
    }
    switch (iargs.length) {
        case 3: { return this[iargs[0]][iargs[1]][iargs[2]]; }
        case 2: { return this[iargs[0]][iargs[1]]; }
        case 1: { return this[iargs[0]]; }
        case 0: { return this[0]; } //无参数直接返回数组第一个值
        default: { return null; }
    }
}



//将某值设置给 Array 数组中指定位置的元素。索引指定为整数。
//
// 参数:
//   value:
//     指定元素的新值。
//
//   indexArgs:
//     一个整数，它表示要获取的 Array 元素的第一维索引。如果有第二个参数则为第二维索引
Array.prototype.SetValue = function (value, indexArgs) {
    if (typeof (value) != "number") return this;
    var iargs = new Array();
    for (var i = 1; i < arguments.length; i++) {
        if (typeof (arguments[i]) == "number")//过滤掉非数字维数参数
            iargs.push(arguments[i]);
    }
    switch (iargs.length) {
        case 3: { this[iargs[0]][iargs[1]][iargs[2]] = value; break; }
        case 2: { this[iargs[0]][iargs[1]] = value; break; }
        case 1: { this[iargs[0]] = value; break; }
        case 0: { this[0] = value; break; } //无参数直接返回数组第一个值
        default: { }
    }
    return this;
}



//从Array中移除所有元素
Array.prototype.Clear = function () {
    while (this.length > 0)
        this.pop();
    return this;
}



//搜索指定的对象，并返回 Array 中从指定的索引开始并包含指定的元素数的元素范围内第一个匹配项的从零开始的索引。
//
// 参数:
//   item:
//     要在 Array 中定位的对象。对于引用类型，该值可以为 null。
//
//   startIndex:
//     从零开始的搜索的起始索引。
//
//   count:
//     要搜索的部分中的元素数。
//
// 返回结果:
//     如果在 Array 中从 startIndex 开始并包含 count 个元素的元素范围内找到 item
//     的第一个匹配项，则为该项的从零开始的索引；否则为 -1。
Array.prototype.IndexOf = function (item, startIndex, count) {
    if (item == null || item == undefined) return -1;
    if (typeof (startIndex) != "number") startIndex = 0;
    if (startIndex < 0 || tartIndex > this.length) return -1;
    if (typeof (count) != "number") count = this.length - startIndex;
    var num = startIndex + count;
    if (num > this.length) num = this.length;

    for (var i = startIndex; i < num; i++) {
        if (this[i] == item) {
            return i;
        }
    }
    return -1;
}



//搜索指定的对象，并返回 Array 中从所有符合的索引数组
//
// 参数:
//   item:
//     要在 Array 中定位的对象。对于引用类型，该值可以为 null。
//
// 返回结果:
//      返回 Array 中从所有匹配的索引 Array，如果没有找到匹配项则返回空Array
Array.prototype.IndexOfAll = function (item) {
    var result = new Array();
    if (item == null || item == undefined) return result;

    for (var i = 0; i < this.length; i++) {
        if (this[i] == item) {
            result.push(i);
        }
    }
    return result;
}



//将元素插入 Array 的指定索引处。
//
// 参数:
//   item:
//     要插入的对象。对于引用类型，该值可以为 null。
//
//   index:
//     从零开始的索引，应在该位置插入 item。
Array.prototype.Insert = function (item, index) {
    return this.InsertArray([item], index);
}



//将指定多个元素组成的数组插入 Array 的指定索引处。
//
// 参数:
//   itemArray:
//     要插入的对象组成的数组。
//
//   index:
//     从零开始的索引，应在该位置插入 itemArray。(如果省略此参数则默认为0)
Array.prototype.InsertArray = function (itemArray, index) {
    if (itemArray == null || itemArray == undefined) return this;
    if (typeof (index) != "number") index = 0;
    if (index < 0 || index > this.length) return this;

    var arr = new Array();
    arr = this.slice(0, index);
    arr.AddArray(itemArray);
    arr.AddArray(this.slice(index, this.length));
    this.Clear().AddArray(arr);
    return this;
}



//与InsertArray相同
Array.prototype.InsertRange = function (collection, index) {
    return this.InsertArray(collection, index);
}



//搜索指定的对象，并返回 Array 中包含指定的元素数并在指定索引处结束的元素范围内最后一个匹配项的从零开始的索引。
//
// 参数:
//   item:
//     要在 Array 中定位的对象。对于引用类型，该值可以为 null。
//
//   startIndex:
//     向后搜索的从零开始的起始索引。从此位置开始往前搜索
//
//   count:
//     要搜索的部分中的元素数。
//
// 返回结果:
//     如果在 Array 中包含 count 个元素、在 startIndex 处结尾的元素范围内找到
//     item 的最后一个匹配项，则为该项的从零开始的索引；否则为 -1。
Array.prototype.LastIndexOf = function (item, startIndex, count) {
    if (item == null || item == undefined) return -1;
    if (typeof (startIndex) != "number") startIndex = this.length - 1;
    if (startIndex < 0 || startIndex > this.length - 1) return -1;
    if (typeof (count) != "number") count = startIndex;
    var num = startIndex - count;
    if (num < 0) num = 0;

    for (var i = startIndex; i >= num; i--) {
        if (this[i] == item) {
            return i;
        }
    }
    return -1;
}