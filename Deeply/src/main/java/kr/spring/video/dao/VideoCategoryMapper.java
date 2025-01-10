package kr.spring.video.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.video.vo.VideoCategoryVO;

@Mapper
public interface VideoCategoryMapper {

    // 특정 아티스트의 카테고리 목록 조회
    @Select("SELECT * FROM video_categories WHERE user_num = #{user_num}")
    List<VideoCategoryVO> selectCategoriesByArtist(Long user_num);

    // 카테고리 추가
    @Insert("INSERT INTO video_categories (category_id, user_num, category_name) " +
            "VALUES (CATEGORY_SEQ.NEXTVAL, #{user_num}, #{category_name})")
    void insertCategory(VideoCategoryVO category);

    // 특정 카테고리 조회
    @Select("SELECT * FROM video_categories WHERE category_id = #{category_id}")
    VideoCategoryVO selectCategory(Long category_id);

    // 카테고리 업데이트
    @Update("UPDATE video_categories SET category_name = #{category_name} " +
            "WHERE category_id = #{category_id}")
    void updateCategory(VideoCategoryVO category);

    // 카테고리 삭제
    @Delete("DELETE FROM video_categories WHERE category_id = #{category_id}")
    void deleteCategory(Long category_id);

    // 카테고리 시퀀스 ID 가져오기
    @Select("SELECT CATEGORY_SEQ.NEXTVAL FROM dual")
    Long getNextCategoryId();
}
