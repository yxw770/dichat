package com.itany.dichat.service;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 12:41
 * File Name: 
 */
public interface UserLogService {

    /**
     * 新增登录记录
     * @param userid
     * @param create_at
     * @param IP
     */
    void insertLog(int userid,long create_at,String IP);
}
