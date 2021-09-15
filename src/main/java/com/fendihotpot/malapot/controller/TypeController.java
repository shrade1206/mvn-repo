package com.fendihotpot.malapot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.domain.SetMealBean;
import com.fendihotpot.malapot.domain.TypeBean;
import com.fendihotpot.malapot.service.TypeService;

@Controller
public class TypeController {
	
	@PersistenceContext
	private Session session;
	
	@Autowired
	private TypeService typeService;
	
	@RequestMapping(path= {"/pages/takeout.typeController"})
	public String handlderMethod(Model model) {
		Map<String, List<?>> type = new HashMap<String, List<?>>();
		Map<String, List<?>> meals = new HashMap<String, List<?>>();
		model.addAttribute("type", type);
		model.addAttribute("meals", meals);
		
		//取出所有各類型品項
		List<Set<?>> result = typeService.selectAll();
		
		List<I9sBean> i9s = new ArrayList<I9sBean>();
		List<SetMealBean> setMeal = new ArrayList<SetMealBean>();
		List<I9sBean> worthSoup = new ArrayList<I9sBean>();
		List<I9sBean> dessert = new ArrayList<I9sBean>();
		List<I9sBean> freeSoup = new ArrayList<I9sBean>();
		List<Set<I9sBean>> setMealList = new ArrayList<Set<I9sBean>>();
		List<Integer> totalKcals = new ArrayList<Integer>();

//		食材
//		${type.i9s}
		Set<?> type1 = result.get(0);
		for(Object i9sBean:type1) {
			i9s.add((I9sBean)i9sBean);
		}

//		套餐
//		${type.meal}
//		${meal.kcal}
//		${meal.i9s}
		Set<?> type2 = result.get(1);
		for(Object setMealBean:type2) {
			setMeal.add((SetMealBean)setMealBean);
			SetMealBean test = (SetMealBean)setMealBean;
			Set<I9sBean> i9sBeans = test.getI9sBeans();
			setMealList.add(i9sBeans);
			Integer totalKcal = 0;
			for(I9sBean bean:i9sBeans) {
				Integer i9sKcal = bean.getKcal();
				totalKcal += i9sKcal;
			}
			totalKcals.add(totalKcal);
		}
		
//		湯底
//		${type.worthsoup}
		Set<?> type3 = result.get(2);
		for(Object i9sBean:type3) {
			worthSoup.add((I9sBean)i9sBean);
		}
		
//		甜點
//		${type.dessert}
		Set<?> type4 = result.get(3);
		for(Object i9sBean:type4) {
			dessert.add((I9sBean)i9sBean);
		}
		
//		免費
//		${type.freesoup}
		Set<?> type5 = result.get(4);
		for(Object i9sBean:type5) {
			freeSoup.add((I9sBean)i9sBean);
		}
		
		type.put("i9s", i9s);
		type.put("setMeal", setMeal);
		type.put("worthSoup", worthSoup);
		type.put("dessert", dessert);
		type.put("freeSoup", freeSoup);
		meals.put("setMealList", setMealList);
		meals.put("totalKcals", totalKcals);
		
		return "/pages/takeout";
	}
	
	@RequestMapping(path= {"/pages/fmenu.typeController"})
	public String Method1(Model model) {
		Map<String, List<?>> type = new HashMap<String, List<?>>();
		Map<String, List<?>> meals = new HashMap<String, List<?>>();
		model.addAttribute("type", type);
		model.addAttribute("meals", meals);
		
		//取出所有各類型品項
		List<Set<?>> result = typeService.selectAll();
		
		List<I9sBean> i9s = new ArrayList<I9sBean>();
		List<SetMealBean> setMeal = new ArrayList<SetMealBean>();
		List<I9sBean> worthSoup = new ArrayList<I9sBean>();
		List<I9sBean> dessert = new ArrayList<I9sBean>();
		List<I9sBean> freeSoup = new ArrayList<I9sBean>();
		List<Set<I9sBean>> setMealList = new ArrayList<Set<I9sBean>>();
		List<Integer> totalKcals = new ArrayList<Integer>();

//		食材
//		${type.i9s}
		Set<?> type1 = result.get(0);
		for(Object i9sBean:type1) {
			i9s.add((I9sBean)i9sBean);
		}

//		套餐
//		${type.meal}
//		${meal.kcal}
//		${meal.i9s}
		Set<?> type2 = result.get(1);
		for(Object setMealBean:type2) {
			setMeal.add((SetMealBean)setMealBean);
			SetMealBean test = (SetMealBean)setMealBean;
			Set<I9sBean> i9sBeans = test.getI9sBeans();
			setMealList.add(i9sBeans);
			Integer totalKcal = 0;
			for(I9sBean bean:i9sBeans) {
				Integer i9sKcal = bean.getKcal();
				totalKcal += i9sKcal;
			}
			totalKcals.add(totalKcal);
		}
		
//		湯底
//		${type.worthsoup}
		Set<?> type3 = result.get(2);
		for(Object i9sBean:type3) {
			worthSoup.add((I9sBean)i9sBean);
		}
		
//		甜點
//		${type.dessert}
		Set<?> type4 = result.get(3);
		for(Object i9sBean:type4) {
			dessert.add((I9sBean)i9sBean);
		}
		
//		免費
//		${type.freesoup}
		Set<?> type5 = result.get(4);
		for(Object i9sBean:type5) {
			freeSoup.add((I9sBean)i9sBean);
		}
		
		type.put("i9s", i9s);
		type.put("setMeal", setMeal);
		type.put("worthSoup", worthSoup);
		type.put("dessert", dessert);
		type.put("freeSoup", freeSoup);
		meals.put("setMealList", setMealList);
		meals.put("totalKcals", totalKcals);
		
		return "/pages/fmenu";
	}
	
	@RequestMapping(path = { "/pages/type{id}" })
	public String typeMethod(Model model,@PathVariable Integer id) {
		Map<String, List<?>> type = new HashMap<String, List<?>>();
		model.addAttribute("type", type);
		//取出所有各類型品項
		List<Set<?>> result = typeService.selectAll();
		List<I9sBean> i9s = new ArrayList<I9sBean>();
		
		TypeBean typeBean = session.get(TypeBean.class, id);
		String name = typeBean.getName();
		
		Set<?> type1 = result.get(id-1);
		for (Object i9sBean : type1) {
			i9s.add((I9sBean) i9sBean);
		}
		type.put("i9s", i9s);
		model.addAttribute("name",name);
		return "/backend/type01";
	}
	
}
