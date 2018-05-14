package com.lxs.bill.po;

import java.io.Serializable;
import java.util.Date;

public class Bill implements Serializable {
	
	private Long id;
	private String title;
	private Date  billTime;
	private Long  typeId;
	private Double price;
	private String explain;
	
	private String filePath;
	private String fileName;
	
	/**
	 * 关联账单类型的属性
	 */
	private BillType type;
	
	/**
	 * 开始时间
	 */
	private Date date1;
	
	/**
	 * 结束时间
	 */
	private Date date2;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getBillTime() {
		return billTime;
	}

	public void setBillTime(Date billTime) {
		this.billTime = billTime;
	}

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public Date getDate1() {
		return date1;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}

	public Date getDate2() {
		return date2;
	}

	public void setDate2(Date date2) {
		this.date2 = date2;
	}

	public BillType getType() {
		return type;
	}

	public void setType(BillType type) {
		this.type = type;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
