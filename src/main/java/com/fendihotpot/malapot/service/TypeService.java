package com.fendihotpot.malapot.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fendihotpot.malapot.i9sDao.TypeDAO;

@Service
@Transactional
public class TypeService {

	@Autowired
	private TypeDAO typeDAO;
	
	public List<Set<?>> selectAll(){
		List<Set<?>> temp = typeDAO.selectAll();
		return temp;
	}
	
}
