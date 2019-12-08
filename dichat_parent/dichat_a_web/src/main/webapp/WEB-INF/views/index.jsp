<%--
  Created by IntelliJ IDEA.
  User: Godfrey
  Date: 2019/11/30
  Time: 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>滴信-聊天系统</title>
    <meta name="renderer" content="webkit"/>

    <!-- 强制Chromium内核，作用于其他双核浏览器 -->
    <meta name="force-rendering" content="webkit"/>

    <!-- 如果有安装 Google Chrome Frame 插件则强制为Chromium内核，否则强制本机支持的最高版本IE内核，作用于IE浏览器 -->
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"/>

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/dist/media/img/favicon.png" type="image/png">

    <!-- Bundle Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bundle.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/enjoyhint/enjoyhint.css">

    <!-- App styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/app.min.css">
    <!-- bootstrapValidator styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrapValidator.min.css">
    <!-- toastr styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/toastr/toastr.min.css">
</head>

<body>

<!-- page loading -->
<div class="page-loading"></div>
<!-- ./ page loading -->
<audio id="notify" >
</audio>
<!-- page tour modal -->
<div class="modal fade" id="pageTour" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-body text-center pt-5">
                <div class="row">
                    <div class="col-md-6 offset-3">
                        <figure>
                            <img src="${pageContext.request.contextPath}/dist/media/svg/undraw_product_tour_foyt.svg" class="img-fluid" alt="image">
                        </figure>
                        <p class="lead mt-5">您需要浏览页面简短介绍吗?</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-primary start-tour">开始浏览</button>
                <button type="button" class="btn btn-link" data-dismiss="modal" aria-label="Close">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- ./ page tour modal -->

<!-- add friends modal -->

<div class="modal fade" id="addFriends" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i data-feather="user-plus" class="mr-2"></i> 添加好友
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="ti-close"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert alert-info">发送好友验证.</div>
                <form id="addFriendAjax" method="post" action="${pageContext.request.contextPath}/center/addFriend">
                    <div class="form-group">
                        <label for="emails" class="col-form-label">滴信号码</label>
                        <input type="text" name="FriendUserid" class="form-control" id="emails" placeholder="请输入对方的滴信号码">
                    </div>
                    <div class="form-group">
                        <label for="message" class="col-form-label">请输入验证消息</label>
                        <textarea class="form-control" name="msg" id="message" placeholder="我是..." rows="4"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="addFriend('${pageContext.request.contextPath}');return false;">发送好友申请</button>
            </div>
        </div>
    </div>
</div>
<!-- ./ add friends modal -->


<!-- edit define modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i data-feather="edit-2" class="mr-2"></i> 修改个人信息
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="ti-close"></i>
                </button>
            </div>
            <div class="modal-body">

                <div class="tab-content">
                    <div class="tab-pane show active" id="personal" role="tabpanel">
                        <form id="editAjaxForm" method="post" action="${pageContext.request.contextPath}/center/editInfo">
                            <div class="form-group">
                                <label for="name" class="col-form-label">姓名</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="name" id="name" value="${userDefine.name}" >
                                    <div class="input-group-append">
                                            <span class="input-group-text">
                                                <i data-feather="user"></i>
                                            </span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="tel" class="col-form-label">手机号</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="tel" id="tel" value="${userDefine.tel}" >
                                    <div class="input-group-append">
                                            <span class="input-group-text">
                                                <i data-feather="phone"></i>
                                            </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-form-label">邮箱</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="email" id="email" value="${userDefine.email}">
                                    <div class="input-group-append">
                                            <span class="input-group-text">
                                                <i class="fa fa-envelope-o"></i>
                                            </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="birthday" class="col-form-label">出生日期</label>
                                <div class="input-group">
                                    <input type="date" class="form-control" id="birthday" name="birthday" max="2018-01-01">
                                    <div class="input-group-append">
                                            <span class="input-group-text">
                                                <i class="fa fa-envelope-o"></i>
                                            </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="instructions" class="col-form-label">个人简介</label>
                                <div class="input-group">
                                    <textarea class="form-control" rows="5" name="instructions" id="instructions" >${userDefine.instructions}</textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="saveEdit('${pageContext.request.contextPath}');return false;">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- ./ edit define modal -->

