package com.itany.dichat.common.util;/**
 * @author:GodFrey
 * @date:2019/12/1/001.
 */

import com.itany.dichat.common.constant.ResposeStatusConstant;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/1/001
 * Time: 19:59
 * File Name:
 * 返回json数据类
 */
public class ResponseResult {

    //状态码
    private int code;

    //消息
    private String msg;

    //数据
    private Object data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public ResponseResult() {
    }

    public ResponseResult(int status, String msg, Object data) {
        this.code = status;
        this.msg = msg;
        this.data = data;
    }

    //成功数据回调
    public static ResponseResult success(Object data) {
        return new ResponseResult(ResposeStatusConstant.RESPONSE_STATUS_SUCCESS, "ok", data);

    }
    //成功返回信息
    public static ResponseResult success(String msg) {
        return new ResponseResult(ResposeStatusConstant.RESPONSE_STATUS_SUCCESS, msg, null);

    }
    public static ResponseResult success() {
        return new ResponseResult(ResposeStatusConstant.RESPONSE_STATUS_SUCCESS, "ok", null);

    }

    //失败
    public static ResponseResult fail() {
        return new ResponseResult(ResposeStatusConstant.RESPONSE_STATUS_FAIL, "fail", null);

    }
    public static ResponseResult fail(String msg) {
        return new ResponseResult(ResposeStatusConstant.RESPONSE_STATUS_FAIL, msg, null);

    }

}
