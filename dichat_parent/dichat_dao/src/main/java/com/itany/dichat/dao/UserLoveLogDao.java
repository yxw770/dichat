package com.itany.dichat.dao;

import com.itany.dichat.pojo.UserLoveLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4
 * Time: 15:11
 * To change this template use File | Settings | File Templates.
 */
public interface UserLoveLogDao {
    List<UserLoveLog> selectByImpressionId(Integer id);

    int addLove(@Param("userid") int userid,@Param("impressionId") int impressionId,@Param("time") long time);

    UserLoveLog selectOneByuseridAndImpressionId(@Param("userid") int userid,@Param("impressionId") int impressionId);
}
