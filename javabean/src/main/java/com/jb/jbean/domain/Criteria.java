package com.jb.jbean.domain;

public abstract class Criteria { //�������� �ʿ��� ��ŭ ����ϱ� ���� Ŭ����

	private int page;	
	private int perPageNum;
	
	public Criteria(){	//page��ȣ 1���� ���� perPageNum ����� �������� ����
		this.page = 1;
		this.perPageNum=15;
	}
	
	public void setPage(int page){	//page�� 1���� �۰ų� ������� 1�� �־��ش�.
		if(page<=1){
			this.page =1;
			return;
		}
		this.page=page;
	}
	
	public void setPerPageNum(int perPageNum){	//0���� �۰ų����ų� 100���� Ŭ��� �����������ٰ����� 15���� �Ѵ�.
		if(perPageNum <=0 || perPageNum >100){
			this.perPageNum=15;
			return;
		}
		this.perPageNum=perPageNum;
	}
	
	public int getPage(){
		return page;
	}
	
	public int getPageStart(){	//������������ġ 
		return (this.page -1) * perPageNum+1;
	}
	
	public int getPageEnd(){	//������ ����ȣ��ġ
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
