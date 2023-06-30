package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.domain.Bookmark;

@Repository
public interface BookmarkMapper {

	public List<Bookmark> selectBookmark();
	
	public void insertBookmark(
			@Param("name") String name,
			@Param("url") String url);
	
	public Bookmark selectBookmarkByUrl(String url);
	
	public int deleteBookmarkById(int id);
}