<!-- layout -->
<div class="layout">

    <!-- navigation -->
    <nav class="navigation">
        <div class="nav-group">
            <ul>
                <li class="logo">
                    <a href="#">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="612px" height="612px" viewBox="0 0 612 612" style="enable-background:new 0 0 612 612;" xml:space="preserve">
                                <g>
                                    <g id="_x32__26_">
                                        <g>
                                            <path d="M401.625,325.125h-191.25c-10.557,0-19.125,8.568-19.125,19.125s8.568,19.125,19.125,19.125h191.25
                                    c10.557,0,19.125-8.568,19.125-19.125S412.182,325.125,401.625,325.125z M439.875,210.375h-267.75
                                    c-10.557,0-19.125,8.568-19.125,19.125s8.568,19.125,19.125,19.125h267.75c10.557,0,19.125-8.568,19.125-19.125
                                    S450.432,210.375,439.875,210.375z M306,0C137.012,0,0,119.875,0,267.75c0,84.514,44.848,159.751,114.75,208.826V612
                                    l134.047-81.339c18.552,3.061,37.638,4.839,57.203,4.839c169.008,0,306-119.875,306-267.75C612,119.875,475.008,0,306,0z
                                    M306,497.25c-22.338,0-43.911-2.601-64.643-7.019l-90.041,54.123l1.205-88.701C83.5,414.133,38.25,345.513,38.25,267.75
                                    c0-126.741,119.875-229.5,267.75-229.5c147.875,0,267.75,102.759,267.75,229.5S453.875,497.25,306,497.25z" />
                                        </g>
                                    </g>
                                </g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            </svg>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/center/" class="active" data-navigation-target="chats" href="#" data-toggle="tooltip" title="聊天列表" data-placement="right">
                        <span class="badge badge-warning"></span>
                        <i data-feather="message-circle"></i>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/center/friendList" data-navigation-target="friends" href="#" data-toggle="tooltip" title="好友列表" data-placement="right">

                        <i data-feather="user"></i>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/center/myImpression" data-navigation-target="favorites" data-toggle="tooltip" title="我的印象" data-placement="right" href="#">
                        <span class="badge badge-light"></span>
                        <i data-feather="star"></i>
                    </a>
                </li>
                <li class="brackets">
                    <a href="${pageContext.request.contextPath}/center/addMsgList" data-navigation-target="archived" href="#" data-toggle="tooltip" title="验证消息" data-placement="right">
                        <span class="badge badge-danger"></span>
                        <i data-feather="archive"></i>
                    </a>
                </li>
                <li>
                    <a href="#" class="dark-light-switcher" data-toggle="tooltip" title="黑夜模式" data-placement="right">
                        <i data-feather="moon"></i>
                    </a>
                </li>
                <li data-toggle="tooltip" title="个人菜单" data-placement="right">
                    <a href="./login.html" data-toggle="dropdown">
                        <figure class="avatar">
                            <img src="${userDefine.headPortrait}" class="rounded-circle" alt="个人菜单">
                        </figure>
                    </a>
                    <div class="dropdown-menu">
                        <a href="#" class="dropdown-item" data-toggle="modal" data-target="#editProfileModal">编辑个人信息</a>
                        <div class="dropdown-divider"></div>
                        <a href="${pageContext.request.contextPath}/user/logout" class="dropdown-item text-danger">退出登录</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <!-- ./ navigation -->

    <!-- content -->
    <div class="content">
        <div class="backlogo">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" fill="#b2b2b2" width="100px" height="100px" viewBox="0 0 612 612" style="/* stroke-width: 20px; */enable-background:new 0 0 612 612;" xml:space="preserve">
                                        <g>
                                            <g id="_x32__26_">
                                                <g>
                                                    <path d="M401.625,325.125h-191.25c-10.557,0-19.125,8.568-19.125,19.125s8.568,19.125,19.125,19.125h191.25
                                            c10.557,0,19.125-8.568,19.125-19.125S412.182,325.125,401.625,325.125z M439.875,210.375h-267.75
                                            c-10.557,0-19.125,8.568-19.125,19.125s8.568,19.125,19.125,19.125h267.75c10.557,0,19.125-8.568,19.125-19.125
                                            S450.432,210.375,439.875,210.375z M306,0C137.012,0,0,119.875,0,267.75c0,84.514,44.848,159.751,114.75,208.826V612
                                            l134.047-81.339c18.552,3.061,37.638,4.839,57.203,4.839c169.008,0,306-119.875,306-267.75C612,119.875,475.008,0,306,0z
                                            M306,497.25c-22.338,0-43.911-2.601-64.643-7.019l-90.041,54.123l1.205-88.701C83.5,414.133,38.25,345.513,38.25,267.75
                                            c0-126.741,119.875-229.5,267.75-229.5c147.875,0,267.75,102.759,267.75,229.5S453.875,497.25,306,497.25z"></path>
                                                </g>
                                            </g>
                                        </g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                <g></g>
                                    </svg>
            滴信
        </div>
        <!-- sidebar group -->
        <div class="sidebar-group">

            <!-- Chats sidebar -->
            <div id="chats" class="sidebar active">
                <header>
                    <span>聊天列表</span>
                    <ul class="list-inline">

                        <li class="list-inline-item" data-toggle="tooltip" title="添加好友">
                            <a class="btn btn-outline-light" href="#" data-toggle="modal" data-navigation-target=“addFriends” data-target="#addFriends">
                                <i data-feather="user-plus"></i>
                            </a>
                        </li>
                        <li class="list-inline-item d-xl-none d-inline">
                            <a href="#" class="btn btn-outline-light text-danger sidebar-close">
                                <i data-feather="x"></i>
                            </a>
                        </li>
                    </ul>
                </header>
                <form>
                    <input type="text" class="form-control" placeholder="搜索好友">
                </form>
                <div class="sidebar-body">
                    <ul class="list-group list-group-flush" id="MsgList">

                    </ul>
                </div>
            </div>
            <!-- ./ Chats sidebar -->

        </div>
        <!-- ./ sidebar group -->

        <!-- chat -->
        <div class="chat" style="display: none;" id="chatBox">
            <div class="chat-header" id="chatFriendDefine">

            </div>
            <div class="chat-body">
                <!-- .no-message -->
                <!--
            <div class="no-message-container">
                <div class="row mb-5">
                    <div class="col-md-4 offset-4">
                        <img src="${pageContext.request.contextPath}/dist/media/svg/undraw_empty_xct9.svg" class="img-fluid" alt="image">
                    </div>
                </div>
                <p class="lead">Select a chat to read messages</p>
            </div>
            -->
                <div class="messages" id="chatContant">

                </div>
            </div>
            <div class="chat-footer">
                <form>
                    <input name="msg" type="text" class="form-control" placeholder="请在这里输入聊天内容" onkeydown='if(event.keyCode==13){$("#send").trigger("click");return false;}'>
                    <input name="file" type="file" hidden class="" id="upload" placeholder="上传图片" accept=".jpeg,.bmp,.jpg,.png" />
                    <div class="form-buttons">
                        <button class="btn btn-light" data-toggle="tooltip" title="发送图片" type="button" onclick="uploads()">
                            <i data-feather="paperclip"></i>
                        </button>

                        <button class="btn btn-primary" id="send" data-friendId=0 data-toggle="tooltip" title="发送" type="button">
                            <i data-feather="send"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <!-- ./ chat -->

        <div class="sidebar-group">
            <div id="contact-information" class="sidebar">
                <header>
                    <span id="define_name2">姓名</span>
                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <a href="#" class="btn btn-outline-light text-danger sidebar-close" onclick="closeDenfine();return false;" id="close">
                                <i data-feather="x"></i>
                            </a>
                        </li>
                    </ul>
                </header>
                <div class="sidebar-body">
                    <div class="pl-4 pr-4">
                        <div class="text-center">
                            <figure class="avatar avatar-xl mb-4">
                                <img id="headPortrait" class="rounded-circle" alt="image">
                            </figure>
                            <h5 class="mb-1" id="define_name"></h5>
                            <small class="text-muted font-italic" id="define_id"></small>
                            <ul class="nav nav-tabs justify-content-center mt-4" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">个人信息</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">好友印象</a>
                                </li>
                            </ul>
                        </div>
                        <hr>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="mt-4 mb-4 ml-2">
                                    <div class="info">
                                        <div class="left-text">姓名</div>
                                        <div class="text-muted" id="define_name1"></div>
                                    </div>
                                </div>
                                <div class="mt-4 mb-4 ml-2">
                                    <div class="info">
                                        <div class="left-text">联系电话</div>
                                        <div class="text-muted" id="define_tel"></div>
                                    </div>

                                </div>
                                <div class="mt-4 mb-4 ml-2">
                                    <div class="info">
                                        <div class="left-text">联系邮箱</div>
                                        <div class="text-muted" id="define_email"></div>
                                    </div>
                                </div>
                                <div class="mt-4 mb-4 ml-2">
                                    <div class="info">
                                        <div class="left-text">年龄</div>
                                        <div class="text-muted" id="define_years_old"></div>
                                    </div>
                                </div>
                                <div class="mt-4 mb-4 ml-2">
                                    <div class="info">
                                        <div class="left-text">生日</div>
                                        <div class="text-muted" id="define_birthday"></div>
                                    </div>
                                </div>
                                <div class="mt-4 mb-4 ml-2">
                                    <div class="info">
                                        <div class="left-text">星座</div>
                                        <div class="text-muted" id="define_constellation"></div>
                                    </div>
                                </div>
                                <h6 class=" ml-2">个人简介</h6>
                                <p class="text-muted  ml-2" id="define_description"></p>


                            </div>
                            <div class="tab-pane fade mt-4" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <div>
                                    <ul class="list-group list-group-flush list-define" id="impressionList">
                                        <li class="list-group-item pl-0 pr-0 align-items-center di-flex1 orange">
                                            <div class="di-flex ">
                                                <div class="left orange">
                                                    123123
                                                </div>
                                                <div class="right">
                                                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                                                </div>
                                            </div>

                                            <div class="description"><i class="fa fa-gratipay" aria-hidden="true">&nbsp; </i>
                                                <div class="love-left">123,123,123,123,123,123,123,123,123,123,</div>
                                                <div class="love-right">共100个喜欢</div>
                                            </div>
                                        </li>
                                        <li class="list-group-item pl-0 pr-0 align-items-center di-flex1 purple">
                                            <div class="di-flex">
                                                <div class="left ">
                                                    123123
                                                </div>
                                                <div class="right">
                                                    <i class="fa fa-heart" aria-hidden="true"></i>
                                                </div>
                                            </div>

                                            <div class="description"><i class="fa fa-gratipay" aria-hidden="true">&nbsp; </i>123,共1个喜欢</div>
                                        </li>
                                        <li class="list-group-item pl-0 pr-0 align-items-center di-flex1 purple">
                                            <div class="di-flex ">
                                                <div class="left purple">
                                                    123123
                                                </div>
                                                <div class="right">
                                                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                                                </div>
                                            </div>

                                            <div class="description"><i class="fa fa-gratipay" aria-hidden="true">&nbsp; </i>
                                                <div class="love-left">123,123,123,123,123,123,123,123,123,123,</div>
                                                <div class="love-right">共100个喜欢</div>
                                            </div>
                                        </li>
                                        <li class="list-group-item pl-0 pr-0 align-items-center di-flex1 red">
                                            <div class="di-flex ">
                                                <div class="left red">
                                                    123123
                                                </div>
                                                <div class="right">
                                                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                                                </div>
                                            </div>

                                            <div class="description"><i class="fa fa-gratipay" aria-hidden="true">&nbsp; </i>
                                                <div class="love-left">123,123,123,123,123,123,123,123,123,123,</div>
                                                <div class="love-right">共100个喜欢</div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- ./ content -->

