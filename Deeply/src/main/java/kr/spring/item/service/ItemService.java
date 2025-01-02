package kr.spring.item.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.item.vo.ItemVO;

public interface ItemService {
	//부모글
	public List<ItemVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	int insertItem(ItemVO Item);
	public ItemVO selectitem(Long item_num);
	int updateItem(ItemVO Item);
	int deleteItem(Long item_num);

}
