package org.Lee.service;

import java.util.List;

import org.Lee.domain.BoardAttachVO;
import org.Lee.domain.BoardVO;
import org.Lee.domain.Criteria;

public interface BoardService {
	//글쓰기 위한 비즈니스 인터페이스
	public void register(BoardVO board);  //추상 메서드
	//상세페이지위한 비즈니스 인터페이스
	public BoardVO get(int bno);          //추상 메서드
	//글수정 위한 비즈니스 인터페이스
	public boolean modify(BoardVO board); //추상 메서드
	//글삭제 위한 비즈니스 인터페이스
	public boolean remove(int bno);       //추상 메서드
	//목록리스트 위한 비즈니스 인터페이스(페이지하기전)
	// public List<BoardVO> getList();    
	//목록리스트 위한 비즈니스 인터페이스(페이지 하기 후)
	public List<BoardVO> getList(Criteria cri);
	//추가
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(int bno);
	
	public int updateViewCnt(int bno);

	public List<BoardVO> selectBoard() throws Exception;
}
