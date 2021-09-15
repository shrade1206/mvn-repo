package com.fendihotpot.malapot.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.domain.SetMealBean;
import com.fendihotpot.malapot.service.SetMealService;

@SpringBootTest
public class SetMealDAOHibernateTests {
	
	@Autowired
	private SetMealDAO setMealDAO;

	@Autowired
	private SetMealService setMealService;
	
//	@Test
//	@Transactional
//	public void testSelectMeal() {
//		List<SetMealBean> select = setMealService.select(null);
//		for(SetMealBean bean:select) {
//			System.out.println("bean"+bean);
//		}
//	}
	
	
	
//	//DAO 新增食材
//	@Test
//	@Transactional
//	public void testInsertItem() {
//		SetMealBean setMealBean = new SetMealBean();
//		Set<I9sBean> i9sBeans = new HashSet<I9sBean>();
//		I9sBean bean1 = new I9sBean();
//		bean1.setI9sId(3);
//		I9sBean bean2 = new I9sBean();
//		bean2.setI9sId(4);
//
//		i9sBeans.add(bean1);
//		i9sBeans.add(bean2);
//		setMealBean.setName("TestPot6");
//		setMealBean.setPrice(1500);
//		setMealBean.setType(2);
//		
//		SetMealBean insert = setMealDAO.insert(setMealBean, i9sBeans);
//		Set<I9sBean> i9sBeans2 = insert.getI9sBeans();
//		for(I9sBean bean:i9sBeans2) {
//			System.out.println("bean="+bean);
//		}
//		System.out.println("insert="+insert);
//	}

//	//Service 新增套餐
//	@Test
//	@Transactional
//	@Rollback(false)
//	public void testServiceInsertMeal() {
//		SetMealBean meal = new SetMealBean();
//		meal.setName("HugePot");
//		meal.setPrice(1000);
//		meal.setType(2);
//		SetMealBean insertMeal = setMealService.insertMeal(meal);
//		System.out.println("insertMeal="+insertMeal);
//	}

//	//DAO 新增套餐
//	@Test
//	@Transactional
//	public void testInsertMeal() {
//		SetMealBean meal = new SetMealBean();
//		meal.setName("海陸總匯鍋");
//		meal.setPrice(790);
//		meal.setType(2);
//		SetMealBean insertMeal = setMealDAO.insertMeal(meal);
//		System.out.println("insertMeal="+insertMeal);
//	}

//	//Service 查詢
//	@Test
//	@Transactional
//	public void testServiceSelect() {
//		SetMealBean meal = new SetMealBean();
//		meal.setId(2);
//		List<List<Object>> meals = setMealService.select(meal);
//		System.out.println("meals="+meals);
//		
//		List<List<Object>> mealss = setMealService.select(null);
//		System.out.println("mealss"+mealss);
//		
//	}

//	//DAO單查
//	@Test
//	@Transactional
//	public void testsSelectOnly() {
//		List<Object> meals = setMealDAO.select(2);
//		SetMealBean  meal = (SetMealBean)meals.get(0);
//		Set<I9sBean> beans = (Set<I9sBean>)meals.get(1);
//		for(I9sBean bean:beans) {
//			System.out.println("bean="+bean);
//		}
//		System.out.println("meal="+meal);
//	}
//	
//	//DAO全查
//	@Test
//	@Transactional
//	public void testSelectAll() {
//		List<List<Object>> meals = setMealDAO.selectAll();
//		for(List<Object> lists:meals) {
//			System.out.println("Meal="+lists.get(0));
//			Set<I9sBean> i9sBens = (Set<I9sBean>)lists.get(1);
//			for(Object i9sBean:i9sBens) {
//				System.out.println("Item="+i9sBean);
//			}
//		}
//	}
}
