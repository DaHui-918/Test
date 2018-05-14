package com.lxs.bill.mapper;

import java.util.List;

import com.lxs.bill.po.Bill;

public interface BillMapper {
	
	public List<Bill> selectBill(Bill b);
	
	public int insertBill(Bill b);
	
	public Bill selectBillById(Long id);
	
	public int updateBill(Bill b);
	
	public int deleteBill(Long id);
}
