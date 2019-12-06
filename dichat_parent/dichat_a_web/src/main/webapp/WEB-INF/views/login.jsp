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
    <title>滴信-用户登录</title>
    <meta name="renderer" content="webkit"/>

    <!-- 强制Chromium内核，作用于其他双核浏览器 -->
    <meta name="force-rendering" content="webkit"/>

    <!-- 如果有安装 Google Chrome Frame 插件则强制为Chromium内核，否则强制本机支持的最高版本IE内核，作用于IE浏览器 -->
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"/>

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/dist/media/img/favicon.png" type="image/png">

    <!-- Bundle Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bundle.css">

    <!-- App styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/app.min.css">
</head>
<body class="form-membership">

<div class="form-wrapper">

    <!-- logo -->
    <div class="logo">
        <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
             xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
             width="612px" height="612px" viewBox="0 0 612 612"
             style="enable-background:new 0 0 612 612;" xml:space="preserve">
            <g>
                <g id="_x32__26_">
                    <g>
                        <path d="M401.625,325.125h-191.25c-10.557,0-19.125,8.568-19.125,19.125s8.568,19.125,19.125,19.125h191.25
                    c10.557,0,19.125-8.568,19.125-19.125S412.182,325.125,401.625,325.125z M439.875,210.375h-267.75
                    c-10.557,0-19.125,8.568-19.125,19.125s8.568,19.125,19.125,19.125h267.75c10.557,0,19.125-8.568,19.125-19.125
                    S450.432,210.375,439.875,210.375z M306,0C137.012,0,0,119.875,0,267.75c0,84.514,44.848,159.751,114.75,208.826V612
                    l134.047-81.339c18.552,3.061,37.638,4.839,57.203,4.839c169.008,0,306-119.875,306-267.75C612,119.875,475.008,0,306,0z
                    M306,497.25c-22.338,0-43.911-2.601-64.643-7.019l-90.041,54.123l1.205-88.701C83.5,414.133,38.25,345.513,38.25,267.75
                    c0-126.741,119.875-229.5,267.75-229.5c147.875,0,267.75,102.759,267.75,229.5S453.875,497.25,306,497.25z"/>
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
    </div>
    <!-- ./ logo -->

    <h5>滴信-用户登录</h5>

    <!-- form -->
    <form action="${pageContext.request.contextPath}/user/login" method="post" id="ajaxform">
        <div class="form-group">
            <input name="username" type="text" class="form-control" placeholder="用户名或账号"  >
        </div>

        <div class="form-group">
            <input name="password" type="password" class="form-control" placeholder="密码" >
        </div>

        <button class="btn btn-primary btn-block" type="button" onclick="userLogin();return false;">登&nbsp;&nbsp;&nbsp;&nbsp;入</button>
        <hr>

        <p class="text-muted"> <a href="./register" >没有账号?点击注册!</a></p>

    </form>
    <!-- ./ form -->

</div>

<!-- Bundle -->
<script src="${pageContext.request.contextPath}/vendor/bundle.js"></script>

<!-- App scripts -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<!-- Layer scripts -->
<script src="${pageContext.request.contextPath}/dist/layer/layer.js"></script>
<!-- sweetalert scripts -->
<script src="${pageContext.request.contextPath}/dist/sweetalert/sweetalert.min.js"></script>
<script type="application/javascript">
    function userLogin() {
        //用户登录

        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/user/login',
            dataType: 'json',
            data: $('#ajaxform').serialize(),
            beforeSend() {
                //发送前操作
                loading = layer.load(2);
            },

            success: function(res) {
                layer.close(loading);
                if (res.code == 1) {
                    swal("登录成功！三秒后跳转！", {
                        button: false,
                        dangerMode: true,
                        icon: "success",
                        timer: 1500,
                    }).then(name => {
                        window.location.href = "${pageContext.request.contextPath}/center/";
                        });

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
                swal("连接错误", {
                    button: false,
                    dangerMode: true,
                    icon: "warning",
                    timer: 2000,
                });
            }

        })
    }
</script>
</body>
</html>