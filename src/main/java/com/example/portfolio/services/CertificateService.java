package com.example.portfolio.services;

import com.example.portfolio.models.Certificates;
import com.example.portfolio.repository.CertificateRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CertificateService {
    private final CertificateRepository certificateRepository;

    public List<Certificates> certificatesList(String title){
        if (title != null) {
            return certificateRepository.findByTitle(title);
        } return certificateRepository.findAll();
    }
    public void saveCertificate(Certificates certificate) {
        log.info("Save {}", certificate);
        certificateRepository.save(certificate);
    }
    public void deleteCertificate(Long id){
        certificateRepository.deleteById(id);
    }

    public Certificates getCertificateById(Long id) {
        return certificateRepository.findById(id).orElse(null);
    }

}