</div>
<div id="down" style="display: none"></div>
<!-- ./ layout -->

<!-- Bundle -->
<script src="${pageContext.request.contextPath}/vendor/bundle.js"></script>

<script src="${pageContext.request.contextPath}/vendor/enjoyhint/enjoyhint.min.js"></script>

<!-- App scripts -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<!-- bootstrapValidator scripts -->
<script src="${pageContext.request.contextPath}/dist/js/bootstrapValidator.min.js"></script>
<!-- Main scripts -->
<script src="${pageContext.request.contextPath}/dist/js/main.js"></script>
<!-- Layer scripts -->
<script src="${pageContext.request.contextPath}/dist/layer/layer.js"></script>
<!-- sweetalert scripts -->
<script src="${pageContext.request.contextPath}/dist/sweetalert/sweetalert.min.js"></script>
<!-- toastr scripts -->
<script src="${pageContext.request.contextPath}/dist/toastr/toastr.min.js"></script>
<!-- moment.js -->
<script src="${pageContext.request.contextPath}/dist/js/moment.js"></script>
<!-- imgviewer.js -->
<script src="${pageContext.request.contextPath}/dist/js/bootstrap.viewer.min.js"></script>

<script>

    $(function() {
        //初始化
        getMsgList();
        $("#birthday").val(moment(${userDefine.birthday}).format("YYYY-MM-DD"));
        function keyup_submit(e){
            var evt = window.event || e;
            if (evt.keyCode == 13){
                //回车事件
                $("#send").trigger("click");
            }
        }
        $('input[name="msg"]').keypress(function (e) {
            if (e.which == 13) {
                $("#send").trigger("click");
            }
        });
        $("#MsgList ").on("click", ".list-group-item",
            function() {

                $(this).addClass('open-chat').siblings().removeClass('open-chat');
            });

        if("${userDefine.isFristLogin}" == "0"){
            setTimeout(function () {
                $('#pageTour').modal('show');
            }, 1000);
            setIsNotFirstLogin();
        }
        setInterval('getNotRead("${pageContext.request.contextPath}")', 1000);


    })

