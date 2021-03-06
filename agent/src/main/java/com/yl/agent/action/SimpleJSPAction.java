package com.yl.agent.action;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.opensymphony.xwork2.ActionContext;

/**
 * JSP跳转控制器
 * 
 * @author 聚合支付有限公司
 * @since 2016年6月28日
 * @version V1.0.0
 */
public class SimpleJSPAction extends Struts2ActionSupport {
	private static final long serialVersionUID = 2271367401003328498L;
	protected static Log logger = LogFactory.getLog(SimpleJSPAction.class);
	
	public String getTarget() {
		return ActionContext.getContext().getName();
	}

	public String execute(){
		String target = getTarget();
		logger.info("forward to jsp["+target+"]");
		return target;
	}
}
