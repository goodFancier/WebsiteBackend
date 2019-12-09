package com.messager.Repository;

import com.messager.Model.Good;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GoodsRepository extends JpaRepository<Good, Long>
{
}
