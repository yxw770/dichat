package com.itany.dichat.pojo;/**
 * @author:GodFrey
 * @date:2019/12/2/002.
 */

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/2/002
 * Time: 7:15
 * File Name: 
 */
public class UserDefine implements Serializable {
    private int id;
    private int userid;
    private long create_at;
    private String name;
    private long birthday;
    private String tel;
    private String email;
    private String instructions;
    private String headPortrait;
    private int isFristLogin;
    public long getBirthday() {
        return birthday;
    }

    public void setBirthday(long birthday) {
        this.birthday = birthday;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    public long getCreate_at() {
        return create_at;
    }

    public void setCreate_at(long create_at) {
        this.create_at = create_at;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }





    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public String getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait;
    }

    public int getIsFristLogin() {
        return isFristLogin;
    }

    public void setIsFristLogin(int isFristLogin) {
        this.isFristLogin = isFristLogin;
    }
}
