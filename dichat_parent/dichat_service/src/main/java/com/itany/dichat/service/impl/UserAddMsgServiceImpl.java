package com.itany.dichat.service.impl;/**
 * @author:GodFrey
 * @date:2019/12/4/004.
 */

import com.itany.dichat.common.exception.UserAddMsgExitstException;
import com.itany.dichat.dao.UserAddMsgDao;
import com.itany.dichat.dao.UserDao;
import com.itany.dichat.dao.UserFriendDao;
import com.itany.dichat.pojo.AddMsgList;
import com.itany.dichat.pojo.User;
import com.itany.dichat.pojo.UserAddMsg;
import com.itany.dichat.pojo.UserFriend;
import com.itany.dichat.service.UserAddMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4/004
 * Time: 19:38
 * File Name:
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class UserAddMsgServiceImpl implements UserAddMsgService {
    @Autowired
    private UserAddMsgDao userAddMsgDao;
    @Autowired
    private UserFriendDao userFriendDao;
    @Autowired
    private UserDao userDao;

    @Override
    public int addFriendByFriendUserid(int userid, int friendUserid, String msg) throws UserAddMsgExitstException {
        User user = userDao.selectById(friendUserid);
        if(user==null){
            throw new UserAddMsgExitstException("滴信账号不存在");
        }
        UserFriend userFriend = userFriendDao.findFriendByUserid(friendUserid,userid);
        if (userFriend != null) {
            throw new UserAddMsgExitstException("您与他已经是好友了");
        }
        UserAddMsg userAddMsg = userAddMsgDao.selectAddMsgByToAndFrom(userid, friendUserid);
        if (userAddMsg != null && userAddMsg.getStatus() == 0) {
            throw new UserAddMsgExitstException("不要太心急哦！对方还没处理您的好友申请呢");
        }
        return userAddMsgDao.addFriendByFriendUserid(userid, friendUserid, msg, new Date().getTime());
    }

    @Override
    public List<AddMsgList> findAllByUserid(int userid) {

        return userAddMsgDao.selectAddMsgByUserid(userid);
    }

    @Override
    public void updateSetStatusAgree(int id) throws UserAddMsgExitstException {
        UserAddMsg userAddMsg = userAddMsgDao.selectAddMsgById(id);
        if (userAddMsg == null) {
            throw new UserAddMsgExitstException("获取验证信息失败");
        }
        if (userAddMsg.getStatus() != 0) {
            throw new UserAddMsgExitstException("此验证已处理！请勿重新提交");
        }
        int friendUserid = userAddMsg.getByUserid();
        int userid = userAddMsg.getToUserid();
        if (friendUserid==userid) {
            throw new UserAddMsgExitstException("处理失败，数据异常");
        }
        UserFriend userFriend = userFriendDao.findFriendByUseridAll(userid, friendUserid);
        //我方加对方
        if (userFriend != null ) {
            //曾经是好友
            if (userFriend.getIs_black() == 1){
                int status = userFriendDao.updateBlackStatus(userid, friendUserid, 0, new Date().getTime());
                if (status == 0) {
                    throw new UserAddMsgExitstException("添加好友失败，数据库更新失败：0");
                }
            }
            int status2 = userAddMsgDao.updateStatusbyId(id, 1, new Date().getTime(), null);
            if (status2 == 0) {
                throw new UserAddMsgExitstException("添加好友失败，数据库更新失败：1");
            }
        } else {
            //非好友

            int status = userFriendDao.insertFriend(userid, friendUserid, new Date().getTime());
            if (status == 0) {
                throw new UserAddMsgExitstException("添加好友失败，数据库更新失败：3");
            }
            int status2 = userAddMsgDao.updateStatusbyId(id, 1, new Date().getTime(), null);
            if (status2 == 0) {
                throw new UserAddMsgExitstException("添加好友失败，数据库更新失败：4");
            }
        }
        //对方加我方互为好友
        UserFriend userFriend1 = userFriendDao.findFriendByUseridAll(friendUserid, userid);
        if (userFriend1 != null) {
            //曾经是好友
            if (userFriend1.getIs_black() == 1){
                int status = userFriendDao.updateBlackStatus(friendUserid, userid, 0, new Date().getTime());
                if (status == 0) {
                    throw new UserAddMsgExitstException("添加好友失败，数据库更新失败：5");
                }
            }

            userAddMsgDao.updateStatusByToAndFrom(userid, friendUserid, 1, new Date().getTime());

        } else {
            //非好友
            int status = userFriendDao.insertFriend(friendUserid, userid, new Date().getTime());
            if (status == 0) {
                throw new UserAddMsgExitstException("添加好友失败，数据库更新失败：7");
            }
            userAddMsgDao.updateStatusByToAndFrom(userid, friendUserid, 1, new Date().getTime());

        }

    }

    @Override
    public void updateSetStatusDisAgree(int id, String disagreeMsg) throws UserAddMsgExitstException {
        UserAddMsg userAddMsg = userAddMsgDao.selectAddMsgById(id);
        if (userAddMsg == null) {
            throw new UserAddMsgExitstException("获取验证信息失败");
        }
        if (userAddMsg.getStatus() != 0) {
            throw new UserAddMsgExitstException("此验证已处理！请勿重新提交");
        }
        int status = userAddMsgDao.updateStatusbyId(id, 2, new Date().getTime(), disagreeMsg);
        if (status == 0) {
            throw new UserAddMsgExitstException("添加好友失败，数据库更新失败：7");
        }
    }
}
