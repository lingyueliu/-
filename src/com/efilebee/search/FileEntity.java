package com.efilebee.search;

import java.io.Serializable;

public class FileEntity implements Serializable {
	/**
	 * Add default serial version ID
	 * Add generated serial version ID
	 */
	private static final long serialVersionUID = 3788269278906994947L;
	private Integer id;
	private String name;
	private String type;
	private String role;
	private String path;
	private String content;
	private Long lastModified;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getLastModified() {
		return lastModified;
	}
	public void setLastModified(Long lastModified) {
		this.lastModified = lastModified;
	}
	
}
