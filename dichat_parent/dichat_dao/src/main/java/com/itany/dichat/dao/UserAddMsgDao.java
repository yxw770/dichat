package com.itany.dichat.dao;/**
 * @author:GodFrey
 * @date:2019/12/4/004.
 */

import com.itany.dichat.pojo.AddMsgList;
import com.itany.dichat.pojo.UserAddMsg;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4/004
 * Time: 19:41
 * File Name:
 */
public interface UserAddMsgDao {
    public int addFriendByFriendUserid(@Param("byUserid") int userid, @Param("toUserid") int friendUserid, @Param("msg") String msg, @Param("create_at") long time);

    public UserAddMsg selectAddMsgByToAndFrom(@Param("byUserid") int userid, @Param("toUserid") int friendUserid);

    List<AddMsgList> selectAddMsgByUserid(int userid);

    UserAddMsg selectAddMsgById(int id);

    int updateStatusbyId(@Param("id") int id, @Param("status") int status, @Param("update_at") long time, @Param("disagreeMsg") String disagreeMsg);

    int updateStatusByToAndFrom(@Param("byUserid") int userid, @Param("toUserid") int friendUserid,  @Param("status") int status, @Param("update_at") long time);
}
