package com.lxs.bill.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lxs.bill.mapper.TypeMapper;
import com.lxs.bill.po.BillType;

@Service
public class TypeService {
	
	@Resource
	private TypeMapper typeMapper;
	
	public List<BillType> list() {
		return typeMapper.selectType();
	}
	

}
