package com.rtest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.rtest.service.TestService;
import com.rtest.vo.TestVO;

@Controller
public class TestController {
    
    private static final Logger logger = LoggerFactory.getLogger(TestController.class);
    
    @Autowired
    private TestService testService;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
        logger.info("Home page requested");
        model.addAttribute("message", "R-TEST-001 프로젝트에 오신 것을 환영합니다!");
        return "index";
    }
    
    @RequestMapping(value = "/test/list", method = RequestMethod.GET)
    public String testList(Model model) {
        logger.info("Test list page requested");
        try {
            List<TestVO> testList = testService.getTestList();
            model.addAttribute("testList", testList);
        } catch (Exception e) {
            logger.error("Error fetching test list", e);
            model.addAttribute("error", "데이터 조회 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "test/list";
    }
    
    @RequestMapping(value = "/test/add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addTest(TestVO testVO) {
        logger.info("Add test requested: " + testVO);
        Map<String, Object> response = new HashMap<>();
        try {
            int result = testService.addTest(testVO);
            response.put("success", true);
            response.put("message", "등록되었습니다.");
        } catch (Exception e) {
            logger.error("Error adding test", e);
            response.put("success", false);
            response.put("message", "등록 실패: " + e.getMessage());
        }
        return response;
    }
}