</script>

<script type="text/javascript">
    //获取聊天列表
    function getMsgList(type=0) {

        // 发送请求
        $.ajax({
            url: "${pageContext.request.contextPath}/center/getChatList",
            type: 'post',
            data: {},
            processData: false,
            contentType: false,
            beforeSend() {
                //发送前操作
                if(type==0){
                    loading = layer.load(2);
                }

            },
            success: function(res) {
                if(type==0){
                    layer.close(loading);
                }

                var flag = 0;
                if (res.code == 1) {
                    console.log(res);
                    var html = '';
                    $.each(res.data, function(index, obj) {


                        if (obj.notRead > 0) {

                            //有消息未读
                            var send_time = obj.create_at == 0 ? ' ' : moment(obj.create_at).format("HH:MM:SS");
                            html += '<li class="list-group-item"><div onclick="openBox(' + obj.friendUserid + ',1)">'
                            if (obj.is_top == 1) {
                                //置顶
                                html += '<i class="fa fa-sort-asc text-primary" aria-hidden="true" style="transform: rotate(-45deg);font-size: 1.3rem;position: absolute;margin: -10px -28px;"></i>'
                            }

                            html += '<figure class="avatar avatar-state-primary">\
                                            <img src="' + obj.headPortrait + '" class="rounded-circle" alt="image">\
                                        </figure></div>\
                                        <div class="users-list-body">\
                                            <div onclick="openBox(' + obj.friendUserid + ',1)">\
                                                <h5 class="text-primary">' + obj.name + '</h5>\
                                                <p>' + obj.msg + '</p>\
                                            </div>\
                                            <div class="users-list-action">\
                                                <div class="new-message-count">' + obj.notRead + '</div>\
                                                <small class="text-primary">' + send_time + '</small>\
                                            </div>\
                                        </div>\
                                    </li>'
                            flag=1;
                        } else {
                            //全部已读
                            var send_time = obj.create_at == 0 ? ' ' : moment(obj.create_at).format("YYYY-MM-DD HH:MM:SS");
                            html += ' <li class="list-group-item">\
                                <div onclick="openBox(' + obj.friendUserid + ',1)">'
                            if (obj.is_top == 1) {
                                //置顶
                                html += '<i class="fa fa-sort-asc text-primary" aria-hidden="true" style="transform: rotate(-45deg);font-size: 1.3rem;position: absolute;margin: -10px -28px;"></i>';
                            }

                            html += '<figure class="avatar">\
                                            <img src="' + obj.headPortrait + '" class="rounded-circle" alt="image">\
                                        </figure>\
                                </div>\
                                <div class="users-list-body">\
                                    <div onclick="openBox(' + obj.friendUserid + ')">\
                                        <h5>' + obj.name + '</h5>\
                                        <p>' + obj.msg + '</p>\
                                    </div>\
                                    <div class="users-list-action">\
                                        <small class="text-muted">' + send_time + '</small>\
                                        <div class="action-toggle">\
                                            <div class="dropdown">\
                                                <a data-toggle="dropdown" href="javasrcipt:void(0);" >\
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal" data-brackets-id="1369"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>\
                                                </a>\
                                                <div class="dropdown-menu dropdown-menu-right">\
                                                    <a href="javasrcipt:void(0);" class="dropdown-item" onclick="openBox(' + obj.friendUserid + ')">发送消息</a>';
                            if (obj.is_top == 1) {
                                html += '<a href="javasrcipt:void(0);"  class="dropdown-item text-danger" onclick="delTop(' + obj.friendUserid + ')">取消置顶</a>';
                            } else {
                                html += '<a href="javasrcipt:void(0);" class="dropdown-item" onclick="setTop(' + obj.friendUserid + ')">置顶</a>';
                            }
                            html += '<a href="javasrcipt:void(0);" class="dropdown-item text-danger" onclick="delMsg(' + obj.friendUserid + ')">删除聊天记录</a>\
                                                </div>\
                                            </div>\
                                        </div>\
                                    </div>\
                                </div>\
                            </li>';

                        }
                        if(getQueryVariable("friendUserid")==obj.friendUserid) {
                            window.history.pushState(null, '', "${pageContext.request.contextPath}/center/")
                            openBox(obj.friendUserid);
                        }
                    })
                    $("#MsgList").html(html);
                    if(flag==1){
                        var friendUserid = $("#send").attr("data-friendId");
                        var friend_headPortrait =  $("#headPortrait").attr("src");
                        var friend_name = $("#define_name1").html();
                        var display=$('#chatBox').css('display')
                        if(display!='none'){
                            console.log("未被隐藏");
                            getUnreadMsg(friendUserid,friend_headPortrait,friend_name);
                        }
                    }
                    $('.dropdown-toggle').dropdown()

                } else {
                    if(type==0){
                        layer.close(loading);
                    }
                    swal("获取信息列表失败请刷新页面", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    })
                        .then(name => {
                        location.reload();
                });
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                layer.close(loading);
                swal("获取信息列表失败请刷新页面", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                }).then(name => {
                    location.reload();
            });
            }

        })
    }
    //打开聊天界面
    function openBox(friendUserid,needRef=0) {

        var formData = new FormData();
        formData.append("FriendUserid", friendUserid);
        $("#chatBox").hide();
        var friend_headPortrait = "";
        var friend_name = "";
        //获取好友信息
        $("#close").trigger("click");
        $.ajax({
            url: "${pageContext.request.contextPath}/center/getFriendDefine",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend() {
                //发送前操作

                loading = layer.load(2);
            },
            success: function(res) {
                layer.close(loading);
                if (res.code == 1) {
                    console.log(res);
                    var html = '';
                    friend_headPortrait = res.data.headPortrait;
                    friend_name = res.data.name;
                    html = '<div class="chat-header-user">\
                                    <figure class="avatar">\
                                        <img src="' + friend_headPortrait + '" class="rounded-circle" alt="image">\
                                    </figure>\
                                    <div>\
                                        <h5>' + friend_name + '</h5>\
                                    </div>\
                                </div>\
                                <div class="chat-header-action">\
                                    <ul class="list-inline">\
                                        <li class="list-inline-item">\
                                            <a href="#" class="btn btn-outline-light" data-toggle="dropdown">\
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>\
                                            </a>\
                                            <div class="dropdown-menu dropdown-menu-right">'


                    html += '             <a href="javasript:void(0);" onclick="openDenfine()" class="dropdown-item">查看资料</a>\
                                                <a href="javascript:void(0);" onclick="getDown(\''+friendUserid+'\')" class="dropdown-item">下载聊天记录</a>\
                                                <a href="javascript:void(0);" onclick="delMsg(\''+friendUserid+'\')" class="dropdown-item text-danger">删除聊天记录</a>\
                                                <div class="dropdown-divider"></div>\
                                                <a href="javascript:void(0);" onclick="delFriend(\''+friendUserid+'\')" class="dropdown-item text-danger">删除好友</a>\
                                            </div> \
                                        </li> \
                                    </ul>\
                                </div>'

                    $("#chatFriendDefine").html(html);
                    //设置资料展示
                    //设置账户

                    $("#define_id").html("账号："+res.data.userid);
                    //设置姓名

                    $("#define_name,#define_name1,#define_name2").html(friend_name);
                    //设置电话
                    $("#define_tel").html(res.data.tel);
                    //设置邮箱
                    $("#define_email").html(res.data.email);
                    //设置介绍
                    $("#define_description").html(res.data.instructions==null?'主人还未设置个人介绍哦！':res.data.instructions);
                    //设置年龄
                    $("#define_years_old").html(getAge(moment(res.data.birthday).format("YYYY-MM-DD")));
                    //设置生日
                    $("#define_birthday").html(moment(res.data.birthday).format("YYYY-MM-DD"));
                    //设置星座
                    $("#define_constellation").html(getAstro(moment(res.data.birthday).format("MM"),moment(res.data.birthday).format("DD"))+"座");
                    //设置头像
                    $("#headPortrait").attr("src",friend_headPortrait);
                    getImpression(friendUserid);
                    getFriendMsg(friendUserid,friend_headPortrait,friend_name,needRef);

                } else {
                    swal("获取聊天内容失败请重新点击", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    })
                        .then(name => {
                        $("#chatBox").hide();
                });
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                layer.close(loading);
                swal("获取聊天内容失败请重新点击", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                }).then(name => {
                    $("#chatBox").hide();
            });
            }

        })
    }
    //设置置顶
    function setTop(friendUserid){

        //设置置顶
        var formData = new FormData();
        formData.append("FriendUserid", friendUserid);
        formData.append("is_top", 1);
        $.ajax({
            url: "${pageContext.request.contextPath}/center/setFriendTop",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend() {
                //发送前操作

                loading = layer.load(2);
            },
            success: function(res) {
                layer.close(loading);
                if (res.code == 1) {
                    getMsgList();
                } else {
                    swal("设置失败请重试", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    });
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                layer.close(loading);
                swal("设置失败请重试", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                });
            }

        })
        //获取聊天记录
    }
    //取消置顶
    function delTop(friendUserid){

        //设置置顶
        var formData = new FormData();
        formData.append("FriendUserid", friendUserid);
        formData.append("is_top", 0);
        $.ajax({
            url: "${pageContext.request.contextPath}/center/setFriendTop",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend() {
                //发送前操作

                loading = layer.load(2);
            },
            success: function(res) {
                layer.close(loading);
                if (res.code == 1) {
                    getMsgList();
                } else {
                    swal("设置失败请重试", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    });
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                layer.close(loading);
                swal("设置失败请重试", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                });
            }

        })
    }
    //发送文本消息
    $("#send").click(function(e){

        //文本发送
        var friendUserid = $("#send").attr("data-friendId");
        var formData = new FormData();
        formData.append("FriendUserid", friendUserid);
        formData.append("msg", $("input[name='msg']").val());
        $.ajax({
            url: "${pageContext.request.contextPath}/center/sendMsgText",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            success: function(res) {
                if (res.code == 1) {
                    SohoExamle.Message.add($("input[name='msg']").val(), 'outgoing-message',"${userDefine.headPortrait}","${userDefine.name}", moment().format("YYYY-MM-DD HH:mm:ss"),0);
//                        SohoExamle.Image.add(obj.msg, 'outgoing-message',"${userDefine.headPortrait}","${userDefine.name}",send_time,obj.isSend)
                    $("input[name='msg']").val("");
                } else {
                    swal(res.msg, {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    });
                };
                getMsgList();
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                swal("发送失败，连接异常", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                });
            }

        })
    })
    //发送图片消息 start
    function uploads(){
        $("#upload").trigger("click");
        openuploads("upload");
    }
    function openuploads(id){
        $("#"+id).change(function(){
            var formData = new FormData();
            var friendUserid = $("#send").attr("data-friendId");
            formData.append('file',$("#"+id)[0].files[0]); //获取图片信息
            formData.append("toUserid", friendUserid);
            $.ajax({
                url: "${pageContext.request.contextPath}/center/sendMsgImg",
                type: 'post',
                data: formData,
                processData: false,
                contentType: false,
                success: function(res) {
                    if (res.code == 1) {
                        SohoExamle.Image.add(res.data.msg, 'outgoing-message',"${userDefine.headPortrait}","${userDefine.name}", moment().format("YYYY-MM-DD HH:mm:ss"),0,res.data.id)
                    } else {
                        swal(res.msg, {
                            button: false,
                            dangerMode: true,
                            icon: "warning",
                            timer: 2000,
                        });
                    }
                    var test = document.getElementById(id);
                    test.outerHTML = test.outerHTML;
                    getMsgList();
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    var test = document.getElementById(id);
                    test.outerHTML = test.outerHTML;
                    swal("发送失败，连接异常", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    });
                }

            })
        })
    }
    //发送图片消息 end
    //删除聊天记录
    function delMsg(friendUserid){
        //删除聊天记录
        layer.confirm('确认要删除与他聊天记录吗？', {
            btn: ['确认删除','取消'] //按钮
        }, function(){
            var formData = new FormData();
            formData.append("FriendUserid", friendUserid);
            $.ajax({
                url: "${pageContext.request.contextPath}/center/delMsg",
                type: 'post',
                data: formData,
                processData: false,
                contentType: false,
                beforeSend() {
                    //发送前操作
                    layer.close(layer.index);
                    loading = layer.load(2);
                },
                success: function(res) {
                    layer.close(loading);
                    if (res.code == 1) {
                        $("#chatBox").hide();
                        getMsgList();
                        swal("删除成功!", {
                            button: false,
                            dangerMode: true,
                            icon: "success",
                            timer: 1500,
                        })
                    } else {
                        swal("删除记录失败请重试", {
                            button: false,
                            dangerMode: true,
                            icon: "warning",
                            timer: 2000,
                        });
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    layer.close(loading);
                    swal("删除记录失败请重试", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    });
                }

            })
        }, function(){

        });

    }
    //删除好友
    function delFriend(friendUserid){
        //删除聊天记录
        layer.confirm('确认要删除好友嘛？', {
            btn: ['确认删除','取消'] //按钮
        }, function(){
            var formData = new FormData();
            formData.append("FriendUserid", friendUserid);
            $.ajax({
                url: "${pageContext.request.contextPath}/center/delFriend",
                type: 'post',
                data: formData,
                processData: false,
                contentType: false,
                beforeSend() {
                    //发送前操作
                    layer.close(layer.index);
                    loading = layer.load(2);
                },
                success: function(res) {
                    layer.close(loading);
                    if (res.code == 1) {
                        $("#chatBox").hide();
                        getMsgList();
                        swal("删除成功!", {
                            button: false,
                            dangerMode: true,
                            icon: "success",
                            timer: 1500,
                        })
                    } else {
                        swal("删除好友失败请重试", {
                            button: false,
                            dangerMode: true,
                            icon: "warning",
                            timer: 2000,
                        });
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    layer.close(loading);
                    swal("删除好友失败请重试", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    });
                }

            })
        }, function(){

        });

    }
    //点赞
    function setLove(impressionId,friendUseiid){

        layer.confirm('您确定要点赞吗？', {
            btn: ['确认','取消'] //按钮
        }, function(){
            var formData = new FormData();
            formData.append("impressionId", impressionId);
            $.ajax({
                url: "${pageContext.request.contextPath}/center/setLove",
                type: 'post',
                data: formData,
                processData: false,
                contentType: false,
                beforeSend() {
                    //发送前操作
                    layer.close(layer.index);
                    loading = layer.load(2);
                },
                success: function(res) {
                    layer.close(loading);
                    if (res.code == 1) {
                        swal("点赞成功!", {
                            button: false,
                            dangerMode: true,
                            icon: "success",
                            timer: 1500,
                        }).then(name => {
                            openBox(friendUseiid);
                    });

                    } else {
                        swal(res.msg, {
                            button: false,
                            dangerMode: true,
                            icon: "warning",
                            timer: 1500,
                        });
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    layer.close(loading);
                    swal("连接异常请重试", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 1500,
                    });
                }

            })
        }, function(){

        });
    }
    //获取对方发来的信息
    function getUnreadMsg(friendUserid,friend_headPortrait,friend_name){
        var formData = new FormData();
        formData.append("FriendUserid", friendUserid);
        $.ajax({
            url: "${pageContext.request.contextPath}/center/getUnreadMsg",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend() {
                //发送前操作
            },
            success: function(res) {
                console.log(res);
                console.log("\n");
                if (res.code == 1) {

                    $.each(res.data, function(index, obj) {

                        var send_time = obj.create_at == 0 ? ' ' : moment(obj.create_at).format("YYYY-MM-DD HH:MM:SS");
                        if(obj.toUserid==${userDefine.userid}){
                            //我是接收方
                            if(obj.type==0){
//                                    文本消息
                                SohoExamle.Message.add(obj.msg, '',friend_headPortrait,friend_name,send_time,obj.isSend);
                            }else{
                                //图片消息
                                SohoExamle.Image.add(obj.msg,'',friend_headPortrait,friend_name,send_time,obj.isSend,obj.id)
                            }

                        }

                    })
                    getMsgList(1);


                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                swal("获取聊天内容失败请重新点击", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                })
            }

        })

    }

