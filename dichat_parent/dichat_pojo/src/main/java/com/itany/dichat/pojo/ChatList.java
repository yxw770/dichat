package com.itany.dichat.pojo;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 16:22
 * File Name:
 */
public class ChatList implements Serializable {
    //好友账号
    private Integer friendUserid;
    //头像
    private String headPortrait;
    //真实姓名
    private String Name;
    //信息展示
    private String msg;
    //时间
    private long create_at;


    //是否置顶
    private Integer is_top;


    //未读数量
    private int notRead;

    public Integer getIs_top() {
        return is_top;
    }

    public void setIs_top(Integer is_top) {
        this.is_top = is_top;
    }

    public ChatList(Integer friendUserid, String headPortrait, String name, String msg, long create_at, int notRead) {
        this.friendUserid = friendUserid;
        this.headPortrait = headPortrait;
        Name = name;
        this.msg = msg;
        this.create_at = create_at;
        this.notRead = notRead;
    }

    public ChatList() {
    }

    public Integer getFriendUserid() {
        return friendUserid;
    }

    public void setFriendUserid(Integer friendUserid) {
        this.friendUserid = friendUserid;
    }

    public String getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public long getCreate_at() {
        return create_at;
    }

    public void setCreate_at(long create_at) {
        this.create_at = create_at;
    }

    public int getNotRead() {
        return notRead;
    }

    public void setNotRead(int notRead) {
        this.notRead = notRead;
    }
}
