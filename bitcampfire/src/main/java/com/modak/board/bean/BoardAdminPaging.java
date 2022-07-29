package com.modak.board.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardAdminPaging {


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
					pagingHTML.append("<a href='/semiproject/admin/adminBoardAllList?category=admin&pg="+previousPage+"'>"); 
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
						pagingHTML.append("<a href='/semiproject/admin/adminBoardAllList?category=admin&pg="+i+"'>");
							pagingHTML.append(i);
						pagingHTML.append("</a>");
					pagingHTML.append("</li>");
				}				
			}//for
			
			if(currentPage < endPage) {                                                            
				int nextPage = currentPage+1;
				pagingHTML.append("<li class='next'>");
					pagingHTML.append("<a href='/semiproject/admin/adminBoardAllList?category=admin&pg="+nextPage+"'>");
						pagingHTML.append("»");
					pagingHTML.append("</a>"); 
				pagingHTML.append("</li>");
			}
		}
		
		//서치용 페이잊ㅇ
		public void makePagingHTML(String target, String keyword) {
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
					pagingHTML.append("<a href='/semiproject/admin/adminBoardSearchAllList?category=admin&pg="+previousPage+"&keyword="+keyword+"&target="+target+"'>"); //풍혁(220706) : href 현재페이지에서 이전페이지로 넘겨주는 url로 수정해야 됨.
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
						pagingHTML.append("<a href='/semiproject/admin/adminBoardSearchAllList?category=admin&pg="+i+"&keyword="+keyword+"&target="+target+"'>");
						
							pagingHTML.append(i);
						pagingHTML.append("</a>");
					pagingHTML.append("</li>");
				}
			}
			//풍혁(220706) : ...맨끝 페이지 이동 기능 구현 보류 ...
			if(currentPage < endPage) {                                                            
				int nextPage = currentPage+1;
				pagingHTML.append("<li class='next'>");
					pagingHTML.append("<a href='/semiproject/admin/adminBoardSearchAllList?pg="+nextPage+"&keyword="+keyword+"&target="+target+"'>"); //풍혁(220706) : href 현재페이지에서 다음페이지로 넘겨주는 url로 수정해야 됨.
						pagingHTML.append("»");
					pagingHTML.append("</a>"); 
				pagingHTML.append("</li>");
			}
		}

	}


	



