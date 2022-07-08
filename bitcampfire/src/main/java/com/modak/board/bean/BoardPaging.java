package com.modak.board.bean;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardPaging {

	private int currentPage; //현재페이지
	private int pageBlock; //[이전][1][2][3][다음]
	private int pageSize; //페이지당 몇개 표시할건지 
	private int totalA; //총글수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		System.out.println("페이지 리스트 만들기 현재 페이지 : " + currentPage + " 페이지 블럭 : " + pageBlock + " 페이지 당 글 " + pageSize);
		
		this.pagingHTML = new StringBuffer();
	
		int totalP = (int)(Math.ceil(totalA / (float)pageSize));
		//int totalP = ( totalA - 1) / ( pageSize + 1); //총 페이지 수
		int startPage = (currentPage-1) / pageBlock * pageBlock +1; //시작 페이지 번호 
		int endPage = startPage + pageBlock - 1; //마지막 페이지
		if(endPage > totalP) {
			endPage = totalP;
		}

		//풍혁(220706) : set 잘해줬는지 test
		System.out.println("@@@ caled totalP = " + totalP + "@@@ caled startPage  = " + startPage +"@@@ caled endPage = " + endPage );
		
		if(currentPage != 1) { //if(startPage > pageBlock)                         
			int previousPage = currentPage-1;                                      
			pagingHTML.append("<li class='prev'>");
				pagingHTML.append("<a href='/semiproject/board/list?pg="+previousPage+"'>"); //풍혁(220706) : href 현재페이지에서 이전페이지로 넘겨주는 url로 수정해야 됨.
					pagingHTML.append("«");
				pagingHTML.append("</a>"); 
			pagingHTML.append("</li>");
		
		}
		
		System.out.println("\n @self log@ current page : " + currentPage);
		for(int i = startPage; i <= endPage; i++) {
			if( i == this.currentPage) {
				pagingHTML.append("<li class='active'>");
					pagingHTML.append("<span>");
						pagingHTML.append(i);
					pagingHTML.append("</span>");
				pagingHTML.append("</li>");
			}else {
				pagingHTML.append("<li>");
					pagingHTML.append("<a href='/semiproject/board/list?pg="+i+"'>");
						pagingHTML.append(i);
					pagingHTML.append("</a>");
				pagingHTML.append("</li>");
			}
		}
		//풍혁(220706) : ...맨끝 페이지 이동 기능 구현 보류 ...
		if(currentPage < endPage) {                                                            
			int nextPage = currentPage+1;
			pagingHTML.append("<li class='next'>");
				pagingHTML.append("<a href='/semiproject/board/list?pg="+nextPage+"'>"); //풍혁(220706) : href 현재페이지에서 다음페이지로 넘겨주는 url로 수정해야 됨.
					pagingHTML.append("»");
				pagingHTML.append("</a>"); 
			pagingHTML.append("</li>");
		}
	}
		
		public void makeSearchPagingHTML(String keyword) {
			this.pagingHTML = new StringBuffer();
		
			int totalP = (int)(Math.ceil(totalA / (float)pageSize));
			//int totalP = ( totalA - 1) / ( pageSize + 1); //총 페이지 수
			int startPage = (currentPage-1) / pageBlock * pageBlock +1; //시작 페이지 번호 
			int endPage = startPage + pageBlock - 1; //마지막 페이지
			if(endPage > totalP) {
				endPage = totalP;
			}

			//풍혁(220706) : set 잘해줬는지 test
			System.out.println("@@@ caled totalP = " + totalP + "@@@ caled startPage  = " + startPage +"@@@ caled endPage = " + endPage );
			
			if(currentPage != 1) { //if(startPage > pageBlock)                         
				int previousPage = currentPage-1;                                      
				pagingHTML.append("<li class='prev'>");
					pagingHTML.append("<a href='/semiproject/board/search?pg="+previousPage+"&keword="+keyword+"'>"); //풍혁(220706) : href 현재페이지에서 이전페이지로 넘겨주는 url로 수정해야 됨.
						pagingHTML.append("«");
					pagingHTML.append("</a>"); 
				pagingHTML.append("</li>");
			
			}
			
			System.out.println("\n @self log@ current page : " + currentPage);
			for(int i = startPage; i <= endPage; i++) {
				if( i == this.currentPage) {
					pagingHTML.append("<li class='active'>");
						pagingHTML.append("<span>");
							pagingHTML.append(i);
						pagingHTML.append("</span>");
					pagingHTML.append("</li>");
				}else {
					pagingHTML.append("<li>");
						pagingHTML.append("<a href='/semiproject/board/search?pg="+i+"&keword="+keyword+"'>");
						
							pagingHTML.append(i);
						pagingHTML.append("</a>");
					pagingHTML.append("</li>");
				}
			}
			//풍혁(220706) : ...맨끝 페이지 이동 기능 구현 보류 ...
			if(currentPage < endPage) {                                                            
				int nextPage = currentPage+1;
				pagingHTML.append("<li class='next'>");
					pagingHTML.append("<a href='/semiproject/board/search?pg="+nextPage+"&keword="+keyword+"'>"); //풍혁(220706) : href 현재페이지에서 다음페이지로 넘겨주는 url로 수정해야 됨.
						pagingHTML.append("»");
					pagingHTML.append("</a>"); 
				pagingHTML.append("</li>");
			}
	}
}
