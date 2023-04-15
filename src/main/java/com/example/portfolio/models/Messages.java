package com.example.portfolio.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "messages")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Messages {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String sender;
    private String messageSubject;
    @Column(name = "message", columnDefinition = "text")
    private String message;
    private LocalDateTime localDateTime;
    @PrePersist
    private void init() {
        localDateTime = LocalDateTime.now();
    }
}
