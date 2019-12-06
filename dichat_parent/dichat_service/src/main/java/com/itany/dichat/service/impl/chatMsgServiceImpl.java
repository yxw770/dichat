package com.itany.dichat.service.impl;

import com.itany.dichat.common.exception.chatMsgExitstException;
import com.itany.dichat.common.util.StringUtils;
import com.itany.dichat.dao.UserFriendDao;
import com.itany.dichat.dao.chatMsgDao;
import com.itany.dichat.dto.ChatMsgDto;
import com.itany.dichat.pojo.UserFriend;
import com.itany.dichat.pojo.chatMsg;
import com.itany.dichat.service.chatMsgService;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StreamUtils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/11/30
 * Time: 4:14
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class chatMsgServiceImpl implements chatMsgService {
    @Autowired
    private chatMsgDao chatMsgDao;
    @Autowired
    private UserFriendDao userFriendDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<chatMsg> getAllList(int userid) {
        List<chatMsg> chatMsg = chatMsgDao.selectAllMsg(userid);
        return chatMsg;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<chatMsg> getMsg(int userid, int FriendUserid) {

        List<chatMsg> chatMsg = chatMsgDao.selectFriendMsg(userid, FriendUserid);
        return chatMsg;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<chatMsg> getMsgASC(int userid, int FriendUserid) {

        List<chatMsg> chatMsg = chatMsgDao.selectFriendMsgASC(userid, FriendUserid);
        return chatMsg;
    }

    @Override
    public void setRead(int userid, int FriendUserid) {

        chatMsgDao.setRead(userid, FriendUserid, new Date().getTime());
    }

    @Override
    public void sendTextMsg(int userid, int friendUserid, String msg) throws chatMsgExitstException {
        UserFriend userFriend = userFriendDao.findFriendByUserid(userid, friendUserid);
        if (userFriend == null) {
            throw new chatMsgExitstException("对方不是您的好友");
        }
        UserFriend userFriend1 = userFriendDao.findFriendByUserid(friendUserid,userid);
        if (userFriend1 == null) {
            throw new chatMsgExitstException("您不是对方的好友");
        }
        chatMsgDao.sendTextMsg(userid, friendUserid, msg, new Date().getTime());
    }

    @Override
    public chatMsg sendImgMsg(ChatMsgDto chatMsgDto) throws FileUploadException {
        int userid = chatMsgDto.getSendUserid();
        int friendUserid = chatMsgDto.getToUserid();
        UserFriend userFriend = userFriendDao.findFriendByUserid(userid, friendUserid);
        if (userFriend == null) {
            throw new FileUploadException("对方不是您的好友");
        }
        UserFriend userFriend1 = userFriendDao.findFriendByUserid(friendUserid,userid);
        if (userFriend1 == null) {
            throw new FileUploadException("您不是对方的好友");
        }
        String fileName = StringUtils.renameFile(chatMsgDto.getFileName());
        String filePath = chatMsgDto.getUploadPath() + "/" + fileName;
        try {
            StreamUtils.copy(chatMsgDto.getInputStream(), new FileOutputStream(filePath));
        } catch (IOException e) {
            throw new FileUploadException("文件上传失败" + e.getMessage());
        }
        //  2.2保存
        chatMsg chatMsg = new chatMsg();
        try {
            PropertyUtils.copyProperties(chatMsg, chatMsgDto);
            chatMsg.setMsg(StringUtils.getFileMsgPath(filePath));
            chatMsg.setCreate_at(new Date().getTime());
            int id = chatMsgDao.sendImgMsg(chatMsg);
            System.out.println(chatMsg.getId());
            chatMsg chatMsg1 = new chatMsg();
            return chatMsg;
        } catch (Exception e) {
            throw new FileUploadException("错误" + e.getMessage());
        }
    }

    @Override
    public void delMsgByFriendUserid(int userid, int friendUseid) {
        chatMsgDao.updateIsTrushByFriendUseridSend(userid, friendUseid, new Date().getTime());
        chatMsgDao.updateIsTrushByFriendUseridTo(userid, friendUseid, new Date().getTime());
    }

    @Override
    public List<chatMsg> getUnReadList(int userid) {
        List<chatMsg> chatMsgs= chatMsgDao.selectgetUnReadList (userid);
        chatMsgDao.updateTime(userid, new Date().getTime());
        return chatMsgs;
    }

    @Override
    public List<chatMsg> getUnreadMsg(int userid, int friendUserid) {
        List<chatMsg> chatMsgs= chatMsgDao.selectUnReadListByFriendUserid (userid,friendUserid);
        chatMsgDao.setRead(userid,friendUserid, new Date().getTime());

        for (int i=0 ;i<chatMsgs.size();i++){
            for (int j=0 ;j<chatMsgs.size();j++){
                if(i!=j){
                    if(chatMsgs.get(i).getId()==chatMsgs.get(j).getId()){
                        chatMsgs.remove(j);
                    }
                }
            }
        }


        return chatMsgs;
    }

}
