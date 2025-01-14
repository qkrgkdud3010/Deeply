package kr.spring.item.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.item.dao.ItemMapper;
import kr.spring.item.vo.ItemVO;
import kr.spring.member.vo.AgroupVO;

@Service
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemMapper itemMapper;

	@Override
	public List<ItemVO> selectList(Map<String, Object> map) {
		return itemMapper.selectList(map);
	}
	
	@Override
	public List<ItemVO> selectListByUserNum(Long user_num) {
		return itemMapper.selectListByUserNum(user_num);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return itemMapper.selectRowCount(map);
	}

	@Override
	public int insertItem(ItemVO Item) {
		return itemMapper.insertItem(Item);
	}

	@Override
	public ItemVO selectitem(Long item_num) {
		return itemMapper.selectitem(item_num);
	}

	@Override
	public void updateItem(ItemVO Item) {
		itemMapper.updateItem(Item);
	}

	@Override
	public void deleteItem(Long item_num) {
		itemMapper.deleteItem(item_num);
	}

	@Override
	public List<ItemVO> showListByGroup() {
		return itemMapper.showListByGroup();
	}

	@Override
	public AgroupVO selectGroup(String group_name) {
		return itemMapper.selectGroup(group_name);
	}

	@Override
	public List<ItemVO> showListGroup() {
		return itemMapper.showListGroup();
	}

	

	
}