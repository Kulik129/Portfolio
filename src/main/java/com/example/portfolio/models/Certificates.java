package com.example.portfolio.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "certificates")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Certificates {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String title;
    private String description;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "certificates")
    private List<Image> images = new ArrayList<>();

    private Long previewImgId;
    private LocalDateTime localDataTime;
    @PrePersist
    private void init() {
        localDataTime = LocalDateTime.now();
    }

    public void addImage(Image image) {
        image.setCertificates(this);
        images.add(image);
    }
}
