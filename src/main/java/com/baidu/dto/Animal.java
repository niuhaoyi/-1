package com.baidu.dto;

import lombok.Data;

@Data
public class Animal {

	private Integer animalid;
	private String animalname;
	private String createdate;
	
	private Integer tid;
	private String tname;
	
	private Integer aid;
	private String aname;
	
	
	private int page;
	private int rows;
	
	private String keywords;

	
}
