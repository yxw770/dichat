<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/5/005
  Time: 17:32
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
                    <a href="${pageContext.request.contextPath}/center/addMsgList" class="active" data-navigation-target="archived" href="#" data-toggle="tooltip" title="验证消息" data-placement="right">
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
                    <span>通知列表</span>
                    <ul class="list-inline">
                        <li class="list-inline-item" data-toggle="tooltip" title="添加好友">
                            <a class="btn btn-outline-light" href="#" data-toggle="modal" data-target="#addFriends">
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
                <div class="sidebar-body">
                    <ul class="list-group list-group-flush" id="MsgList">

                    </ul>
                </div>
            </div>
            <!-- ./ Friends sidebar -->
        </div>
        <!-- ./ sidebar group -->

        <!--  data card -->
        <div class="dataCard" id="dataCard" style="display: none;" id="dataCard">

            <div id="contact-information" class="sidebar">
                <div class="sidebar-body">
                    <div class="pl-4 pr-4">
                        <div class="text-center">
                            <figure class="avatar avatar-xl mb-4">
                                <img id="headPortrait" class="rounded-circle" alt="image">
                            </figure>
                            <h5 class="mb-1" id="define_name"></h5>
                            <small class="text-muted font-italic" id="define_id"></small>
                        </div>
                        <hr>
                        <div class="ml-5 ">
                            <h5 class="mb-1">验证信息：<small class="text-muted" id="msg"></small></h5>


                        </div>
                        <hr>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="define" role="tabpanel" aria-labelledby="define-tab">
                                <div class="mt-4 mb-4 ml-5">
                                    <div class="info">
                                        <div class="left-text">姓名</div>
                                        <div class="text-muted" id="define_name1"></div>
                                    </div>
                                </div>
                                <div class="mt-4 mb-4 ml-5">
                                    <div class="info">
                                        <div class="left-text">联系电话</div>
                                        <div class="text-muted" id="define_tel"></div>
                                    </div>

                                </div>
                                <div class="mt-4 mb-4 ml-5">
                                    <div class="info">
                                        <div class="left-text">联系邮箱</div>
                                        <div class="text-muted" id="define_email"></div>
                                    </div>
                                </div>
                                <div class="mt-4 mb-4 ml-5">
                                    <div class="info">
                                        <div class="left-text">年龄</div>
                                        <div class="text-muted" id="define_years_old"></div>
                                    </div>
                                </div>
                                <div class="mt-4 mb-4 ml-5">
                                    <div class="info">
                                        <div class="left-text">生日</div>
                                        <div class="text-muted" id="define_birthday"></div>
                                    </div>
                                </div>
                                <div class="mt-4 mb-4 ml-5">
                                    <div class="info">
                                        <div class="left-text">星座</div>
                                        <div class="text-muted" id="define_constellation"></div>
                                    </div>
                                </div>
                                <h6 class=" ml-5">个人简介</h6>
                                <p class="text-muted  ml-5" id="define_description"></p>


                            </div>
                        </div>
                    </div>

                    <div id="status_0" class="btn-footer">
                        <div class="col-12" style="padding: 0 5%;position: absolute;top: 50%;transform: translateY(-50%);display: flex;">
                            <a href="javascript:void(0)" id="btn_agree" class="btn btn-success text-center" style="width: 45%;margin-right: 10%;">
                                <font style="text-align: center;width: 100%;line-height: 28px;font-size: 16px;font-weight: 600;">同意</font>
                            </a>
                            <a href="javascript:void(0)" id="btn_disagree" class="btn btn-danger text-center" style="width: 45%;">
                                <font style="text-align: center;width: 100%;line-height: 28px;font-size: 16px;font-weight: 600;">拒绝</font>
                            </a>
                        </div>

                    </div>
                    <div id="status_1" class="btn-footer">
                        <div class="col-12" style="padding: 0 5%;position: absolute;top: 50%;transform: translateY(-50%);display: flex;">
                            <a href="javascript:void(0)" class="btn btn-success text-center disabled" style="width: 100%;">
                                <font style="text-align: center;width: 100%;line-height: 28px;font-size: 16px;font-weight: 600;">已同意</font>
                            </a>
                        </div>

                    </div>
                    <div id="status_2" class="btn-footer">
                        <div class="col-12" style="padding: 0 5%;position: absolute;top: 50%;transform: translateY(-50%);display: flex;">
                            <a href="javascript:void(0)" class="btn btn-danger text-center disabled" style="width: 100%;">
                                <font style="text-align: center;width: 100%;line-height: 28px;font-size: 16px;font-weight: 600;">已拒绝</font>
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

