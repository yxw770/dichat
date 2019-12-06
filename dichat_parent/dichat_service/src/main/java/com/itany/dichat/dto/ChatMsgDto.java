package com.itany.dichat.dto;/**
 * @author:GodFrey
 * @date:2019/12/3/003.
 */

import java.io.InputStream;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/3/003
 * Time: 11:41
 * File Name: 
 */
public class ChatMsgDto {
    private Integer sendUserid;
    private Integer toUserid;
    private InputStream inputStream;//文件输入流
    private String fileName;//文件名
    private String uploadPath;//文件上传目录

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

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getUploadPath() {
        return uploadPath;
    }

    public void setUploadPath(String uploadPath) {
        this.uploadPath = uploadPath;
    }
}
