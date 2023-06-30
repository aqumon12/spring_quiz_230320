package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.domain.Bookmark;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {
	
	@Autowired
	private BookmarkBO bookmarkBO;
	
	// 즐겨찾기 목록
	@GetMapping("/bookmark_view")
	public String BookmarkView(Model model) {
		List<Bookmark> bookmarks = bookmarkBO.getBookmark();
		model.addAttribute("bookmarks", bookmarks);
		
		return "lesson06/bookmark";
	}
	// 즐겨찾기 추가 페이지
	@GetMapping("/add_bookmark_view")
	public String addBookmarkView() {
		
		return "lesson06/addBookmark";
	}
	
	// AJAX가 하는 요청 - URL 중복확인
	@ResponseBody
	@PostMapping("/is_Duplication_url")
	public Map<String, Object> isDuplicationUrl(
			@RequestParam("url") String url) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("isDuplication", false);
		
		// db select by url
		Bookmark bookmark = bookmarkBO.getBookmarkByUrl(url); // bookmark or null
		if (bookmark != null) { // 중복
			result.put("isDuplication", true);
		}
		
		return result;
		
	}
	
	// AJAX가 하는 요청 -insert
	@ResponseBody
	@PostMapping("/add_bookmark")
	public Map<String, Object> addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// db insert
		bookmarkBO.addBookmark(name, url);
		
		// 응답
		// "{"code":1, "result":"성공"}"  JSON  String
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
	
	// AJAX가 하는 요청 - 즐겨찾기 삭제
	@ResponseBody
	@DeleteMapping("/delete_bookmark")
	public Map<String,Object> deleteBookmark(
			@RequestParam("bookmarkId") int id) {
		
		// db delete 
		int row = bookmarkBO.deleteBookmarkById(id);
		
		Map<String,Object> result = new HashMap<>();
		
		if (row == 1) {
			// 삭제 성공
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			// 삭제된 행 없음 - 실패
			result.put("code", 500);
			result.put("errorMessage", "삭제될 데이터가 없습니다.");
			
		}
		
		return result;
				
		
	}
}
