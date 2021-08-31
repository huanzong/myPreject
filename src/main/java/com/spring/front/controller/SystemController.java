package com.spring.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SystemController {

    /**
     * 关于我们页面
     *
     * @return
     */
    @GetMapping("about")
    public String index() {


        return "front/system/about";
    }

}
