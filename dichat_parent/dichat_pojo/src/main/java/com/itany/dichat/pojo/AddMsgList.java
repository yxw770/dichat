package com.itany.dichat.pojo;/**
 * @author:GodFrey
 * @date:2019/12/6/006.
 */

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/6/006
 * Time: 9:29
 * File Name: 
 */
public class AddMsgList implements Serializable {
    private Integer id;
    private Integer byUserid;
    private String headPortrait;
    private String name;
    private Long create_at;
    private Integer status;
    private String msg;

    public AddMsgList() {
    }

    public AddMsgList(Integer id, Integer byUserid, String headPortrait, String name, Long create_at, Integer status, String msg) {
        this.id = id;
        this.byUserid = byUserid;
        this.headPortrait = headPortrait;
        this.name = name;
        this.create_at = create_at;
        this.status = status;
        this.msg = msg;
    }

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

    public String getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Long create_at) {
        this.create_at = create_at;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
