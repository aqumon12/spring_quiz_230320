package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 북마크 목록
	@GetMapping("/bookmark_view")
	public String BookmarkView(Model model) {
		List<Bookmark> bookmarks = bookmarkBO.getBookmark();
		model.addAttribute("bookmarks", bookmarks);
		
		return "lesson06/bookmark";
	}
	// 북마크 추가 페이지
	@GetMapping("/add_bookmark_view")
	public String addBookmarkView() {
		
		return "lesson06/addBookmark";
	}
	
	// 북마크 ajax로 insert
	@ResponseBody
	@PostMapping("/add_bookmark")
	public String addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		bookmarkBO.addBookmark(name, url);
		
		return "성공";
	}
}
