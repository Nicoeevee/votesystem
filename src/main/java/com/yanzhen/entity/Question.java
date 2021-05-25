package com.yanzhen.entity;

import com.yanzhen.utils.Entity;

import java.util.Date;
import java.util.List;


public class Question extends Entity {

	/**
	 * text;number;date
	 */
	private String checkStyle;
	/**
	 * 
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Integer creator;
	/**
	 * 
	 */
	private Integer id;
	/**
	 * 0顺序1随机
	 */
	private Integer orderStyle;
	/**
	 * 
	 */
	private Integer orderby;
	/**
	 * 
	 */
	private String remark;
	/**
	 * 0非必填1必填
	 */
	private Integer required;
	/**
	 * 
	 */
	private Integer score;
	/**
	 * 1;2;3;4
	 */
	private Integer showStyle;
	/**
	 * 
	 */
	private Integer surveyId;
	/**
	 * 0不测评1测评
	 */
	private Integer test;
	/**
	 * 
	 */
	private String title;
	/**
	 * 1radio|2checkbox|3text|4textarea
	 */
	private Integer type;

	private List<QuestionOpt> options;


	public String getCheckStyle() {
		return checkStyle;
	}
	public void setCheckStyle(String checkStyle) {
		this.checkStyle = checkStyle;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getCreator() {
		return creator;
	}
	public void setCreator(Integer creator) {
		this.creator = creator;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderStyle() {
		return orderStyle;
	}
	public void setOrderStyle(Integer orderStyle) {
		this.orderStyle = orderStyle;
	}
	public Integer getOrderby() {
		return orderby;
	}
	public void setOrderby(Integer orderby) {
		this.orderby = orderby;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getRequired() {
		return required;
	}
	public void setRequired(Integer required) {
		this.required = required;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getShowStyle() {
		return showStyle;
	}
	public void setShowStyle(Integer showStyle) {
		this.showStyle = showStyle;
	}
	public Integer getSurveyId() {
		return surveyId;
	}
	public void setSurveyId(Integer surveyId) {
		this.surveyId = surveyId;
	}
	public Integer getTest() {
		return test;
	}
	public void setTest(Integer test) {
		this.test = test;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}

	public List<QuestionOpt> getOptions() {
		return options;
	}

	public void setOptions(List<QuestionOpt> options) {
		this.options = options;
	}
}