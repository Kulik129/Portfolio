package com.example.portfolio.repository;

import com.example.portfolio.models.Certificates;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CertificateRepository extends JpaRepository<Certificates, Long > {
    List<Certificates> findByTitle(String title);
}
