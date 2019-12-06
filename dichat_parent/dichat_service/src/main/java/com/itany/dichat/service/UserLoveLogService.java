package com.itany.dichat.service;

import com.itany.dichat.common.exception.UserLoveLogExitstException;
import com.itany.dichat.pojo.UserLoveLog;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4
 * Time: 15:10
 * To change this template use File | Settings | File Templates.
 */
public interface UserLoveLogService {
    /**
     * 获取对应印象的点赞人
     * @param id
     * @return
     */
    List<UserLoveLog> selectByImpressionId(Integer id);

    /**
     * 新增点赞
     * @param userid
     * @param impressionId
     * @return
     */
    int addLove(int userid, int impressionId) throws UserLoveLogExitstException;
}
