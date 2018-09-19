<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write</title>
</head>
<body>

<jsp:include page="top.jsp"></jsp:include>

<div class="container" id="start">

    <div class="row">
        <div class="col-md-offset-1 col-md-10">
            <div class="row article_row">
                <div class="page-header">
                <form id="blog">
                    <div class="input-group">
                        <span class="input-group-addon" id="sizing-addon1">标题：</span>
                        <input id="article_Title" class="form-control" type="text" placeholder="请输入标题" />
                    </div>
                </div>
                    <div class="row article_row_content">
                        <!--wangEditor-->
                        <div class="" id="editor" style="margin: 0px 20px 35px 20px;">


                        </div>
                        <!--Editor end-->
                    </div>
                    <div class="" >
	                 	<select class="selectpicker" id="article_Class" name="article_Class">
							  <option>Mustard</option>
							  <option>Ketchup</option>
							  <option>Barbecue</option>
						</select>
                  	</div>
                    <div class="row">
                        <div class="text-center">
                            <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                            <button id="submit" type="button" class="btn btn-primary">提交</button>
                            <!-- Standard button -->
                            <button type="button" class="btn btn-default">保存</button>
                        </div>
                        <div class="pull-left">
                            <button id="testb1" type="button" class="btn btn-warning">获取内容</button>
                            <button id="testb2" type="button" class="btn btn-warning">转换内容</button>
                            <button id="testb3" type="button" class="btn btn-warning">设置HTML内容</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

<div class="container">

    <hr >
        <footer class="footer navbar-fixed-bottom text-center">
            <p>&copy; 2018 Company, Inc.</p>
        </footer>

</div> <!-- /container -->

<script>
	$(function(){
		$('.selectpicker').selectpicker();
		bindSelectListOption();
	})
	function bindSelectListOption(){
		jqyAsyncJsonPost2("${APP_PATH}front/getLeftBarClassList", null, function(rtn){
			var data = rtn;
			var article_Class = $('#article_Class');
			article_Class.empty();
			$.each(data.content.list,function(index,item){
				var option = '<option value='+ item.class_Id +'>'+ item.class_Name +'</option>'
				article_Class.append(option);
			})
			$('.selectpicker').selectpicker('refresh');
		})
	}



    var E = window.wangEditor;
    var editor = new E('#editor');
    //配置上传图片地址
    editor.customConfig.uploadImgServer = '${APP_PATH}upload/uploadImges';
    editor.customConfig.uploadFileName = 'img';
    editor.customConfig.uploadImgParams = {
        project: 'xxx'  // 需要传递的参数
    };
    //将传递的参数拼接到上传地址后面
    editor.customConfig.uploadImgParamsWithUrl = true;
    editor.customConfig.uploadImgHooks = {
        before: function (xhr, editor, files) {
            // 图片上传之前触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，files 是选择的图片文件

            // 如果返回的结果是 {prevent: true, msg: 'xxxx'} 则表示用户放弃上传
            // return {
            //     prevent: true,
            //     msg: '放弃上传'
            // }
            console.log("开始上传");
        },
        success: function (xhr, editor, result) {
            // 图片上传并返回结果，图片插入成功之后触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            console.log("发送成功 返回result：" + result);
        },
        fail: function (xhr, editor, result) {
            // 图片上传并返回结果，但图片插入错误时触发
                // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            console.log("发送失败 返回result：" + result);
        },
        error: function (xhr, editor) {
            // 图片上传出错时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            console.log("上传发生错误");
        },
        timeout: function (xhr, editor) {
            // 图片上传超时时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            console.log("上传超时");
        },

        // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
        // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
        // customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
            // var url = result.url
            // insertImg(url)

            // result 必须是一个 JSON 格式字符串！！！否则报错
        // }
    }
    editor.create();



/**
*@author wangj
*@date 2018-09-17 20:28:22
*@Description 提交文章
*/
    $('#submit').click(function () {
        var article_Title = $('#article_Title').val();
        var article_Class = $('#article_Class').val();
        var article_Content = HTMLEncode(editor.txt.html());
        console.info(article_Title+article_Content);
        var params = $.extend({},{article_Title:article_Title},{article_Content:article_Content},{article_Class:article_Class});
        jqyAsyncJsonPost2("${APP_PATH}article/submitArticle",params,function (rtn) {
            var data = rtn;
            console.info(data);
            editor.txt.html("");
            window.location.href = getContextPath() + "article";
        })
    });
    $('#testb1').click(function () {
        var a = editor.txt.html();
        alert(a);
    });
    $('#testb2').click(function () {
        var a = HTMLEncode(editor.txt.html());
        alert(a);
    });
    $('#testb3').click(function () {
        var a = HTMLEncode(editor.txt.html());
        editor.txt.append("&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;h1&gt;h标签&lt;/h1&gt;");
    });

</script>
</body>
</html>
