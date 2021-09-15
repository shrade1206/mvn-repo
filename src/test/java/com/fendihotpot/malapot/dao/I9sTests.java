package com.fendihotpot.malapot.dao;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.fendihotpot.malapot.domain.I9sBean;



@RunWith(SpringRunner.class)
@SpringBootTest
public class I9sTests {
	@Autowired
	private I9sRepository i9sRepository;
	
	
	@Test
	@Transactional
	public void test() throws Exception {
		//查全部
		List<I9sBean> selectAll = i9sRepository.findAll();
		System.out.println(selectAll);
		//查指定ID
		Optional<I9sBean> selectOne = i9sRepository.findById(7);
		System.out.println(selectOne);
		
//		Optional<I9sBean> findOne = i9sRepository.findOne(null);
	}
}
