package com.itany.dichat.service.impl;

import com.itany.dichat.common.exception.UserLoveLogExitstException;
import com.itany.dichat.dao.UserLoveLogDao;
import com.itany.dichat.pojo.UserLoveLog;
import com.itany.dichat.service.UserLoveLogService;
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
 * Time: 15:10
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class UserLoveLogServiceImpl implements UserLoveLogService {
    @Autowired
    private UserLoveLogDao userLoveLogDao;

    @Override
    public List<UserLoveLog> selectByImpressionId(Integer id) {
        return userLoveLogDao.selectByImpressionId(id);
    }

    @Override
    public int addLove(int userid, int impressionId) throws UserLoveLogExitstException {
        UserLoveLog userLoveLog = userLoveLogDao.selectOneByuseridAndImpressionId(userid,impressionId);

        if(userLoveLog==null){
            return userLoveLogDao.addLove(userid,impressionId,new Date().getTime());
        }else {
            throw new UserLoveLogExitstException("您已经点过赞了哦");
        }

    }
}
