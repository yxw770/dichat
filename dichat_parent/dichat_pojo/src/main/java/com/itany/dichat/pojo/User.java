package com.itany.dichat.pojo;/**
 * @author:GodFrey
 * @date:2019/12/1/001.
 */

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/1/001
 * Time: 19:20
 * File Name: 
 */
public class User implements Serializable {
    private Integer id;
    private String username;
    private String password;

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    private String sessionId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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
}
