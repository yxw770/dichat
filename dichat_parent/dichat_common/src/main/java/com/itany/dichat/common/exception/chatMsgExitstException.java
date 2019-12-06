package com.itany.dichat.common.exception;/**
 * @author:GodFrey
 * @date:2019/12/3/003.
 */

/**
 * Created by IntelliJ IDEA.
 * User: Godfrey
 * Date: 2019/12/3/003
 * Time: 11:22
 * File Name: 
 */
public class chatMsgExitstException extends Exception {
    public chatMsgExitstException() {
        super();
    }

    public chatMsgExitstException(String message) {
        super(message);
    }

    public chatMsgExitstException(String message, Throwable cause) {
        super(message, cause);
    }

    public chatMsgExitstException(Throwable cause) {
        super(cause);
    }
}
