package kr.spring.item.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.item.vo.ItemVO;

@Mapper
public interface ItemMapper {
	//부모글
	public List<ItemVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public int insertItem(ItemVO Item);
	@Select("SELECT * FROM shop_item JOIN spmember USING(user_num) LEFT OUTER JOIN auser_detail USING(user_num) WHERE item_num=#{shopitem_num}") //작성 후 boardserviceIpml
	public ItemVO selectitem(Long item_num);
	public int updateItem(ItemVO Item);
	public int deleteItem(Long item_num);


}
