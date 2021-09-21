package com.fendihotpot.malapot.i9sDao;

import java.util.List;
import java.util.Set;

import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.domain.SetMealBean;

public interface SetMealDAO {
	public abstract SetMealBean select(Integer id);
	
	public abstract List<SetMealBean> selectAll();
	
	public abstract SetMealBean insertMeal(SetMealBean bean);
	
	public abstract Set<I9sBean> insertMealI9s(SetMealBean bean,I9sBean i9sbean);
	
	public abstract SetMealBean updateMeal(SetMealBean bean);
	
	public abstract Set<I9sBean> deleteMealI9s(SetMealBean bean,I9sBean i9sBean);
	
	public abstract boolean deleteMeal(Integer setId);
}
