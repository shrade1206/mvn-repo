package com.fendihotpot.malapot.dao;

import java.util.List;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.fendihotpot.malapot.domain.I9sBean;



@Repository
public class I9sDAOHibernate implements I9sDAO{
	@PersistenceContext
	private Session session;
	
	@Override
	public Integer totalRows() {
		String hql = "SELECT COUNT(i9s.id) FROM I9sBean as i9s";
		// 跟數字有關的查詢都會是long型別，intValue()，把傳回來的值變成整數
		return session.createQuery(hql,Long.class).uniqueResult().intValue();
	}
	
	
// 查單筆
	@Override
	public I9sBean select(Integer i9sId) {
		if(i9sId!=null) {
			return session.get(I9sBean.class, i9sId);
		}
		return null;
	}
// 查單筆 + 分頁
	@Override
	public List<I9sBean> select(Integer i9sId,Integer currentpage,Integer pageSize) {
		if(i9sId!=null) {
			String hql = "FROM I9sBean WHERE id=:id ORDER BY id DESC";
			List<I9sBean> bean = session.createQuery(hql,I9sBean.class)
					.setParameter("id", i9sId)
					.setFirstResult((currentpage -1 ) * pageSize)
					.setMaxResults(pageSize)
					.list();
			return bean;
		}
		return null;
	}
// 查全部資料 + 分頁
	@Override
	public List<I9sBean> selectAll(Integer currentPage,Integer pageSize) {
		String hql = "FROM I9sBean ORDER BY id DESC";
		List<I9sBean> pagination = session.createQuery(hql,I9sBean.class)
				.setFirstResult((currentPage - 1 ) * pageSize)
				.setMaxResults(pageSize)
				.list();
		return 	pagination;
	}
// insert
	@Override
	public I9sBean insert(I9sBean bean) {
		String hql = "from I9sBean where name=:name";
		if(bean!=null && bean.getI9sName()!=null) {
			I9sBean temp =session
					.createQuery(hql, I9sBean.class)
					.setParameter("name", bean.getI9sName())
					.uniqueResult();
			if(temp==null) {
				Integer pk = (Integer) session.save(bean);
				I9sBean newI9s = session.get(I9sBean.class, pk);
				return newI9s;
			}
		}
		return null;
	}
// 更新資料
	@Override
	public I9sBean update(I9sBean bean) {
		if(bean.getI9sId()!=null) {
			I9sBean i9sBean = session.get(I9sBean.class, bean.getI9sId());
			if(bean!=null) {
				i9sBean.setI9sName(bean.getI9sName());
				i9sBean.setUnit(bean.getUnit());
				i9sBean.setKcal(bean.getKcal());
				i9sBean.setI9sPrice(bean.getI9sPrice());
				i9sBean.setI9sType(bean.getI9sType());
				i9sBean.setI9sPicture(bean.getI9sPicture());
				return i9sBean;
			}
		}
		return null;
	}
// 刪除資料
	@Override
	public boolean delete(Integer i9sId) {
		if(i9sId!=null && !i9sId.equals(0)) {
			I9sBean bean = session.get(I9sBean.class, i9sId);
			if(bean!=null) {
				session.delete(bean);
				return true;
			}
		}
		return false;
	}
}