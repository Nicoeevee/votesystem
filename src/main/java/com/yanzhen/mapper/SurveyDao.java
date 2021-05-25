package com.yanzhen.mapper;

import java.util.List;
import java.util.Map;

import com.yanzhen.entity.Survey;

public interface SurveyDao {
	public int create(Survey pi);
	public int delete(Map<String, Object> paramMap);
	public int update(Map<String, Object> paramMap);
	public List<Survey> query(Map<String, Object> paramMap);
	public List<Survey> queryMySurvey(Map<String, Object> paramMap);
	public Survey detail(Map<String, Object> paramMap);
	public int count(Map<String, Object> paramMap);
	public List<Integer> queryByState(String state);
	public List<Integer> queryByStateForExec(String state);
}