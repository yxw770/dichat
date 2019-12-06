package com.itany.dichat.service;

import com.itany.dichat.pojo.UserImpression;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4
 * Time: 15:08
 * To change this template use File | Settings | File Templates.
 */
public interface UserImpressionService {
    List<UserImpression> selectAllByToUserid(int friendUserid);

    int addImpression(int userid, int friendUserid, String msg);
}
