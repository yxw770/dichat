package com.itany.dichat.service;

import com.itany.dichat.common.exception.chatMsgExitstException;
import com.itany.dichat.dto.ChatMsgDto;
import com.itany.dichat.pojo.chatMsg;
import org.apache.commons.fileupload.FileUploadException;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/11/30
 * Time: 4:12
 * To change this template use File | Settings | File Templates.
 */
public interface chatMsgService {


    /**
     * 获取所有聊天信息
     * @param userid
     * @return
     */
    public List<chatMsg> getAllList(int userid);

    /**
     * 获取某人聊天记录
     * @param userid
     * @param FriendUserid
     * @return
     */
    public List<chatMsg> getMsg(int userid ,int FriendUserid);
    /**
     * 获取某人聊天记录ASC
     * @param userid
     * @param FriendUserid
     * @return
     */
    public List<chatMsg> getMsgASC(int userid ,int FriendUserid);

    /**
     * 设置为已读
     * @param userid
     * @param FriendUserid
     */
    public void setRead(int userid,int FriendUserid);

    /**
     * 发送文本消息
     * @param friendUserid
     * @param msg
     */
    public void sendTextMsg(int userid,int friendUserid, String msg) throws chatMsgExitstException;

    /**
     * 发送图片消息
     * @param chatMsgDto
     * @return
     * @throws FileUploadException
     */
    public chatMsg sendImgMsg(ChatMsgDto chatMsgDto) throws FileUploadException;

    /**
     * 删除某个好友的聊天记录
     * @param userid
     * @param friendUseid
     */
    public void delMsgByFriendUserid(int userid, int friendUseid);

    /**
     * 获取是否有未读消息
     * @return
     * @param userid
     */
    public List<chatMsg> getUnReadList(int userid);

    /**
     * 获取未读消息
     * @param userid
     * @param friendUserid
     * @return
     */
    public List<chatMsg> getUnreadMsg(int userid, int friendUserid);
}
