package com.rtest.vo;

public class TestVO {
    private String testId;
    private String testName;
    private String testDesc;
    private String regDate;
    
    public TestVO() {
    }
    
    public String getTestId() {
        return testId;
    }
    
    public void setTestId(String testId) {
        this.testId = testId;
    }
    
    public String getTestName() {
        return testName;
    }
    
    public void setTestName(String testName) {
        this.testName = testName;
    }
    
    public String getTestDesc() {
        return testDesc;
    }
    
    public void setTestDesc(String testDesc) {
        this.testDesc = testDesc;
    }
    
    public String getRegDate() {
        return regDate;
    }
    
    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }
    
    @Override
    public String toString() {
        return "TestVO [testId=" + testId + ", testName=" + testName + 
               ", testDesc=" + testDesc + ", regDate=" + regDate + "]";
    }
}
