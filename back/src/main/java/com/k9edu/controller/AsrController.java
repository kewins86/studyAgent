package com.k9edu.controller;

import com.k9edu.common.Result;
import com.k9edu.service.IflytekAsrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 讯飞 ASR 签名接口（前端用签名直连讯飞 WebSocket，不暴露 APIKey/Secret）
 */
@RestController
@RequestMapping("/api/asr")
public class AsrController {

    @Autowired
    private IflytekAsrService iflytekAsrService;

    /**
     * 获取讯飞流式听写 WebSocket 连接参数（含签名）
     * 前端拿到后直接连 wss://ws-api.xfyun.cn/v2/iat
     */
    @GetMapping("/signature")
    public Result<Map<String, String>> getSignature() {
        Map<String, String> params = iflytekAsrService.buildSignature();
        return Result.ok(params);
    }
}
