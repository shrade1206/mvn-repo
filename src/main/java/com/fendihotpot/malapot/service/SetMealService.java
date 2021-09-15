package com.fendihotpot.malapot.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fendihotpot.malapot.dao.SetMealDAO;
import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.domain.SetMealBean;

@Service
@Transactional
public class SetMealService {
	
	@Autowired
	private SetMealDAO setMealDAO;
	
	//查詢單筆 & 全部
	public List<SetMealBean> select(SetMealBean bean){
		List<SetMealBean> result = null;
		if(bean!=null && bean.getId()!=null && !bean.getId().equals(0)) {
			SetMealBean temp = setMealDAO.select(bean.getId());
			if(temp!=null) {
				result = new ArrayList<SetMealBean>();
				result.add(temp);
			}
		}else {
			result = setMealDAO.selectAll();
		}
		return result;
	}
	
	//新增套餐 
	public SetMealBean insertMeal(SetMealBean bean) {
		SetMealBean insert = setMealDAO.insertMeal(bean);
		return insert;
	}
	
	//增加套餐的食材清單項目
	public Set<I9sBean> insertMealI9s(SetMealBean bean,I9sBean i9sbean){
		Set<I9sBean> insert = setMealDAO.insertMealI9s(bean, i9sbean);
		return insert;
	}
	
	//刪除套餐的食材清單項目
	public Set<I9sBean> deleteMealI9s(SetMealBean bean, I9sBean i9sBean){
		Set<I9sBean> deleteMealI9s = setMealDAO.deleteMealI9s(bean, i9sBean);
		return deleteMealI9s;
	}
	
	//刪除套餐
	public boolean deleteMeal(Integer id) {
		boolean result = false;
		if(id!=null && id!=0) {
			result = setMealDAO.deleteMeal(id);
		}
		return result;
	}
	
	//修改套餐資訊
	public SetMealBean updateMeal(SetMealBean bean) {
		SetMealBean result = null;
		if(bean!=null && bean.getId()!=null) {
			result = setMealDAO.updateMeal(bean);
		}
		return result;
	}
}
