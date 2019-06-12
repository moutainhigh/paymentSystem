<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>  
  <title>服务商信息</title>
  <%@ include file="../include/header.jsp"%>
</head>
<body style="width: 900px; padding: 10px;">
  
  <div style="padding: 10px;">
    <!-- 基本信息 -->
    <div class="row">
      <div class="title-h1 fix tabSwitch2">
        <span class="primary fl">基本信息</span>
      </div>
      <div class="content detail">

        <div class="col w-p-50">
          <div class="row">
            <span class="label">服务商编号:</span>
            <span class="value">${agent.agentNo}</span>
          </div>
          <div class="row">
            <span class="label">服务商类型:</span>
            <span class="value"><dict:write dictId="${agent.agentType }" dictTypeId="AGENT_TYPE"></dict:write></span>
          </div>
          <div class="row">
            <span class="label">服务商联系人:</span>
            <span class="value">${agent.linkMan}</span>
          </div>
          <div class="row">
            <span class="label">服务商全称:</span>
            <span class="value">${agent.fullName}</span>
          </div>
          <div class="row">
            <span class="label">服务商联系电话:</span>
            <span class="value">${agent.phoneNo}</span>
          </div>
          <div class="row">
            <span class="label">可用余额:</span>
            <span class="value"><fmt:formatNumber currencySymbol="" type="currency" value="${balance}" /></span>
          </div>
          <div class="row">
            <span class="label">邮箱:</span>
            <span class="value">${agent.EMail}</span>
          </div>
          <div class="row">
            <span class="label">身份证:</span>
            <span class="value">${agent.idCard}</span>
          </div>
        </div>
        <div class="col w-p-50">
          <div class="row">
            <span class="label">服务商简称:</span>
            <span class="value">${agent.shortName}</span>
          </div>
          <div class="row">
            <span class="label">服务商等级:</span>
            <span class="value"><dict:write dictId="${agent.agentLevel }" dictTypeId="SERVICE_PROVIDER_LEVEL"></dict:write></span>
          </div>
          <div class="row">
            <span class="label">所属服务商:</span>
            <span class="value">${agent.parenId}</span>
          </div>
          <div class="row">
            <span class="label">所属省:</span>
            <span class="value">${agent.province}</span>
          </div>
          <div class="row">
            <span class="label">所属市:</span>
            <span class="value">${agent.city}市</span>
          </div>
          <div class="row">
            <span class="label">服务商地址:</span>
            <span class="value">${agent.addr}</span>
          </div>
          <div class="row">
            <span class="label">保证金:</span>
            <span class="value"><fmt:formatNumber currencySymbol="" type="currency" value="${agent.cautionMoney}" /></span>
          </div>
        </div>
      </div>
    </div>

  <c:if test="${agent.agentType != 'INDIVIDUAL'}">
      <!-- 企业信息 -->
      <div class="row companyInfo">
        <div class="title-h1 fix tabSwitch2">
          <span class="primary fl">企业信息</span>
        </div>
        <div class="content detail">
          <div class="fix">
            <div class="col w-p-50">
              <div class="row">
                <span class="label">法人姓名:</span>
                <span class="value">${agentCert.legalPerson}</span>
              </div>
              <div class="row">
                <span class="label">企业网址:</span>
                <span class="value">${agentCert.enterpriseUrl}</span>
              </div>
              <div class="row">
                <span class="label">客服电话:</span>
                <span class="value">${agentCert.consumerPhone}</span>
              </div>
              <div class="row">
                <span class="label">ICP备案号:</span>
                <span class="value">${agentCert.icp}</span>
              </div>
            </div>
            <div class="col w-p-50">
              <div class="row">
                <span class="label">经营范围:</span>
                <span class="value">${agentCert.businessScope}</span>
              </div>
              <div class="row">
                <span class="label">企业信用码:</span>
                <span class="value">${agentCert.enterpriseCode}</span>
              </div>
              <div class="row">
                <span class="label">经营地址:</span>
                <span class="value">${agentCert.businessAddress}</span>
              </div>
              <div class="row">
                <span class="label">营业期限:</span>
                <span class="value"><fmt:formatDate value="${agentCert.validStartTime}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${agentCert.validEndTime}" pattern="yyyy-MM-dd" /></span>
              </div>
            </div>
          </div>
  
          <div class="fix">
            <div class="item">
              <div class="input-area">
                <span class="label w-90">补充材料:</span>
                <div class="input-wrap">
                  <a class="btn" href="javascript:void(0);" onclick="lookImg('${pageContext.request.contextPath}/findDocumentImg.action?fileName=FILE_ATT&agentCert.agentNo=${agent.agentNo}','补充材料', this);" >查看</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </c:if>

    <!-- 费率信息 -->
    <div class="row">
      <div class="title-h1 fix tabSwitch2">
        <span class="primary fl">费率信息</span>
      </div>
      <div class="content">

        <div id="productWrap">
          <!-- 个人网银 -->
          <div class="productItem" data-productType="B2C">
            <input type="hidden" class="ignoreEmpy" name="agentFees[0].productType" value="B2C">
            <div class="title-h2 fix">
              <span class="primary fl">个人网银</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[0].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[0].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[0].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[0].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[0].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[0].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[0].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[0].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 企业网银 -->
          <div class="productItem" data-productType="B2B">
            <input type="hidden" class="ignoreEmpy" name="agentFees[1].productType" value="B2B">
            <div class="title-h2 fix">
              <span class="primary fl">企业网银</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[1].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[1].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[1].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[1].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[1].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[1].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[1].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[1].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 认证支付 -->
          <div class="productItem" data-productType="AUTHPAY">
            <input type="hidden" class="ignoreEmpy" name="agentFees[2].productType" value="AUTHPAY">
            <div class="title-h2 fix">
              <span class="primary fl">认证支付</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[2].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[2].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[2].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[2].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[2].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[2].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[2].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[2].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 微信公众号支付 -->
          <div class="productItem" data-productType="WXJSAPI">
            <input type="hidden" class="ignoreEmpy" name="agentFees[3].productType" value="WXJSAPI">
            <div class="title-h2 fix">
              <span class="primary fl">微信公众号支付</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[3].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[3].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[3].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[3].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[3].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[3].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[3].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[3].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 微信二维码支付 -->
          <div class="productItem" data-productType="WXNATIVE">
            <input type="hidden" class="ignoreEmpy" name="agentFees[4].productType" value="WXNATIVE">
            <div class="title-h2 fix">
              <span class="primary fl">微信二维码支付</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[4].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[4].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[4].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[4].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[4].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[4].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[4].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[4].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 支付宝 -->
          <div class="productItem" data-productType="ALIPAY">
            <input type="hidden" class="ignoreEmpy" name="agentFees[5].productType" value="ALIPAY">
            <div class="title-h2 fix">
              <span class="primary fl">支付宝</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[5].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[5].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[5].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[5].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[5].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[5].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[5].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[5].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 代付 -->
          <div class="productItem" data-productType="REMIT">
            <input type="hidden" class="ignoreEmpy" name="agentFees[6].productType" value="REMIT">
            <div class="title-h2 fix">
              <span class="primary fl">代付</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[6].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[6].minFee" required amount maxIgnoreEmpy="[name='agentFees[6].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">审核:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select" name="serviceConfigBean.manualAudit" dictTypeId="YN"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">IP:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text" name="serviceConfigBean.custIp">
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">单笔最大金额:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text" name="serviceConfigBean.maxAmount" required amount  minIgnoreEmpy="[name='serviceConfigBean.minAmount']" message='{"minIgnoreEmpy": "低于单笔最小金额"}' >
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">单日最大金额:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text" name="serviceConfigBean.dayMaxAmount" required amount minIgnoreEmpy="[name='serviceConfigBean.maxAmount']" message='{"minIgnoreEmpy": "低于单笔最大金额"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">自动结算:</span>
                      <div class="input-wrap">
                        <select class="input-select" name="serviceConfigBean.fireType" required>
                          <option value="AUTO">自动</option>
                          <option value="MAN">人工</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[6].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">是否开通假日付:</span>
                      <div class="input-wrap">
                        <select class="input-select holidayStatus" name="serviceConfigBean.holidayStatus" required>
                          <option value="TRUE">是</option>
                          <option value="FALSE">否</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[6].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[6].maxFee" required amount minIgnoreEmpy="[name='agentFees[6].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">短信验证:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select" name="serviceConfigBean.usePhoneCheck" dictTypeId="YN"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">域名:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text" name="serviceConfigBean.domain">
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">单笔最小金额:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text" name="serviceConfigBean.minAmount" required amount  maxIgnoreEmpy="[name='serviceConfigBean.maxAmount']" message='{"maxIgnoreEmpy": "超过单笔最大金额"}' >
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">付款起止时间:</span>
                      <div class="input-wrap">
                        <input type="text" name="serviceConfigBean.startTime" class="input-date w-78" date-fmt="H:mm" required>
                      </div>
                      <span class="cut"> - </span>
                      <div class="input-wrap">
                        <input type="text" name="serviceConfigBean.endTime" class="input-date w-78" date-fmt="H:mm" required>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">运营审核:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select" name="serviceConfigBean.bossAudit" dictTypeId="DF_AUDIT"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[6].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 假日付 -->
          <div class="productItem" data-productType="HOLIDAY_REMIT">
            <input type="hidden" class="ignoreEmpy" name="agentFees[7].productType" value="HOLIDAY_REMIT">
            <div class="title-h2 fix">
              <span class="primary fl">假日付</span>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[7].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[7].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[7].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[7].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[7].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[7].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[7].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[7].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 代收 -->
          <div class="productItem" data-productType="RECEIVE">
            <input type="hidden" class="ignoreEmpy" name="agentFees[8].productType" value="RECEIVE">
            <div class="title-h2 fix">
              <span class="primary fl">代收</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[8].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[8].minFee" required amount maxIgnoreEmpy="[name='agentFees[8].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">IP:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text" name="receiveConfigInfoBean.custIp">
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">单笔最大金额:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text" name="receiveConfigInfoBean.singleMaxAmount" required amount >
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">单批次最大笔数:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text" name="receiveConfigInfoBean.singleBatchMaxNum" required digits min="1">
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[8].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[8].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[8].maxFee" required amount minIgnoreEmpy="[name='agentFees[8].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">域名:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text" name="receiveConfigInfoBean.domain">
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">日限额:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text" name="receiveConfigInfoBean.dailyMaxAmount" required amount  minIgnoreEmpy="[name='receiveConfigInfoBean.singleMaxAmount']" message='{"minIgnoreEmpy": "小于单笔最大金额"}' >
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">状态:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select rate-select" name="receiveConfigInfoBean.status" dictTypeId="STATUS"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[8].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 银行卡收单 -->
          <div class="productItem" data-productType="POS">
            <input type="hidden" class="ignoreEmpy" name="agentFees[9].productType" value="POS">
            <div class="title-h2 fix">
              <span class="primary fl">银行卡收单</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[9].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[9].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[9].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[9].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[9].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[9].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[9].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[9].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>


          <!-- 快捷支付 -->
          <div class="productItem" data-productType="QUICKPAY">
            <input type="hidden" class="ignoreEmpy" name="agentFees[10].productType" value="QUICKPAY">
            <div class="title-h2 fix">
              <span class="primary fl">快捷支付</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[10].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[10].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[10].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[10].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[10].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[10].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[10].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[10].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 支付宝条码 -->
          <div class="productItem" data-productType="ALIPAYMICROPAY">
            <input type="hidden" class="ignoreEmpy" name="agentFees[11].productType" value="ALIPAYMICROPAY">
            <div class="title-h2 fix">
              <span class="primary fl">支付宝条码</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[11].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[11].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[11].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[11].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[11].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[11].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[11].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[11].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 微信条码 -->
          <div class="productItem" data-productType="WXMICROPAY">
            <input type="hidden" class="ignoreEmpy" name="agentFees[12].productType" value="WXMICROPAY">
            <div class="title-h2 fix">
              <span class="primary fl">微信条码</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[12].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[12].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[12].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[12].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[12].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[12].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[12].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[12].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 绑卡认证 -->
          <div class="productItem" data-productType="BINDCARD_AUTH">
            <input type="hidden" class="ignoreEmpy" name="agentFees[13].productType" value="BINDCARD_AUTH">
            <div class="title-h2 fix">
              <span class="primary fl">绑卡认证</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[13].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[13].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[13].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[13].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[13].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[13].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[13].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[13].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 支付宝服务窗 -->
          <div class="productItem" data-productType="ALIPAYJSAPI">
            <input type="hidden" class="ignoreEmpy" name="agentFees[14].productType" value="ALIPAYJSAPI">
            <div class="title-h2 fix">
              <span class="primary fl">支付宝服务窗</span>
              <a class="delProduct fr" href="javascript:void(0);">删除</a>
            </div>
            <div class="fix">
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select fee-type" dictTypeId="FEE_TYPE" name="agentFees[14].feeType"></dict:select>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最低费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text minfee" name="agentFees[14].minFee" required amount minfee maxIgnoreEmpy="[name='agentFees[14].maxFee']" message='{"maxIgnoreEmpy": "超过最大费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润类型:</span>
                      <div class="input-wrap">
                        <dict:select styleClass="input-select profit-type" name="agentFees[14].profitType" dictTypeId="PROFIT_TYPE"></dict:select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col fl w-p-50">
                <div class="fix">
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text fee" name="agentFees[14].fee" required amount fee>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">最高费率:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text maxfee" name="agentFees[14].maxFee" required amount maxfee minIgnoreEmpy="[name='agentFees[14].minFee']" message='{"minIgnoreEmpy": "低于最低费率"}'>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="input-area">
                      <span class="label w-90">分润比例:</span>
                      <div class="input-wrap">
                        <input type="text" class="input-text profit-ratio" name="agentFees[14].profitRatio" required amount profitratio>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>


        </div>
      </div>
    </div>




    <!-- 结算卡信息 -->
    <div class="row">
      <div class="title-h1 fix tabSwitch2">
        <span class="primary fl">服务商结算卡信息</span>
      </div>
      <div class="content">
        <ul class="list">
          <li>
            <span class="info-title">账户名称:</span>
            <span class="info-value">${agentSettle.accountName }</span>
          </li>
         <%--  <li>
            <span class="info-title">银行编号:</span>
            <span class="info-value">${agentSettle.accountNo}</span>
          </li> --%>
          <li>
            <span class="info-title">开户行名称:</span>
            <span class="info-value">${agentSettle.openBankName}</span>
          </li>
          <li>
            <span class="info-title">账户类型:</span>
            <span class="info-value"><dict:write dictId="${agentSettle.agentType }" dictTypeId="AGENT_TYPE"></dict:write></span>
          </li>
          <li>
            <span class="info-title">银行卡号:</span>
            <span class="info-value">${agentSettle.accountNo}</span>
          </li>
        </ul>
      </div>
    </div>

    <!-- 证件信息 -->
    <div class="row">
      <div class="title-h1 fix tabSwitch2">
        <span class="primary fl">证件信息</span>
      </div>
      <div class="content">
        <div class="fix">

          <ul class="crt-list">
            <li><a onclick="lookImg('${pageContext.request.contextPath}/findDocumentImg.action?fileName=FILE_BUSILICECERT&agentCert.agentNo=${agent.agentNo}', '企业营业执照 | 个人身份证正面', this);" href="javascript:void(0);"><span class="pre-text">企业营业执照</span> | <span class="pre-text">个人身份证正面</span></a></li>
            <li><a onclick="lookImg('${pageContext.request.contextPath}/findDocumentImg.action?fileName=FILE_TAXREGCERT&agentCert.agentNo=${agent.agentNo}', '企业营业执照 | 个人身份证正面', this);" href="javascript:void(0);"><span class="pre-text">企业税务登记证</span> | <span class="pre-text">个人身份证反面</span></a></li>
            <li><a onclick="lookImg('${pageContext.request.contextPath}/findDocumentImg.action?fileName=FILE_ORGANIZATIONCERT&agentCert.agentNo=${agent.agentNo}', '企业营业执照 | 个人身份证正面', this);" href="javascript:void(0);"><span class="pre-text">组织机构证</span> | <span class="pre-text">个人银行卡正面</span></a></li>
            <li><a onclick="lookImg('${pageContext.request.contextPath}/findDocumentImg.action?fileName=FILE_OPENBANKACCCERT&agentCert.agentNo=${agent.agentNo}', '企业营业执照 | 个人身份证正面', this);" href="javascript:void(0);"><span class="pre-text">银行开户许可证</span> | <span class="pre-text">个人银行卡反面</span></a></li>
            <li><a onclick="lookImg('${pageContext.request.contextPath}/findDocumentImg.action?fileName=FILE_IDCARD&agentCert.agentNo=${agent.agentNo}', '企业营业执照 | 个人身份证正面', this);" href="javascript:void(0);"><span class="pre-text">企业法人身份证</span> | <span class="pre-text">个人手持身份证</span></a></li>
          </ul>

        </div>
      </div>
    </div>






  </div>
  
  
  
  <%@ include file="../include/bodyLink.jsp"%>
  <script>
    // 初始化产品管理器
    product.init();
    $(document).ready(function() {
      // 更改费率类型
      $('.fee-type').change(function(event, ignore) {
        general.changeFeeType(this.value, $(this).closest('.productItem'));
      }).trigger('change', true);
      // 禁用产品
      product.disabledProduct();
    });
  </script>
  
  
    <c:forEach items="${agentFees }" var="fees" varStatus="tempIdx">
      <!-- 循环普通产品费率 -->
      <c:if test="${fees.productType.name() != 'REMIT' && fees.productType.name() != 'RECEIVE' }">
        <script>
          product.fillBaseValue(product.open('${fees.productType.name()}', null, true), {
            // 费率类型 RATIO=百分比, FIXED=固定
            '.fee-type': '${fees.feeType }',
            // 费率id
            '.fee-id': '${fees.id}',
            // 费率
            '.fee': '${fees.fee }',
            // 最低费率
            '.minfee': '${fees.minFee }',
            // 最高费率
            '.maxfee': '${fees.maxFee }',
            // 费率状态
            '.fee-status': '${fees.status}',
            // 分润类型
            '.profit-type': '${fees.profitType}',
            // 分润比率
            '.profit-ratio': '${fees.profitRatio }',
          });
        </script>
      </c:if>
      <!-- 初始化代付费率 -->
      <c:if test="${fees.productType.name() == 'REMIT'}">
        <script>
          product.fillRemit(product.open('REMIT', null, true), {
            // 费率类型 RATIO=百分比, FIXED=固定
            '.fee-type': '${fees.feeType }',
            // 费率id
            '.fee-id': '${fees.id}',
            // 费率
            '.fee': '${fees.fee }',
            // 最低费率
            '.minfee': '${fees.minFee }',
            // 最高费率
            '.maxfee': '${fees.maxFee }',
            // 分润类型
            '.profit-type': '${fees.profitType}',
            // 分润比率
            '.profit-ratio': '${fees.profitRatio }',
            // 路由模板
            '.router-template': '',
            // 审核 TRUE=是, FALSE=否
            '[name="serviceConfigBean.manualAudit"]': '${serviceConfigBean.manualAudit }',
            // 短信验证 TRUE=是, FALSE=否
            '[name="serviceConfigBean.usePhoneCheck"]': '${serviceConfigBean.usePhoneCheck }',
            // IP
            '[name="serviceConfigBean.custIp"]': '${serviceConfigBean.custIp }',
            // 域名
            '[name="serviceConfigBean.domain"]': '${serviceConfigBean.domain }',
            // 单笔最大金额
            '[name="serviceConfigBean.maxAmount"]': '${serviceConfigBean.maxAmount }',
            // 单笔最小金额
            '[name="serviceConfigBean.minAmount"]': '${serviceConfigBean.minAmount }',
            // 单日最大金额
            '[name="serviceConfigBean.dayMaxAmount"]': '${serviceConfigBean.dayMaxAmount }',
            // 付款起始时间
            '[name="serviceConfigBean.startTime"]': '${serviceConfigBean.startTime}',
            // 付款截止时间
            '[name="serviceConfigBean.endTime"]': '${serviceConfigBean.endTime}',
            // 自动结算 AUTO=自动, MAN=人工
            '[name="serviceConfigBean.fireType"]': '${serviceConfigBean.fireType}',
            // 运营审核 TRUE=需要运营审核, FALSE=不需要
            '[name="serviceConfigBean.bossAudit"]': '${serviceConfigBean.bossAudit }',
            // 是否开通假日付
            '[name="serviceConfigBean.holidayStatus"]': '${serviceConfigBean.holidayStatus}',
            // ownerId
            '[name="serviceConfigBean.ownerId"]': '${serviceConfigBean.ownerId }',
            // 费率状态
            '.fee-status': '${fees.status}'
          });
        </script>
      </c:if>
      <!-- 初始化代收费率 -->
      <c:if test="${fees.productType.name() == 'RECEIVE'}">
        <script>
          product.fillRemit(product.open('RECEIVE', null, true), {
            // 费率类型 RATIO=百分比, FIXED=固定
            '.fee-type': '${fees.feeType }',
            // 费率id
            '.fee-id': '${fees.id}',
            // 费率
            '.fee': '${fees.fee }',
            // 最低费率
            '.minfee': '${fees.minFee }',
            // 最高费率
            '.maxfee': '${fees.maxFee }',
            // 分润类型
            '.profit-type': '${fees.profitType}',
            // 分润比率
            '.profit-ratio': '${fees.profitRatio }',
            // IP
            '[name="receiveConfigInfoBean.custIp"]': '${receiveConfigInfoBean.custIp }',
            // 域名
            '[name="receiveConfigInfoBean.domain"]': '${receiveConfigInfoBean.domain }',
            // 单笔最大金额
            '[name="receiveConfigInfoBean.singleMaxAmount"]': '${receiveConfigInfoBean.singleMaxAmount}',
            // 单批最大笔数
            '[name="receiveConfigInfoBean.singleBatchMaxNum"]': '${receiveConfigInfoBean.singleBatchMaxNum}',
            // 日限额
            '[name="receiveConfigInfoBean.dailyMaxAmount"]': '${receiveConfigInfoBean.dailyMaxAmount}',
            // 状态
            '[name="receiveConfigInfoBean.status"]': '${receiveConfigInfoBean.status}',
            // ownerId
            '[name="receiveConfigInfoBean.ownerId"]': '${receiveConfigInfoBean.ownerId }',
            // 费率状态
            '.fee-status': '${fees.status}'
          });
        </script>
      </c:if>
      
    </c:forEach>
  
  
</body>
</html>
