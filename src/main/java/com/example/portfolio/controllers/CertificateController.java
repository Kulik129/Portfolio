package com.example.portfolio.controllers;

import com.example.portfolio.models.Certificates;
import com.example.portfolio.services.CertificateService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class CertificateController {
    private final CertificateService certificateService;

    @GetMapping("/")
    public String certificate(@RequestParam(name = "title", required = false)String title, Model model){
        model.addAttribute("certificates", certificateService.certificatesList(title));
        return "main";
    }

    @PostMapping("/certificate/add")
    public String addCertificate(Certificates certificate){
        certificateService.saveCertificate(certificate);
        return "redirect:/";
    }
    @PostMapping("/certificate/delete/{id}")
    public String deleteCertificate(@PathVariable Long id){
        certificateService.deleteCertificate(id);
        return "redirect:/";
    }
}
