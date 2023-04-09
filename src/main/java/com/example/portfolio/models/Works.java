package com.example.portfolio.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "works")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Works {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String title;
    private String description;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "works")
    private List<Image> images = new ArrayList<>();

    private Long previewImageId;
    private LocalDateTime localDateTime;

    @PrePersist
    private void init() {
        localDateTime = LocalDateTime.now();
    }
    public void addImage(Image image){
        image.setWorks(this);
        images.add(image);
    }
}
