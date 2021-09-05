package org.Lee.mapper;

import java.util.List;

import org.Lee.domain.Criteria;
import org.Lee.domain.ReplyVO;
import org.apache.ibatis.annotations.Param;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(int bno);
	
	public int delete(int rno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") int bno);		
	
	public int getCountByBno(int bno);
	
}
