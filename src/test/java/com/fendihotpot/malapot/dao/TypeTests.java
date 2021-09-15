package com.fendihotpot.malapot.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.domain.SetMealBean;
import com.fendihotpot.malapot.domain.TypeBean;
import com.fendihotpot.malapot.service.TypeService;

@SpringBootTest
public class TypeTests {
	
	@PersistenceContext
	private Session session;
	
	@Autowired
	private TypeDAO typeDAO;
	
	
	@Test
	@Transactional
	public void testTypeDAO() {
		List<Set<?>> selectAll = typeDAO.selectAll();
		for(Set<?> set:selectAll) {
			System.out.println("set="+set);
		}
	}
	
//	@Test
//	@Transactional
//	public void testType() {
//		TypeBean typeBeans = session.get(TypeBean.class, 2);
//		
//		Set<I9sBean> i9sBeans = typeBeans.getI9sBeans();
//		for(I9sBean bean:i9sBeans) {
//			System.out.println("bean="+bean);
//		}
//		
//		Set<SetMealBean> setMealBeans = typeBeans.getSetMealBeans();
//		for(SetMealBean bean: setMealBeans) {
//			System.out.println("bean="+bean);
//		}
//	}
}
