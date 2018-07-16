package com.jb.jbean.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum=10;
	private SearchCriteria scri;
	
	public int getTotalCount() {
		return totalCount;
	}
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}
	public void setTotalCount(int totalCount) {	//toatl값이 들어오면 calcData메소드 실행
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	
	private void calcData(){ //endpage, startpage, prev, next값을 넣어준다.
		//math.ceil:올림
		endPage= (int) (Math.ceil(scri.getPage()/(double)displayPageNum)* displayPageNum);
									 
		startPage= (endPage- displayPageNum)+1;
		
		int tempEndPage=(int) (Math.ceil(totalCount)/(double)scri.getPerPageNum());
				
		if(endPage>tempEndPage){
			endPage = tempEndPage+1;
		}
		
		prev= startPage==1? false: true;
		next= endPage * scri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page){
		
		UriComponents uriComponents=UriComponentsBuilder.newInstance()
									.queryParam("page", page)
									//.queryParam("perPageNum", cri.getPerPageNum())
									.build();
		
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page){
		UriComponents uriComponents=UriComponentsBuilder.newInstance().queryParam("page", page)
				//.queryParam("perPageNum", scri.getPerPageNum())
				.queryParam("searchType",scri.getSearchType() )
				.queryParam("keyword", encoding( scri.getKeyword()))
				.build();
		
		return uriComponents.toUriString();
		
	}
	//trim()-문자의 앞뒤 공백 제거
	private String encoding(String keyword){
		if(keyword == null || keyword.trim().length() ==0){
		return "";
		}
		
		try {
			return URLEncoder.encode(keyword,"UTF-8");
		}catch(UnsupportedEncodingException e){
			return "";
		}
	}
	
}
