<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>欢迎来到电脑销售网</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<%=path%>/include/easyui/themes/icon.css" type="text/css"
	rel="stylesheet" />
<link href="<%=path%>/include/default/easyui.css" type="text/css"
	rel="stylesheet" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="<%=path%>/css/index.css" type="text/css"
	rel="stylesheet" />
<style type="text/css">
	#index-src {
		width: 715px;
		/* height: 500px; */
	}
	/* 为标题栏上的选项卡设置底部距离 */ 
	.tab-topic{
		margin-bottom: 3px;
	}
</style>
</head>
<body class="myElement">
<!-- 顶部导航栏 -->
<jsp:include page="public/nav-top.jsp"></jsp:include>
	


	 <div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<c:forEach var="img" items="${produces_index }" varStatus="status" >
				<li data-target="#carousel-example-generic" data-slide-to="${status.index }"
				class="
					<c:if test="${status.index == 0}">
					active
					</c:if>
				"
				></li>
			</c:forEach>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<c:forEach var="news" items="${produces_index }" varStatus="status" >
				<div class="item
					<c:if test="${status.index == 0}">
					active
					</c:if> 
				">
					<a href="<%=path %>/topic/${news.id }">
						<img src="<%=path %>/${news.path}" alt="无图片">
					</a>
					<div class="carousel-caption">
						<p class="text-success">${news.name}</p>
					</div>
				</div>
				
			</c:forEach>
			
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">上一页</span> </a> <a class="right carousel-control"
			href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">下一页</span> </a>
	</div>
	
	<hr/>
<!-- 栅格系统 平均分三列 -->
<div class="container" id="summary-container">

	<!-- 分割线暂时注释掉
	<hr class="divider"/> -->
	<div class="row">
	
		<div class="col-md-8 ">
		
			<div class="row">
				<div class="col-md-12">
					<p class="text-left">
						<a class="btn btn-success" onclick="createTopic();" href="javascript:void(0)">发起采购</a>
						<input type="hidden" id="session_username" value="${user.username }"/>
						<input type="hidden" id="session_user_id" value="${user.id }"/>
					</p>
				</div>
			</div>
			
		
			<div class="panel panel-info">
				<c:forEach var="ns" items="${produces }" varStatus="status" >
					
					<div class="panel-heading ">
					
						<!-- 利用一个栅格系统向右偏移完成布局 -->
						<div class="row">
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-2">
									</div>
									<div class="col-md-10">
										<b>
										<a href="<%=path %>/topic/${ns.id}">${ns.name }</a>
										</b>
									</div>
								</div>
							</div>
						</div>
						
						
					</div>
						<div class="panel-body">
							<c:choose>
								<c:when test="${empty ns.url}">
								</c:when>
								<c:otherwise>
								<a href="<%=path %>/topic/${ns.id}" class="thumbnail">
									<img id="index-src" src="<%=path %>/${ns.path}" alt="">
	 							</a>
								</c:otherwise>
							</c:choose>
						  <%--内容暂时不显示  ${ns.content }... --%>
						</div>
				<hr class="divider"/>
					
				</c:forEach>
				
				
			</div>
			
			
		</div>
		<div class="col-md-4 ">
			
			<div class="panel panel-primary">
				<div class="panel-heading">
					通知
				</div>
				<%-- <c:forEach var="com" items="${achatList }" varStatus="status">
				  	<div class="panel-body">
				    	<a href="<%=path%>/user/achatDetail/${user.id}">${com.title }</a>
				    	&nbsp;&nbsp;&nbsp;
				    	${com.support_price }
				    	<span class="glyphicon glyphicon-jpy" aria-hidden="true"></span>
				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				    	${com.state}
				  	</div>
				</c:forEach> --%>
				
				<table id="notification_list">
				</table>
				
			</div>
			
			<hr class="hr-right"/>
			
			
		</div>
	</div>


<!-- 分页 -->
<nav class="text-right">
  <ul class="pagination pagination-lg">
    <li class="
    	<c:if test="${currentpage == 1}">
			disabled
		</c:if>
    ">
      <a  href="<%=path%>/index/turnToIndex/${currentpage -1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="
    	<c:if test="${currentpage == 1}">
			active
		</c:if>
    "><a href="<%=path%>/index/turnToIndex/1">1</a></li>
    
    <li class="
    	<c:if test="${currentpage == 2}">
			active
		</c:if>
    "><a href="<%=path%>/index/turnToIndex/2">2</a></li>
    
    <li class="
    	<c:if test="${currentpage == 3}">
			active
		</c:if>
    "><a href="<%=path%>/index/turnToIndex/3">3</a></li>
    
    <li class="
    	<c:if test="${currentpage == 4}">
			active
		</c:if>
    "><a href="<%=path%>/index/turnToIndex/4">4</a></li>
    
    <li class="
    	<c:if test="${currentpage == 5}">
			active
		</c:if>
    "><a href="<%=path%>/index/turnToIndex/5">5</a></li>
    
    <li><a href="#">.....</a></li>
    
    <li>
      <a href="<%=path%>/index/turnToIndex/${currentpage +1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>


	<!-- 分割线 -->
	<hr class="divider"/>
	
	

