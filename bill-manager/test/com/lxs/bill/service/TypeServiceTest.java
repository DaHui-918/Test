package com.lxs.bill.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lxs.bill.po.BillType;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:beans.xml")
public class TypeServiceTest {
	
	@Autowired
	private TypeService typeService;

	@Test
	public void testList() {
		List<BillType> list = typeService.list();
		for (BillType billType : list) {
			System.out.println(billType.getName());
		}
	}

}
