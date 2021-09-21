package com.fendihotpot.malapot.i9sDao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.domain.SetMealBean;

@Repository
public class SetMealDAOHibernate implements SetMealDAO {
	@PersistenceContext
	private Session session;

	//查單筆
	@Override
	public SetMealBean select(Integer id) {
		if(id!=null) {
			SetMealBean setMealBean = session.get(SetMealBean.class, id);
			return setMealBean;
		}
		return null;
	}

	//查所有套餐
	@Override
	public List<SetMealBean> selectAll() {
		// 取出所有套餐
		List<SetMealBean> setMealBeans = session.createQuery("from SetMealBean", SetMealBean.class).list();
		return setMealBeans;
	}

	//新增套餐
	@Override
	public SetMealBean insertMeal(SetMealBean bean) {
		String hql = "from SetMealBean where name=:name";
		//判斷輸入套餐是否為空
		if (bean != null && bean.getName() != null && bean.getPrice() != null && bean.getType() == 2) {
			//name判斷是否重複
			SetMealBean temp = session
					.createQuery(hql, SetMealBean.class)
					.setParameter("name", bean.getName())
					.uniqueResult();
			if (temp==null) {
				Integer pk = (Integer) session.save(bean);
				SetMealBean newMeal = session.get(SetMealBean.class, pk);
				return newMeal;
			}
		}
		return null;
	}
	
	//新增食材至套餐清單
	@Override
	public Set<I9sBean> insertMealI9s(SetMealBean bean,I9sBean i9sbean) {
		SetMealBean setMealBean = session.get(SetMealBean.class, bean.getId());
		Set<I9sBean> i9sBeans = setMealBean.getI9sBeans();
		i9sBeans.add(i9sbean);
		setMealBean.setI9sBeans(i9sBeans);
		return i9sBeans;
	}

	@Override
	public boolean deleteMeal(Integer id) {
		if(id!=null && !id.equals(0)) {
			SetMealBean setMeal = session.get(SetMealBean.class, id);
			if(setMeal!=null) {
				session.delete(setMeal);
				return true;
			}
		}
		return false;
	}

	@Override
	public SetMealBean updateMeal(SetMealBean bean) {
		if(bean.getId()!=null && !bean.getId().equals(0) && bean.getName()!="") {
			SetMealBean setMealBean = session.get(SetMealBean.class, bean.getId());
			if(setMealBean!=null) {
				setMealBean.setName(bean.getName());
				setMealBean.setPrice(bean.getPrice());
				setMealBean.setPicture(bean.getPicture());
				return setMealBean;
			}
		}
		return null;
	}

	@Override
	public Set<I9sBean> deleteMealI9s(SetMealBean bean, I9sBean i9sBean) {
		SetMealBean setMealBean = session.get(SetMealBean.class, bean.getId());
		Set<I9sBean> i9sBeans = setMealBean.getI9sBeans();
		i9sBeans.remove(i9sBean);
		setMealBean.setI9sBeans(i9sBeans);
		return i9sBeans;
	}	
}
