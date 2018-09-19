<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>

<%@include file="top.jsp" %>

<div class="container" id="start">

    <div class="row">
		<%@include file="leftTar.jsp" %>
		
        <div class="col-md-offset-1 col-md-7" id="article-list">
           
        </div>
    </div>

</div>

<div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-4">
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
                condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
                condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
            <h2>Heading</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula
                porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut
                fermentum massa justo sit amet risus.</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
    </div>

    <hr>

    <footer>
        <p>&copy; 2018 Company, Inc.</p>
    </footer>
</div> <!-- /container -->

<script type="text/javascript">
    $(function () {
        // var articleRow = append('<div></div>').addClass('row article_row');
        // var pageHeader = append('<div></div>').addClass('page-header');
        // var h3 = append('<h3></h3>');
        // var articleRowContent = append('<div></div>').addClass('row article_row_content');
        renderArticleList();
    })
    function renderArticleList() {
        jqyAsyncJsonPost2('${APP_PATH}article/getArticleList',null,function (data) {
            var data = data;
            console.info(data);
            if(data.code===200){
                $.each(data.content.list,function (index,item) {
                    var div = '<div class="row article_row">\n' +
                        '     <div class="page-header">\n' +
                        '     <h3>\n' +
                        '     <a href="${APP_PATH}article/showArticle?article_Id='+ item.article_Id +'">'+ item.article_Title +'</a>\n' +
                        '     </h3>\n' +
                        '     </div>\n' +
                        '     <div class="row article_row_content">\n' +
                        '     <div class="col-md-3">\n' +
                        '     <img src="${path}static/image/shuijiao.jpg" class="img-responsive"/>\n' +
                        '     </div>\n' +
                        '     <div class="col-md-9">\n' +
                        '     <p>sdadasdsdsaddddddddddddddddddsaddsadsadddddddddddddddddddddddddddddddddddddddss\n' +
                        '     ssssssssssssssssssssssssssssssss\n' +
                        '     ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd\n' +
                        '     dddddddddddddddddddddddddddddddddddd\n' +
                        '     dsaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n' +
                        '     dsaada</p>\n' +
                        '     </div>\n' +
                        '     </div>\n' +
                        '     <div class="row article_row_little">\n' +
                        '     <p class="text-right">\n' +
                        '     <span>\n' +
                        '     <i class="fa fa-user"></i>\n' +
                        '     <a href="#">wj</a>\n' +
                        '     </span>\n' +
                        '     <span>\n' +
                        '     <i class="fa fa-clock-o"></i>\n' +
                        '     <a href="#">'+ item.article_Create_Time +'</a>\n' +
                        '     </span>\n' +
                        '     <span>\n' +
                        '     <i class="fa fa-eye"></i>\n' +
                        '     <a href="#">'+ item.article_Views +'浏览</a>\n' +
                        '     </span>\n' +
                        '     <span>\n' +
                        '     <i class="fa fa-comment-o"></i>\n' +
                        '     <a href="#">'+ item.article_Comments +'评论</a>\n' +
                        '     </span>\n' +
                        '     <span class="love">\n' +
                        '     <i class="fa fa-heart-o"></i>\n' +
                        '     <a href="#" >'+ item.article_Heart +'喜欢</a>\n' +
                        '     </span>\n' +
                        '     </p>\n' +
                        '     </div>\n' +
                        '     </div>'
                    $('#article-list').append(div);
                })
            }
        })
    }
    /**
     * <div class="row article_row">
     <div class="page-header">
     <h3>
     <a href="#">你好！世界。</a>
     </h3>
     </div>
     <div class="row article_row_content">
     <div class="col-md-3">
     <img src="static/image/shuijiao.jpg" class="img-responsive"/>
     </div>
     <div class="col-md-9">
     <p>sdadasdsdsaddddddddddddddddddsaddsadsadddddddddddddddddddddddddddddddddddddddss
     ssssssssssssssssssssssssssssssss
     ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
     dddddddddddddddddddddddddddddddddddd
     dsaaaaaaaaaaaaaaaaaaaaaaaaaaaa
     dsaada</p>
     </div>
     </div>
     <div class="row article_row_little">
     <p class="text-right">
     <span>
     <i class="fa fa-user"></i>
     <a href="#">wj</a>
     </span>
     <span>
     <i class="fa fa-clock-o"></i>
     <a href="#">20:49</a>
     </span>
     <span>
     <i class="fa fa-eye"></i>
     <a href="#">500浏览</a>
     </span>
     <span>
     <i class="fa fa-comment-o"></i>
     <a href="#">0评论</a>
     </span>
     <span class="love">
     <i class="fa fa-heart-o"></i>
     <a href="#" >0喜欢</a>
     </span>
     </p>
     </div>
     </div>
     */

</script>
</body>
</html>
