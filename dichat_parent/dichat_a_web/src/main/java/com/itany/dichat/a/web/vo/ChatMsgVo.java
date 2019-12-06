package com.itany.dichat.a.web.vo;/**
 * @author:GodFrey
 * @date:2019/12/3/003.
 */

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/3/003
 * Time: 11:38
 * File Name: 
 */
public class ChatMsgVo {
    private Integer sendUserid;
    private Integer toUserid;
    private CommonsMultipartFile file;

    public Integer getSendUserid() {
        return sendUserid;
    }

    public void setSendUserid(Integer sendUserid) {
        this.sendUserid = sendUserid;
    }

    public Integer getToUserid() {
        return toUserid;
    }

    public void setToUserid(Integer toUserid) {
        this.toUserid = toUserid;
    }

    public CommonsMultipartFile getFile() {
        return file;
    }

    public void setFile(CommonsMultipartFile file) {
        this.file = file;
    }
}
