package com.example.portfolio.controllers;

import com.example.portfolio.models.User;
import com.example.portfolio.models.enums.Role;
import com.example.portfolio.services.CertificateService;
import com.example.portfolio.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {
    private final UserService userService;
    private final CertificateService certificateService;
    @GetMapping("/admin")
    public String admin(Model model, Principal principal){
        model.addAttribute("users", userService.userList());
        model.addAttribute("user",certificateService.getUserByPrincipal(principal));
        return "admin";
    }

    @PostMapping("/admin/user/block/{id}")
    public String userBlock(@PathVariable("id") Long id) {
        userService.blockUser(id);
        return "redirect:/admin";
    }
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }

    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }
}
