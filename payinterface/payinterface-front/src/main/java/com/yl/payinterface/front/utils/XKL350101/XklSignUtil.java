package com.yl.payinterface.front.utils.XKL350101;

import com.lefu.commons.utils.lang.JsonUtils;
import com.lefu.commons.utils.web.HttpClientUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

/**
 * 新快乐 签名工具
 *
 * @author AnLin
 * @version V1.0.0
 * @since 2018/4/8
 */
public class XklSignUtil {

    private static final Logger logger = LoggerFactory.getLogger(XklSignUtil.class);

    /**
     * 签名计算
     * @param params
     * @param key
     * @return
     */
    public static String signData(Map<String, String> params, String key) {
        TreeMap<String, String> tempMap = new TreeMap<String, String>();
        for (Entry<String, String> entry : params.entrySet()) {
            if (StringUtils.isNotBlank(entry.getValue())) {
                tempMap.put(entry.getKey(), entry.getValue());
            }
        }
        StringBuffer buf = new StringBuffer();
        for (String mkey : tempMap.keySet()) {
            buf.append(tempMap.get(mkey));
        }
        String signatureStr = buf + key;
        logger.info("签名明文:" + signatureStr);
        String signData = DigestUtils.sha256Hex(signatureStr.toString()).toLowerCase();
        logger.info("计算的签名:" + signData);
        return signData;
    }
}