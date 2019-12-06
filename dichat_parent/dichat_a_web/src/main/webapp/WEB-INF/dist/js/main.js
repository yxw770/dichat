var SohoExamle = {
    Message: {
        add: function (message, type, friend_headPortrait, friend_name, time, isSend) {
            var chat_body = $('.layout .content .chat .chat-body');
            if (chat_body.length > 0) {

                type = type ? type : '';
                message = message ? message : '[未知信息]';

                $('.layout .content .chat .chat-body .messages').append(`<div class="message-item ` + type + `" style="position: relative;overflow: hidden;">
                        <div class="message-avatar">
                            <figure class="avatar">
                                <img src="` + friend_headPortrait + `" class="rounded-circle">
                            </figure>
                            <div>
                                <h5>` + friend_name + `</h5>
                                <div class="time">` + time + `</div>
                            </div>
                        </div>
                        <div class="message-content">
                            ` + message + `
                        </div>` +
                    (type == 'outgoing-message' ? (isSend == 1 ? '<i class="ti-double-check text-info" style="position:  absolute;right:  0;margin-right: 4px;margin-top: -18px;color: #00ffb4 !important;"></i>' : '<i class="ti-check " style="position:  absolute;right:  0;margin-right: 14px;margin-top: -18px;color: #00ffb4 !important;"></i><i class="ti-check text-light" style="position:  absolute;right:  0;margin-right: 4px;margin-top: -18px;"></i>') : '') +
                    `</div>`);

                setTimeout(function () {
                    chat_body.scrollTop(chat_body.get(0).scrollHeight, -1).niceScroll({
                        cursorcolor: 'rgba(66, 66, 66, 0.20)',
                        cursorwidth: "4px",
                        cursorborder: '0px'
                    }).resize();
                }, 200);
            }
        }
    },
    Image: {
        add: function (message, type, friend_headPortrait, friend_name, time, isSend, id) {
            var chat_body = $('.layout .content .chat .chat-body');
            if (chat_body.length > 0) {

                type = type ? type : '';
                message = message ? message : '[未知信息]';

                $('.layout .content .chat .chat-body .messages').append(`<div class="message-item ` + type + `" style="position: relative;overflow: hidden;">
                        <div class="message-avatar">
                            <figure class="avatar">
                                <img src="` + friend_headPortrait + `" class="rounded-circle">
                            </figure>
                            <div>
                                <h5>` + friend_name + `</h5>
                                <div class="time">` + time + `</div>
                            </div>
                        </div>
                        <figure>\
                            <img style="cursor: pointer;" src="` + message + `" class="w-25 img-fluid rounded viewer" alt="查看原图">\
                        </figure>` +
                    (type == 'outgoing-message' ? (isSend == 1 ? '<i class="ti-double-check text-info" style="position:  absolute;right:  0;margin-right: 4px;margin-top: -18px;color: #00ffb4 !important;"></i>' : '<i class="ti-check " style="position:  absolute;right:  0;margin-right: 14px;margin-top: -18px;color: #00ffb4 !important;"></i><i class="ti-check text-light" style="position:  absolute;right:  0;margin-right: 4px;margin-top: -18px;"></i>') : '') +
                    `</div>`);
                $('.viewer').bootstrapViewer(); //The default image source file path is the src attribute of the img tag.

                setTimeout(function () {
                    chat_body.scrollTop(chat_body.get(0).scrollHeight, -1).niceScroll({
                        cursorcolor: 'rgba(66, 66, 66, 0.20)',
                        cursorwidth: "4px",
                        cursorborder: '0px'
                    }).resize();
                }, 200);
            }
        }
    }
};
var Impression = {
    orange: {
        add: function (message, isLove, id, lover, loveNum, friendUserid) {
            $('#impressionList').append(`<li class="list-group-item pl-0 pr-0 align-items-center di-flex1 orange">
                                            <div class="di-flex ">
                                                <div class="left orange">
                                                    ` + message + `
                                                </div>
                                                <div class="right">
                                                    <i data-id="` + id + `" class="fa ` + (isLove == 1 ? 'fa-heart' : 'fa-heart-o') + `" ` + (isLove == 1 ? 'onclick=\'swal("您已经点过赞了哦", {button: false,dangerMode: true,icon: "warning",timer: 2000});return false;\'' : 'onclick="setLove(\'' + id + '\',' + friendUserid + ');return false;"') + `aria-hidden="true"></i>
                                                </div>
                                            </div>

                                            <div class="description"><i class="fa fa-gratipay" aria-hidden="true">&nbsp; </i>
                                                <div class="love-left">` + lover + `</div>
                                                <div class="love-right">共` + loveNum + `个喜欢</div>
                                            </div>
                                        </li>`);
        }
    },
    purple: {
        add: function (message, isLove, id, lover, loveNum, friendUserid) {
            $('#impressionList').append(`<li class="list-group-item pl-0 pr-0 align-items-center di-flex1 purple">
                                            <div class="di-flex ">
                                                <div class="left purple">
                                                    ` + message + `
                                                </div>
                                                <div class="right">
                                                    <i data-id="` + id + `" class="fa ` + (isLove == 1 ? 'fa-heart' : 'fa-heart-o') + `" ` + (isLove == 1 ? 'onclick=\'swal("您已经点过赞了哦", {button: false,dangerMode: true,icon: "warning",timer: 2000});return false;\'' : 'onclick="setLove(\'' + id + '\',' + friendUserid + ');return false;"') + `aria-hidden="true"></i>
                                                </div>
                                            </div>

                                            <div class="description"><i class="fa fa-gratipay" aria-hidden="true">&nbsp; </i>
                                                <div class="love-left">` + lover + `</div>
                                                <div class="love-right">共` + loveNum + `个喜欢</div>
                                            </div>
                                        </li>`);
        }
    },
    red: {
        add: function (message, isLove, id, lover, loveNum, friendUserid) {
            $('#impressionList').append(`<li class="list-group-item pl-0 pr-0 align-items-center di-flex1 red">
                                            <div class="di-flex ">
                                                <div class="left red">
                                                    ` + message + `
                                                </div>
                                                <div class="right">
                                                    <i data-id="` + id + `" class="fa ` + (isLove == 1 ? 'fa-heart' : 'fa-heart-o') + `" ` + (isLove == 1 ? 'onclick=\'swal("您已经点过赞了哦", {button: false,dangerMode: true,icon: "warning",timer: 2000});return false;\'' : 'onclick="setLove(\'' + id + '\',' + friendUserid + ');return false;"') + `aria-hidden="true"></i>
                                                </div>
                                            </div>

                                            <div class="description"><i class="fa fa-gratipay" aria-hidden="true">&nbsp; </i>
                                                <div class="love-left">` + lover + `</div>
                                                <div class="love-right">共` + loveNum + `个喜欢</div>
                                            </div>
                                        </li>`);
        }
    }

};
/*根据出生日期算出年龄*/
function getAge(strBirthday) {
    var returnAge;
    var strBirthdayArr = strBirthday.split("-");
    var birthYear = strBirthdayArr[0];
    var birthMonth = strBirthdayArr[1];
    var birthDay = strBirthdayArr[2];

    d = new Date();
    var nowYear = d.getFullYear();
    var nowMonth = d.getMonth() + 1;
    var nowDay = d.getDate();

    if (nowYear == birthYear) {
        returnAge = 0; //同年 则为0岁
    } else {
        var ageDiff = nowYear - birthYear; //年之差
        if (ageDiff > 0) {
            if (nowMonth == birthMonth) {
                var dayDiff = nowDay - birthDay; //日之差
                if (dayDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff;
                }
            } else {
                var monthDiff = nowMonth - birthMonth; //月之差
                if (monthDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff;
                }
            }
        } else {
            returnAge = -1; //返回-1 表示出生日期输入错误 晚于今天
        }
    }

    return returnAge + " 岁"; //返回周岁年龄

}
/*获取星座*/
function getAstro(m, d) {
    return "魔羯水瓶双鱼牡羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯".substr(m * 2 - (d < "102223444433".charAt(m - 1) - -19) * 2, 2);
}
/*添加好友*/
function addFriend(url) {
    var formData = $('#addFriendAjax').serializeArray();

    $.ajax({
        type: 'post',
        url: url + '/center/addFriend',
        dataType: 'json',
        data: formData,
        beforeSend() {
            //发送前操作
            loading = layer.load(2);
        },
        success: function (res) {
            layer.close(loading);
            if (res.code == 1) {
                swal("发送验证消息成功", {
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
        error: function (XMLHttpRequest, textStatus, errorThrown) {
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
/*修改个人信息*/
function saveEdit(url) {
    $('#editAjaxForm').data('bootstrapValidator').validate();
    if (!$('#editAjaxForm').data('bootstrapValidator').isValid()) {
        return;
    } else {
        var formData = $('#editAjaxForm').serializeArray();


        var timestamp = new Date(formData[3]['value']).getTime();
        formData[3]['value'] = timestamp;
        console.log(formData);
        $.ajax({
            type: 'post',
            url: url + '/center/editInfo',
            dataType: 'json',
            data: formData,
            beforeSend() {
                //发送前操作
                loading = layer.load(2);
            },
            success: function (res) {
                layer.close(loading);
                if (res.code == 1) {
                    swal("修改成功", {
                        button: false,
                        dangerMode: true,
                        icon: "success",
                        timer: 1500,
                    }).then(name => {
                        window.location.reload();
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
            error: function (XMLHttpRequest, textStatus, errorThrown) {
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
}

function getNotRead(url) {
    $.post(
        url + "/center/ajaxGetMsg", {},
        function (res) {
            console.log(res);
            if (res.code == 1) {
                $('#notify')[0].play(); //播放声音
                var audio = document.createElement("audio");
                var index = 0;
                audio.src = url + "/dist/mp3/notify1.mp3";
                audio.addEventListener('ended', function () {}, false);
                audio.play();
                try {
                    getMsgList(1);
                } catch (e) {
                    setBuling();
                }
                toastr.info('您有一条新的消息');
            }

        }
        // , "json"
    );
}

/*获取get参数*/
function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }
    return (false);
}

function changeURLPar(destiny, par, par_value) {
    var pattern = par + '=([^&]*)';
    var replaceText = par + '=' + par_value;
    if (destiny.match(pattern)) {
        var tmp = '/\\' + par + '=[^&]*/';
        tmp = destiny.replace(eval(tmp), replaceText);
        return (tmp);
    } else {
        if (destiny.match('[\?]')) {
            return destiny + '&' + replaceText;
        } else {
            return destiny + '?' + replaceText;
        }
    }
    return destiny + '\n' + par + '\n' + par_value;
}
$(function () {
    $(".badge.badge-warning").hide();
    $(".badge.badge-light").hide();
    $(".badge.badge-danger").hide();
    //个人信息表单校验
    $("#editAjaxForm").bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                message: '姓名验证失败',
                validators: {
                    notEmpty: {
                        message: '姓名不能为空'
                    },
                    stringLength: {
                        max: 30,
                        message: '姓名长度不能超过30位'
                    }
                }
            },
            birthday: {
                message: '出生日期验证失败',
                validators: {
                    notEmpty: {
                        message: '出生日期不能为空'
                    },
                    date: {
                        format: 'YYYY/MM/DD',
                        message: '出生日期无效'
                    }
                }
            },
            tel: {
                message: '手机号验证失败',
                validators: {
                    notEmpty: {
                        message: '手机号不能为空'
                    },
                    regexp: {
                        regexp: /^1\d{10}$/,
                        message: '手机号格式错误'
                    }
                }
            },
            email: {
                message: '邮箱验证失败',
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '邮箱格式错误'
                    }
                }
            }
        },
    })

})
