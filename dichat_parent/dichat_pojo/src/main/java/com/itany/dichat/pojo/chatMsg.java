package com.itany.dichat.pojo;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/11/30
 * Time: 3:02
 * To change this template use File | Settings | File Templates.
 */
public class chatMsg implements Serializable {
    private Integer id;

    private Integer sendUserid;
    private Integer toUserid;
    private long create_at;
    private long update_at;
    private String msg;
    private Integer type;
    private Integer isSend;
    private Integer send_is_trush;
    private Integer to_is_trush;

    public Integer getSend_is_trush() {
        return send_is_trush;
    }

    public void setSend_is_trush(Integer send_is_trush) {
        this.send_is_trush = send_is_trush;
    }

    public Integer getTo_is_trush() {
        return to_is_trush;
    }

    public void setTo_is_trush(Integer to_is_trush) {
        this.to_is_trush = to_is_trush;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSendUserid() {
        return sendUserid;
    }

    public void setSendUserid(Integer sendUserid) {
        this.sendUserid = sendUserid;
    }

    public Integer getToUserid() {
        return toUserid;
    }

    public void setToUserid(Integer toUserid) {
        this.toUserid = toUserid;
    }

    public long getCreate_at() {
        return create_at;
    }

    public void setCreate_at(long create_at) {
        this.create_at = create_at;
    }

    public long getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(long update_at) {
        this.update_at = update_at;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getIsSend() {
        return isSend;
    }

    public void setIsSend(Integer isSend) {
        this.isSend = isSend;
    }
}
