package com.example.portfolio.controllers;

import com.example.portfolio.models.Messages;
import com.example.portfolio.services.CertificateService;
import com.example.portfolio.services.MessagesService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor

public class MessageController {
    private final MessagesService messageService;
    private final CertificateService certificateService;
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/message")
    public String viewMessages(Model model, Principal principal) {
        model.addAttribute("messages", messageService.messagesList());
        model.addAttribute("user",certificateService.getUserByPrincipal(principal));
        return "message";
    }
    @PostMapping("/message/send")
    public String sendMessage(Messages message) {
        messageService.addMessage(message);
        return "redirect:/";
    }
    @PostMapping("/message/delete/{id}")
    public String deleteMessage(@PathVariable(name = "id") String id){
        Long messageID = Long.parseLong(id.trim());
        messageService.deleteMessage(messageID);
        return "redirect:/message";
    }
}

