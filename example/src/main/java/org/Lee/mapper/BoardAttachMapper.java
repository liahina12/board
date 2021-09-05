package org.Lee.mapper;

import java.util.List;

import org.Lee.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);
		
	public List<BoardAttachVO> findByBno(int bno);
	
	public List<BoardAttachVO> getOldFiles();
	
	public void deleteAll(int bno);
	
	public void delete(String uuid);
	
	
}

