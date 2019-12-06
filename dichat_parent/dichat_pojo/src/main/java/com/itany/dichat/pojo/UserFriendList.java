package com.itany.dichat.pojo;/**
 * @author:GodFrey
 * @date:2019/12/5/005.
 */

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/5/005
 * Time: 18:25
 * File Name: 
 */
public class UserFriendList implements Serializable {
    private Integer id;
    private Integer friendUserid;
    private Integer sort;
    private String headPortrait;
    private String name;
    private String instructions;

    public UserFriendList() {
    }

    public UserFriendList(Integer id, Integer friendUserid, Integer sort, String headPortrait, String name, String instructions) {
        this.id = id;
        this.friendUserid = friendUserid;
        this.sort = sort;
        this.headPortrait = headPortrait;
        this.name = name;
        this.instructions = instructions;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
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
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }
}
