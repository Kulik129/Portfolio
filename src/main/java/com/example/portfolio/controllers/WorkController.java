package com.example.portfolio.controllers;

import com.example.portfolio.models.Works;
import com.example.portfolio.services.CertificateService;
import com.example.portfolio.services.WorkService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class WorkController {
    private final WorkService workService;
    private final CertificateService certificateService;

    @GetMapping("/works")
    public String viewWork(Model model, Principal principal){
        model.addAttribute("works", workService.worksList());
        model.addAttribute("user",certificateService.getUserByPrincipal(principal));
        return "works";
    }
    @GetMapping("work/{id}")
    public String workInfo(Model model, @PathVariable(name = "id") String id){
        Long workID = Long.parseLong(id.trim());
        Works work = workService.getWorkById(workID);
        model.addAttribute("works", work);
        model.addAttribute("images", work.getImages());
        return "work-info";
    }

    @PostMapping("/work/add")
    public String addWork(@RequestParam("file1") MultipartFile file1,
                          @RequestParam("file2") MultipartFile file2, Works works)throws IOException {
        workService.saveWork(works, file1, file2);
        return "redirect:/";
    }
    @PostMapping("/work/delete/{id}")
    public String deleteWork(@PathVariable Long id){
        workService.deleteWork(id);
        return "redirect:/";
    }
}
