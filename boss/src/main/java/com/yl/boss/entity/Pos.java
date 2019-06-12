package com.yl.boss.entity;

import com.yl.boss.enums.RunStatus;
import com.yl.boss.enums.Status;
import com.yl.boss.enums.TransType;

import javax.persistence.*;
import java.util.Date;

/**
 * POS终端
 *
 * @author 聚合支付有限公司
 * @since 2016年8月11日
 * @version V1.0.0
 */

@Entity
@Table(name = "POS")
public class Pos extends AutoIDEntity{

	private static final long serialVersionUID = 1L;
	
	private String posCati;			//POS终端号
	private Customer customer;		//所属商户
	private String posBrand;		//品牌
	private String type;			//POS机型号
	private Shop shop;				//所属网点
	private Status status;			//状态
	private RunStatus runStatus;	//运行状态
	private String batchNo;			//批次号
	private String operator;		//操作员
	private String posSn;			//POS机具序列号
	private String softVersion;		//当前软件版本号
	private String paramVersion;	//当前参数版本号
	private String mKey;			//主密钥(密文)
	private Date lastSigninTime;	//最后签到时间
	private Date createTime;		//创建时间
	private String posType;			//大pos，小pos
	private String customerNo;		//商户编号
	private String shopNo;			//网点编号
	private TransType routeType;    //交易类型
	private String agentNo;			//服务商编号

	@Column(name = "POS_CATI", length = 20)
	public String getPosCati() {
		return posCati;
	}
	public void setPosCati(String posCati) {
		this.posCati = posCati;
	}
	
	@ManyToOne(fetch = FetchType.EAGER )
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	@Column(name = "POS_BRAND", length = 20)
	public String getPosBrand() {
		return posBrand;
	}
	public void setPosBrand(String posBrand) {
		this.posBrand = posBrand;
	}
	
	@Column(name = "TYPE", length = 30)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@ManyToOne(fetch = FetchType.EAGER )
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	
	@Enumerated(value = EnumType.STRING)
	@Column(name = "STATUS", columnDefinition = "VARCHAR(20)")
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	
	@Enumerated(value = EnumType.STRING)
	@Column(name = "RUN_STATUS", columnDefinition = "VARCHAR(20)")
	public RunStatus getRunStatus() {
		return runStatus;
	}
	public void setRunStatus(RunStatus runStatus) {
		this.runStatus = runStatus;
	}
	
	@Column(name = "BATCH_NO", length = 20)
	public String getBatchNo() {
		return batchNo;
	}
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
	
	@Column(name = "OPERATOR", length = 10)
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	@Column(name = "POS_SN", length = 50)
	public String getPosSn() {
		return posSn;
	}
	public void setPosSn(String posSn) {
		this.posSn = posSn;
	}
	
	@Column(name = "SOFT_VERSION", length = 20)
	public String getSoftVersion() {
		return softVersion;
	}
	public void setSoftVersion(String softVersion) {
		this.softVersion = softVersion;
	}
	
	@Column(name = "PARAM_VERSION", length = 20)
	public String getParamVersion() {
		return paramVersion;
	}
	public void setParamVersion(String paramVersion) {
		this.paramVersion = paramVersion;
	}
	
	@Column(name = "M_KEY", length = 64)
	public String getMKey() {
		return mKey;
	}
	public void setMKey(String mKey) {
		this.mKey = mKey;
	}
	
	@Column(name = "LAST_SIGNIN_TIME", columnDefinition = "DATETIME")
	public Date getLastSigninTime() {
		return lastSigninTime;
	}
	public void setLastSigninTime(Date lastSigninTime) {
		this.lastSigninTime = lastSigninTime;
	}
	
	@Column(name = "CREATE_TIME", columnDefinition = "DATETIME")
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Column(name = "pos_Type", length = 10)
	public String getPosType() {
		return posType;
	}
	public void setPosType(String posType) {
		this.posType = posType;
	}
	
	@Column(name = "CUSTOMER_NO", length = 30)
	public String getCustomerNo() {
		return customerNo;
	}
	
	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}
	
	@Column(name = "SHOP_NO", length = 30)
	public String getShopNo() {
		return shopNo;
	}
	public void setShopNo(String shopNo) {
		this.shopNo = shopNo;
	}
	
	@Enumerated(value = EnumType.STRING)
	@Column(name = "ROUTE_TYPE", columnDefinition = "VARCHAR(20)")
	public TransType getRouteType() {
		return routeType;
	}
	public void setRouteType(TransType routeType) {
		this.routeType = routeType;
	}
	
	@Column(name = "AGENT_NO", length = 30)
	public String getAgentNo() {
		return agentNo;
	}
	public void setAgentNo(String agentNo) {
		this.agentNo = agentNo;
	}
	
}