package com.yl.payinterface.core.handle.impl.quick.hxt100001;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;

import org.apache.commons.codec.binary.Base64;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.lefu.commons.cache.util.CacheUtils;
import com.lefu.commons.utils.lang.AmountUtils;
import com.lefu.commons.utils.lang.JsonUtils;
import com.lefu.commons.utils.lang.StringUtils;
import com.yl.boss.api.bean.CustomerFee;
import com.yl.boss.api.bean.TransCardBean;
import com.yl.boss.api.enums.CardAttr;
import com.yl.boss.api.enums.CardStatus;
import com.yl.boss.api.interfaces.CustomerInterface;
import com.yl.payinterface.core.C;
import com.yl.payinterface.core.enums.BusinessCompleteType;
import com.yl.payinterface.core.enums.FeeType;
import com.yl.payinterface.core.exception.BusinessRuntimeException;
import com.yl.payinterface.core.handle.impl.auth.hxt100001.utils.HXTCommonUtils;
import com.yl.payinterface.core.handle.impl.wallet.cib330000.WxSign;
import com.yl.payinterface.core.handler.BindCardHandler;
import com.yl.payinterface.core.handler.QuickPayHandler;
import com.yl.payinterface.core.model.InterfaceRequest;
import com.yl.payinterface.core.service.InterfaceInfoService;
import com.yl.payinterface.core.service.InterfaceRequestService;
import com.yl.payinterface.core.service.QuickPayFeeService;
import com.yl.payinterface.core.utils.CodeBuilder;
import com.yl.payinterface.core.utils.FeeUtils;
import com.yl.payinterface.core.utils.HolidayUtils;

@Service("quickHxt100001Handler")
public class HXT100001Handler implements QuickPayHandler, BindCardHandler {

	private static Logger logger = LoggerFactory.getLogger(HXT100001Handler.class);

	private static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
	@Resource
	private CustomerInterface customerInterface;
	@Resource
	private InterfaceRequestService interfaceRequestService;
	@Resource
	private InterfaceInfoService interfaceInfoService;
	@Resource
	private QuickPayFeeService quickPayFeeService;

