package com.example.portfolio.services;

import com.example.portfolio.models.Image;
import com.example.portfolio.models.Works;
import com.example.portfolio.repository.WorkRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class WorkService {
    private final WorkRepository workRepository;

    public List<Works> worksList() {
        return workRepository.findAll();
    }

    public void saveWork(Works work, MultipartFile...files) throws IOException {
        for (int i = 0; i< files.length;i++){
            MultipartFile file = files[i];
            if (file.getSize()!=0){
                Image image = toImageEntity(file);
                if (i==0){
                    image.setPreviewImage(true);
                }
                work.addImage(image);
            }
        }
        Works worksFromDB = workRepository.save(work);
        worksFromDB.setPreviewImageId(worksFromDB.getImages().get(0).getId());
        workRepository.save(work);
    }
    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteWork(Long id) {
        workRepository.deleteById(id);
    }

    public Works getWorkById(Long id) {
        return workRepository.findById(id).orElse(null);
    }
}
