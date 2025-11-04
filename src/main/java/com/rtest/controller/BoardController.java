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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.rtest.service.BoardService;
import com.rtest.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
    
    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
    
    @Autowired
    private BoardService boardService;
    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        logger.info("Board list page requested");
        try {
            List<BoardVO> boardList = boardService.getBoardList();
            model.addAttribute("boardList", boardList);
        } catch (Exception e) {
            logger.error("Error fetching board list", e);
            model.addAttribute("error", "게시글 목록 조회 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "board/list";
    }
    
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(@RequestParam("boardNo") Long boardNo, Model model) {
        logger.info("Board view page requested: " + boardNo);
        try {
            BoardVO board = boardService.getBoard(boardNo);
            model.addAttribute("board", board);
        } catch (Exception e) {
            logger.error("Error fetching board", e);
            model.addAttribute("error", "게시글 조회 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "board/view";
    }
    
    @RequestMapping(value = "/writeForm", method = RequestMethod.GET)
    public String writeForm() {
        logger.info("Board write form requested");
        return "board/write";
    }
    
    @RequestMapping(value = "/write", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> write(BoardVO boardVO) {
        logger.info("Board write requested: " + boardVO);
        Map<String, Object> response = new HashMap<>();
        try {
            int result = boardService.addBoard(boardVO);
            response.put("success", true);
            response.put("message", "게시글이 등록되었습니다.");
        } catch (Exception e) {
            logger.error("Error writing board", e);
            response.put("success", false);
            response.put("message", "게시글 등록 실패: " + e.getMessage());
        }
        return response;
    }
    
    @RequestMapping(value = "/editForm", method = RequestMethod.GET)
    public String editForm(@RequestParam("boardNo") Long boardNo, Model model) {
        logger.info("Board edit form requested: " + boardNo);
        try {
            BoardVO board = boardService.getBoardForEdit(boardNo);
            model.addAttribute("board", board);
        } catch (Exception e) {
            logger.error("Error fetching board for edit", e);
            model.addAttribute("error", "게시글 조회 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "board/edit";
    }
    
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> edit(BoardVO boardVO) {
        logger.info("Board edit requested: " + boardVO);
        Map<String, Object> response = new HashMap<>();
        try {
            int result = boardService.modifyBoard(boardVO);
            response.put("success", true);
            response.put("message", "게시글이 수정되었습니다.");
        } catch (Exception e) {
            logger.error("Error editing board", e);
            response.put("success", false);
            response.put("message", "게시글 수정 실패: " + e.getMessage());
        }
        return response;
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@RequestParam("boardNo") Long boardNo) {
        logger.info("Board delete requested: " + boardNo);
        Map<String, Object> response = new HashMap<>();
        try {
            int result = boardService.removeBoard(boardNo);
            response.put("success", true);
            response.put("message", "게시글이 삭제되었습니다.");
        } catch (Exception e) {
            logger.error("Error deleting board", e);
            response.put("success", false);
            response.put("message", "게시글 삭제 실패: " + e.getMessage());
        }
        return response;
    }
}
