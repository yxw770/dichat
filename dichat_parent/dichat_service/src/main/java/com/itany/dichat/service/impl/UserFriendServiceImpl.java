package com.itany.dichat.service.impl;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */

import com.itany.dichat.dao.UserFriendDao;
import com.itany.dichat.pojo.UserFriend;
import com.itany.dichat.pojo.UserFriendList;
import com.itany.dichat.service.UserFriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 15:59
 * File Name:
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class UserFriendServiceImpl implements UserFriendService {
    @Autowired
    private UserFriendDao userFriendDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<UserFriend> selectByUserid(int userid) {

        return userFriendDao.selectByUserid(userid);
    }

    @Override
    public void setFriendTop(int userid, int friendUserid,int is_top) {
        userFriendDao.setFriendTop(userid,friendUserid,is_top,new Date().getTime());
    }

    @Override
    public void delFriendByFriendUserid(int userid, int friendUserid) {
        userFriendDao.delFriendByFriendUserid(userid,friendUserid,new Date().getTime());
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    public List<UserFriendList> selectFriendListByUserid(int userid) {
        return userFriendDao.selectFriendListByUserid(userid);
    }

    @Override
    public void setSort(int userid, int id, int sort) {
        userFriendDao.setSort(userid,id,sort,new Date().getTime());
    }
}
