package com.itany.dichat.common.exception;/**
 * @author:GodFrey
 * @date:2019/12/4/004.
 */

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/4/004
 * Time: 19:51
 * File Name: 
 */
public class UserAddMsgExitstException extends Exception {
    public UserAddMsgExitstException() {
        super();
    }

    public UserAddMsgExitstException(String message) {
        super(message);
    }

    public UserAddMsgExitstException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserAddMsgExitstException(Throwable cause) {
        super(cause);
    }
}
