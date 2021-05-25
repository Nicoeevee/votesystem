package com.yanzhen.mapper;

import java.util.List;
import java.util.Map;

import com.yanzhen.entity.QuestionOpt;

public interface QuestionOptDao {
	public int create(QuestionOpt pi);
	public int delete(Map<String, Object> paramMap);
	public int update(Map<String, Object> paramMap);
	public List<QuestionOpt> query(Map<String, Object> paramMap);
	public QuestionOpt detail(Map<String, Object> paramMap);
	public int count(Map<String, Object> paramMap);
}