	@Override
	public Map<String, String> sendVerifyCode(Map<String, String> params) {

		Properties properties = JsonUtils.toObject(String.valueOf(params.get("tradeConfigs")), new TypeReference<Properties>() {
		});
		InterfaceRequest interfaceRequest = interfaceRequestService.queryByInterfaceRequestID(params.get("interfaceRequestID"));
		String key = properties.getProperty("key");
		String retKey = properties.getProperty("retKey");
		String agentId = properties.getProperty("agentId");
		String merId = properties.getProperty("merId");
		String cardNo = params.get("cardNo");
		String token = params.get("token");

		String timeStr = simpleDateFormat.format(new Date());
		try {
			CacheUtils.setEx("SENDVERIFYCODE:" + token, timeStr, 900);
		} catch (Exception e) {
			logger.error("恒信通认证支付 缓存绑卡信息异常 接口编号:[{}],卡号:[{}],异常信息：[{}]", params.get("interfaceInfoCode"), params.get("cardNo"), e);
		}

		SortedMap<Object, Object> reqMap = new TreeMap<Object, Object>();

		// 检查交易卡信息
		checkCardInfo(reqMap, interfaceRequest.getOwnerID(), params.get("cardNo"));
		// 获取结算卡信息
		quickPayFeeService.getSettleInfo(reqMap, interfaceRequest.getOwnerID(), cardNo);
		// 保存交易卡历史信息
		quickPayFeeService.saveTransCardHis(cardNo, interfaceRequest);

		reqMap.put("version", "1.0.1");
		reqMap.put("agentId", agentId);
		reqMap.put("merId", merId);
		reqMap.put("orderId", interfaceRequest.getInterfaceRequestID());
		reqMap.put("txnTime", timeStr);
		reqMap.put("txnAmt", String.valueOf((int) AmountUtils.multiply(interfaceRequest.getAmount(), 100)));
		reqMap.put("token", token);

		String sign = WxSign.createSign(reqMap, key);
		reqMap.put("sign", sign);
		String reqBody = JSON.toJSONString(reqMap);
		Map<String, String> retMap = new HashMap<>();
		try {
			logger.info("恒信通认证支付 获取验证码请求明文  接口请求号:[{}],卡号:[{}],请求报文:[{}]", interfaceRequest.getInterfaceRequestID(), params.get("cardNo"), reqBody);
			String response = HXTCommonUtils.sendReq(properties.getProperty("verifyCodeUrl"), reqBody, "POST");
			logger.info("恒信通认证支付 获取验证码响应报文  接口请求号:[{}],卡号:[{}],响应报文:[{}]", interfaceRequest.getInterfaceRequestID(), params.get("cardNo"), response);
			SortedMap<Object, Object> res = JsonUtils.toObject(response, TreeMap.class);

			String retSign = WxSign.createSign(res, retKey);
			retMap.put("interfaceRequestID", interfaceRequest.getInterfaceRequestID());
			if (retSign.equals(res.get("sign"))) {
				if ("00".equals(res.get("respCode"))) {
					retMap.put("orderCode", interfaceRequest.getBussinessOrderID());
					retMap.put("payCardNo", params.get("cardNo"));
					retMap.put("settleCardNo", reqMap.get("cardNo").toString());
					retMap.put("payerName", reqMap.get("realName").toString());
					retMap.put("certNo", reqMap.get("identityCard").toString());
					retMap.put("phone", reqMap.get("phoneNo").toString());
					retMap.put("responseCode", "00");
					retMap.put("token", params.get("token"));
					retMap.put("amount", Double.toString(interfaceRequest.getAmount()));
					retMap.put("interfaceCode", interfaceRequest.getInterfaceInfoCode());
					retMap.put("responseCode", "00");

					String cacheKey = CodeBuilder.getOrderIdByUUId();
					Map<String, String> bindCardInfo = new HashMap<>();
					bindCardInfo.put("interfaceRequestID", interfaceRequest.getInterfaceRequestID());
					bindCardInfo.put("interfaceCode", params.get("interfaceInfoCode"));
					bindCardInfo.put("token", params.get("token"));
					bindCardInfo.put("cardNo", params.get("cardNo"));
					retMap.put("key", cacheKey);
					try {
						CacheUtils.setEx("BINDCARD:" + cacheKey, JsonUtils.toJsonString(bindCardInfo), 900);
					} catch (Exception e) {
						logger.error("恒信通认证支付 缓存绑卡信息异常 接口编号:[{}],卡号:[{}],异常信息：[{}]", params.get("interfaceInfoCode"), params.get("cardNo"), e);
					}
				} else {
					retMap.put("responseCode", "2001");
					retMap.put("responseMessage", "短信验证码发送失败");
				}
				retMap.put("cardNo", params.get("cardNo"));
				retMap.put("interfaceInfoCode", params.get("interfaceInfoCode"));
				retMap.put("gateway", "quickPay");
			} else {
				// 0002 验签失败
				throw new BusinessRuntimeException("2002");
			}

		} catch (Exception e) {
			if (e instanceof BusinessRuntimeException) {
				retMap.put("responseCode", e.getMessage().equals("2002") || e.getMessage().equals("2003") ? "2001" : e.getMessage());
				retMap.put("interfaceRequestID", params.get("interfaceRequestID"));
				return retMap;
			}
			logger.error("恒信通认证支付 获取验证码异常 接口请求号:[{}],卡号:[{}],异常信息：[{}]", interfaceRequest.getInterfaceRequestID(), params.get("cardNo"), e);
			throw new RuntimeException(e.getMessage());
		}

		return retMap;
	}

	@Override
	public Map<String, String> authPay(Map<String, String> map) {
		return sendVerifyCode(map);
	}

