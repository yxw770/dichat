package com.itany.dichat.dao;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */

import com.itany.dichat.pojo.UserFriend;
import com.itany.dichat.pojo.UserFriendList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 16:04
 * File Name:
 */
public interface UserFriendDao {

    List<UserFriend> selectByUserid(int userid);

    void setFriendTop(@Param("userid") int userid, @Param("friendUserid") int friendUserid, @Param("is_top") int is_top, @Param("update_at") long update_at);

    UserFriend findFriendByUserid(@Param("userid") int userid, @Param("friendUserid") int friendUserid);

    UserFriend findFriendByUseridAll(@Param("userid") int userid, @Param("friendUserid") int friendUserid);

    void delFriendByFriendUserid(@Param("userid") int userid, @Param("friendUserid") int friendUserid, @Param("update_at") long time);

    int updateBlackStatus(@Param("userid") int userid, @Param("friendUserid") int friendUserid, @Param("is_black") int is_black, @Param("update_at") long time);

    int insertFriend(@Param("userid") int userid, @Param("friendUserid") int friendUserid, @Param("create_at") long time);

    List<UserFriendList> selectFriendListByUserid(int userid);

    void setSort(@Param("userid") int userid, @Param("id") int id, @Param("sort") int sort, @Param("update_at") long time);
}
