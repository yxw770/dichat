package com.itany.dichat.dao;

import com.itany.dichat.pojo.UserImpression;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4
 * Time: 15:11
 * To change this template use File | Settings | File Templates.
 */
public interface UserImpressionDao {
    List<UserImpression> selectAllByToUserid(int friendUserid);

    int addImpression(@Param("fromUserid") int userid,@Param("toUserid") int friendUserid,@Param("msg") String msg,@Param("create_at") long time);
}
