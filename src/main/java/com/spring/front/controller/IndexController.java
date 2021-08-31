package com.spring.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {

    /**
     * 前台主页面
     *
     * @return
     */
    @GetMapping
    public String index() {


        return "front/index";
    }




}
