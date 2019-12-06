<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/5/005
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--
Created by Brackets.
User: Godfrey
-->
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>滴信-聊天系统-好友列表</title>
    <meta name="renderer" content="webkit" />

    <!-- 强制Chromium内核，作用于其他双核浏览器 -->
    <meta name="force-rendering" content="webkit" />

    <!-- 如果有安装 Google Chrome Frame 插件则强制为Chromium内核，否则强制本机支持的最高版本IE内核，作用于IE浏览器 -->
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />

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
<audio id="notify">
</audio>
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
                                    <input type="text" class="form-control" name="name" id="name" value="${userDefine.name}">
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
                                    <input type="text" class="form-control" name="tel" id="tel" value="${userDefine.tel}">
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
                                    <textarea class="form-control" rows="5" name="instructions" id="instructions">${userDefine.instructions}</textarea>
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
                    <a href="${pageContext.request.contextPath}/center/" data-navigation-target="chats" href="#" data-toggle="tooltip" title="聊天列表" data-placement="right">
                        <span class="badge badge-warning"></span>
                        <i data-feather="message-circle"></i>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/center/friendList" class="active" data-navigation-target="friends" href="#" data-toggle="tooltip" title="好友列表" data-placement="right">

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

        <!-- sidebar group -->
        <div class="sidebar-group">
            <!-- Friends sidebar -->
            <div id="friends" class="sidebar active">
                <header>
                    <span>好友列表</span>
                    <ul class="list-inline">
                        <li class="list-inline-item" data-toggle="tooltip" title="添加好友">
                            <a class="btn btn-outline-light" href="#" data-toggle="modal" data-target="#addFriends">
                                <i data-feather="user-plus"></i>
                            </a>
                        </li>
                        <li class="list-inline-item" data-toggle="tooltip" title="好友排序" id="sort1">
                            <a class="btn btn-outline-light" href="#" data-toggle="modal" data-target="#sort" data-status="false">
                                <i class="fa fa-bars"></i>
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
            <!-- ./ Friends sidebar -->
        </div>
        <!-- ./ sidebar group -->

        <!--  data card -->
        <div class="dataCard" id="dataCard" style="display: none;">

            <div id="contact-information" class="sidebar">
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
                                    <a class="nav-link active" id="define-tab" data-toggle="tab" href="#define" role="tab" aria-controls="home" aria-selected="true">个人信息</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="impression-tab" data-toggle="tab" href="#impression" role="tab" aria-controls="profile" aria-selected="false">好友印象</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="define" role="tabpanel" aria-labelledby="define-tab">
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
                            <div class="tab-pane fade mt-4" id="impression" role="tabpanel" aria-labelledby="impression-tab">
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
                    <hr>
                    <div id="send_btn" class="btn-footer">
                        <div class="col-12" style="padding: 0 5%;position: absolute;top: 50%;transform: translateY(-50%);">
                            <a href="#" class="btn btn-primary text-center" style="width: 100%;">
                                <font style="text-align: center;width: 100%;line-height: 28px;font-size: 16px;font-weight: 600;">发&nbsp;消&nbsp;息</font>
                            </a>
                        </div>
                    </div>


                    <div id="add_impression_btn" class="btn-footer">
                        <div class="col-12" style="padding: 0 5%;position: absolute;top: 50%;transform: translateY(-50%);">
                            <a href="#" class="btn btn-primary text-center" style="width: 100%;">
                                <font style="text-align: center;width: 100%;line-height: 28px;font-size: 16px;font-weight: 600;">添 加 评 价</font>
                            </a>
                        </div>

                    </div>
                </div>

            </div>

        </div>
        <!-- ./ chat -->

    </div>
    <!-- ./ content -->

</div>
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
<!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
<script src="${pageContext.request.contextPath}/dist/js/jquery-ui.min.js"></script>
<!-- JQ UI -->
<script type="text/javascript">
    $("#MsgList").sortable();
    $("#MsgList").sortable("disable");
    $("[data-target='#sort']").click(function() {
        //            <i class="fa fa-bars"></i>
        var status = $(this).attr("data-status");
        if (status == 'false') {
            $(this).parent().attr("data-original-title", "确认提交修改").tooltip('show').focus();
            $(this).attr("data-status", '确认修改');
            $(this).html('<i class="fa fa-check"></i>');
            $("#MsgList").sortable("enable");

            //            $("#friendsList").disableSelection();
        } else {
            resetSort();
        }


    })


    //        $( "#friendsList" ).sortable("disable");
