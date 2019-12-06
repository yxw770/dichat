package com.itany.dichat.dao;/**
 * @author:GodFrey
 * @date:2019/12/1/001.
 */

import com.itany.dichat.pojo.User;
import org.apache.ibatis.annotations.Param;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/1/001
 * Time: 19:19
 * File Name:
 */
public interface UserDao {
    public User userLoginByUsername(String username);

    public void updateSessionId(@Param("sessionId") String sessionId, @Param("id") int id);

    public User sessionIDGetUserId(String sessionId);

    public void add(User user);

    User selectByUsername(String username);

    User selectById(int userid);

    User userLoginById(int userid);
}
