package com.rtest.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.rtest.vo.BoardVO;

@Repository
public class BoardDAO {
    
    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.rtest.mapper.BoardMapper";
    
    public List<BoardVO> selectBoardList() {
        return sqlSession.selectList(NAMESPACE + ".selectBoardList");
    }
    
    public BoardVO selectBoard(Long boardNo) {
        return sqlSession.selectOne(NAMESPACE + ".selectBoard", boardNo);
    }
    
    public int insertBoard(BoardVO boardVO) {
        return sqlSession.insert(NAMESPACE + ".insertBoard", boardVO);
    }
    
    public int updateBoard(BoardVO boardVO) {
        return sqlSession.update(NAMESPACE + ".updateBoard", boardVO);
    }
    
    public int deleteBoard(Long boardNo) {
        return sqlSession.delete(NAMESPACE + ".deleteBoard", boardNo);
    }
    
    public int increaseViewCount(Long boardNo) {
        return sqlSession.update(NAMESPACE + ".increaseViewCount", boardNo);
    }
}
