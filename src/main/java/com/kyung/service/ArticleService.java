package com.kyung.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kyung.mapper.ArticleMapper;
import com.kyung.model.ArticleRegistrationModel;

@Service
public class ArticleService {
	@Autowired ArticleMapper articleMapper;
	
	public void create(int boardId, int userId, ArticleRegistrationModel articleModel)
	{
		String title = articleModel.getTitle();
		String contents = articleModel.getContents();
		int category = articleModel.getCategory();
		articleMapper.insert(boardId, userId, title, contents, category);
	}
}
