package com.rtest.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.rtest.dao.BoardDAO;
import com.rtest.vo.BoardVO;

@Service
public class BoardService {
    
    @Autowired
    private BoardDAO boardDAO;
    
    public List<BoardVO> getBoardList() {
        return boardDAO.selectBoardList();
    }
    
    @Transactional
    public BoardVO getBoard(Long boardNo) {
        boardDAO.increaseViewCount(boardNo);
        return boardDAO.selectBoard(boardNo);
    }
    
    public BoardVO getBoardForEdit(Long boardNo) {
        return boardDAO.selectBoard(boardNo);
    }
    
    @Transactional
    public int addBoard(BoardVO boardVO) {
        return boardDAO.insertBoard(boardVO);
    }
    
    @Transactional
    public int modifyBoard(BoardVO boardVO) {
        return boardDAO.updateBoard(boardVO);
    }
    
    @Transactional
    public int removeBoard(Long boardNo) {
        return boardDAO.deleteBoard(boardNo);
    }
}
