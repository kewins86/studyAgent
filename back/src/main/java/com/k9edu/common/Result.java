package com.k9edu.common;

import lombok.Data;

/**
 * 统一返回体
 * <p>
 * 所有接口统一返回：{code, message, data}
 * code=0 成功；非 0 失败（业务错误码 1xxx，系统错误 5xxx）
 */
@Data
public class Result<T> {

    private int code;
    private String message;
    private T data;

    public static <T> Result<T> ok(T data) {
        Result<T> r = new Result<>();
        r.code = 0;
        r.message = "success";
        r.data = data;
        return r;
    }

    public static <T> Result<T> ok() {
        return ok(null);
    }

    public static <T> Result<T> fail(int code, String message) {
        Result<T> r = new Result<>();
        r.code = code;
        r.message = message;
        return r;
    }

    public static <T> Result<T> fail(String message) {
        return fail(1000, message);
    }
}
