package com.messager.Controller;

import com.messager.Model.Message;
import com.messager.Repository.MessageRepository;
import com.messager.payload.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/message")
public class MessageController
{
    private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

    @Autowired
    private MessageRepository messageRepository;

    @PostMapping("/send")
    public ResponseEntity<?> processMessage(@RequestParam(value = "message") String messageText, @RequestParam(value = "recipient") Long recipient, @RequestParam(value = "sender") Long sender)
    {
        Message message = new Message();
        message.setMessageText(messageText);
        message.setMessageRecipient(recipient);
        message.setMessageSender(sender);
        return ResponseEntity.ok(new ApiResponse(true, "Message sent", new Date()));
    }

    @GetMapping("/getLastDialogParticipants")
    public List<String> getLastDialogParticipants()
    {
        List<String> dialogParticipants = messageRepository.findLastDialogParticipants();
        return dialogParticipants;
    }
}
