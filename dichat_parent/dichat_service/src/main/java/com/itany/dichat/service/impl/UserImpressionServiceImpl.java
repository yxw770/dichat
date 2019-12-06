package com.itany.dichat.service.impl;

import com.itany.dichat.dao.UserImpressionDao;
import com.itany.dichat.pojo.UserImpression;
import com.itany.dichat.service.UserImpressionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4
 * Time: 15:09
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class UserImpressionServiceImpl implements UserImpressionService {

    @Autowired
    private UserImpressionDao userImpressionDao;
    @Override
    public List<UserImpression> selectAllByToUserid(int friendUserid) {

        return userImpressionDao.selectAllByToUserid(friendUserid);
    }

    @Override
    public int addImpression(int userid, int friendUserid, String msg) {
        return userImpressionDao.addImpression(userid,friendUserid,msg,new Date().getTime());
    }
}
