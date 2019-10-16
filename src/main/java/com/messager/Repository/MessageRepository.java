package com.messager.Repository;


import com.messager.Model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long>
{

    @Query("Select m from Message m where m.messageSender = :messageSender")
    List<Message> findByMessageSender(@Param("messageSender") Long messageSender);

    @Query("Select m from Message m where m.messageRecipient = :messageRecipient")
    List<Message> findByMessageRecipient(@Param("messageRecipient") Long messageRecipient);

    @Query("Select u.username from Message m INNER JOIN User u ON m.messageRecipient = u.id")
    List<String> findLastDialogParticipants();
}
