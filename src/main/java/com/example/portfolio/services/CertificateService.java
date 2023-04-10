package com.example.portfolio.services;

import com.example.portfolio.models.Certificates;
import com.example.portfolio.models.Image;
import com.example.portfolio.repository.CertificateRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CertificateService {
    private final CertificateRepository certificateRepository;

    public List<Certificates> certificatesList() {
        return certificateRepository.findAll();
    }

    public void saveCertificate(Certificates certificate, MultipartFile... files) throws IOException {
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            if (file.getSize() != 0) {
                Image image = toImageEntity(file);
                if (i == 0) {
                    image.setPreviewImage(true);
                }
                certificate.addImage(image);
            }
        }
        Certificates certificateFromDB = certificateRepository.save(certificate);
        certificateFromDB.setPreviewImgId(certificateFromDB.getImages().get(0).getId());
        certificateRepository.save(certificate);
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image img = new Image();
        img.setName(file.getName());
        img.setOriginalFileName(file.getOriginalFilename());
        img.setContentType(file.getContentType());
        img.setSize(file.getSize());
        img.setBytes(file.getBytes());
        return img;
    }

    public void deleteCertificate(Long id) {
        certificateRepository.deleteById(id);
    }

    public Certificates getCertificateById(Long id) {
        return certificateRepository.findById(id).orElse(null);
    }

}
