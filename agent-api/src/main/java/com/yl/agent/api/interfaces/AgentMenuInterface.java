package com.yl.agent.api.interfaces;

import java.util.List;

import com.yl.agent.api.bean.Menu;

/**
 * 服务商菜单远程操作接口
 * 
 * @author 聚合支付有限公司
 * @since 2016年7月22日
 * @version V1.0.0
 */
public interface AgentMenuInterface {
	
	/**
	 * 查询所有
	 * @param menu
	 */
	public List<Menu> findAll();
	
	/**
	 * 根据ID查询
	 * @return
	 */
	public Menu findById(Long id);
	
	/**
	 * 根据等级查找
	 * @param level
	 * @return
	 */
	public List<Menu> findByLevel(String level);
	
	/**
	 * 修改
	 * @param menu
	 * @return
	 */
	public Menu update(Menu menu);
	
	/**
	 * 新建
	 * @param menu
	 * @return
	 */
	public Menu create(Menu menu);
	/**
	 * 根据名字模糊查询
	 * @param name
	 * @return
	 */
	public List<Menu> findMenuByName(String name);
	public Menu findMenuName(String name);
}