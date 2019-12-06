package com.itany.dichat.pojo;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4
 * Time: 14:55
 * To change this template use File | Settings | File Templates.
 */
public class ImpressionList implements Serializable {
    private Integer id;
    private Integer LoveNum;
    private String msg;
    private Integer isLove;//是否已经喜欢
    private String Lover;//喜欢者名最长24

    public ImpressionList() {
    }

    public ImpressionList(Integer id, Integer loveNum, String msg, Integer isLove, String lover) {
        this.id = id;
        LoveNum = loveNum;
        this.msg = msg;
        this.isLove = isLove;
        Lover = lover;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLoveNum() {
        return LoveNum;
    }

    public void setLoveNum(Integer loveNum) {
        LoveNum = loveNum;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getIsLove() {
        return isLove;
    }

    public void setIsLove(Integer isLove) {
        this.isLove = isLove;
    }

    public String getLover() {
        return Lover;
    }

    public void setLover(String lover) {
        Lover = lover;
    }
}
