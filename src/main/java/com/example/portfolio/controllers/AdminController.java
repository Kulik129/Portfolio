package com.example.portfolio.controllers;

import com.example.portfolio.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {
    private final UserService userService;
    @GetMapping("/admin")
    public String admin(Model model){
        model.addAttribute("users", userService.userList());
        return "admin";
    }

    @PostMapping("/admin/user/block/{id}")
    public String userBlock(@PathVariable("id") Long id) {
        userService.blockUser(id);
        return "redirect:/admin";
    }
}
