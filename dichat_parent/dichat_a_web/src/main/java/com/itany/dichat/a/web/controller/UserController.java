package com.itany.dichat.a.web.controller;

import com.itany.dichat.a.web.vo.UserDefineVo;
import com.itany.dichat.common.exception.UserExistException;
import com.itany.dichat.common.util.RequestUtils;
import com.itany.dichat.common.util.ResponseResult;
import com.itany.dichat.dao.UserLogDao;
import com.itany.dichat.dto.UserDefineDto;
import com.itany.dichat.pojo.User;
import com.itany.dichat.pojo.UserDefine;
import com.itany.dichat.service.UserLogService;
import com.itany.dichat.service.UserService;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/11/30
 * Time: 2:43
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserLogService userLogService;

    @RequestMapping("/login")
    @ResponseBody
    public ResponseResult login(String username, String password, HttpSession session,HttpServletRequest request) {

        /**
         * 登录区
         */
        try {
            User user ;
            Pattern pattern = Pattern.compile("[0-9]*");
            if(pattern.matcher(username).matches()){
                user = userService.UserLoginById(Integer.parseInt(username));
            }else{
                user = userService.UserLoginByusername(username);
            }

            if (user.getPassword().equals(password)) {
                session.setAttribute("user.username", user.getUsername());
                session.setAttribute("user.id", user.getId());
                session.setAttribute("user.sessionId", user.getSessionId());
                userService.UserSetSessionId(session.getId(), user.getId());
                userLogService.insertLog(user.getId(),new Date().getTime(), RequestUtils.getIpAddress(request));
                return ResponseResult.success();
            } else {
                return ResponseResult.fail("密码错误");
            }

        } catch (UserExistException e) {
            return ResponseResult.fail(e.getMessage());
        }
    }

    @RequestMapping(value = "/register")
    @ResponseBody
    public ResponseResult register(UserDefineVo userDefineVo, HttpSession session) {
        /**
         * 用户注册
         */
        String uploadPath = session.getServletContext().getRealPath("/WEB-INF/upload/headPortrait");

        //VO转DTO
        try {
            UserDefineDto userDefineDto = new UserDefineDto();
            PropertyUtils.copyProperties(userDefineDto, userDefineVo);
//            System.out.println(userDefineVo.getName());

            if (userDefineVo.getFile() == null) {
                return ResponseResult.fail("文件为空");
            }

            userDefineDto.setInputStream(userDefineVo.getFile().getInputStream());
            userDefineDto.setFileName(userDefineVo.getFile().getOriginalFilename());
            userDefineDto.setUploadPath(uploadPath);
            userService.insertUser(userDefineDto);
            return ResponseResult.success();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.fail(e.getMessage());
        }

    }

    @RequestMapping("/checkUsername")
    @ResponseBody
    public Map<String, Object> checkUsername(String username) {
        Map<String, Object> map = new HashMap<>();
        boolean flag = userService.checkUsername(username);
        if (flag == true) {
            map.put("valid", true);
        } else {
            map.put("valid", false);
            map.put("message", "此用户名已存在");
        }

        return map;
    }



    @RequestMapping("/logout")
    @ResponseBody
    public void logout(HttpSession session, HttpServletResponse response) throws IOException {
        session.invalidate();
        response.sendRedirect("/login");
//        return ResponseResult.success();
    }


}
