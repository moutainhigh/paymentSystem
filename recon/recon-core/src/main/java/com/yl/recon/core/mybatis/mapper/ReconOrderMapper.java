package com.yl.recon.core.mybatis.mapper;

import com.lefu.commons.utils.Page;
import com.yl.recon.core.entity.ReconOrder;
import com.yl.recon.core.entity.ReconOrderExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author 聚合支付有限公司
 * @since 2018年01月05
 * @version V1.0.0
 */
@Repository
public interface ReconOrderMapper {


	/**
	 * 分页查询所有
	 *
	 * @param page
	 * @param params
	 * @return
	 */
	List <com.yl.recon.api.core.bean.ReconOrder> findAll(@Param("page") Page page, @Param("params") Map<String, Object> params);
	/**
	 * 查询所有
	 * @param params
	 * @return
	 */
	List <com.yl.recon.api.core.bean.ReconOrder> queryAll(@Param("params") Map<String, Object> params);


	int insert(@Param("reconOrder") ReconOrder reconOrder);

	int insertSelective(@Param("reconOrder") ReconOrder reconOrder);

	int insertList(@Param("reconOrders") List<ReconOrder> reconOrders);

	int update(@Param("reconOrder") ReconOrder reconOrder);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recon_order
     *
     * @mbggenerated Wed Sep 06 13:04:08 CST 2017
     */
    int countByExample(ReconOrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recon_order
     *
     * @mbggenerated Wed Sep 06 13:04:08 CST 2017
     */
    int deleteByExample(ReconOrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recon_order
     *
     * @mbggenerated Wed Sep 06 13:04:08 CST 2017
     */
    int deleteByPrimaryKey(Long code);



    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recon_order
     *
     * @mbggenerated Wed Sep 06 13:04:08 CST 2017
     */
    List<ReconOrder> selectByExample(ReconOrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recon_order
     *
     * @mbggenerated Wed Sep 06 13:04:08 CST 2017
     */
    ReconOrder selectByPrimaryKey(Long code);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recon_order
     *
     * @mbggenerated Wed Sep 06 13:04:08 CST 2017
     */
    int updateByExampleSelective(@Param("record") ReconOrder record, @Param("example") ReconOrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recon_order
     *
     * @mbggenerated Wed Sep 06 13:04:08 CST 2017
     */
    int updateByExample(@Param("record") ReconOrder record, @Param("example") ReconOrderExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recon_order
     *
     * @mbggenerated Wed Sep 06 13:04:08 CST 2017
     */
    int updateByPrimaryKeySelective(ReconOrder record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recon_order
     *
     * @mbggenerated Wed Sep 06 13:04:08 CST 2017
     */
    int updateByPrimaryKey(ReconOrder record);



}