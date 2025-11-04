package com.rtest.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.rtest.vo.TestVO;

@Repository
public class TestDAO {
    
    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.rtest.mapper.TestMapper";
    
    public List<TestVO> selectTestList() {
        return sqlSession.selectList(NAMESPACE + ".selectTestList");
    }
    
    public TestVO selectTest(String testId) {
        return sqlSession.selectOne(NAMESPACE + ".selectTest", testId);
    }
    
    public int insertTest(TestVO testVO) {
        return sqlSession.insert(NAMESPACE + ".insertTest", testVO);
    }
    
    public int updateTest(TestVO testVO) {
        return sqlSession.update(NAMESPACE + ".updateTest", testVO);
    }
    
    public int deleteTest(String testId) {
        return sqlSession.delete(NAMESPACE + ".deleteTest", testId);
    }
}
