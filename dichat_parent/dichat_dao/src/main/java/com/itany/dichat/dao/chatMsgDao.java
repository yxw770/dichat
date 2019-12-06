package com.itany.dichat.dao;

import com.itany.dichat.pojo.chatMsg;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/11/30
 * Time: 3:50
 * To change this template use File | Settings | File Templates.
 */
public interface chatMsgDao {

    public List<chatMsg> selectAllMsg(int userid);

    public List<chatMsg> selectFriendMsg(@Param("userid") int userid, @Param("friendUserid") int friendUserid);

    public List<chatMsg> selectFriendMsgASC(@Param("userid") int userid, @Param("friendUserid") int friendUserid);

    public void setRead(@Param("userid") int userid, @Param("friendUserid") int friendUserid, @Param("update_at") long update_at);

    public void sendTextMsg(@Param("sendUserid") int sendUserid,@Param("toUserid") int toUserid, @Param("msg") String msg,@Param("create_at") long create_at);

    public int sendImgMsg(chatMsg chatMsg);

    public void updateIsTrushByFriendUseridSend(@Param("userid") int userid,@Param("friendUserid") int friendUseid, @Param("update_at") long update_at);

    public void updateIsTrushByFriendUseridTo(@Param("userid") int userid,@Param("friendUserid") int friendUseid, @Param("update_at") long update_at);

    public List<chatMsg> selectgetUnReadList(int userid);

    public void updateTime(@Param("userid") int userid,@Param("update_at") long time);

    public List<chatMsg> selectUnReadListByFriendUserid(@Param("userid") int userid,@Param("friendUserid") int friendUseid );
}
