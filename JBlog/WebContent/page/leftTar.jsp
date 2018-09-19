<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>leftTar</title>
</head>
        <div class="col-md-4  panel_left" style="margin-top: 0px">
        <!-- panel -->
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title ">
                        <span>分类</span>
                        <span class="pull-right"><a href="${APP_PATH}article"><i class="fa fa-home"></i></a></span>
                    </h3>
                </div>
                <div class="list-group">
                	
                </div>
            </div>
            <!-- panel end -->
        </div>
<script type="text/javascript">
	$(function(){
		jqyAsyncJsonPost2("${APP_PATH}front/getLeftBarClassList", null, function(rtn){
			var list = rtn.content.list;
			$.each(list,function(index,item){
				var a = '<a href="#" class="list-group-item">' + item.class_Name + '</a>';
				$('.list-group').append(a);
			})
		})
	})
</script>