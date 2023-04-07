package com.example.portfolio.repository;

import com.example.portfolio.models.Works;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WorkRepository extends JpaRepository<Works,Long> {
}
