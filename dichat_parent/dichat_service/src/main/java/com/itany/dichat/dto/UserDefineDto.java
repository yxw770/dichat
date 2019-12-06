package com.itany.dichat.dto;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */

import java.io.InputStream;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 8:43
 * File Name: 
 */
public class UserDefineDto {
    private String username;
    private String password;
    private long birthday;
    private String tel;
    private String name;
    private String email;
    private InputStream inputStream;//文件输入流
    private String fileName;//文件名
    private String uploadPath;//文件上传目录

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getBirthday() {
        return birthday;
    }

    public void setBirthday(long birthday) {
        this.birthday = birthday;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
