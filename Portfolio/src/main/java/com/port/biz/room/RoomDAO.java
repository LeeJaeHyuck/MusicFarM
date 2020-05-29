package com.port.biz.room;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.port.biz.vo.BookVO;
import com.port.biz.vo.CommentsVO;
import com.port.biz.vo.RoomVO;

@Repository
public class RoomDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<RoomVO> getRoomList(String person) {
		return mybatis.selectList("RoomDAO.getRoomList", person);
	}
	
	public RoomVO getRoom(String roomNum) {
		return mybatis.selectOne("RoomDAO.getRoom", roomNum);
	}
	
	public List<BookVO> getBookList(String roomNum) {
		return mybatis.selectList("RoomDAO.getBookList", roomNum);
	}
	
	public void reserveRoom(BookVO book) {
		mybatis.insert("RoomDAO.reserveRoom", book);
	}
	
	public List<BookVO> getBookListById(String id){
		return mybatis.selectList("RoomDAO.getBookListById", id);
	}
	
	public List<CommentsVO> getRoomCommentList(int roomNum){
		return mybatis.selectList("CommentDAO.getRoomCommentList", roomNum);
	}
	
	public void saveRoomComment(CommentsVO comment) {
		mybatis.insert("CommentDAO.saveRoomComment", comment);
	}
	
	public void deleteComment(int coseq) {
		mybatis.delete("CommentDAO.deleteComment", coseq);
	}
}
