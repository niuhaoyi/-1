package com.baidu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baidu.dto.Animal;

@Mapper
public interface AnimalMapper {

	public List<Animal> findList(Animal animal);
	
	public List<Animal> findListCount(Animal animal);

	public void deleteByIds(String ids);

	public List<Animal> findAnimal(Animal animal);

	public void addAnimal(Animal animal);

	public List<Animal> findType(Animal animal);

	public Animal findMenusByPwd(Animal animal);
}
