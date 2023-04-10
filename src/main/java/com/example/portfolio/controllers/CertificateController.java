package com.example.portfolio.controllers;

import com.example.portfolio.models.Certificates;
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
    public String certificateInfo(Model model, @PathVariable(name = "id") String id) {
        Long certificateID = Long.parseLong(id.trim());
        Certificates certificates = certificateService.getCertificateById(certificateID);
        model.addAttribute("certificates", certificates);
        model.addAttribute("images", certificates.getImages());
        return "certificate-info";
    }

    @PostMapping("/certificate/add")
    public String addCertificate(@RequestParam("file1") MultipartFile file1,
                                 @RequestParam("file2") MultipartFile file2,Certificates certificate) throws IOException {
        certificateService.saveCertificate(certificate,file1, file2);
        return "redirect:/";
    }
    @PostMapping("/certificate/delete/{id}")
    public String deleteCertificate(@PathVariable(name = "id") String id){
        Long certificateID = Long.parseLong(id.trim());
        certificateService.deleteCertificate(certificateID);
        return "redirect:/";
    }
}
