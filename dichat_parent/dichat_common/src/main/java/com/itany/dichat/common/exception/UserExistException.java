package com.itany.dichat.common.exception;/**
 * @author:GodFrey
 * @date:2019/12/1/001.
 */

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/1/001
 * Time: 19:46
 * File Name: 
 */
public class UserExistException extends Exception {
    public UserExistException() {
        super();
    }

    public UserExistException(String message) {
        super(message);
    }

    public UserExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserExistException(Throwable cause) {
        super(cause);
    }
}
