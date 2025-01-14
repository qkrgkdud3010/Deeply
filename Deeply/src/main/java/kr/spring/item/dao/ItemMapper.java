package kr.spring.item.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.item.vo.ItemOrderVO;
import kr.spring.item.vo.ItemVO;
import kr.spring.member.vo.AgroupVO;

@Mapper
public interface ItemMapper {
	//부모글
	public List<ItemVO> selectList(Map<String,Object> map);
	@Select("SELECT * FROM shop_item WHERE user_num=#{user_num}")
	public List<ItemVO> selectListByUserNum(Long user_num);
	public int selectRowCount(Map<String,Object> map);
	public int insertItem(ItemVO Item);
	@Select("SELECT * FROM shop_item WHERE item_num=#{item_num}")
	public ItemVO selectitem(Long item_num);
	public void updateItem(ItemVO Item);
	@Delete("DELETE FROM shop_item WHERE item_num=#{item_num}")
	public void deleteItem(Long item_num);
	public List<Map<String,Object>> showListByGroup(Map<String,Object> map);
	//그룹 번호 가져오기
	@Select("SELECT * FROM agroup WHERE group_name=#{group_name}")
	public AgroupVO selectGroup(String group_name);
	
	
	//구매하기
	//----------구매자(사용자)-------------
	//주문등록
	public void insertOrder(ItemOrderVO order);
	//전체 주문 개수/검색 주문 개수
	//전체 주문 목록/검색 주문 목록
	//개별 상품 목록
	//주문 취소
	//배송지정보 수정
	
	//----------관리자(아티스트)-------------
	//전체 주문 개수/검색 주문 개수
	//전체 주문 목록/검색 주문 목록
	//관리자/사용자 - 주문 상세
	//배송상태 수정
	//주문 삭제(삭제시 재고를 원상 복귀시키지 하지 않으면서 주문취소일 때 재고 수량 원상 복귀)
	
	
	
	
	
	//좋아요
	
	
	


}
