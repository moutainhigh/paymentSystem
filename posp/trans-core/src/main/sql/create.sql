CREATE TABLE `proxy_pay_info` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BANK_CUSTOMER_NO` varchar(30) NOT NULL COMMENT '银行商户编号',
  `SYS_FLOW_NO` varchar(20) DEFAULT NULL COMMENT 'POS交易流水号',
  `PAN` varchar(30) DEFAULT NULL COMMENT '交易卡号',
  `TRANS_AMOUNT` varchar(20) DEFAULT NULL COMMENT '交易金额',
  `CUSTOMER_NO` varchar(30) DEFAULT NULL COMMENT '交易商户',
  `CUST_NAME` varchar(30) DEFAULT NULL COMMENT '收款行姓名',
  `CUST_CARD_NO` varchar(30) DEFAULT NULL COMMENT '收款行卡号',
  `CUST_AMOUNT` varchar(30) DEFAULT NULL COMMENT '收款人收款金额',
  `ISS_NAME` varchar(150) DEFAULT NULL COMMENT '收款人银行名称',
  `ISS_NO` varchar(30) DEFAULT NULL COMMENT '收款人开户行行号',
  `ORDER_NO` varchar(30) DEFAULT NULL COMMENT '订单号',
  `NOTIFY_URL` varchar(100) DEFAULT NULL COMMENT '代付推送地址',
  `SIGN_CODE` varchar(50) DEFAULT NULL COMMENT '验证信息',
	`RSP_CODE` varchar(10) DEFAULT NULL COMMENT '响应码',
	`RSP_MSG` varchar(100) DEFAULT NULL COMMENT '响应信息',
	`CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
	`LAST_UPDATE_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `STATUS` VARCHAR(20) DEFAULT NULL COMMENT '状态：IINIT,PAY_REQ_SUCC,PAY_REQ_FAIL,PAY_RESP_SUCC,PAY_RESP_FAIL',
	REMARK VARCHAR(200) DEFAULT NULL COMMENT '描述',
	CARD_TYPE VARCHAR(20) DEFAULT NULL COMMENT '卡类型',
	EXTERNAL_ID VARCHAR(20) DEFAULT NULL COMMENT '检索号',
	BANK_EXTERNAL_ID VARCHAR(20) DEFAULT NULL COMMENT '通道检索号',
	PROXY_PAY_COST VARCHAR(20) DEFAULT NULL COMMENT '代付成本',
	`ORDER_COMPLETE_TIME` datetime DEFAULT NULL COMMENT '订单完成时间',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;