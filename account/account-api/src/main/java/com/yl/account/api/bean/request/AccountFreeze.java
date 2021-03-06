package com.yl.account.api.bean.request;

import java.util.Date;

import javax.validation.constraints.Future;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

/**
 * 账户冻结请求
 * 
 * @author 聚合支付有限公司
 * @since 2016年2月24日
 * @version V1.0.0
 */
public class AccountFreeze extends TradeVoucher {

	private static final long serialVersionUID = -2994378241968724767L;

	/** 账号 */
	@NotBlank
	private String accountNo;
	/** 冻结金额 */
	@NotNull
	@Min(value = 0)
	private double freezeAmount;
	/** 冻结期限 */
	@NotNull
	@Future
	private Date freezeLimit;

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public double getFreezeAmount() {
		return freezeAmount;
	}

	public void setFreezeAmount(double freezeAmount) {
		this.freezeAmount = freezeAmount;
	}

	public Date getFreezeLimit() {
		return freezeLimit;
	}

	public void setFreezeLimit(Date freezeLimit) {
		this.freezeLimit = freezeLimit;
	}

}
