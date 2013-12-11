package com.radius.base.page;

import java.util.List;

public class Pager<E> {
	// ÿҳ��ʾ�ļ�¼��
	protected Integer pageSize = 10;
	// ��ǰ��ҳ��
	protected Integer pageNo;
	// ��¼����
	protected Long rowCount;
	// ��ҳ��
	protected Integer pageCount;
	// ��ʼ��
	protected Integer startIndex;
	// ������
	protected Integer endIndex;
	// ��ҳ
	protected Integer firstPageNo = 1;
	// ĩҳ
	protected Integer endPageNo;
	// ǰһҳ
	protected Integer prePageNo;
	// ��һҳ
	protected Integer nextPagNo;
	// ��Ž����
	@SuppressWarnings("unchecked")
	protected List<E> pagelist;
	
	@SuppressWarnings("unchecked")
	public Pager(Object...objects){
		this.pageNo = Integer.valueOf(objects[0].toString());
		this.rowCount = Long.valueOf(objects[1].toString());
		if(objects.length>3)
			this.pageSize=Integer.valueOf(objects[2].toString());
		pagelist=(List<E>)objects[objects.length-1];
		execute();
	}
	
	
	@SuppressWarnings("unchecked")
	public Pager(Integer pageNo, long rowCount, List<E> pagelist){
		this(new Object[]{pageNo,rowCount,pagelist});
	}

	public Integer getEndIndex() {
		return endIndex;
	}


	public void setEndIndex(Integer endIndex) {
		this.endIndex = endIndex;
	}


	public Integer getEndPageNo() {
		return endPageNo;
	}


	public void setEndPageNo(Integer endPageNo) {
		this.endPageNo = endPageNo;
	}


	public Integer getFirstPageNo() {
		return firstPageNo;
	}


	public void setFirstPageNo(Integer firstPageNo) {
		this.firstPageNo = firstPageNo;
	}


	public Integer getNextPagNo() {
		return nextPagNo;
	}


	public void setNextPagNo(Integer nextPagNo) {
		this.nextPagNo = nextPagNo;
	}


	public Integer getPageCount() {
		return pageCount;
	}


	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}


	@SuppressWarnings("unchecked")
	public List<E> getPagelist() {
		return pagelist;
	}


	@SuppressWarnings("unchecked")
	public void setPagelist(List<E> pagelist) {
		this.pagelist = pagelist;
	}


	public Integer getPageNo() {
		return pageNo;
	}


	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}


	public Integer getPageSize() {
		return pageSize;
	}


	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}


	public Integer getPrePageNo() {
		return prePageNo;
	}


	public void setPrePageNo(Integer prePageNo) {
		this.prePageNo = prePageNo;
	}


	public Long getRowCount() {
		return rowCount;
	}


	public void setRowCount(Long rowCount) {
		this.rowCount = rowCount;
	}


	public Integer getStartIndex() {
		return startIndex;
	}


	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}
	
	private void execute(){
		//������ҳ��
		if(this.rowCount%this.pageSize == 0){
			this.pageCount = this.rowCount.intValue()/this.pageSize;
		}else{
			this.pageCount = (this.rowCount.intValue()/this.pageSize) + 1;
		}
		
		//������ʼ��
		this.startIndex = this.pageSize*(this.pageNo - 1);
		
		//���ý�����
		this.endIndex = this.startIndex + pagelist.size();
		
		//����ĩҳ
		this.endPageNo = this.pageCount;
		
		//����ǰһҳ
		if(this.pageNo > 1){
			this.prePageNo = this.pageNo - 1; 
		}
		
		//���ú�һҳ
		if(this.pageNo == this.pageCount ){
			this.nextPagNo = this.pageCount;
		}else{
			this.nextPagNo = this.pageNo + 1;
		}
		
	}
}	
