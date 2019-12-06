<%--
  Created by IntelliJ IDEA.
  User: Godfrey
  Date: 2019/11/30
  Time: 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <a href="${pageContext.request.contextPath}/center/myImpression" class="active" data-navigation-target="favorites" data-toggle="tooltip" title="我的印象" data-placement="right" href="#">
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
                        <a id="editProfileModal" href="#" class="dropdown-item" data-toggle="modal" data-target="#editProfileModal">编辑个人信息</a>
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
        <div class="sidebar-group col-12">
            <!-- Friends sidebar -->
            <div id="friends" class="sidebar active col-12">
                <header>
                    <span>我的资料</span>
                </header>
                <!--  data card -->
                <div class="dataCard" style="border: 0;">
                    <div class="col-12">
                        <div id="contact-information" class="">
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
                                    <hr>
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
                            </div>
                        </div>

                    </div>
                </div>
                <!-- ./ chat -->
            </div>
            <!-- ./ Friends sidebar -->

        </div>
        <!-- ./ sidebar group -->

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
<script type="text/javascript">
    $(function() {
        $(".dataCard").niceScroll("", {
            cursorcolor: "rgba(66, 66, 66, 0.20)",
            cursorwidth: "4px",
            cursorborder: "0px"
        });
        setInterval('getNotRead("${pageContext.request.contextPath}")', 3000);
        getMyDefine()

    });
    //查看资料
    function getMyDefine() {
        //设置账户
        $("#define_id").html("账号：${userDefine.userid}");
        //设置姓名
        $("#define_name,#define_name1,#define_name2").html("${userDefine.name}");
        //设置电话
        $("#define_tel").html("${userDefine.tel}");
        //设置邮箱
        $("#define_email").html("${userDefine.email}");
        //设置介绍
        $("#define_description").html("${userDefine.instructions}" == null ? '主人还未设置个人介绍哦！' : "${userDefine.instructions}");
        //设置年龄
        $("#define_years_old").html(getAge(moment(parseInt("${userDefine.birthday}")).format("YYYY-MM-DD")));
        //设置生日
        $("#define_birthday").html(moment(parseInt("${userDefine.birthday}")).format("YYYY-MM-DD"));
        //设置星座
        $("#define_constellation").html(getAstro(moment(parseInt("${userDefine.birthday}")).format("MM"), moment(parseInt("${userDefine.birthday}")).format("DD")) + "座");
        //设置头像
        $("#headPortrait").attr("src", "${userDefine.headPortrait}");
        getImpression(parseInt("${userDefine.userid}"));
        $("#define-tab").trigger("click");
        $("#dataCard").show();
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
