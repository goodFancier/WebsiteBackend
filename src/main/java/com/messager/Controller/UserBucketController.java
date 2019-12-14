package com.messager.Controller;

import com.messager.model.Good;
import com.messager.model.User;
import com.messager.model.UserBucket;
import com.messager.Repository.UserBucketRepository;
import com.messager.Repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class UserBucketController
{
    private static final Logger logger = LoggerFactory.getLogger(UserBucketController.class);

    @Autowired
    private UserBucketRepository userBucketRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/getUserGoods")
    public List<Good> getUserGoods(@RequestParam(value = "userId") String userId)
    {
        UserBucket userBucket;
        Optional<User> user = userRepository.findById(Long.valueOf(userId));
        if (user.isPresent())
        {
            boolean isUserBucketPresent = userBucketRepository.findByUser(user.get()).isPresent();
            if (isUserBucketPresent)
            {
                userBucket = userBucketRepository.findByUser(user.get()).get();
                return userBucket.getBucketGoods();
            } else
            {
                logger.info("Корзины не найдено. Создаем новую для пользователя");
                userBucket = new UserBucket();
                userBucket.setUser(user.get());
                return new ArrayList<>();
            }
        } else
        {
            logger.error("не удалось получить пользователя по id");
            return new ArrayList<>();
        }
    }
}
