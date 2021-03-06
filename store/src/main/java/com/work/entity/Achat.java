package com.work.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
/**
 * 
 * ClassName: Achat 
 * @Description: 用户发布请求实体
 * @author crossoverJie
 * @date 2016年4月16日 下午10:13:56
 */
@Entity
public class Achat {
	private int id ;
	private String title ;
	private String content ;
	private String create_user ;
	private String support_price ;//供应商报价
	
	private String support_id ;//供应商ID
	private String support_name ;//供应商名称
	
	private String produce_id ;//对应的产品ID
	private String produce_name ;//产品名称
	private String produce_model ;//产品型号
	
	private String create_username ;//发起人名字
	
	private Date create_date ;
	private String category_id ;
	
	
	private String category_name ;
	private String parseDate ;
	
	/**用于时间查询的区间条件**/
	private String start_date ;
	private String end_date ;
	
	/**
	 * 状态 0：管理员处理中      1：供应商报价中
	 * 2：会员处理中                  3：供应商上架中  会员已经同意
	 * 4：会员拒绝 不同意         5：加入会员订单中
	 */
	private String state ;
	
	@Id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Transient
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	@Transient
	public String getParseDate() {
		return parseDate;
	}
	public void setParseDate(String parseDate) {
		this.parseDate = parseDate;
	}
	@Transient
	public String getCreate_username() {
		return create_username;
	}
	public void setCreate_username(String create_username) {
		this.create_username = create_username;
	}
	public String getSupport_id() {
		return support_id;
	}
	public void setSupport_id(String support_id) {
		this.support_id = support_id;
	}
	
	@Transient
	public String getSupport_name() {
		return support_name;
	}
	public void setSupport_name(String support_name) {
		this.support_name = support_name;
	}
	public String getSupport_price() {
		return support_price;
	}
	public void setSupport_price(String support_price) {
		this.support_price = support_price;
	}
	public String getProduce_id() {
		return produce_id;
	}
	public void setProduce_id(String produce_id) {
		this.produce_id = produce_id;
	}
	@Transient
	public String getProduce_name() {
		return produce_name;
	}
	public void setProduce_name(String produce_name) {
		this.produce_name = produce_name;
	}
	@Transient
	public String getProduce_model() {
		return produce_model;
	}
	public void setProduce_model(String produce_model) {
		this.produce_model = produce_model;
	}
	@Transient
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	@Transient
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
}
