package com.spring.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {


    /**
     * 商品列表页
     *
     * @return
     */
    @GetMapping("productList")
    public String productList(Integer typeId) {


        return "front/product/listproducts";
    }

    /**
     * 商品列表网格页
     *
     * @return
     */
    @GetMapping("productGrid")
    public String productGrid(Integer typeId) {


        return "front/product/gridproducts";
    }

    /**
     * 商品详情页
     *
     * @return
     */
    @GetMapping("detailLeft")
    public String detailLeft(Long productId) {


        return "front/product/productdetails-leftsidebar";
    }

    /**
     * 商品详情页
     *
     * @return
     */
    @GetMapping("detailRight")
    public String detailRight(Long productId) {


        return "front/product/productdetails-rightsidebar";
    }

    /**
     * 商品详情页
     *
     * @return
     */
    @GetMapping("detailFull")
    public String detailFull(Long productId) {


        return "front/product/productdetails-fullwidth";
    }


}
