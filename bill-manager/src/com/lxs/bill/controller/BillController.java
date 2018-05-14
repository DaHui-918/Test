package com.lxs.bill.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.lxs.bill.po.Bill;
import com.lxs.bill.po.BillType;
import com.lxs.bill.service.BillService;
import com.lxs.bill.service.TypeService;

@Controller
@RequestMapping("/bill")
public class BillController {

	@Resource
	private TypeService typeService;

	@Resource
	private BillService billService;

	/**
	 * 查询
	 * 
	 * @param b
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(Bill b, Model model) {
		List<Bill> list = billService.list(b);
		model.addAttribute("list", list);

		List<BillType> types = typeService.list();
		model.addAttribute("types", types);

		return "list";
	}

	/**
	 * 分页查询
	 * 
	 * @param b
	 * @param model
	 * @return
	 */
	@RequestMapping("/list-page")
	public String listPage(Bill b, Model model, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "10") int pageSize) {

		PageInfo<Bill> page = billService.listPage(b, pageNum, pageSize);

		model.addAttribute("page", page);

		List<BillType> types = typeService.list();
		model.addAttribute("types", types);

		return "list-page";
	}

	/**
	 * 调到添加页面
	 * 
	 * @return
	 */
	@RequestMapping("/toAdd")
	public String toAdd(Model model) {
		List<BillType> types = typeService.list();
		model.addAttribute("types", types);

		return "add";
	}

	/**
	 * 执行添加
	 * 
	 * @param b
	 * @return
	 */
	@RequestMapping("/add")
	public String add(@RequestParam("file") MultipartFile file, Bill b, HttpServletRequest request) {

		// 发布到tomcat的项目的路径
		String path = request.getServletContext().getRealPath("/");

		String originalFileName = file.getOriginalFilename(); // c:/a/jsps.zip

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String fileName = FilenameUtils.getBaseName(originalFileName) + "-" + sdf.format(new Date()) + "-" + new Random().nextInt(10)
				+ "." + FilenameUtils.getExtension(originalFileName);

		try {
			file.transferTo(new File(path + "upload\\" + fileName ));
		} catch (Exception e) {
			e.printStackTrace();
		}

		b.setFilePath(path + "upload\\" + fileName);
		
		b.setFileName(originalFileName);
		
		billService.add(b);

		return "redirect:/bill/list";
	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable(value="id") Long id) {
		billService.delete(id);

		return "redirect:/bill/list";
	}

	/**
	 * 加载跳到修改页面
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toUpdate/{id}")
	public String toUpdate(@PathVariable("id") Long id, Model model) {
		Bill bill = billService.get(id);
		model.addAttribute("bill", bill);

		List<BillType> types = typeService.list();
		model.addAttribute("types", types);

		return "update";
	}

	/**
	 * 执行修改
	 * 
	 * @param b
	 * @return
	 */
	@RequestMapping("/update")
	public String update(Bill b) {
		billService.update(b);
		return "redirect:/bill/list";
	}

	/**
	 * 文件下载
	 * @param id
	 * @param response
	 */
	@RequestMapping("/download/{id}")
	public void download(@PathVariable("id") Long id, HttpServletResponse response) throws Exception {
		Bill b = billService.get(id);
		
		//设置下载的文件名
		response.setHeader("Content-disposition",
				"attachment; filename=" + new String(b.getFileName().getBytes(), "ISO8859-1")); //下载文件名
		
		InputStream in = new FileInputStream(b.getFilePath());
		OutputStream out = response.getOutputStream(); 
		
		FileCopyUtils.copy(in, out);
		in.close();
		out.close();
	}
	
	

}
