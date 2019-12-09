package com.messager.Controller;

import com.messager.Model.Good;
import com.messager.Repository.GoodsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class CatalogueController
{
    @Autowired
    public GoodsRepository goodsRepository;

    @GetMapping("/getCatalogueOfGoods")
    public List<Good> getCatalogueOfGoods()
    {
        return goodsRepository.findAll();
    }
}
