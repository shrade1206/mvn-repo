package com.fendihotpot.malapot.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fendihotpot.malapot.dao.I9sDAO;
import com.fendihotpot.malapot.domain.I9sBean;

@Service
@Transactional
public class I9sService {
	@Autowired
	private I9sDAO i9sDAO;
	
	private final Integer pageSize = 10;
	
	public Integer totalPage() {
		  return ((i9sDAO.totalRows()+this.pageSize-1)/this.pageSize);
		 }
	
	@Transactional(readOnly = true)
	public List<I9sBean> select(I9sBean bean,Integer currentpage) {
		List<I9sBean> result = null;
		if(bean!=null && bean.getI9sId()!=null && !bean.getI9sId().equals(0)) {
				result = new ArrayList<I9sBean>();
				result.add(i9sDAO.select(bean.getI9sId()));
		} else {
			result = i9sDAO.selectAll(currentpage,this.pageSize); 
		}
		return result;
	}
	
//	@Transactional(readOnly = true)
//	public List<I9sBean> select(I9sBean bean) {
//		List<I9sBean> result = null;
//		if(bean!=null && bean.getI9sId()!=null && !bean.getI9sId().equals(0)) {
//			I9sBean temp = i9sDAO.select(bean.getI9sId());
//			if(temp!=null) {
//				result = new ArrayList<I9sBean>();
//				result.add(temp);
//			}
//		} else {
//			result = i9sDAO.selectAll(); 
//		}
//		return result;
//	}
	
	public I9sBean insert(I9sBean bean) {
		I9sBean result = null;
		if(bean!=null) {
			result = i9sDAO.insert(bean);
		}
		return result;
		
	}
	public I9sBean update(I9sBean bean) {
		I9sBean result = null;
		if(bean!=null && bean.getI9sId()!=null) {
			result = i9sDAO.update(bean);
		}
		return result;
	}
	public boolean delete(I9sBean bean) {
		boolean result = false;
		if(bean!=null && bean.getI9sId()!=null) {
			result = i9sDAO.delete(bean.getI9sId());
		}
		return result;
	}
}