package com.baidu.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baidu.dto.Animal;
import com.baidu.mapper.AnimalMapper;

@Controller
public class AnimalControl {

	@Autowired
	private AnimalMapper am;
	
	//列表
	@RequestMapping("list")
	@ResponseBody
	public Map<String, Object> findList(Animal animal){
		Map<String,Object> map = new HashMap<String, Object>();
		animal.setPage((animal.getPage()-1)*animal.getRows());
		map.put("total", am.findListCount(animal));
		map.put("rows", am.findList(animal));
		return map;
	}
	//删除
	@RequestMapping("deleteByIds")
	@ResponseBody
	public boolean deleteByIds(String ids){
		try {
			am.deleteByIds(ids);
			return true;
		} catch (Exception e) {
			e.getMessage();
			return false;
		}
	}
	//添加
	@RequestMapping("addAnimal")
	@ResponseBody
	public boolean addAnimal(Animal animal){
		try {
			am.addAnimal(animal);
			return true;
		} catch (Exception e) {
			e.getMessage();
			return false;
		}
	}
	//回显分布区域
	@RequestMapping("findAnimal")
	@ResponseBody
	public List<Animal> findAnimal(Animal animal){
		return am.findAnimal(animal);
	}
	//回显种类
	@RequestMapping("findType")
	@ResponseBody
	public List<Animal> findType(Animal animal){
		return am.findType(animal);
	}
	
	// 登录
		@RequestMapping("toLogin")
		@ResponseBody
		public boolean login(Animal animal,HttpServletRequest request) {
			Animal lu = am.findMenusByPwd(animal);
			if (lu == null) {
				return false;//表示登录失败
			} else {
				//表示登录成功
				//保存用户登录的状态
				request.getSession().setAttribute("user", lu);
				return true;
			}
		}
}
