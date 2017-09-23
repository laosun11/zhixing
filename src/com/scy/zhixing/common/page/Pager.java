package com.scy.zhixing.common.page;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @author vo分页
 *
 * @param <T>
 */
public class Pager<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	private long count; // 总行数
	private int pageSize = 8; // 每页显示的行数
	private int currentPage = 1; // 当前页号
	private int pageCount; // 总页数
	private List<T> list;

	public Pager() {
	}

	public Pager(int count) {
		this(count, 10);
	}

	public Pager(int currentPage, int pageSize) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
	}

	public Pager(Pager<T> pager) {
		this.count = pager.count; // 总行数
		this.pageSize = pager.pageSize; // 每页显示的行数
		this.currentPage = pager.currentPage; // 当前页号
		this.pageCount = pager.pageCount; // 总页数
		this.list = pager.list;
	}

	public int getPageCount() {
		pageSize = pageSize > 0 ? pageSize : 10;
		pageCount = Long.valueOf(count / pageSize).intValue();
		long mod = count % pageSize;
		if (mod > 0) {
			pageCount++;
		}
		return pageCount;
	}

	public int getStart() {
		return (currentPage - 1) * pageSize;
	}

	public long getCount() {
		return count;
	}

	public Pager<T> setCount(long count) {
		getPageCount();
		this.count = count;
		return this;
	}

	public int getPageSize() {
		return pageSize;
	}

	public Pager<T> setPageSize(int pageSize) {
		this.pageSize = pageSize;
		return this;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public Pager<T> setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		return this;
	}

	public List<T> getList() {
		return list;
	}

	public Pager<T> setList(List<T> list) {
		this.list = list;
		return this;
	}
}
