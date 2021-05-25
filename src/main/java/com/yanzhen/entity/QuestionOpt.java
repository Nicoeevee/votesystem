package com.yanzhen.entity;

import java.util.Date;

public class QuestionOpt{

	/**
	 * 默认为NULL；1答案
	 */
	private Integer answer;
	/**
	 * 
	 */
	private Integer id;
	/**
	 * 
	 */
	private String opt;
	/**
	 * 
	 */
	private Integer orderby;
	/**
	 * 
	 */
	private Integer questionId;
	/**
	 * 
	 */
	private Integer surveyId;
	/**
	 * 1radio|2checkbox
	 */
	private Integer type;

	//被投票数量
	private Integer num;

	public Integer getAnswer() {
		return answer;
	}
	public void setAnswer(Integer answer) {
		this.answer = answer;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	public Integer getOrderby() {
		return orderby;
	}
	public void setOrderby(Integer orderby) {
		this.orderby = orderby;
	}
	public Integer getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	public Integer getSurveyId() {
		return surveyId;
	}
	public void setSurveyId(Integer surveyId) {
		this.surveyId = surveyId;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
}