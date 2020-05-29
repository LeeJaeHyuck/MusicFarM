package com.port.biz.room;

import java.util.List;

import com.port.biz.vo.BookVO;
import com.port.biz.vo.CommentsVO;
import com.port.biz.vo.RoomVO;

public interface RoomService {
	
	List<RoomVO> getRoomList(String person);
	
	RoomVO getRoom(String roomNum);
	
	List<BookVO> getBookList(String roomNum);

	void reserveRoom(BookVO book);
	
	List<BookVO> getBookListById(String id);
	
	List<CommentsVO> getRoomCommentList(int roomNum);
	
	void saveRoomComment(CommentsVO comment);
	
	void deleteComment(int coseq);
}
