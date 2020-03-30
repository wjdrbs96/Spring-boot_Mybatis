package com.example.mybatis.mapper;

import com.example.mybatis.dto.Department;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DepartmentMapper {
    List<Department> findAll();
}
