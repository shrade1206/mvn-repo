package com.fendihotpot.malapot.i9sDao;

import java.util.List;

import com.fendihotpot.malapot.domain.I9sBean;

public interface I9sDAO {
	public abstract I9sBean select(Integer i9sId);
	
	public abstract List<I9sBean> select(Integer i9sId,Integer currentPage,Integer pageSize);

	public abstract List<I9sBean> selectAll(Integer currentPage,Integer pageSize);

	public abstract I9sBean insert(I9sBean bean);

	public abstract I9sBean update(I9sBean bean);

	public abstract boolean delete(Integer i9sId);
	
	public abstract Integer totalRows();
}