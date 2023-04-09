package com.example.portfolio.controllers;

import com.example.portfolio.models.Certificates;
import com.example.portfolio.models.Works;
import com.example.portfolio.services.CertificateService;
import com.example.portfolio.services.WorkService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class CertificateController {
    private final CertificateService certificateService;
    private final WorkService workService;
    @GetMapping("/certificates")
    public String viewCertificates( Model model){
        model.addAttribute("certificates", certificateService.certificatesList());
        return "certificates";
    }
    @GetMapping("/")
    public String certificate( Model model){
        model.addAttribute("certificates", certificateService.certificatesList());
        model.addAttribute("works", workService.worksList());
        return "main";
    }
    @GetMapping("/certificates/{id}")
    public String certificateInfo(Model model, @PathVariable Long id) {
        Certificates certificates = certificateService.getCertificateById(id);
        model.addAttribute("certificates", certificates);
        return "certificate-info";
    }

    @PostMapping("/certificate/add")
    public String addCertificate(Certificates certificate) throws IOException {
        certificateService.saveCertificate(certificate);
        return "redirect:/";
    }
    @PostMapping("/certificate/delete/{id}")
    public String deleteCertificate(@PathVariable Long id){
        certificateService.deleteCertificate(id);
        return "redirect:/";
    }
}
