package com.example.portfolio.controllers;

import com.example.portfolio.models.Works;
import com.example.portfolio.services.WorkService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class WorkController {
    private final WorkService workService;
    @GetMapping("/works")
    public String viewWork(Model model){
        model.addAttribute("works", workService.worksList());
        return "works";
    }
    @PostMapping("/work/add")
    public String addWork(Works works){
        workService.saveWork(works);
        return "redirect:/";
    }
    @PostMapping("/work/delete/{id}")
    public String deleteWork(@PathVariable Long id){
        workService.deleteWork(id);
        return "redirect:/";
    }
}
