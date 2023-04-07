package com.example.portfolio.services;

import com.example.portfolio.models.Works;
import com.example.portfolio.repository.WorkRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class WorkService {
    private final WorkRepository workRepository;

    public List<Works> worksList(){
        return workRepository.findAll();
    }
    public void saveWork(Works work){
        workRepository.save(work);
    }
    public void deleteWork(Long id){
        workRepository.deleteById(id);
    }

    public Works getWorkById(Long id){
        return workRepository.findById(id).orElse(null);
    }
}
