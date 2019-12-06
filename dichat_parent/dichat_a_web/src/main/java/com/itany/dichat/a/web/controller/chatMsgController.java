package com.itany.dichat.a.web.controller;

import com.itany.dichat.service.chatMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/11/30
 * Time: 3:00
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/chatMsg")
public class chatMsgController {
    @Autowired
    private chatMsgService chatMsgService;
    @RequestMapping("getMsg")
    public String getMSg(){

        //获取信息
        return "";
    }
}
