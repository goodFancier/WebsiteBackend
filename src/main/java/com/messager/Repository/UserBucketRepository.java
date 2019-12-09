package com.messager.Repository;

import com.messager.Model.User;
import com.messager.Model.UserBucket;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserBucketRepository extends JpaRepository<UserBucket, Long>
{
    Optional<UserBucket> findByUser(User user);
}
