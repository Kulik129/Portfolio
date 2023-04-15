package com.example.portfolio.services;

import com.example.portfolio.models.Messages;
import com.example.portfolio.repository.MessagesRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class MessagesService {
    private final MessagesRepository messagesRepository;
    public List<Messages> messagesList(){
        return messagesRepository.findAll();
    }
    public void addMessage(Messages message){
        messagesRepository.save(message);
    }
    public void deleteMessage(Long id) {
        messagesRepository.deleteById(id);
    }
    public Messages getMessageById(Long id){
        return messagesRepository.findById(id).orElse(null);
    }
}
