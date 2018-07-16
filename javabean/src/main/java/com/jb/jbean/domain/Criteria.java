package com.jb.jbean.domain;

public abstract class Criteria { //쿼리에서 필요한 만큼 출력하기 위한 클래스

	private int page;	
	private int perPageNum;
	
	public Criteria(){	//page번호 1부터 시작 perPageNum 몇개까지 보여줄지 지정
		this.page = 1;
		this.perPageNum=15;
	}
	
	public void setPage(int page){	//page가 1보다 작거나 같을경우 1을 넣어준다.
		if(page<=1){
			this.page =1;
			return;
		}
		this.page=page;
	}
	
	public void setPerPageNum(int perPageNum){	//0보다 작거나같거나 100보다 클경우 페이지보여줄개수를 15개로 한다.
		if(perPageNum <=0 || perPageNum >100){
			this.perPageNum=15;
			return;
		}
		this.perPageNum=perPageNum;
	}
	
	public int getPage(){
		return page;
	}
	
	public int getPageStart(){	//페이지시작위치 
		return (this.page -1) * perPageNum+1;
	}
	
	public int getPageEnd(){	//페이지 끝번호위치
		return (this.page -1) * perPageNum+ perPageNum;
	}
	
	public int getPerPageNum(){
		return perPageNum;
	}
	
	@Override
	public String toString(){
		return "Criteria [page=" + page+", " + "perPageNum="+perPageNum+ "]";
	}
	
}
