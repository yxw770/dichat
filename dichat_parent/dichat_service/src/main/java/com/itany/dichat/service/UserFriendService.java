package com.itany.dichat.service;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */

import com.itany.dichat.pojo.UserFriend;
import com.itany.dichat.pojo.UserFriendList;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 15:59
 * File Name: 
 */
public interface UserFriendService {
    /**
     * 获取所有好友
     * @param userid
     * @return
     */
    public List<UserFriend> selectByUserid(int userid);

    /**
     * 设置置顶
     * @param userid
     * @param friendUserid
     * @param is_top
     */
    public void setFriendTop(int userid, int friendUserid,int is_top);

    /**
     * 删除好友
     * @param userid
     * @param friendUserid
     */
    public void delFriendByFriendUserid(int userid, int friendUserid);

    /**
     * 获取好友列表
     * @param userid
     * @return
     */
    public List<UserFriendList> selectFriendListByUserid(int userid);

    void setSort(int userid, int id, int sort);
}
