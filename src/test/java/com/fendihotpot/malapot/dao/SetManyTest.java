package com.fendihotpot.malapot.dao;

import java.util.Set;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.domain.SetMealBean;

@SpringBootTest
public class SetManyTest {
	@PersistenceContext
	private Session session;
	
	
	@Test
	@Transactional
	public void setManyTest() {
		SetMealBean bean = session.get(SetMealBean.class, 1);
//		System.out.println("bean="+bean);
		Set<I9sBean> i9sList = bean.getI9sBeans();
//		for(I9sBean i9sBean:i9sList) {
//			System.out.println("i9sBean="+i9sBean);
//		}
		
//		I9sBean i9sBean = session.get(I9sBean.class, 3);
//		boolean result = i9sList.add(i9sBean);
//		if(result) {
//			for(I9sBean x:i9sList) {
//				System.out.println("x="+x);
//			}
//		}
//		
		I9sBean newi9sBean = session.get(I9sBean.class, 10);
		boolean newresult = i9sList.add(newi9sBean);
		if(newresult) {
			SetMealBean newbean = session.get(SetMealBean.class, 1);
			Set<I9sBean> newi9sList = newbean.getI9sBeans();
			for(I9sBean y:newi9sList) {
				System.out.println("y="+y);
			}
		}
		
//		I9sBean i9sbean = session.get(I9sBean.class, 1);
//		System.out.println("i9sbean="+i9sbean);
//		Set<SetMealBean> setMealBeans = i9sbean.getSetMealBeans();
//		System.out.println("setMealBeans="+setMealBeans);
	}
}
