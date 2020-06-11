package com.yl.recon.core.mybatis.mapper;

 
import java.util.List;

import com.lefu.commons.utils.Page;
import com.yl.recon.api.core.bean.ReconOrderDataQueryBean;
import org.apache.ibatis.annotations.Param;

import com.yl.recon.core.entity.order.AccountOrder;
import com.yl.recon.core.entity.order.AccountOrderExample;
import org.springframework.stereotype.Repository;
/**
 * @author 聚合支付有限公司
 * @since 2018年01月05
 * @version V1.0.0
 */
@Repository
public interface AccountOrderMapper {



	int insert(@Param("accountOrder") AccountOrder accountOrder);

	int insertSelective(@Param("accountOrder") AccountOrder accountOrder);

	int insertList(@Param("accountOrders") List<AccountOrder> accountOrders);

	int update(@Param("accountOrder") AccountOrder accountOrder);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table account_order
     *
     * @mbggenerated Sat Sep 02 23:30:13 CST 2017
     */
    int countByExample(AccountOrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table account_order
     *
     * @mbggenerated Sat Sep 02 23:30:13 CST 2017
     */
    int deleteByExample(AccountOrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table account_order
     *
     * @mbggenerated Sat Sep 02 23:30:13 CST 2017
     */
    int deleteByPrimaryKey(Long code);


    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table account_order
     *
     * @mbggenerated Sat Sep 02 23:30:13 CST 2017
     */
    List<AccountOrder> selectByExample(AccountOrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table account_order
     *
     * @mbggenerated Sat Sep 02 23:30:13 CST 2017
     */
    AccountOrder selectByPrimaryKey(Long code);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table account_order
     *
     * @mbggenerated Sat Sep 02 23:30:13 CST 2017
     */
    int updateByExampleSelective(@Param("record") AccountOrder record, @Param("example") AccountOrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table account_order
     *
     * @mbggenerated Sat Sep 02 23:30:13 CST 2017
     */
    int updateByExample(@Param("record") AccountOrder record, @Param("example") AccountOrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table account_order
     *
     * @mbggenerated Sat Sep 02 23:30:13 CST 2017
     */
    int updateByPrimaryKeySelective(AccountOrder record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table account_order
     *
     * @mbggenerated Sat Sep 02 23:30:13 CST 2017
     */
    int updateByPrimaryKey(AccountOrder record);

	/**
	 * 分页
	 * @param reconOrderDataQueryBean
	 * @param page
	 * @return
	 */
	List<com.yl.recon.api.core.bean.order.AccountOrder> findAllAccountOrder(@Param("reconOrderDataQueryBean")ReconOrderDataQueryBean reconOrderDataQueryBean,@Param("page") Page page);

	/**
	 * 不分页
	 * @param reconOrderDataQueryBean
	 * @return
	 */
	List<com.yl.recon.api.core.bean.order.AccountOrder> finAccountOrder(@Param("reconOrderDataQueryBean")ReconOrderDataQueryBean reconOrderDataQueryBean);
}