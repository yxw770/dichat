package com.itany.dichat.service.impl;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */

import com.itany.dichat.dao.UserLogDao;
import com.itany.dichat.service.UserLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 12:41
 * File Name:
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class UserLogServiceImpl implements UserLogService {
    @Autowired
    private UserLogDao userLogDao;

    @Override
    public void insertLog(int userid, long create_at, String IP) {
        userLogDao.add(userid,create_at,IP);
    }
}
