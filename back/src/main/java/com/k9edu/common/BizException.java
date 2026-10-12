package com.k9edu.common;

/**
 * 业务异常（message 直接展示给用户）
 */
public class BizException extends RuntimeException {

    public BizException(String message) {
        super(message);
    }
}
