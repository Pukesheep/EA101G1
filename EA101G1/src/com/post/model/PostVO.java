package com.post.model;

import java.sql.Date;

public class PostVO implements java.io.Serializable {
	
	private static final long serialVersionUID = 4695612728332425992L;
	
	private String post_id;
	private String mem_id;
	private Integer ptype_id;
	private Integer p_status;
	private String p_title;
	private String text;
	private byte[] image;
	private java.sql.Date last_edit;
	private java.sql.Date post_time;
	
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	
	public String getPost_id() {
		return post_id;
	}
	
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	
	public void setPtype_id(Integer ptype_id) {
		this.ptype_id = ptype_id;
	}
	
	public Integer getPtype_id() {
		return ptype_id;
	}
	
	public void setP_status(Integer p_status) {
		this.p_status = p_status;
	}
	
	public Integer getP_status() {
		return p_status;
	}
	
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	
	public String getP_title() {
		return p_title;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}
	
	public void setImage(byte[] image) {
		this.image = image;
	}
	
	public byte[] getImage() {
		return image;
	}
	
	public void setLast_edit(Date last_edit) {
		this.last_edit = last_edit;
	}
	
	public Date getLast_edit() {
		return last_edit;
	}
	
	public void setPost_time(Date post_time) {
		this.post_time = post_time;
	}
	
	public Date getPost_time() {
		return post_time;
	}
}
