package com.rtest.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.rtest.dao.TestDAO;
import com.rtest.vo.TestVO;

@Service
public class TestService {
    
    @Autowired
    private TestDAO testDAO;
    
    public List<TestVO> getTestList() {
        return testDAO.selectTestList();
    }
    
    public TestVO getTest(String testId) {
        return testDAO.selectTest(testId);
    }
    
    @Transactional
    public int addTest(TestVO testVO) {
        return testDAO.insertTest(testVO);
    }
    
    @Transactional
    public int modifyTest(TestVO testVO) {
        return testDAO.updateTest(testVO);
    }
    
    @Transactional
    public int removeTest(String testId) {
        return testDAO.deleteTest(testId);
    }
}
