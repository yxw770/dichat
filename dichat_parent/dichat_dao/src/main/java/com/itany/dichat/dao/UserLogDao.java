package com.itany.dichat.dao;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */


import org.apache.ibatis.annotations.Param;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 12:34
 * File Name: 
 */
public interface UserLogDao {
    void add(@Param("userid")int userid,@Param("create_at")long create_at,@Param("IP")String IP);
}
