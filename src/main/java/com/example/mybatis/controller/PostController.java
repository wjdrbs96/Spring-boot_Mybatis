package com.example.mybatis.controller;

import com.example.mybatis.dto.Post;
import com.example.mybatis.mapper.PostMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class PostController {

    private PostMapper postMapper;

    public PostController(PostMapper postMapper) {
        this.postMapper = postMapper;
    }

    @RequestMapping(value = "post", method = RequestMethod.GET)
    public String findPost(@RequestParam("postId") int postId) {
        Post post = postMapper.findByPostId(postId);
        System.out.println("### " + post.getContent());
        return "index";
    }

    @RequestMapping(value = "post/write", method = RequestMethod.POST)
    public String postWrite(@RequestParam("title") String title,
                            @RequestParam("content") String content,
                            @RequestParam("number") int memberId) {
        Post post = new Post();
        post.setTitle(title);
        post.setContent(content);
        post.setMemberId(memberId);
        post.setCount(1);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        post.setCreateDateTime(sdf.format(new Date()));
        postMapper.insertPost(post);
        return "index";
    }

}
