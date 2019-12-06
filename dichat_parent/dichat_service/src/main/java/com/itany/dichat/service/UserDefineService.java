package com.itany.dichat.service;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */

import com.itany.dichat.pojo.UserDefine;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 15:49
 * File Name: 
 */
public interface UserDefineService {
    /**
     * 获取某个用户信息
     * @param userid
     * @return
     */
    public UserDefine selectByUserid(int userid);

    void setIsNotFirstLogin(int userid);

    int editInfo(UserDefine userDefine);
}
