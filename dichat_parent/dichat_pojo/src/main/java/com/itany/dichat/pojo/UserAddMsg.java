package com.itany.dichat.pojo;/**
 * @author:GodFrey
 * @date:2019/12/4/004.
 */

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4/004
 * Time: 19:35
 * File Name: 
 */
public class UserAddMsg implements Serializable {
    private Integer id;
    private Integer byUserid;
    private Integer toUserid;
    private String msg;
    private Integer status;
    private String disagreeMsg;
    private Long create_at;
    private Long update_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getByUserid() {
        return byUserid;
    }

    public void setByUserid(Integer byUserid) {
        this.byUserid = byUserid;
    }

    public Integer getToUserid() {
        return toUserid;
    }

    public void setToUserid(Integer toUserid) {
        this.toUserid = toUserid;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDisagreeMsg() {
        return disagreeMsg;
    }

    public void setDisagreeMsg(String disagreeMsg) {
        this.disagreeMsg = disagreeMsg;
    }

    public Long getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Long create_at) {
        this.create_at = create_at;
    }

    public Long getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(Long update_at) {
        this.update_at = update_at;
    }
}
