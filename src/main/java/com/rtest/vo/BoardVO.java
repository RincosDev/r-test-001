package com.rtest.vo;

public class BoardVO {
    private Long boardNo;
    private String title;
    private String content;
    private String writer;
    private String regDate;
    private String modDate;
    private int viewCount;
    private int rowNum;
    
    public BoardVO() {
    }
    
    public Long getBoardNo() {
        return boardNo;
    }
    
    public void setBoardNo(Long boardNo) {
        this.boardNo = boardNo;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public String getWriter() {
        return writer;
    }
    
    public void setWriter(String writer) {
        this.writer = writer;
    }
    
    public String getRegDate() {
        return regDate;
    }
    
    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }
    
    public String getModDate() {
        return modDate;
    }
    
    public void setModDate(String modDate) {
        this.modDate = modDate;
    }
    
    public int getViewCount() {
        return viewCount;
    }
    
    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }
    
    public int getRowNum() {
        return rowNum;
    }
    
    public void setRowNum(int rowNum) {
        this.rowNum = rowNum;
    }
    
    @Override
    public String toString() {
        return "BoardVO [boardNo=" + boardNo + ", title=" + title + 
               ", content=" + content + ", writer=" + writer + 
               ", regDate=" + regDate + ", modDate=" + modDate + 
               ", viewCount=" + viewCount + "]";
    }
}