	@Override
	public Map<String, String> sale(Map<String, String> params) {
		Properties properties = JsonUtils.toObject(String.valueOf(params.get("tradeConfigs")), new TypeReference<Properties>() {
		});
		String key = properties.getProperty("key");
		String retKey = properties.getProperty("retKey");
		String cardNo = params.get("cardNo");
		String token = params.get("token");
		String smsCode = params.get("smsCode");
		String agentId = properties.getProperty("agentId");
		String merId = properties.getProperty("merId");
		String saleBackUrl = properties.getProperty("saleBackUrl");
		String withdrawUrl = properties.getProperty("withdrawUrl");
		String interfaceRequestId = params.get("interfaceRequestID");

		InterfaceRequest interfaceRequest = JsonUtils.toObject(params.get("interfaceRequest"), InterfaceRequest.class);

		SortedMap<Object, Object> reqMap = new TreeMap<Object, Object>();
		String timeStr = CacheUtils.get("SENDVERIFYCODE:" + token, String.class);
		String settleAmount;
		String remark = interfaceRequest.getRemark();
		// 如果备注不为空
		if (org.apache.commons.lang3.StringUtils.isNotBlank(remark)) {
			try {
				// 判断字符串中是否有settleType字段
				if (remark.contains("settleType")) {
					Map<String, String> map = JsonUtils.toObject(remark, new TypeReference<Map<String, String>>() {
					});
					// 如果类型是金额
					if (C.SETTLE_TYPE_AMOUNT.equals(map.get("settleType"))) {
						settleAmount = String.valueOf((int) AmountUtils.multiply(Double.valueOf(map.get("settleAmount")), 100));
					} else {
						throw new BusinessRuntimeException("9010");
					}
				} else {
					settleAmount = String.valueOf((int) AmountUtils.multiply(Double.valueOf(remark), 100));
				}
			} catch (Exception e) {
				throw new BusinessRuntimeException("9010");
			}
		} else {
			settleAmount = quickPayFeeService.getSettleAmountInCents(interfaceRequest.getOwnerID(), interfaceRequest.getAmount());
		}

		reqMap.put("version", "1.0.1");
		reqMap.put("agentId", agentId);
		reqMap.put("merId", merId);
		reqMap.put("backUrl", saleBackUrl);
		reqMap.put("withdrawUrl", withdrawUrl);
		reqMap.put("orderId", interfaceRequestId);
		reqMap.put("txnTime", timeStr);
		reqMap.put("txnAmt", String.valueOf((int) AmountUtils.multiply(interfaceRequest.getAmount(), 100)));
		reqMap.put("token", token);
		reqMap.put("smsCode", smsCode);
		reqMap.put("settleCycle", "0");
		reqMap.put("settleAmt", settleAmount);

		String sign = WxSign.createSign(reqMap, key);
		reqMap.put("sign", sign);
		String reqBody = JSON.toJSONString(reqMap);
		Map<String, String> retMap = new HashMap<>();

		try {
			logger.info("恒信通认证支付 消费请求明文  接口请求号:[{}],卡号:[{}],请求报文:[{}]", interfaceRequest.getInterfaceRequestID(), params.get("cardNo"), reqBody);
			String response = HXTCommonUtils.sendReq(properties.getProperty("saleUrl"), reqBody, "POST");
			logger.info("恒信通认证支付 消费响应报文  接口请求号:[{}],卡号:[{}],响应报文:[{}]", interfaceRequest.getInterfaceRequestID(), params.get("cardNo"), response);
			SortedMap<Object, Object> res = JsonUtils.toObject(response, TreeMap.class);

			String retSign = WxSign.createSign(res, retKey);
			if (retSign.equals(res.get("sign"))) {
				if ("00".equals(res.get("respCode"))) {
					retMap.put("tranStat", "UNKNOWN");
					retMap.put("responseCode", "01");
					retMap.put("responseMessage", "交易成功，扣款状态未知");
				} else {
					retMap.put("responseCode", "2001");
					retMap.put("responseMessage", "交易失败");
					retMap.put("tranStat", "FAILED");
					retMap.put("businessCompleteType", BusinessCompleteType.NORMAL.name());
				}
			} else {
				// 0002 验签失败
				throw new BusinessRuntimeException("2002");
			}
		} catch (Exception e) {
			logger.error("恒信通认证支付 消费异常 接口编号:[{}],卡号:[{}],异常信息：[{}]", params.get("interfaceInfoCode"), params.get("cardNo"), e);
			throw new RuntimeException(e.getMessage());
		}

		return retMap;
	}

