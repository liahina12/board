package org.Lee.mapper;

import java.util.List;

import org.Lee.domain.BoardVO;
import org.Lee.domain.Criteria;
import org.apache.ibatis.annotations.Param;

public interface BoardMapper {

	//@Select(" select * from tb1_board where bno > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board); //글 적기
	
	public BoardVO read(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO board);
		
	public void updateReplyCnt(@Param("bno") int bno, @Param("amount") int amount);
	
	public int updateViewCnt(int bno);
	
	public List<BoardVO> selectBoard() throws Exception;
}
