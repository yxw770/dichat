package com.itany.dichat.pojo;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 15:56
 * File Name:
 */
public class UserFriend implements Serializable {
    private Integer id;


    private Integer userid;
    private Integer friendUserid;
    private Integer sort;
    private Integer is_black;
    private long create_at;
    private long update_at;
    private Integer is_top;

    private Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getFriendUserid() {
        return friendUserid;
    }

    public void setFriendUserid(Integer friendUserid) {
        this.friendUserid = friendUserid;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getIs_black() {
        return is_black;
    }

    public void setIs_black(Integer is_black) {
        this.is_black = is_black;
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

    public Integer getIs_top() {
        return is_top;
    }

    public void setIs_top(Integer is_top) {
        this.is_top = is_top;
    }

}
