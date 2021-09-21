package com.fendihotpot.malapot.i9sDao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.domain.SetMealBean;
import com.fendihotpot.malapot.domain.TypeBean;

@Repository
public class TypeDAOHibernate implements TypeDAO{

	@PersistenceContext
	private Session session;
	
	@Override
	public List<Set<?>> selectAll() {
		//取出所有類型
		List<Set<?>> typeList = new ArrayList<Set<?>>();
		List<TypeBean> typeBeans = session.createQuery("from TypeBean",TypeBean.class).list();
		
		Set<I9sBean> i9s = new HashSet<I9sBean>();
		Set<I9sBean> dessert = new HashSet<I9sBean>();
		Set<I9sBean> worthSoup = new HashSet<I9sBean>();
		Set<I9sBean> freeSoup = new HashSet<I9sBean>();
		Set<SetMealBean> setMeal = new HashSet<SetMealBean>();
		
		for(TypeBean bean:typeBeans) {
			if(bean.getId()==1) {
				i9s = bean.getI9sBeans();
				typeList.add(i9s);
			}
			if(bean.getId()==2) {
				setMeal = bean.getSetMealBeans();
				typeList.add(setMeal);
			}
			if(bean.getId()==3) {
				worthSoup = bean.getI9sBeans();
				typeList.add(worthSoup);
			}
			if(bean.getId()==4) {
				dessert = bean.getI9sBeans();
				typeList.add(dessert);
			}
			if(bean.getId()==5) {
				freeSoup = bean.getI9sBeans();
				typeList.add(freeSoup);
			}
		}
		return typeList;
	}
	
}
