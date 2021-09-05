package org.Lee.service;

import java.util.List;

import org.Lee.domain.Criteria;
import org.Lee.domain.ReplyPageDTO;
import org.Lee.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	
	public ReplyVO get(int rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(int rno);
	
	public List<ReplyVO> getList(Criteria cri, int bno);
	
	public ReplyPageDTO getListPage(Criteria cri, int bno);
}
