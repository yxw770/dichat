package com.itany.dichat.service;/**
 * @author:GodFrey
 * @date:2019/12/1/001.
 */

import com.itany.dichat.common.exception.UserExistException;
import com.itany.dichat.dto.UserDefineDto;
import com.itany.dichat.pojo.User;
import org.apache.commons.fileupload.FileUploadException;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/1/001
 * Time: 19:18
 * File Name: 
 */
public interface UserService {
    /**
     * 用户名登录
     * @param username
     * @return
     * @throws UserExistException
     */
    public User UserLoginByusername(String username) throws UserExistException;
    /**
     * 用户名登录
     * @param username
     * @return
     * @throws UserExistException
     */
    public User UserLoginById(int username) throws UserExistException;
    /**
     * 设置用户sessionid
     * @param sessionId
     * @param id
     */
    public void UserSetSessionId(String sessionId,int id) ;

    /**
     * session反查用户id
     * @return
     */
    public User SessionIDGetUserId(String sessionId) throws UserExistException;

    /**
     * 新建用户
     * @param userDefineDto
     */
    void insertUser(UserDefineDto userDefineDto) throws FileUploadException;

    boolean checkUsername(String username);
}
