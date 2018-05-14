package com.lxs.bill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lxs.bill.mapper.BillMapper;
import com.lxs.bill.po.Bill;

@Service
public class BillService {
	
	@Autowired
	private BillMapper billMapper;
	
	public List<Bill> list(Bill b) {
		return billMapper.selectBill(b);
	}
	
	/**
	 * 分页
	 * @param b
	 * @param pageNum：当前页
	 * @param pageSize：每页行数
	 * @return
	 */
	public PageInfo<Bill> listPage(Bill b, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<>(billMapper.selectBill(b));
	}
	
	public int add(Bill b) {
		return billMapper.insertBill(b);
	}
	
	public Bill get(Long id) {
		return billMapper.selectBillById(id);
	}
	
	public int update(Bill b) {
		return billMapper.updateBill(b);
	}
	
	public int delete(Long id) {
		return billMapper.deleteBill(id);
	}
	
	

}
