package com.lxs.bill.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lxs.bill.po.Bill;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:beans.xml"})
public class BillServiceTest {
	
	@Resource
	private BillService billService;
	@Test
	public void testList() {
		List<Bill> list = billService.list(new Bill());
		for (Bill bill : list) {
			System.out.println(bill.getType().getName());
		}
	}
	
	
	public void testListPage() {
		
		//设置分页参数,第一个参数：当前页,第二个参数：每页行数
		PageHelper.startPage(21, 10);
		
		List<Bill> list = billService.list(new Bill());
		
		//把list结果包装pageInfo，pageInfo中有我们分页数据
		PageInfo<Bill> page = new PageInfo<>(list);
		
		//当前页数据
		for (Bill bill : page.getList()) {
			System.out.println(bill.getId() + "\t" + bill.getTitle());
		}
		
		System.out.println("总行数=" + page.getTotal());
		System.out.println("当前页=" + page.getPageNum());
		System.out.println("每页行数=" + page.getPageSize());
		System.out.println("总页数=" + page.getPages());
		System.out.println("起始行数=" + page.getStartRow());
		
		System.out.println("是第一页=" + page.isIsFirstPage());
		System.out.println("是最后页=" + page.isIsLastPage());
		
		System.out.println("还有下一页=" + page.isHasNextPage());
		System.out.println("还有上一页=" + page.isHasPreviousPage());
	}
	

}
