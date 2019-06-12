package com.yl.client.front.common;

import java.security.MessageDigest;

/**
 * MD5工具类
 * 
 * @author 聚合支付有限公司
 * @since 2016年9月17日
 * @version V1.0.0
 */
public class MD5 {
	  private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5",
	      "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	  /**
	   * 转换字节数组为16进制字串
	   * 
	   * @param b
	   *            字节数组
	   * @return 16进制字串
	   */

	  public static String byteArrayToHexString(byte[] b) {
	    StringBuffer resultSb = new StringBuffer();
	    for (int i = 0; i < b.length; i++) {
	      resultSb.append(byteToHexString(b[i]));
	    }
	    return resultSb.toString();
	  }

	  private static String byteToHexString(byte b) {
	    int n = b;
	    if (n < 0)
	      n = 256 + n;
	    int d1 = n / 16;
	    int d2 = n % 16;
	    return hexDigits[d1] + hexDigits[d2];
	  }
	  
	  public final static String MD5Encode16(String s){
		  return MD5Encode(s).substring(6, 22);
	  }
	  
	  public final static String MD5Encode(String s, String charset) {
	      try {
	          byte[] btInput = s.getBytes(charset);
	          MessageDigest mdInst = MessageDigest.getInstance("MD5");
	          mdInst.update(btInput);
	          byte[] md = mdInst.digest();
	          StringBuffer sb = new StringBuffer();
	          for (int i = 0; i < md.length; i++) {
	              int val = ((int) md[i]) & 0xff;
	              if (val < 16){
	              	sb.append("0");
	              }
	              sb.append(Integer.toHexString(val));
	          }
	          return sb.toString();
	      } catch (Exception e) {
	          return null;
	      }
	  }


	  public static String MD5Encode(String origin) {
	    String resultString = null;

	    try {
	      resultString = new String(origin);
	      MessageDigest md = MessageDigest.getInstance("MD5");
	      resultString = byteArrayToHexString(md.digest(resultString
	          .getBytes()));
	    } catch (Exception ex) {

	    }
	    return resultString;
	  }

	}