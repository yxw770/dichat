package com.itany.dichat.a.web.vo;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 7:48
 * File Name: 
 */
public class UserDefineVo {
    private String username;
    private String password;
    private long birthday;
    private String tel;
    private String name;
    private String email;
    private CommonsMultipartFile file;
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

    public CommonsMultipartFile getFile() {
        return file;
    }

    public void setFile(CommonsMultipartFile file) {
        this.file = file;
    }


}
