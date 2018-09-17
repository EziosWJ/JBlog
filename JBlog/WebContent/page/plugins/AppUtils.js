/**
*@author wangj
*@date 2018-09-13 21:10:01
*@Description 获取项目地址
*/
function getContextPath() {
    var host = window.location.host;
    var projectName = "/JBlog/";
    var contextPath = "http://" + host + projectName;
    return contextPath;
}
/**
*@author wangj
*@date 2018-09-13 20:54:55
*@Description
*/
function HTMLEncode(html) {
    var temp = document.createElement("div");
    (temp.textContent != null) ? (temp.textContent = html) : (temp.innerText = html);
    var output = temp.innerHTML;
    temp = null;
    return output;
}
function HTMLDecode(text) {
    var temp = document.createElement("div");
    temp.innerHTML = text;
    var output = temp.innerText || temp.textContent;
    temp = null;
    return output;
}
/**
*@author wangj
*@date 2018-09-13 20:54:20
*@Description 通过formId获取表单数据 转为json
*/
function getFormJson(formId)
{
    var data = {};
    $("#" + formId).serializeArray().map(function(x){
        if (data[x.name] !== undefined) {
            if (!data[x.name].push) {
                data[x.name] = [data[x.name]];
            }
            data[x.name].push(x.value || '');
        } else {
            data[x.name] = x.value || '';
        }
    });
    return data;
}
/**
*@author wangj
*@date 2018-09-13 20:53:10
*@Description 模拟表单POST
*/

function mockPost(URL, PARAMS) {
    var temp = document.createElement("form");
    temp.action = URL;
    temp.method = "post";
    temp.style.display = "none";
    for ( var x in PARAMS) {
        var opt = document.createElement("textarea");
        opt.name = x;
        opt.value = PARAMS[x];
        temp.appendChild(opt);
    }
    document.body.appendChild(temp);
    console.log(temp);
    temp.submit();
    return temp;
}


/*
 * 同步提交
*/
function jqySyncPost(url, data)
{
    var rtn = $.ajax({
        async:false,
        url: url,
        type: "POST",
        dataType: 'json',
        data: data
    });
    return rtn.responseText;
}
/*
 * 异步提交
*/
function jqyAsyncJsonPost(url, param, func)
{
    $.ajax({
        async: true,
        url: url,
        type: "POST",
        dataType: 'json',
        data: param,
        success: function(data)
        {
            alert('操作成功!');
            if(func != null)
                func(data.data);
        }
    });

}
/*
 * @author wangj
 * 异步提交
 */
function jqyAsyncJsonPost2(url, param, func)
{
    $.ajax({
        async: true,
        url: url,
        type: "POST",
        dataType: 'json',
        data: param,
        success: function(data)
        {
            if(func != null)
                func(data);
        }
    });

}
/*
 * 异步提交
*/
function jqyAsyncDataPost(url, param, func)
{
    $.ajax({
        async: true,
        url: url,
        type: "POST",
        data: param,
        cache: false,
        processData: false,
        contentType: false,
        success: function(data)
        {
            alert('操作成功!');
            if(func != null)
                func(data.data);
        }
    });

}
/*
 * 跨域提交访问
*/
function jqyDomainPost(url, param, callName, callFunc)
{
    $.ajax({
        async:false,
        url: url,
        type: "POST",
        dataType: 'jsonp',
        data: param,
        jsonp: callName,
        success: function(data)
        {
            if(callFunc != null)
            {
                callFunc(data);
            }
        }
    });
}