</script>


<script>
    $(function() {
        //初始化
        //niceScroll init
        $(".dataCard").niceScroll("", {
            cursorcolor: "rgba(66, 66, 66, 0.20)",
            cursorwidth: "4px",
            cursorborder: "0px"
        });
        $(".sidebar-body").niceScroll("", {
            cursorcolor: "rgba(66, 66, 66, 0.20)",
            cursorwidth: "4px",
            cursorborder: "0px"
        });
        setInterval('getNotRead("${pageContext.request.contextPath}")', 3000);
        getFriendList();
        $("#define-tab").click(function(e) {
            $("#add_impression_btn").hide();
            $("#send_btn").show();

        })
        $("#impression-tab").click(function(e) {
            $("#send_btn").hide();
            $("#add_impression_btn").show();
        })

    })
    //更改顺序
    function resetSort() {
        layer.confirm('确认要更改排序吗？', {
            btn: ['确认更改', '重新排序', '关闭'] //按钮
        }, function() {
            layer.close(layer.index);
            var Qty = $('#MsgList').children("li").length;
            $("#MsgList li").each(function() {
                var self = $(this);
                setSort(self.attr("data-id"), Qty--);
            });
            $("[data-target='#sort']").attr("data-status", 'false');
            $("[data-target='#sort']").html('<i class="fa fa-bars"></i>');
            $("#sort1").attr("data-original-title", "好友排序").tooltip('show').focus();
            $("#MsgList").sortable("disable");
            swal("修改排序成功!", {
                button: false,
                dangerMode: true,
                icon: "success",
                timer: 1500,
            })
        }, function() {
            layer.close(layer.index);
            layer.confirm('确认要重新排序吗？', {
                btn: ['确认', '取消'] //按钮
            }, function() {
                layer.close(layer.index);
                $("[data-target='#sort']").attr("data-status", 'false');
                $("[data-target='#sort']").html('<i class="fa fa-bars"></i>');
                $("#sort1").attr("data-original-title", "好友排序").tooltip('show').focus();
                $("#MsgList").sortable("disable");
                getFriendList();
            })
        })
    }
    //设置顺序
    function setSort(id, sort) {
        var formData = new FormData();
        formData.append("id", id);
        formData.append("sort", sort);
        $.ajax({
            url: "${pageContext.request.contextPath}/center/setSort",
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            success: function(res) {},
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                swal("修改排序失败请重试", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                });
            }

        })
    }
    //删除好友
    function delFriend(friendUserid) {
        //删除聊天记录
        layer.confirm('确认要删除好友嘛？', {
            btn: ['确认删除', '取消'] //按钮
        }, function() {
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
                        getFriendList();
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
        }, function() {

        });

    }
    //获取好友列表
    function getFriendList() {
        // 发送请求
        $.ajax({
            url: "${pageContext.request.contextPath}/center/getFriendList",
            type: 'post',
            data: {},
            processData: false,
            contentType: false,
            beforeSend() {
                //发送前操作
                loading = layer.load(2);
            },
            success: function(res) {
                layer.close(loading);
                $("#MsgList").html("");
                var flag = 0;
                if (res.code == 1) {
                    console.log(res);
                    $.each(res.data, function(index, obj) {
                        List.add(obj.friendUserid, obj.headPortrait, obj.name, obj.instructions, obj.id);
                    })


                } else {
                    layer.close(loading);

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
    //查看资料
    function openBox(friendUserid) {
        var formData = new FormData();
        formData.append("FriendUserid", friendUserid);
        $("#dataCard").hide();
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
                    friend_headPortrait = res.data.headPortrait;
                    friend_name = res.data.name;
                    //设置资料展示
                    //设置账户
                    $("#define_id").html("账号：" + res.data.userid);
                    //设置姓名

                    $("#define_name,#define_name1,#define_name2").html(friend_name);
                    //设置电话
                    $("#define_tel").html(res.data.tel);
                    //设置邮箱
                    $("#define_email").html(res.data.email);
                    //设置介绍
                    $("#define_description").html(res.data.instructions == null ? '主人还未设置个人介绍哦！' : res.data.instructions);
                    //设置年龄
                    $("#define_years_old").html(getAge(moment(res.data.birthday).format("YYYY-MM-DD")));
                    //设置生日
                    $("#define_birthday").html(moment(res.data.birthday).format("YYYY-MM-DD"));
                    //设置星座
                    $("#define_constellation").html(getAstro(moment(res.data.birthday).format("MM"), moment(res.data.birthday).format("DD")) + "座");
                    //设置头像
                    $("#headPortrait").attr("src", friend_headPortrait);
                    //设置为发送消息
                    $("#send_btn div a").attr("href", "${pageContext.request.contextPath}/center/?friendUserid=" + friendUserid)
                    //设置添加评论
                    $("#add_impression_btn div a").attr("onclick", "addImpression('" + friendUserid + "')")
                    getImpression(friendUserid);
                    $("#define-tab").trigger("click");
                    $("#dataCard").show();

                } else {
                    swal("获取资料失败请重新点击", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    })
                        .then(name => {
                        $("#dataCard").hide();
                });
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                layer.close(loading);
                swal("获取资料失败请重新点击", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                }).then(name => {
                    $("#dataCard").hide();
            });
            }

        })
    }
    //获取印象
    function getImpression(friendUserId) {
        var formData = new FormData();

        formData.append("FriendUserid", friendUserId);
        $.ajax({
            url: "${pageContext.request.contextPath}/center/getLoveList",
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
                    $("#impressionList").html("");
                    $.each(res.data, function(index, obj) {

                        if (obj.id % 3 == 0) {
                            Impression.orange.add(obj.msg, obj.isLove, obj.id, obj.lover, obj.loveNum, friendUserId);
                        } else if (obj.id % 3 == 1) {
                            Impression.purple.add(obj.msg, obj.isLove, obj.id, obj.lover, obj.loveNum, friendUserId);
                        } else if (obj.id % 3 == 2) {
                            Impression.red.add(obj.msg, obj.isLove, obj.id, obj.lover, obj.loveNum, friendUserId);
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
                layer.close(loading);
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
    //添加评论
    function addImpression(friendUserId) {
        layer.prompt({
            title: '添加印象',
            formType: 2
        }, function(msg, index) {
            layer.close(index);

            $.ajax({
                url: "${pageContext.request.contextPath}/center/addImpression",
                type: 'post',
                data: {
                    FriendUserid: friendUserId,
                    msg: msg
                },
                beforeSend() {
                    //发送前操作
                    loading = layer.load(2);
                },
                success: function(res) {
                    layer.close(loading);
                    console
                    var flag = 0;
                    if (res.code == 1) {

                        swal("添加成功!", {
                            button: false,
                            dangerMode: true,
                            icon: "success",
                            timer: 1500,
                        })
                        openBox(friendUserId);
                    } else {
                        swal(res.msg, {
                            button: false,
                            dangerMode: true,
                            icon: "warning",
                            timer: 2000,
                        })
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    layer.close(loading);
                    swal("连接错误请刷新页面", {
                        button: false,
                        dangerMode: true,
                        icon: "warning",
                        timer: 2000,
                    })
                }

            })
        });
    }
    //点赞
    function setLove(impressionId, friendUseiid) {

        layer.confirm('您确定要点赞吗？', {
            btn: ['确认', '取消'] //按钮
        }, function() {
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
        }, function() {

        });
    }

    var List = {
        add: function(friendUserid, headPortrait, name, instructions, id) {
            instructions = instructions == null ? '' : instructions;
            $('#MsgList').append(`<li class="list-group-item" data-id=` + id + `>
                            <div onclick="openBox(` + friendUserid + `,1)">
                                <figure class="avatar">
                                    <img src="` + headPortrait + `" class="rounded-circle" alt="image">
                                </figure>
                            </div>
                            <div class="users-list-body">
                                <div onclick="openBox(` + friendUserid + `,1)">
                                    <h5>` + name + `</h5>
                                    <p>` + instructions + `</p>
                                </div>
                                <div class="users-list-action">
                                    <div class="action-toggle">
                                        <div class="dropdown">
                                            <a data-toggle="dropdown" href="#">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal" data-brackets-id="1369"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a href="` + "${pageContext.request.contextPath}" + `/center/?friendUserid=` + friendUserid + `" class="dropdown-item" >发送信息</a>
                                                <div class="dropdown-divider"></div>
                                                <a href="javascript:void(0)" class="dropdown-item text-danger" onclick="delFriend(` + friendUserid + `)">删除好友</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>`);

        }
    }
    //设置图标闪烁
    function setBuling() {
        $(".badge.badge-warning").show();
        if (!$('[data-navigation-target="chats"]').hasClass("bulingbuling")) {
            $('[data-navigation-target="chats"]').addClass("bulingbuling");
        }
    }
</script>
</body></html>
