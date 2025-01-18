package kr.spring.item.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.item.vo.CartVO;
import kr.spring.item.vo.ItemVO;
import kr.spring.item.vo.OrderVO;
import kr.spring.member.vo.AgroupVO;
import kr.spring.member.vo.MemberVO;

public interface ItemService {
	//부모글
	public List<ItemVO> selectList(Map<String,Object> map);
	public List<ItemVO> selectListByUserNum(Long user_num);
	public int selectRowCount(Map<String,Object> map);
	public int insertItem(ItemVO Item);
	public ItemVO selectitem(Long item_num);
	public void updateItem(ItemVO Item);
	public void deleteItem(Long item_num);
	public List<ItemVO> showListByGroup();
	public List<ItemVO> showListGroup();
	public AgroupVO selectGroup(String group_name);
	
	//----------구매자(사용자)-------------
	public void insertOrder(OrderVO ordervo);
	public int selectOrderRowCount(Map<String,Object> map);
	public List<OrderVO> selectOrder(Map<String,Object> map);
	public OrderVO selectOrderDetail(OrderVO ordervo);
	public MemberVO selectUserInfo(MemberVO memberVO);
	public void deleteOrder(Long Order_num);
	public void updateStock(int quantity, long item_num);
	public void updatePayNum(long pay_num, long order_num);
	
	//----------장바구니-------------
	public void deleteCart(Long Cart_num);
	public int insertCart(CartVO cart);
	public List<CartVO> selectCart(long user_num);
	public int updateCartByItem_num(long item_num, long user_num, long order_quantity);
	public CartVO getCurrentQuantity(long user_num, long item_num);
	public void updateTotalQuantity(int total_quantity, long cart_num);
}