</script>
<script>
    //获取好友聊天记录
    function getFriendMsg(friendUserid,friend_headPortrait,friend_name,needRef){
        var formData = new FormData();
        formData.append("FriendUserid", friendUserid);
        $.ajax({
            url: "${pageContext.request.contextPath}/center/getFriendMsg",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend() {
                //发送前操作
                loading = layer.load(2);
            },
            success: function(res) {
                layer.close(loading);
                if (res.code == 1) {

                    $("#chatContant").html("");
                    $.each(res.data, function(index, obj) {

                        var send_time = obj.create_at == 0 ? ' ' : moment(obj.create_at).format("YYYY-MM-DD HH:MM:SS");
                        if(obj.sendUserid==${userDefine.userid}){
                            //我是发送方

                            if(obj.type==0){
//                                    文本消息
                                SohoExamle.Message.add(obj.msg, 'outgoing-message',"${userDefine.headPortrait}","${userDefine.name}",send_time,obj.isSend);
                            }else{
                                //图片消息
                                SohoExamle.Image.add(obj.msg, 'outgoing-message',"${userDefine.headPortrait}","${userDefine.name}",send_time,obj.isSend,obj.id)
                            }
                        }
                        if(obj.toUserid==${userDefine.userid}){
                            //我是接收方
                            if(obj.type==0){
//                                    文本消息
                                SohoExamle.Message.add(obj.msg, '',friend_headPortrait,friend_name,send_time,obj.isSend);
                            }else{
                                //图片消息
                                SohoExamle.Image.add(obj.msg,'',friend_headPortrait,friend_name,send_time,obj.isSend,obj.id)
                            }

                        }

                    })




                    $("#chatBox").show();
                    $("#send").attr("data-friendId",friendUserid);
                    if(needRef==1){
                        getMsgList();
                    }

                } else {
                    swal("获取聊天内容失败请重新点击", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    })
                        .then(name => {
                        $("#chatBox").hide();
                });
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                layer.close(loading);
                swal("获取聊天内容失败请重新点击", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                }).then(name => {
                    $("#chatBox").hide();
            });
            }

        })

    }
    //下载聊天记录 start
    function fakeClick(obj) {
        var ev = document.createEvent("MouseEvents");
        ev.initMouseEvent("click", true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
        obj.dispatchEvent(ev);
    }

    function exportRaw(name, data) {
        var urlObject = window.URL || window.webkitURL || window;
        var export_blob = new Blob(['\ufeff' + data], {type : 'text/html'});
        var export_blob = new Blob(['\ufeff' + data], {type: 'text/csv,charset=UTF-8'});
        var save_link = document.createElementNS("http://www.w3.org/1999/xhtml", "a")
        save_link.href = urlObject.createObjectURL(export_blob);
        save_link.download = name;
        fakeClick(save_link);
    }

    function saveFile(text,friendUserid){
        // var inValue  = document.querySelector('#'+id).value;
        // var inValue  = document.querySelector('#'+id).textContent;
        var inValue  = text;
        console.log(inValue);
        exportRaw(friendUserid+'.csv', inValue);
    }
    function getDown(friendUserid){
        var formData = new FormData();

        formData.append("FriendUserid", friendUserid);
        $.ajax({
            url: "${pageContext.request.contextPath}/center/getFriendMsg",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend() {
                //发送前操作

                loading = layer.load(2);
            },
            success: function(res) {
                layer.close(loading);

                if (res.code == 1) {
                    var text1 = "";
                    $("#down").html(text1);
                    $.each(res.data, function(index, obj) {
                        var send_time = obj.create_at == 0 ? ' ' : moment(obj.create_at).format("YYYY-MM-DD HH:MM:SS");
                        if(obj.sendUserid==${userDefine.userid}){
                            //我是发送方
                            if(obj.type==0){
                                //                            文本消息
                                text1 += send_time+",发送,${userDefine.name}"+":"+obj.msg+"\r\n";
                            }else{
                                //图片消息
                                text1 += send_time+",发送,${userDefine.name}"+":[图片消息],http://${pageContext.request.serverName}"+obj.msg+"\r\n";
                            }
                        }
                        if(obj.toUserid==${userDefine.userid}){
                            //我是接收方
                            if(obj.type==0){
                                //                            文本消息
                                text1 += send_time+",接收,"+$(".chat-header-user h5").html()+":"+obj.msg+"\r\n";
                            }else{
                                //图片消息
                                text1 += send_time+",接收,"+$(".chat-header-user h5").html()+":[图片消息],http://${pageContext.request.serverName}"+obj.msg+"\r\n";
                            }
                        }

                    })
                    saveFile(text1,friendUserid);
                } else {
                    swal("获取聊天内容失败请重新点击", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    })
                        .then(name => {
                        $("#chatBox").hide();
                });
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                layer.close(loading);
                swal("获取聊天内容失败请重新点击", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                }).then(name => {
                    $("#chatBox").hide();
            });
            }

        })
    }
    //下载聊天记录 end

    //获取印象
    function getImpression(friendUserId){
        var formData = new FormData();

        formData.append("FriendUserid", friendUserId);
        $.ajax({
            url: "${pageContext.request.contextPath}/center/getLoveList",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            success: function(res) {
                if (res.code == 1) {
                    $("#impressionList").html("");
                    $.each(res.data, function(index, obj) {

                        if(obj.id%3==0){
                            Impression.orange.add(obj.msg,obj.isLove,obj.id,obj.lover,obj.loveNum,friendUserId);
                        }else if(obj.id%3==1){
                            Impression.purple.add(obj.msg,obj.isLove,obj.id,obj.lover,obj.loveNum,friendUserId);
                        }else if(obj.id%3==2){
                            Impression.red.add(obj.msg,obj.isLove,obj.id,obj.lover,obj.loveNum,friendUserId);
                        }

                    })
                } else {
                    swal("获取好友印象失败，请重新获取", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    })
                        .then(name => {
                        $("#chatBox").hide();
                });
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                swal("获取好友印象失败，请重新获取", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                }).then(name => {
                    $("#chatBox").hide();
            });
            }

        })
    }
    //设置第一次登陆为否
    function setIsNotFirstLogin(){

        $.ajax({
            url: "${pageContext.request.contextPath}/center/setIsNotFirstLogin",
            type: 'post',
            data: {},
            processData: false,
            contentType: false,
            success: function(res) {

            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                swal("连接错误", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                }).then(name => {
                    window.location.reload();
            });
            }

        })
    }
    function openDenfine(){
        $('#contact-information').is('.active')?"":$("#contact-information").addClass("active");
        $(".layout .content .chat").css({
            "flex":"1"
        });
    }
    function closeDenfine(){
        $("#contact-information").removeClass("active");
        $(".layout .content .chat").css({
            "flex":"0 0 calc(100% - 350px)"
        });
    }
</script>
</body>

</html>