	@Override
	public Map<String, String> query(Map<String, String> params) {
		Properties properties = JsonUtils.toObject(String.valueOf(params.get("tradeConfigs")), new TypeReference<Properties>() {
		});
		String key = properties.getProperty("key");
		String retKey = properties.getProperty("retKey");
		String cardNo = params.get("cardNo");
		String requestNo = params.get("requestNo");
		String agentId = properties.getProperty("agentId");
		String merId = properties.getProperty("merId");

		SortedMap<Object, Object> reqMap = new TreeMap<Object, Object>();
		String timeStr = simpleDateFormat.format(new Date());

		reqMap.put("version", "1.0.1");
		reqMap.put("agentId", agentId);
		reqMap.put("merId", merId);
		reqMap.put("orderId", requestNo);
		reqMap.put("txnTime", timeStr);

		String sign = WxSign.createSign(reqMap, key);
		reqMap.put("sign", sign);
		String reqBody = JSON.toJSONString(reqMap);
		Map<String, String> retMap = new HashMap<>();

		try {
			logger.info("恒信通认证支付 查询请求明文  接口编号:[{}],卡号:[{}],请求报文:[{}]", params.get("interfaceCode"), params.get("cardNo"), reqBody);
			String response = HXTCommonUtils.sendReq(properties.getProperty("querySaleUrl"), reqBody, "POST");
			logger.info("恒信通认证支付 查询响应报文  接口编号:[{}],卡号:[{}],响应报文:[{}]", params.get("interfaceCode"), params.get("cardNo"), response);
			SortedMap<Object, Object> res = JsonUtils.toObject(response, TreeMap.class);

			String retSign = WxSign.createSign(res, retKey);
			if (retSign.equals(res.get("sign"))) {
				if ("00".equals(res.get("respCode")) && "00".equals(res.get("origRespCode"))) {
					retMap.put("interfaceRequestID", params.get("requestNo"));
					retMap.put("tranStat", "SUCCESS");
					if (StringUtils.notBlank(res.get("txnAmt") + "")) {
						double amount = AmountUtils.divide(Double.valueOf(res.get("txnAmt") + "").doubleValue(), 100.0D);
						retMap.put("amount", Double.toString(amount));
					}
					retMap.put("responseCode", "9001");
					retMap.put("responseMsg", "扣款成功，付款未知");
					retMap.put("interfaceOrderID", res.get("orderId") + "");
				} else {
					retMap.put("tranStat", "UNKNOWN");
					retMap.put("responseCode", res.get("respCode") + "");
					retMap.put("responseMsg", res.get("respMsg") + "");
				}
			} else {
				throw new RuntimeException("恒信通证支付 查询响应报文 验签失败");
			}
		} catch (Exception e) {
			logger.error("恒信通认证支付 查询异常 接口编号:[{}],卡号:[{}],异常信息：[{}]", params.get("interfaceInfoCode"), params.get("cardNo"), e);
			throw new RuntimeException(e.getMessage());
		}

		return retMap;
	}

	@Override
	public Map<String, String> bindCard(Map<String, String> params) {
		Properties properties = JsonUtils.toObject(String.valueOf(params.get("tradeConfigs")), new TypeReference<Properties>() {
		});
		String key = properties.getProperty("key");
		String retKey = properties.getProperty("retKey");
		String cardNo = params.get("cardNo");
		String agentId = properties.getProperty("agentId");
		String merId = properties.getProperty("merId");
		String frontUrl = properties.getProperty("frontUrl");
		String backUrl = properties.getProperty("backUrl");

		SortedMap<Object, Object> reqMap = new TreeMap<Object, Object>();
		String timeStr = simpleDateFormat.format(new Date());
		// String orderId = System.currentTimeMillis() + "";

		reqMap.put("version", "1.0.1");
		reqMap.put("agentId", agentId);
		reqMap.put("merId", merId);
		reqMap.put("frontUrl", frontUrl);
		reqMap.put("backUrl", backUrl);
		reqMap.put("orderId", cardNo);
		reqMap.put("txnTime", timeStr);
		reqMap.put("cardNo", cardNo);

		String sign = WxSign.createSign(reqMap, key);
		reqMap.put("sign", sign);
		String reqBody = JSON.toJSONString(reqMap);
		Map<String, String> retMap = new HashMap<>();
		try {
			logger.info("恒信通认证支付 绑卡请求明文  接口编号:[{}],卡号:[{}],请求报文:[{}]", params.get("interfaceCode"), params.get("cardNo"), reqBody);
			String response = HXTCommonUtils.sendReq(properties.getProperty("bindCardUrl"), reqBody, "POST");
			logger.info("恒信通认证支付 绑卡响应报文  接口编号:[{}],卡号:[{}],响应报文:[{}]", params.get("interfaceCode"), params.get("cardNo"), response);
			SortedMap<Object, Object> res = JsonUtils.toObject(response, TreeMap.class);

			String retSign = WxSign.createSign(res, retKey);
			if (retSign.equals(res.get("sign"))) {
				if ("00".equals(res.get("respCode"))) {
					String html = new String(Base64.decodeBase64(res.get("html") + ""));
					retMap.put("html", html);
					retMap.put("responseCode", "00");

					Map<String, String> bindCardInfo = new HashMap<>();
					bindCardInfo.put("tradeOrderCode", params.get("tradeOrderCode"));
					bindCardInfo.put("amount", params.get("amount"));
					bindCardInfo.put("interfaceCode", params.get("interfaceCode"));
					try {
						CacheUtils.setEx("BINDCARD:" + cardNo, JsonUtils.toJsonString(bindCardInfo), 900);
					} catch (Exception e) {
						logger.error("恒信通认证支付 缓存绑卡信息异常 接口编号:[{}],卡号:[{}],异常信息：[{}]", params.get("interfaceInfoCode"), params.get("cardNo"), e);
					}
				} else {
					retMap.put("responseCode", "01");
				}
				retMap.put("cardNo", params.get("cardNo"));
				retMap.put("interfaceInfoCode", params.get("interfaceInfoCode"));
				retMap.put("gateway", "htmlSubmit");
			}
		} catch (Exception e) {
			logger.error("恒信通认证支付 绑卡异常 接口编号:[{}],卡号:[{}],异常信息：[{}]", params.get("interfaceInfoCode"), params.get("cardNo"), e);
			throw new RuntimeException(e.getMessage());
		}
		return retMap;
	}

