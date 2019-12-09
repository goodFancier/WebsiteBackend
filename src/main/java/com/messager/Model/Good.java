package com.messager.Model;

import com.messager.Model.ORM.ORMDto;
import com.messager.Model.audit.DateAudit;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Good extends DateAudit
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String oldPrice;

    private String currentPrice;

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getOldPrice()
    {
        return oldPrice;
    }

    public void setOldPrice(String oldPrice)
    {
        this.oldPrice = oldPrice;
    }

    public String getCurrentPrice()
    {
        return currentPrice;
    }

    public void setCurrentPrice(String currentPrice)
    {
        this.currentPrice = currentPrice;
    }
}
