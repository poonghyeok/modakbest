package com.modak.user.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserAdminPaging {
	private int currentPage; //현재페이지
	private int pageBlock; //[이전][1][2][3][다음]
	private int pageSize; //1페이장당 행 갯수
	private int totalA; //총 유저 수 
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		this.pagingHTML = new StringBuffer();
		
		//int totalP = (totalA-1) / pageSize + 1; //총페이지수
		int totalP = (int)(Math.ceil(totalA / (float)pageSize));
		
		//시작 페이지 번호
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1; //시작 페이지 번호
		int endPage = startPage + pageBlock - 1; //마지막 페이지 번호
		if(endPage > totalP) {
			endPage = totalP; //글수에 따라 endPage 다르게
		}
		
		if(currentPage != 1) {//if(startPage > pageBlock)
			int previousPage = currentPage-1;       
			pagingHTML.append("<li class='prev'>");
				pagingHTML.append("<a href='/semiproject/admin/adminUserAllList?pg="+previousPage+"'>"); 
					pagingHTML.append("«");
				pagingHTML.append("</a>"); 
			pagingHTML.append("</li>");				
		}
		for(int i=startPage; i<=endPage; i++) {
			if(i == this.currentPage) {
				pagingHTML.append("<li class='active'>");
					pagingHTML.append("<span>");
						pagingHTML.append(i);
					pagingHTML.append("</span>");
				pagingHTML.append("</li>");
			}				
			else {
				pagingHTML.append("<li>");
					pagingHTML.append("<a href='/semiproject/admin/adminUserAllList?pg="+i+"'>");
						pagingHTML.append(i);
					pagingHTML.append("</a>");
				pagingHTML.append("</li>");
			}				
		}//for
		
		if(currentPage < endPage) {                                                            
			int nextPage = currentPage+1;
			pagingHTML.append("<li class='next'>");
				pagingHTML.append("<a href='/semiproject/admin/adminUserAllList?pg="+nextPage+"'>");
					pagingHTML.append("»");
				pagingHTML.append("</a>"); 
			pagingHTML.append("</li>");
		}
	}
	
	public void makeSearchPagingHTML(String searchOption, String keyword) {
		this.pagingHTML = new StringBuffer();
		
		//int totalP = (totalA-1) / pageSize + 1; //총페이지수
		int totalP = (int)(Math.ceil(totalA / (float)pageSize));
		
		//시작 페이지 번호
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1; //시작 페이지 번호
		int endPage = startPage + pageBlock - 1; //마지막 페이지 번호
		if(endPage > totalP) {
			endPage = totalP; //글수에 따라 endPage 다르게
		}
		
		if(currentPage != 1) {//if(startPage > pageBlock)
			int previousPage = currentPage-1;       
			pagingHTML.append("<li class='prev'>");
				pagingHTML.append("<a href='/semiproject/admin/adminUserAllList?pg="+previousPage+"&searchOption="+searchOption+"&keword="+keyword+"'>"); 
					pagingHTML.append("«");
				pagingHTML.append("</a>"); 
			pagingHTML.append("</li>");				
		}
		for(int i=startPage; i<=endPage; i++) {
			if(i == this.currentPage) {
				pagingHTML.append("<li class='active'>");
					pagingHTML.append("<span>");
						pagingHTML.append(i);
					pagingHTML.append("</span>");
				pagingHTML.append("</li>");
			}				
			else {
				pagingHTML.append("<li>");
					pagingHTML.append("<a href='/semiproject/admin/adminUserAllList?pg="+i+"&searchOption="+searchOption+"&keyword="+keyword+"'>");
						pagingHTML.append(i);
					pagingHTML.append("</a>");
				pagingHTML.append("</li>");
			}				
		}//for
		
		if(currentPage < endPage) {                                                            
			int nextPage = currentPage+1;
			pagingHTML.append("<li class='next'>");
				pagingHTML.append("<a href='/semiproject/admin/adminUserAllList?pg="+nextPage+"&searchOption="+searchOption+"&keyword="+keyword+"'>");
					pagingHTML.append("»");
				pagingHTML.append("</a>"); 
			pagingHTML.append("</li>");
		}
	
	}
}
