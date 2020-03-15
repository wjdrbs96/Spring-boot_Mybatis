package com.example.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PostController {

    @Autowired
    private PostMapper postMapper;

    @RequestMapping(value = "post", method = RequestMethod.GET)
    public String findPost(@RequestParam("postId") int postId) {
        Post post = postMapper.findByPostId(postId);
        System.out.println("### " + post.getContent());
        return "index";
    }
}
