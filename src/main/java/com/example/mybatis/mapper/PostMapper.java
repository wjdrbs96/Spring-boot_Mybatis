package com.example.mybatis.mapper;

import com.example.mybatis.dto.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PostMapper {

    Post findByPostId(@Param("postId") int postId);

    void insertPost(Post post);

}
