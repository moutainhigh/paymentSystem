package com.yl.online.gateway.dao;

import com.yl.online.gateway.bean.License;
import org.apache.ibatis.annotations.Param;

/**
 * 扫码入网数据接口
 * 
 * @author 聚合支付有限公司
 * @since 2016年9月8日
 * @version V1.0.0
 */
public interface LicenseDao {
	/**
	 * 第一步
	 * @param license
	 */
	void licenseLoginInfo(License license);
	
	/**
	 * 第二步
	 * @param license
	 */
	void licenseBaseInfo(License license);
	
	/**
	 * 第三部
	 * @param license
	 */
	void licenseBankCard(License license);
	
	/**
	 * 检测手机号是否存在
	 * @param phone
	 * @return
	 */
	License checkPhone(String phone);
	
	/**
	 * 检测商户名是否存在
	 * @param fullName
	 * @return
	 */
	License checkFullName(String fullName);
	
	/**
	 * 步骤获取
	 * @param cardNo
	 * @param checkCode
	 * @return
	 */
	License getInfo(@Param("cardNo")String cardNo, @Param("checkCode")String checkCode);
	
	/**
	 * 信息获取
	 * @param id
	 * @return
	 */
	License findById(@Param("id")int id);
	
	/**
	 * 修改第一步
	 * @param license
	 */
	void again(License license);
}