<!--  niceScroll init  -->
<script type="text/javascript">
    $(function() {
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
        getAddMsgList();
        setInterval('getNotRead("${pageContext.request.contextPath}")', 3000);
    });
    //获取验证信息列表
    function getAddMsgList() {
        // 发送请求
        $.ajax({
            url: "${pageContext.request.contextPath}/center/getAddMsg",
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
                        List.add(obj.byUserid, obj.headPortrait, obj.name, obj.create_at, obj.id, obj.status, obj.msg);
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
    function openBox(friendUserid, status, msg, id) {
        var formData = new FormData();
        formData.append("FriendUserid", friendUserid);
        $("#dataCard").hide();
        $("#status_0").hide();
        $("#status_1").hide();
        $("#status_2").hide();

        var friend_headPortrait = "";
        var friend_name = "";
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
                    //验证消息
                    $("#msg").html(msg);
                    if (status == 0) {
                        //设置同意
                        $("#btn_agree").attr("onclick", "agree('" + id + "')")
                        //设置拒绝
                        $("#btn_disagree").attr("onclick", "disagree('" + id + "')")
                    }
                    $("#status_" + status).show();
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
    //同意好友申请
    function agree(id) {
        //删除聊天记录
        layer.confirm('确认要同意申请嘛？', {
            btn: ['确认', '取消'] //按钮
        }, function() {
            var formData = new FormData();
            formData.append("id", id);
            $.ajax({
                url: "${pageContext.request.contextPath}/center/agreeAddMsg",
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
                        $("#dataCard").hide();
                        getAddMsgList();
                        swal("已添加为好友!", {
                            button: false,
                            dangerMode: true,
                            icon: "success",
                            timer: 1500,
                        })
                    } else {
                        swal(res.msg, {
                            button: false,
                            dangerMode: true,
                            icon: "warning",
                            timer: 2000,
                        });
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    layer.close(loading);
                    swal("连接异常，请刷新网站", {
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

    //拒绝好友申请
    function disagree(id) {
        //删除聊天记录
        layer.prompt({
            title: '拒绝理由',
            formType: 2
        }, function(msg, index) {
            layer.close(index);
            var formData = new FormData();
            formData.append("id", id);
            formData.append("disagreeMsg", msg);
            $.ajax({
                url: "${pageContext.request.contextPath}/center/disagreeAddMsg",
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
                        $("#dataCard").hide();
                        getAddMsgList();
                        swal("拒绝成功!", {
                            button: false,
                            dangerMode: true,
                            icon: "success",
                            timer: 1500,
                        })
                    } else {
                        swal(res.msg, {
                            button: false,
                            dangerMode: true,
                            icon: "warning",
                            timer: 2000,
                        });
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    layer.close(loading);
                    swal("连接异常，请刷新网站", {
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


    var List = {
        add: function(friendUserid, headPortrait, name, create_at, id, status, msg) {

            $('#MsgList').append(`<li class="list-group-item" onclick="openBox(` + friendUserid + `,` + status + `,'` + (msg == '' ? "对方未写验证消息" : msg) + `',` + id + `)">
                                <figure class="avatar ">
                                    <img src="` + headPortrait + `" class="rounded-circle" alt="image">
                                </figure>
                                <div class="users-list-body">
                                    <div>
                                        <h5 class="` + (status == 0 ? 'text-primary' : 'text-muted') + `">` + name + `</h5>
                                        <p>好友申请</p>
                                    </div>
                                    <div class="users-list-action text-center">
                                        <p><small class="` + (status == 0 ? 'text-primary' : 'text-muted') + `">` + moment(create_at).format("YYYY-MM-DD") + `</small></p>
                                        <p><small class="` + (status == 0 ? 'text-primary' : 'text-muted') + `">` + moment(create_at).format("HH:MM:SS") + `</small></p>
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

</body>

</html>