</div>


<!-- 弹出框 模态框关于 -->
<div class="modal fade" id="about" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">关于</h4>
      </div>
      <div class="modal-body">
      	<p>
      		自由开发者crossoverJie
      	</p>
   		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

<!-- 弹出框 模态框登录 -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_login">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel_login">登录</h4>
      </div>
      <div class="modal-body">
			<form id="loginForm" method="post" >
			  <div class="form-group">
			    <label for="exampleInputEmail1">用户名</label>
			    <input type="email" name="text" required="required" class="form-control" id="login-name" placeholder="用户名">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">密码</label>
			    <input type="password" name="password" required="required" class="form-control" id="login-password" placeholder="密码">
			  </div>
			  <div class="modal-footer">
				  <button type="button" onclick="login();" class="btn btn-primary">登录</button>
			      <button type="reset" class="btn btn-danger">重置</button>
		      </div>
			</form>
      </div>
    </div>
  </div>
</div>

<!-- 弹出框 模态框注册 -->
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_register">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel_register">注册</h4>
      </div>
      <div class="modal-body">
			<form method="post" id="registerUserForm" action="<%=path%>/index/register">
			  
			  <div class="form-group" id="div-username">
				<label for="register-username">用户名</label>
				<input type="text" name="username" class="form-control" id="register-username" required="required"
				min="1" maxlength="20" placeholder="用户名(1-20位中英文、数字。下划线)"/>
			  </div>
			  
			  <div class="form-group " id="div-password1">
			    <label for="exampleInputPassword1">密码</label>
			    <input type="password" required="required" class="form-control" id="password1" name="password"
			    min="6" maxlength="20" placeholder="密码(6-20位数字、英文)">
			  </div>
			  <div class="form-group" id="div-password2">
			    <label for="exampleInputPassword2">确认密码</label>
			    <input type="password" required="required" class="form-control" id="password2" placeholder="确认密码">
							    
			  </div>
			  
			  <div class="form-group">
			    <label for="">省份</label>
			    <select required="required" id="province" name="province" class="form-control ">
					<option value="北京">北京市</option>
                       <option value="浙江省">浙江省</option>
                       <option value="天津市">天津市</option>
                       <option value="安徽省">安徽省</option>
                       <option value="上海市">上海市</option>
                       <option value="福建省">福建省</option>
                       <option value="重庆市">重庆市</option>
                       <option value="江西省">江西省</option>
                       <option value="山东省">山东省</option>
                       <option value="河南省">河南省</option>
                       <option value="湖北省">湖北省</option>
                       <option value="湖南省">湖南省</option>
                       <option value="广东省">广东省</option>
                       <option value="海南省">海南省</option>
                       <option value="山西省">山西省</option>
                       <option value="青海省">青海省</option>
                       <option value="江苏省">江苏省</option>
                       <option value="辽宁省">辽宁省</option>
                       <option value="吉林省">吉林省</option>
                       <option value="台湾省">台湾省</option>
                       <option value="河北省">河北省</option>
                       <option value="贵州省">贵州省</option>
                       <option value="四川省">四川省</option>
                       <option value="云南省">云南省</option>
                       <option value="陕西省">陕西省</option>
                       <option value="甘肃省">甘肃省</option>
                       <option value="黑龙江省">黑龙江省</option>
                       <option value="香港特别行政区">香港特别行政区</option>
                       <option value="澳门特别行政区">澳门特别行政区</option>
                       <option value="广西壮族自治区">广西壮族自治区</option>
                       <option value="宁夏回族自治区">宁夏回族自治区</option>
                       <option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
                       <option value="内蒙古自治区">内蒙古自治区</option>
				</select>
			  </div>
			  
			  <div class="modal-footer">
				  <button type="submit" class="btn btn-primary">注册</button>
			      <button type="reset" class="btn btn-danger" >重置</button>
		      </div>
			</form>
      </div>
    </div>
  </div>
</div>

  	<footer>
		<p class="text-center">© 2016 crossoverJie</p>
		<p class="text-center">
			<a href="<%=path%>/login.jsp">后台登录</a>
		</p>
		<p class="text-center">

		<script language="javascript" type="text/javascript" src="http://js.users.51.la/18800358.js"></script>
		<noscript><a href="http://www.51.la/?18800358" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/18800358.asp" style="border:none" /></a></noscript>
			
		</p>
	</footer>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/index.js" type="text/javascript"></script>
	<script src="<%=path%>/include/js/jquery.easyui.min.js"
	type="text/javascript"></script>
	<script src="<%=path%>/include/js/easyui-lang-zh_CN.js" type="text/javascript"></script>
</body>
</html>
