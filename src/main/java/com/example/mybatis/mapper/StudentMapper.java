package com.example.mybatis.mapper;

import com.example.mybatis.dto.Student;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StudentMapper {
    Student findOne(int id);
    Student findByStudentNumber(String studentNumber);
    List<Student> findAll();
    void insert(Student student);
    void update(Student student);
    void delete(int id);


}
