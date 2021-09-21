package com.fendihotpot.malapot.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.domain.SetMealBean;
import com.fendihotpot.malapot.i9sDao.SetMealDAO;
import com.fendihotpot.malapot.service.I9sService;
import com.fendihotpot.malapot.service.SetMealService;
import com.fendihotpot.malapot.service.TypeService;

@Controller
public class SetMealController {
	
	@PersistenceContext
	private Session session;

	@Autowired
	private SetMealService setMealService;
		
	@Autowired
	private SetMealDAO setMealDAO;
	
	@Autowired
	private TypeService typeService;
	

	// (後台)查詢所有套餐/食材並排列(meal.jsp)
	@RequestMapping(path = { "/backend/selectAllMeal.controller" })
	public String selectAll(Model model) {
		List<SetMealBean> test = setMealService.select(null);
		List<Set<I9sBean>> test1 = new ArrayList<Set<I9sBean>>();
		for(SetMealBean setMealBean: test) {
			Set<I9sBean> i9sBeans = setMealBean.getI9sBeans();
			test1.add(i9sBeans);
		}
		
		model.addAttribute("i9sBeanList",test1);
		model.addAttribute("setMeal",test);
		return "/backend/meal";
	}
	
	// (後台)點擊update跳轉至新頁面，並協助輸入點擊之套餐的名稱價格
	@RequestMapping(path= {"/pages/selectThis/{id}"})
	public String selectThis(Model model,@PathVariable Integer id) {
		SetMealBean setMealBean = setMealDAO.select(id);
		model.addAttribute("setMealBean",setMealBean);
		return "/backend/mealupdate";
	}
	
	// 抓取圖片檔名+副檔名
	@ModelAttribute
	public void addimage(Model model,HttpSession session) {
		String path = session.getServletContext().getRealPath("/upload/picture");
			model.addAttribute("path",path);
	}

	
	// (後台)點擊新增跳轉新增套餐頁面，輸入值送出新增，隨即跳回套餐管理
	@PostMapping(path= {"/pages/addMeal"})
	@ResponseBody
	public SetMealBean addMeal(SetMealBean bean,MultipartFile multipart,Model model){
		String path = (String)model.getAttribute("path");
		String fileName = UUID.randomUUID().toString() + multipart.getOriginalFilename().substring(multipart.getOriginalFilename().lastIndexOf('.'));
		bean.setPicture(fileName);
		try {
			multipart.transferTo(new File(path,fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		SetMealBean insertMeal = setMealService.insertMeal(bean);
		return insertMeal;
	}
	
	// (後台)點擊del，刪除套餐，並顯示刪除什麼且重新整理頁面
	@RequestMapping(path= {"/pages/deleteMeal"})
	@ResponseBody
	public boolean deleteMeal(Integer id) {
		boolean deleteMeal = setMealService.deleteMeal(id);
		return deleteMeal;
	}
	
	// (後台)點擊"確認修改"，修改名稱、價格
	@RequestMapping(path= {"/pages/updateMeal"})
	@ResponseBody
	public SetMealBean updateMeal(SetMealBean bean) {
		SetMealBean updateMeal = setMealService.updateMeal(bean);
		return updateMeal;
	}
	
	// (後台)點擊"食材調整"，出現自己食材清單+type1食材清單
	@RequestMapping(path= {"/pages/updateList/{id}"})
	public String updateList(@PathVariable Integer id,Model model) {
		//取出this的食材清單
		SetMealBean setMealBean = session.get(SetMealBean.class, id);
		Set<I9sBean> i9sBeans = setMealBean.getI9sBeans();
		//取出type1的食材清單
		List<Set<?>> selectAll = typeService.selectAll();
		Set<?> set = selectAll.get(0);
		//type1減this食材清單
		
		List<I9sBean> mealList = new ArrayList<I9sBean>();
		List<I9sBean> type1 = new ArrayList<I9sBean>();
		List<I9sBean> type1cutmealList = new ArrayList<I9sBean>();
		
		for(I9sBean bean:(Set<I9sBean>)set) {
			type1.add(bean);
			type1cutmealList.add(bean);
		}
		
		for(I9sBean bean:i9sBeans) {
			mealList.add(bean);
			type1cutmealList.remove(bean);
		}

		model.addAttribute("setMealBean",setMealBean);
		model.addAttribute("mealList",mealList);
		model.addAttribute("type1",type1cutmealList);
		
		return "/backend/meali9sbean";
	}
	
	// (後台)點擊新增食材，新增指定套餐的食材
	@RequestMapping(path= {"/pages/addi9sformeal/{id}"})
	@ResponseBody
	public Integer addi9sformeal(@RequestBody Integer[] ids,@PathVariable Integer id) {
		
		SetMealBean setMealBean = session.get(SetMealBean.class, id);
		List<I9sBean> i9sBeans = new ArrayList<I9sBean>();
		for(Integer i9sid:ids) {
			I9sBean i9sBean = session.get(I9sBean.class, i9sid);
			i9sBeans.add(i9sBean);
			setMealService.insertMealI9s(setMealBean, i9sBean);
		}	
		return i9sBeans.size();
	}
	
	//(後台)點擊刪除食材，刪除指定套餐中的指定食材
	@RequestMapping(path= {"/pages/deletei9sformeal/{id}"})
	@ResponseBody
	public Integer deletei9sformeal(@RequestBody Integer[] ids,@PathVariable Integer id) {
		SetMealBean setMealBean = session.get(SetMealBean.class, id);
		List<I9sBean> i9sBeans = new ArrayList<I9sBean>();
		for(Integer i9sid:ids) {
			I9sBean i9sBean = session.get(I9sBean.class, i9sid);
			i9sBeans.add(i9sBean);
			setMealService.deleteMealI9s(setMealBean, i9sBean);
		}
		return i9sBeans.size();
	}
	
}
