package com.yl.payinterface.core.handle.impl.wallet.xkl350104;

import com.lefu.commons.utils.lang.AmountUtils;
import com.lefu.commons.utils.lang.JsonUtils;
import com.yl.payinterface.core.handle.impl.wallet.xkl350104.utils.XklSignUtil;
import com.yl.payinterface.core.handler.WalletPayHandler;
import com.yl.payinterface.core.model.InterfaceRequest;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * 新快乐支付宝服务窗
 *
 * @author AnLin
 * @version V1.0.0
 * @since 2018/5/2
 */
@Service("walletXkl350104Handler")
public class Xkl350104HandlerImpl implements WalletPayHandler {

    private static final Logger logger = LoggerFactory.getLogger(Xkl350104HandlerImpl.class);

    public static void main(String[] args) {
        Map<String,String> pay = new HashMap<>();
        pay.put("merNo", "888688812147");
        pay.put("orderNo", "TD2018050266668");
        pay.put("transAmt", "1000");
        pay.put("commodityName", "充值啊");
        pay.put("notifyUrl", "https://kd.alblog.cn/front/callback");
        pay.put("paytypeCode", "01");
        pay.put("opUserId", "2088012044464986");
        pay.put("sign", XklSignUtil.signData(pay, "2d72979be0de4f77a15ca25d17e77ab1"));
        Map<String, String> res = XklSignUtil.httpGet(pay, "http://api.kuailefpay.cn/interface/jsApiPay");
        System.out.println(res);
    }

    @Override
    public Map<String, String> pay(Map<String, String> map) {
        Map<String,String> resParams = new HashMap<>();
        Map<String,String> pay = new HashMap<>();
        Properties properties = JsonUtils.toObject(String.valueOf(map.get("tradeConfigs")), new TypeReference<Properties>(){});
        String interfaceRequestID = map.get("interfaceRequestID");
        String amount = String.valueOf((int) AmountUtils.multiply(Double.valueOf(map.get("amount")), 100));
        String productName = map.get("productName");
        String authCode = map.get("authCode");
        try {
            pay.put("merNo", properties.getProperty("merNo"));
            pay.put("orderNo", interfaceRequestID);
            pay.put("transAmt", amount);
            pay.put("commodityName", productName);
            pay.put("notifyUrl", properties.getProperty("notifyUrl"));
            pay.put("paytypeCode", "01");
            pay.put("opUserId", authCode);
            pay.put("sign", XklSignUtil.signData(pay, properties.getProperty("key")));
            Map<String, String> res = XklSignUtil.httpGet(pay, properties.getProperty("url"));
            if("S".equals(res.get("respType"))) {
                resParams.put("code_url", res.get("payInfo"));
                resParams.put("code_img_url", res.get("payInfo"));
                resParams.put("interfaceInfoCode", map.get("interfaceInfoCode"));
                resParams.put("interfaceRequestID", interfaceRequestID);
                resParams.put("gateway", "native");
                resParams.put("merchantNo", properties.getProperty("merNo"));
            }
        } catch (Exception e) {
            logger.error("新快乐支付宝服务窗异常!异常信息:{}", e);
        }
        return resParams;
    }

    @Override
    public Map<String, String> query(Map<String, String> map) {
        return null;
    }

    @Override
    public InterfaceRequest complete(Map<String, Object> map) {
        return null;
    }
}