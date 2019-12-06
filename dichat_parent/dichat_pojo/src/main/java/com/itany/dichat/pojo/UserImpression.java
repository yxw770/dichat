package com.itany.dichat.pojo;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4
 * Time: 14:52
 * To change this template use File | Settings | File Templates.
 */
public class UserImpression implements Serializable {
    private Integer id;
    private Integer fromUserid;
    private Integer toUSerid;
    private String msg;
    private Long create_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFromUserid() {
        return fromUserid;
    }

    public void setFromUserid(Integer fromUserid) {
        this.fromUserid = fromUserid;
    }

    public Integer getToUSerid() {
        return toUSerid;
    }

    public void setToUSerid(Integer toUSerid) {
        this.toUSerid = toUSerid;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Long getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Long create_at) {
        this.create_at = create_at;
    }
}
