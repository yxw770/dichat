package com.itany.dichat.service.impl;/**
 * @author:GodFrey
 * @date:2019/12/1/001.
 */

import com.itany.dichat.common.exception.UserExistException;
import com.itany.dichat.common.util.StringUtils;
import com.itany.dichat.dao.UserDao;
import com.itany.dichat.dao.UserDefineDao;
import com.itany.dichat.dto.UserDefineDto;
import com.itany.dichat.pojo.User;
import com.itany.dichat.pojo.UserDefine;
import com.itany.dichat.service.UserService;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StreamUtils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/1/001
 * Time: 19:18
 * File Name:
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class )
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private UserDefineDao userDefineDao;


    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public User UserLoginByusername(String username) throws UserExistException {
        User user = userDao.userLoginByUsername(username);
        if(null == user){
            throw new UserExistException("用户名不存在");
        }

        return user;
    }

    @Override
    public User UserLoginById(int username) throws UserExistException {
        User user = userDao.userLoginById(username);
        if(null == user){
            throw new UserExistException("用户名不存在");
        }

        return user;
    }

    @Override
    public void UserSetSessionId(String sessionId,int id) {
        userDao.updateSessionId(sessionId,id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public User SessionIDGetUserId(String sessionId) throws UserExistException{
        User user = userDao.sessionIDGetUserId(sessionId);
        if(null == user){
            throw new UserExistException("用户信息失效，请重新登录");
        }

        return user;
    }

    @Override
    public void insertUser(UserDefineDto userDefineDto) throws FileUploadException {

        //1.新建用户
        //  1.1判断是否存在
        User userRes = userDao.userLoginByUsername(userDefineDto.getUsername());
        if(userRes!=null){
            throw new FileUploadException("用户名已存在");
        }
        //  1.2新建用户
        Integer userid=0;
        User user = new User();
        try {
            PropertyUtils.copyProperties(user,userDefineDto);
            userDao.add(user);
            User userRes1 = userDao.userLoginByUsername(userDefineDto.getUsername());
            userid = userRes1.getId();
        } catch (Exception e) {
            throw new FileUploadException("错误"+e.getMessage());
        }

        //2修改信息
        //  2.1上传文件
        if(userid==0){
            throw new FileUploadException("添加用户失败");
        }
        String fileName = StringUtils.renameFile(userDefineDto.getFileName());
        String filePath = userDefineDto.getUploadPath()+"/"+fileName;
        try {
            StreamUtils.copy(userDefineDto.getInputStream(),new FileOutputStream(filePath));
        } catch (IOException e) {
            throw new FileUploadException("文件上传失败"+e.getMessage());
        }
        //  2.2保存
        UserDefine userDefine = new UserDefine();
        try {
            PropertyUtils.copyProperties(userDefine,userDefineDto);
            userDefine.setHeadPortrait(StringUtils.getFileWebPath(filePath));

            userDefine.setUserid(userid);
            userDefine.setCreate_at(new Date().getTime());
            userDefineDao.add(userDefine);
        } catch (Exception e) {
            throw new FileUploadException("错误"+e.getMessage());
        }



    }

    @Override
    public boolean checkUsername(String username) {
        User userRes = userDao.selectByUsername(username);
        if (userRes!=null){
            return false;
        }
        return true;
    }

}
