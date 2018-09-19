<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>article</title>
</head>
<body>

<%@include file="top.jsp" %>

<div class="container" id="start">

    <div class="row">
        <%@include file="leftTar.jsp" %>
        <div class="col-md-offset-1 col-md-7">
            <div class="row article_row">
                <div class="page-header">
                    <h3>
                        <a href="#"><span id="title"></span></a>
                    </h3>
                    <div class="row article_row_little">
                        <p class="text-right">
                        <span>
                          <i class="fa fa-user"></i>
                          <a href="#">wj</a>
                        </span>
                            <span>
                          <i class="fa fa-clock-o"></i>
                          <a href="#"><span id="article_Create_Time"></span></a>
                        </span>
                            <span>
                          <i class="fa fa-eye"></i>
                          <a href="#"><span id="article_Views"></span>浏览</a>
                        </span>
                            <span>
                          <i class="fa fa-comment-o"></i>
                          <a href="#"><span id="article_Comments"></span>评论</a>
                        </span>
                            <span class="love">
                          <i class="fa fa-heart-o"></i>
                          <a href="#"><span id="article_Heart"></span>喜欢</a>
                        </span>
                        </p>
                    </div>
                </div>
                <div class="row article_row_content">
                    <div class="col-md-12" id="content">

                    </div>
                </div>
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
    $(function () {
    	var id = '${requestScope.article_Id}';
        jqyAsyncJsonPost2(getContextPath()+'article/getArticleDetailed',{article_Id:id},function (data) {
            var data = data;
            var content = HTMLDecode(data.content.article.article_Content);
            $('#content').append(content);
            $('#title').text(data.content.article.article_Title);
            $('#article_Create_Time').text(data.content.article.article_Create_Time);
            $('#article_Comments').text(data.content.article.article_Comments);
            $('#article_Views').text(data.content.article.article_Views);
            $('#article_Heart').text(data.content.article.article_Heart);
  
        })
    })
</script>
</body>
</html>