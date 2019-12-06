package com.itany.dichat.pojo;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4
 * Time: 14:53
 * To change this template use File | Settings | File Templates.
 */
public class UserLoveLog implements Serializable {
    private Integer id;
    private Integer impressionid;
    private Integer Userid;
    private Long create_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getImpressionid() {
        return impressionid;
    }

    public void setImpressionid(Integer impressionid) {
        this.impressionid = impressionid;
    }

    public Integer getUserid() {
        return Userid;
    }

    public void setUserid(Integer userid) {
        Userid = userid;
    }

    public Long getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Long create_at) {
        this.create_at = create_at;
    }
}
