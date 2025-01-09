package kr.spring.video.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.video.dao.VideoCategoryMapper;
import kr.spring.video.vo.VideoCategoryVO;

@Service
public class VideoCategoryServiceImpl implements VideoCategoryService {

    @Autowired
    private VideoCategoryMapper videoCategoryMapper;

    @Override
    public List<VideoCategoryVO> getCategoriesByArtist(Long artistId) {
        // 특정 아티스트의 모든 카테고리 가져오기
        return videoCategoryMapper.selectCategoriesByArtist(artistId);
    }

    @Override
    public VideoCategoryVO addCategory(Long artistId, String categoryName) {
        // 새로운 카테고리 추가
        VideoCategoryVO category = new VideoCategoryVO();
        category.setUser_num(artistId);
        category.setCategory_name(categoryName);
        
        videoCategoryMapper.insertCategory(category);
        
        // 새로 추가된 카테고리를 반환
        return category;
    }
}
