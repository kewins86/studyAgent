package com.k9edu.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 讯飞 ASR 签名服务（WebSocket 鉴权）
 * 参考：https://www.xfyun.cn/doc/asr/voicedictation/API.html
 */
@Service
public class IflytekAsrService {

    @Value("${iflytek.app-id}")
    private String appId;

    @Value("${iflytek.api-key}")
    private String apiKey;

    @Value("${iflytek.api-secret}")
    private String apiSecret;

    @Value("${iflytek.host:ws-api.xfyun.cn}")
    private String host;

    @Value("${iflytek.path:/v2/iat}")
    private String path;

    /**
     * 构建 WebSocket 连接参数（含签名）
     * 前端用这些参数拼接 wss URL 并连讯飞
     */
    public Map<String, String> buildSignature() {
        try {
            String date = getRfc1123Date();
            String signatureOrigin = String.format("host: %s\ndate: %s\nGET %s HTTP/1.1", host, date, path);

            // HMAC-SHA256 签名
            Mac mac = Mac.getInstance("HmacSHA256");
            SecretKeySpec spec = new SecretKeySpec(apiSecret.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
            mac.init(spec);
            byte[] signatureBytes = mac.doFinal(signatureOrigin.getBytes(StandardCharsets.UTF_8));
            String signature = Base64.getEncoder().encodeToString(signatureBytes);

            // 授权头
            String authorizationOrigin = String.format("api_key=\"%s\", algorithm=\"hmac-sha256\", headers=\"host date request-line\", signature=\"%s\"", apiKey, signature);
            String authorization = Base64.getEncoder().encodeToString(authorizationOrigin.getBytes(StandardCharsets.UTF_8));

            Map<String, String> result = new HashMap<>();
            result.put("appId", appId);
            result.put("host", host);
            result.put("path", path);
            result.put("date", date);
            result.put("authorization", authorization);
            // WebSocket URL 示例（前端拼接）：
            // wss://ws-api.xfyun.cn/v2/iat?authorization=xxx&date=xxx&host=ws-api.xfyun.cn
            return result;

        } catch (Exception e) {
            throw new RuntimeException("讯飞 ASR 签名生成失败", e);
        }
    }

    private String getRfc1123Date() {
        SimpleDateFormat sdf = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);
        sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
        return sdf.format(new Date());
    }
}
