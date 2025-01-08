package kr.spring.item.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.item.vo.ItemVO;

@Mapper
public interface ItemMapper {
	//부모글
	public List<ItemVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public int insertItem(ItemVO Item);
	@Select("SELECT * FROM shop_item JOIN auser_detail USING(user_num) WHERE item_num=#{item_num}")
	public ItemVO selectitem(Long item_num);
	public void updateItem(ItemVO Item);
	@Delete("DELETE FROM shop_item WHERE item_num=#{item_num}")
	public void deleteItem(Long item_num);
	


}
