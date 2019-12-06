package com.itany.dichat.a.web.controller;/**
 * @author:GodFrey
 * @date:2019/12/1/001.
 */

import com.itany.dichat.a.web.vo.ChatMsgVo;
import com.itany.dichat.common.exception.UserAddMsgExitstException;
import com.itany.dichat.common.exception.UserExistException;
import com.itany.dichat.common.exception.UserLoveLogExitstException;
import com.itany.dichat.common.exception.chatMsgExitstException;
import com.itany.dichat.common.util.ResponseResult;
import com.itany.dichat.dao.UserLoveLogDao;
import com.itany.dichat.dto.ChatMsgDto;
import com.itany.dichat.pojo.*;
import com.itany.dichat.service.*;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/1/001
 * Time: 20:57
 * File Name:
 */
@Controller
@RequestMapping("/center")
public class CenterController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserDefineService userDefineService;
    @Autowired
    private UserFriendService userFriendService;
    @Autowired
    private chatMsgService chatMsgService;
    @Autowired
    private UserLoveLogService userLoveLogService;
    @Autowired
    private UserImpressionService userImpressionService;
    @Autowired
    private UserAddMsgService userAddMsgService;

    /**
     * 初始检测用户是否登录
     *
     * @param session
     * @param response
     * @return
     * @throws IOException
     */
    @ModelAttribute("userDefine")
    public UserDefine checkUser(HttpSession session, HttpServletResponse response) throws IOException {
        //校验是否已登录用户

        try {
            User user = userService.SessionIDGetUserId(session.getId());
            UserDefine userDefine1 = userDefineService.selectByUserid(user.getId());
            if (user == null) {
                response.sendRedirect("/user/logout");
            }
            return userDefine1;
        } catch (UserExistException e) {
//            e.printStackTrace();
            response.sendRedirect("/user/logout");
        }
        return null;

    }

    @RequestMapping("/")
    public String index(HttpSession session, HttpServletResponse response) throws IOException {
        return "index";
    }

    @RequestMapping("/friendList")
    public String friendList(HttpSession session, HttpServletResponse response) throws IOException {

        return "friendList";
    }
    @RequestMapping("/myImpression")
    public String myImpression(HttpSession session, HttpServletResponse response) throws IOException {

        return "myImpression";
    }

    @RequestMapping("/addMsgList")
    public String addMsgList(HttpSession session, HttpServletResponse response) throws IOException {

        return "addMsgList";
    }
    /**
     * 获取聊天列表
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/getChatList", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getChatList(HttpSession session) {
        int userid = (int) session.getAttribute("user.id");

//        List<chatMsg> allList = chatMsgService.getAllList(userid);
        List<UserFriend> userFriends = userFriendService.selectByUserid(userid);
        List<ChatList> chatLists = new ArrayList<>();
        for (int i = 0; i < userFriends.size(); i++) {
            int FriendUserid = userFriends.get(i).getFriendUserid();
            int is_top = userFriends.get(i).getIs_top();
            //获取对方信息
            UserDefine userDefine = userDefineService.selectByUserid(FriendUserid);
            String HeadPortrait = userDefine.getHeadPortrait();
            String Name = userDefine.getName();
            //获取好友聊天消息
            List<chatMsg> msg = chatMsgService.getMsg(userid, FriendUserid);

            if (msg != null && msg.size() > 0) {
                int sum = 0;//未读数量
                for (int j = 0; j < msg.size(); j++) {
                    if (msg.get(j).getToUserid() == userid && msg.get(j).getIsSend() == 0) {
                        sum++;
                    }
                }
                ChatList chatListTmp = new ChatList();
                chatListTmp.setCreate_at(msg.get(0).getCreate_at());
                chatListTmp.setFriendUserid(FriendUserid);
                chatListTmp.setHeadPortrait(HeadPortrait);

                if (msg.get(0).getType() == 0) {
                    chatListTmp.setMsg(msg.get(0).getMsg());
                } else {
                    chatListTmp.setMsg("[图片消息]");
                }
                chatListTmp.setName(Name);
                chatListTmp.setNotRead(sum);
                chatListTmp.setIs_top(is_top);
                chatLists.add(chatListTmp);
            } else {
                ChatList chatListTmp = new ChatList();
                chatListTmp.setCreate_at(0);
                chatListTmp.setFriendUserid(FriendUserid);
                chatListTmp.setHeadPortrait(HeadPortrait);
                chatListTmp.setMsg("");
                chatListTmp.setName(Name);
                chatListTmp.setNotRead(0);
                chatListTmp.setIs_top(is_top);
                chatLists.add(chatListTmp);
            }


        }
        //按照时间先后排序
        Collections.sort(chatLists, new Comparator<ChatList>() {
            @Override
            public int compare(ChatList o1, ChatList o2) {
                //TODO: 升序排列
//                return o1.getCreate_at().compareTo(o2.getCreate_at());
                //TODO: 降序排列
                return new Long(o2.getCreate_at()).compareTo(new Long(o1.getCreate_at()));
            }
        });
        //根据未读信息多少排序
        Collections.sort(chatLists, new Comparator<ChatList>() {
            @Override
            public int compare(ChatList o3, ChatList o4) {
                //TODO: 升序排列
//                return o1.getCreate_at().compareTo(o2.getCreate_at());
                //TODO: 降序排列
                return new Long(o4.getNotRead()).compareTo(new Long(o3.getNotRead()));
            }
        });
        //按照置顶排序
        Collections.sort(chatLists, new Comparator<ChatList>() {
            @Override
            public int compare(ChatList o3, ChatList o4) {
                //TODO: 升序排列
//                return o1.getCreate_at().compareTo(o2.getCreate_at());
                //TODO: 降序排列
                return new Long(o4.getIs_top()).compareTo(new Long(o3.getIs_top()));
            }
        });
        //根据置顶排序

        return ResponseResult.success(chatLists);
    }

    /**
     * 好友置顶设置
     *
     * @param FriendUserid
     * @param is_top
     * @param session
     * @return
     */
    @RequestMapping(value = "/setFriendTop", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult setFriendTop(int FriendUserid, int is_top, HttpSession session) {
        int userid = (int) session.getAttribute("user.id");

        userFriendService.setFriendTop(userid, FriendUserid, is_top);
        return ResponseResult.success();
    }

    /**
     * 获取好友聊天信息
     *
     * @param FriendUserid
     * @param session
     * @return
     */
    @RequestMapping(value = "/getFriendMsg", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getFriendMsg(int FriendUserid, HttpSession session) {
        int userid = (int) session.getAttribute("user.id");
        chatMsgService.setRead(userid, FriendUserid);
        List<chatMsg> msg = chatMsgService.getMsgASC(userid, FriendUserid);
        return ResponseResult.success(msg);
    }

    /**
     * 获取好友信息
     *
     * @param FriendUserid
     * @return
     */
    @RequestMapping(value = "/getFriendDefine", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getFriendDefine(int FriendUserid) {
        UserDefine FriendDefine = userDefineService.selectByUserid(FriendUserid);


        return ResponseResult.success(FriendDefine);
    }

    /**
     * 发送文本消息
     *
     * @param FriendUserid
     * @return
     */
    @RequestMapping(value = "/sendMsgText", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult sendMsgText(int FriendUserid, String msg, HttpSession session) {
        int userid = (int) session.getAttribute("user.id");
        try {
            chatMsgService.sendTextMsg(userid, FriendUserid, msg);
        } catch (chatMsgExitstException e) {
            return ResponseResult.fail(e.getMessage());
        }
        return ResponseResult.success();
    }

    /**
     * 发送图片消息
     *
     * @param chatMsgVo
     * @param session
     * @return
     */
    @RequestMapping(value = "/sendMsgImg", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult sendMsgImg(ChatMsgVo chatMsgVo, HttpSession session) {

        int userid = (int) session.getAttribute("user.id");
        chatMsgVo.setSendUserid(userid);
        String uploadPath = session.getServletContext().getRealPath("/WEB-INF/upload/msgImg");
        try {
            ChatMsgDto chatMsgDto = new ChatMsgDto();
            PropertyUtils.copyProperties(chatMsgDto, chatMsgVo);
//            System.out.println(userDefineVo.getName());

            if (chatMsgVo.getFile() == null) {
                return ResponseResult.fail("图片为空");
            }

            chatMsgDto.setInputStream(chatMsgVo.getFile().getInputStream());
            chatMsgDto.setFileName(chatMsgVo.getFile().getOriginalFilename());
            chatMsgDto.setUploadPath(uploadPath);
            chatMsg chatMsg1 = chatMsgService.sendImgMsg(chatMsgDto);

            return ResponseResult.success(chatMsg1);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.fail(e.getMessage());
        }
    }

    /**
     * 删除聊天记录
     *
     * @param FriendUserid
     * @param session
     * @return
     */
    @RequestMapping(value = "/delMsg", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult delMsg(int FriendUserid, HttpSession session) {

        int userid = (int) session.getAttribute("user.id");
        chatMsgService.delMsgByFriendUserid(userid, FriendUserid);
        return ResponseResult.success();
    }

    /**
     * 删除好友
     *
     * @param FriendUserid
     * @param session
     * @return
     */
    @RequestMapping(value = "/delFriend", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult delFriend(int FriendUserid, HttpSession session) {

        int userid = (int) session.getAttribute("user.id");
        userFriendService.delFriendByFriendUserid(userid, FriendUserid);
        return ResponseResult.success();
    }

    /**
     * 获取此人的印象列表
     *
     * @param FriendUserid
     * @param session
     * @return
     */
    @RequestMapping(value = "/getLoveList", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getLoveList(int FriendUserid, HttpSession session) {

        int userid = (int) session.getAttribute("user.id");
        List<UserImpression> userImpression = userImpressionService.selectAllByToUserid(FriendUserid);
        List<ImpressionList> impressionLists = new ArrayList<>();
        for (int i = 0; i < userImpression.size(); i++) {
            List<UserLoveLog> userLoveLogs = userLoveLogService.selectByImpressionId(userImpression.get(i).getId());
            String lover = "";
            int LoveNum = userLoveLogs.size();
            int isLove = 0;
            for (int j = 0; j < userLoveLogs.size(); j++) {
                if (userLoveLogs.get(j).getUserid() == userid) {
                    isLove = 1;
                }
                if (lover.length() <= 18) {
                    UserDefine userDefine = userDefineService.selectByUserid(userLoveLogs.get(j).getUserid());
                    lover += userDefine.getName() + ",";
                }

            }
            ImpressionList impressionListTmp = new ImpressionList(userImpression.get(i).getId(), LoveNum, userImpression.get(i).getMsg(), isLove, lover);

            impressionLists.add(impressionListTmp);
        }

        return ResponseResult.success(impressionLists);
    }

    /**
     * 对这条印象点赞
     *
     * @param impressionId
     * @param session
     * @return
     */
    @RequestMapping(value = "/setLove", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult setLove(int impressionId, HttpSession session) {

        int userid = (int) session.getAttribute("user.id");
        try {
            int status = userLoveLogService.addLove(userid, impressionId);
            if (status == 1) {
                return ResponseResult.success();
            } else {
                return ResponseResult.fail("点赞失败，请重试");
            }
        } catch (UserLoveLogExitstException e) {
            return ResponseResult.fail(e.getMessage());
        }
    }

    /**
     * 添加好友
     *
     * @param FriendUserid
     * @param msg
     * @param session
     * @return
     */
    @RequestMapping(value = "/addFriend", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult addFriend(int FriendUserid, String msg, HttpSession session) {
        int userid = (int) session.getAttribute("user.id");
        if (FriendUserid == userid) {
            return ResponseResult.fail("您加自己为好友是为什么呢？(O_O)?");
        }
        if (msg == "") {
            return ResponseResult.fail("验证消息必填");
        }
        int status = 0;
        try {
            status = userAddMsgService.addFriendByFriendUserid(userid, FriendUserid, msg);
            if (status == 1) {
                return ResponseResult.success();
            } else {
                return ResponseResult.fail("添加好友失败，请重试");
            }
        } catch (UserAddMsgExitstException e) {
            return ResponseResult.fail(e.getMessage());
        }
    }

    /**
     * 获取验证信息
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/getAddMsg", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getAddMsg(HttpSession session) {
        int userid = (int) session.getAttribute("user.id");
        List<AddMsgList> addMsgLists = userAddMsgService.findAllByUserid(userid);
        return ResponseResult.success(addMsgLists);
    }

    /**
     * 同意好友申请
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/agreeAddMsg", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult agreeAddMsg(int id) {
        if (id == 0) {
            return ResponseResult.fail("信息错误");
        }

        try {
            userAddMsgService.updateSetStatusAgree(id);
            return ResponseResult.success();
        } catch (UserAddMsgExitstException e) {
            return ResponseResult.fail(e.getMessage());
        }
    }

    /**
     * 拒绝好友申请
     *
     * @param id
     * @param disagreeMsg
     * @return
     */
    @RequestMapping(value = "/disagreeAddMsg", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult disagreeAddMsg(int id, String disagreeMsg) {
        if (id == 0 || disagreeMsg == null) {
            return ResponseResult.fail("信息错误");
        }
        try {
            userAddMsgService.updateSetStatusDisAgree(id, disagreeMsg);
            return ResponseResult.success();
        } catch (UserAddMsgExitstException e) {
            return ResponseResult.fail(e.getMessage());
        }
    }

    /**
     * 设置第一次登陆为1
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/setIsNotFirstLogin", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult setIsNotFirstLogin(HttpSession session) {
        int userid = (int) session.getAttribute("user.id");
        userDefineService.setIsNotFirstLogin(userid);
        return ResponseResult.success();
    }

    /**
     * 修改个人信息
     *
     * @param userDefine
     * @param session
     * @return
     */
    @RequestMapping(value = "/editInfo")
    @ResponseBody
    public ResponseResult editInfo(UserDefine userDefine, HttpSession session) {

        if (userDefine == null) {
            return ResponseResult.success("您没有需要修改的信息");
        }

        int userid = (int) session.getAttribute("user.id");
        UserDefine userDefine1 = userDefineService.selectByUserid(userid);
        String edit_email = userDefine.getEmail();
        String edit_tel = userDefine.getTel();
        String edit_name = userDefine.getName();
        Long edit_birthday = userDefine.getBirthday();
        String edit_instructions = userDefine.getInstructions();
        if (edit_birthday != 0 && userDefine1.getBirthday() == edit_birthday) {
            if (edit_tel != null && userDefine1.getTel().equals(edit_tel)) {
                if (edit_name != null && userDefine1.getName().equals(edit_name)) {
                    if (edit_email != null && userDefine1.getEmail().equals(edit_email)) {
                        if (edit_instructions != null && userDefine1.getInstructions().equals(edit_instructions)) {
                            return ResponseResult.fail("您没有需要修改的信息");
                        }
                    }
                }
            }
        }
        userDefine.setUserid(userid);
        int status = userDefineService.editInfo(userDefine);
        if (status == 1) {
            return ResponseResult.success();
        } else {
            return ResponseResult.fail("修改信息失败，请重试");
        }
    }

    /**
     * 添加印象
     *
     * @param FriendUserid
     * @param msg
     * @param session
     * @return
     */
    @RequestMapping(value = "/addImpression")
    @ResponseBody
    public ResponseResult addImpression(int FriendUserid, String msg, HttpSession session) {
        int userid = (int) session.getAttribute("user.id");
        int status = userImpressionService.addImpression(userid, FriendUserid, msg);
        if (status == 1) {
            return ResponseResult.success();
        } else {
            return ResponseResult.fail("添加评论失败");
        }
    }

    /**
     * 是否有新的消息
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/ajaxGetMsg")
    @ResponseBody
    public ResponseResult ajaxGetMsg(HttpSession session) {
        int userid = (int) session.getAttribute("user.id");
        List<chatMsg> chatMsgs = chatMsgService.getUnReadList(userid);

        if (chatMsgs!=null && chatMsgs.size()!=0){
            return ResponseResult.success();
        }else {
            return ResponseResult.fail();
        }
    }

    /**
     * 获取对方未读消息
     * @param FriendUserid
     * @param session
     * @return
     */
    @RequestMapping(value = "/getUnreadMsg")
    @ResponseBody
    public ResponseResult getUnreadMsg(int FriendUserid , HttpSession session) {
        int userid = (int) session.getAttribute("user.id");
        List<chatMsg> chatMsgs = chatMsgService.getUnreadMsg(userid,FriendUserid);
        return ResponseResult.success(chatMsgs);
    }

    /**
     * 获取好友列表
     * @param session
     * @return
     */
    @RequestMapping(value = "/getFriendList")
    @ResponseBody
    public ResponseResult getFriendList(HttpSession session) {
        int userid = (int) session.getAttribute("user.id");
        List<UserFriendList> UserFriend = userFriendService.selectFriendListByUserid(userid);
        return ResponseResult.success(UserFriend);
    }

    /**
     * 设置好友排序
     * @param id
     * @param sort
     * @param session
     * @return
     */
    @RequestMapping(value = "/setSort")
    @ResponseBody
    public ResponseResult setSort(int id,int sort,HttpSession session) {
        int userid = (int) session.getAttribute("user.id");
        userFriendService.setSort(userid,id,sort);
        return ResponseResult.success();
    }

}