	@Override
	public Map<String, String> queryBindCard(Map<String, String> params) {

		Properties properties = JsonUtils.toObject(String.valueOf(params.get("tradeConfigs")), new TypeReference<Properties>() {
		});
		String key = properties.getProperty("key");
		String retKey = properties.getProperty("retKey");
		String orderId = params.get("cardNo");
		String agentId = properties.getProperty("agentId");
		String merId = properties.getProperty("merId");

		SortedMap<Object, Object> reqMap = new TreeMap<Object, Object>();
		String timeStr = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());// params.get("timeStr");

		reqMap.put("version", "1.1.0");
		reqMap.put("agentId", agentId);
		reqMap.put("merId", merId);
		reqMap.put("orderId", orderId);
		reqMap.put("txnTime", timeStr);
		String sign = WxSign.createSign(reqMap, key);
		reqMap.put("sign", sign);

		String reqBody = JSON.toJSONString(reqMap);
		Map<String, String> retMap = new HashMap<>();

		try {
			logger.info("恒信通认证支付 查询绑卡请求明文  接口编号:[{}],卡号:[{}],请求报文:[{}]", params.get("interfaceCode"), params.get("cardNo"), reqBody);
			String response = HXTCommonUtils.sendReq(properties.getProperty("bindCardQueryUrl"), reqBody, "POST");
			logger.info("恒信通认证支付 查询绑卡响应报文  接口编号:[{}],卡号:[{}],响应报文:[{}]", params.get("interfaceCode"), params.get("cardNo"), response);
			SortedMap<Object, Object> res = JsonUtils.toObject(response, TreeMap.class);

			String retSign = WxSign.createSign(res, retKey);
			if (retSign.equals(res.get("sign"))) {
				if ("00".equals(res.get("respCode"))) {
					retMap.put("token", res.get("tokenPayData") + "");
					retMap.put("responseCode", "00");
				} else {
					retMap.put("responseCode", "01");
				}
				retMap.put("cardNo", params.get("cardNo"));
				retMap.put("interfaceInfoCode", params.get("interfaceInfoCode"));
			}
		} catch (Exception e) {
			logger.error("恒信通认证支付 查询 绑卡异常 接口编号:[{}],卡号:[{}],异常信息：[{}]", params.get("interfaceInfoCode"), params.get("cardNo"), e);
			throw new RuntimeException(e.getMessage());
		}

		return retMap;
	}

	private void checkCardInfo(Map<Object, Object> map, String ownerId, String cardNo) {
		TransCardBean transCardBean = customerInterface.findTransCardByAccNo(ownerId, cardNo, CardAttr.TRANS_CARD);
		if (transCardBean == null) {
			throw new BusinessRuntimeException("3009");
		}
		if (transCardBean.getCardStatus() != CardStatus.NORAML) {
			throw new BusinessRuntimeException("3008");
		}
		map.put("phoneNo", transCardBean.getPhone());
	}

	/**
	 * 返回单位为分的结算金额
	 * @param ownerId
	 * @param amount
	 * @return
	 */
	private String getSettleAmount(String ownerId, double amount) {
		// 获取商户费率 结算手续费
		CustomerFee remitFee;
		if (HolidayUtils.isHoliday()) {
			remitFee = customerInterface.getCustomerFee(ownerId, "HOLIDAY_REMIT");
			if (remitFee == null) {
				throw new BusinessRuntimeException("3005");
			}
		} else {
			remitFee = customerInterface.getCustomerFee(ownerId, "REMIT");
			if (remitFee == null) {
				throw new BusinessRuntimeException("3004");
			}
		}
		CustomerFee authFee = customerInterface.getCustomerFee(ownerId, "QUICKPAY");
		if (authFee == null) {
			throw new BusinessRuntimeException("3006");
		}
		double custFee = FeeUtils.computeFee(amount, FeeType.valueOf(authFee.getFeeType().name()), authFee.getFee());
		if (AmountUtils.leq(AmountUtils.subtract(amount, custFee), remitFee.getFee())) {
			throw new BusinessRuntimeException("3007");
		}

		String settleAmount = String.valueOf((int) AmountUtils.multiply(AmountUtils.subtract(AmountUtils.subtract(amount, custFee), remitFee.getFee()), 100));
		return settleAmount;
	}

}
