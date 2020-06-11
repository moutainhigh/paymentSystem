package com.yl.recon.core.mybatis.mapper;

import com.lefu.commons.utils.Page;
import com.yl.recon.api.core.bean.ReconOrderDataQueryBean;
import com.yl.recon.core.entity.order.PayinterfaceOrder;
import com.yl.recon.core.entity.order.PayinterfaceOrderExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @author 聚合支付有限公司
 * @version V1.0.0
 * @since 2018年01月05
 */
@Repository
public interface PayinterfaceOrderMapper {

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	int insert(@Param("payinterfaceOrder") PayinterfaceOrder payinterfaceOrder);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	int insertSelective(@Param("payinterfaceOrder") PayinterfaceOrder payinterfaceOrder);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	int insertList(@Param("payinterfaceOrders") List <PayinterfaceOrder> payinterfaceOrders);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	int update(@Param("payinterfaceOrder") PayinterfaceOrder payinterfaceOrder);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	int countByExample(PayinterfaceOrderExample example);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	int deleteByExample(PayinterfaceOrderExample example);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	int deleteByPrimaryKey(Long code);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	List <PayinterfaceOrder> selectByExample(PayinterfaceOrderExample example);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	PayinterfaceOrder selectByPrimaryKey(Long code);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	int updateByExampleSelective(@Param("record") PayinterfaceOrder record, @Param("example") PayinterfaceOrderExample example);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	int updateByExample(@Param("record") PayinterfaceOrder record, @Param("example") PayinterfaceOrderExample example);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	int updateByPrimaryKeySelective(PayinterfaceOrder record);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table payinterface_order
	 *
	 * @mbggenerated Sat Sep 02 13:57:28 CST 2017
	 */
	int updateByPrimaryKey(PayinterfaceOrder record);


	/**
	 * 分页
 	 * @param page
	 * @return
	 */
	List<com.yl.recon.api.core.bean.order.PayinterfaceOrder> findAllPayInterfaceOrder(@Param("reconOrderDataQueryBean")ReconOrderDataQueryBean reconOrderDataQueryBean,@Param("page") Page page);

	/**
	 * 不分页
 	 * @return
	 */
	List<com.yl.recon.api.core.bean.order.PayinterfaceOrder> findPayInterfaceOrder(@Param("reconOrderDataQueryBean")ReconOrderDataQueryBean reconOrderDataQueryBean);
}