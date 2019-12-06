function formCheck(url) {
    $("#ajaxform").bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: '用户名验证失败',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 18,
                        message: '用户名长度必须在6到18位之间'
                    },
                    regexp: {
                        regexp: /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$/,
                        message: '用户名至少6位，要求必须字母、数字加英文符号（不包含空格)'
                    },
                    remote: {
                        url: "${pageContext.request.contextPath}/user/checkUsername"
                    }
                }
            },
            file: {
                validators: {
                    notEmpty: {
                        message: '头像不能为空'
                    },
                    file: {
                        extension: 'png,jpg,jpeg,bmp',
                        type: 'image/png,image/jpg,image/jpeg,image/bmp',
                        message: '图片格式错误仅支持png,jpg,jpeg,bmp'
                    }
                }
            },
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
            },
            password: {
                message: '密码验证失败',
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: '密码与确认密码不一致'
                    }
                }
            },

        },
    })
}